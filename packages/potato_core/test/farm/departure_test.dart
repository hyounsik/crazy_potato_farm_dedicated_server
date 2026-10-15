import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _normal = plainSeed(PotatoType.food, Grade.normal);
const _tile = TilePos(12, 9);

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1);
    farm.seeds.add(_normal, 8);
  });

  int growOne() {
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    farm.runSteps(catalog.potatoType(PotatoType.food).growSeconds);
    return farm.field(1)!.potatoAt(_tile)!.id;
  }

  test('setting out takes food and companions off the farm', () {
    final id = growOne();
    farm.takeEvents();

    expect(farm.apply(FarmCommand.depart(food: 50, potatoIds: [id])), isNull);
    expect(farm.food, 150);
    expect(farm.awayPotatoes.single.id, id);
    expect(farm.takeEvents(), [
      FarmEvent.departed(food: 50, potatoIds: [id]),
    ]);
  });

  test('an away potato stands still and frees its tile', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 0, potatoIds: [id]));
    final potato = farm.potatoById(id)!;
    final lived = potato.livedMillis;

    farm.runSteps(100);
    expect(potato.livedMillis, lived);
    expect(potato.stored, 0);
    expect(
      farm.apply(FarmCommand.harvest(fieldId: 1, tile: _tile)),
      FarmRejection.noPotato,
    );
    expect(
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal)),
      isNull,
    );
  });

  test('a companion whose tile was taken comes home to the fridge', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 0, potatoIds: [id]));
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    farm.takeEvents();

    farm.apply(FarmCommand.returnHome(food: 0, potatoIds: [id]));
    expect(farm.fridge.single.id, id);
    expect(farm.takeEvents(), [
      FarmEvent.returned(food: 0, seeds: 0, potatoIds: [id], toFridge: [id]),
    ]);
  });

  test('who and how much can go', () {
    expect(
      farm.apply(FarmCommand.depart(food: 201)),
      FarmRejection.notEnoughFood,
    );
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    final sprout = farm.field(1)!.potatoAt(_tile)!.id;
    expect(
      farm.apply(FarmCommand.depart(food: 0, potatoIds: [sprout])),
      FarmRejection.cannotGo,
      reason: 'still growing',
    );
    expect(
      farm.apply(FarmCommand.depart(food: 0, potatoIds: [999])),
      FarmRejection.cannotGo,
    );
    expect(farm.food, 200, reason: 'a refused departure changes nothing');
  });

  test('a run result comes home into the farm', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 40, potatoIds: [id]));

    final rare = plainSeed(PotatoType.food, Grade.rare);
    final before = farm.seeds.count(rare);
    final result = RaidResult(
      outcome: RaidOutcome.wentHome,
      items: [
        ItemStack('food', 30),
        ItemStack('seed_food_rare', 1, seed: rare),
        ItemStack('seed_food_rare', 1, seed: rare),
        ItemStack('material', 9),
      ],
      companions: [(potatoId: id, down: true, gone: false)],
      score: 3,
      lost: false,
    );
    final command = result.homecoming(catalog);
    expect(farm.apply(command), isNull);

    expect(farm.food, 190);
    expect(farm.seeds.count(rare), before + 2);
    expect(farm.materials, {'material': 9});
    expect(farm.awayPotatoes, isEmpty);
    expect(farm.fieldSpotOf(id)!.tile, _tile);
    expect(farm.progress, 3, reason: 'going home from a safe zone succeeds');
  });

  test('a lost danger run brings nothing and the companions are gone', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 40, potatoIds: [id]));
    farm.takeEvents();
    final result = RaidResult(
      outcome: RaidOutcome.fainted,
      items: [ItemStack('food', 30), ItemStack('material', 9)],
      companions: [(potatoId: id, down: false, gone: false)],
      score: 12,
      lost: true,
    );
    expect(farm.apply(result.homecoming(catalog)), isNull);

    expect(farm.food, 160);
    expect(farm.materials, isEmpty);
    expect(farm.awayPotatoes, isEmpty);
    expect(farm.potatoById(id), isNull);
    expect(farm.graves, isEmpty, reason: 'lost companions leave no grave');
    expect(farm.progress, 0);
    final returned = farm.takeEvents().whereType<Returned>().single;
    expect(returned.lost, [id]);
    expect(returned.potatoIds, isEmpty);
  });

  test('a companion that fell in a danger zone stays gone after leaving', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 40, potatoIds: [id]));
    farm.takeEvents();
    final result = RaidResult(
      outcome: RaidOutcome.extracted,
      items: [ItemStack('food', 10)],
      companions: [(potatoId: id, down: true, gone: true)],
      score: 12,
      lost: false,
    );
    expect(farm.apply(result.homecoming(catalog)), isNull);
    expect(farm.potatoById(id), isNull);
    expect(farm.awayPotatoes, isEmpty);
    expect(farm.progress, 12);
    expect(farm.takeEvents().whereType<Returned>().single.lost, [id]);
  });

  test('progress follows the best successful run and never drops', () {
    RaidResult run(RaidOutcome outcome, int score) => RaidResult(
      outcome: outcome,
      items: const [],
      companions: const [],
      score: score,
      lost: false,
    );
    farm.apply(run(RaidOutcome.extracted, 12).homecoming(catalog));
    expect(farm.progress, 12);
    farm.apply(run(RaidOutcome.wentHome, 3).homecoming(catalog));
    expect(farm.progress, 12);
    farm.apply(run(RaidOutcome.starved, 20).homecoming(catalog));
    expect(farm.progress, 12, reason: 'starving home is not a success');
    final saved = FarmDocument.of(farm).toSimulation(catalog);
    expect(saved.progress, 12);
  });

  test('companions carry their farm potato over to the run', () {
    final id = growOne();
    expect(companionsFor(farm, [id, 999]).single.potatoId, id);
  });
}
