import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

const _normal = Seed(type: PotatoType.food, grade: Grade.normal);
const _tile = TilePos(12, 9);

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1);
  });

  int growOne() {
    farm.apply(const FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
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

  test('an away potato keeps its tile and stands still', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 0, potatoIds: [id]));
    final potato = farm.potatoById(id)!.potato;
    final lived = potato.livedMillis;

    farm.runSteps(100);
    expect(potato.livedMillis, lived);
    expect(potato.stored, 0);
    expect(
      farm.apply(
        const FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal),
      ),
      FarmRejection.tileTaken,
    );
    expect(
      farm.apply(const FarmCommand.harvest(fieldId: 1, tile: _tile)),
      FarmRejection.noPotato,
    );
  });

  test('who and how much can go', () {
    expect(
      farm.apply(const FarmCommand.depart(food: 201)),
      FarmRejection.notEnoughFood,
    );
    farm.apply(const FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    final sprout = farm.field(1)!.potatoAt(_tile)!.id;
    expect(
      farm.apply(FarmCommand.depart(food: 0, potatoIds: [sprout])),
      FarmRejection.cannotGo,
      reason: 'still growing',
    );
    expect(
      farm.apply(const FarmCommand.depart(food: 0, potatoIds: [999])),
      FarmRejection.cannotGo,
    );
    expect(farm.food, 200, reason: 'a refused departure changes nothing');
  });

  test('a run result comes home into the farm', () {
    final id = growOne();
    farm.apply(FarmCommand.depart(food: 40, potatoIds: [id]));

    final result = RaidResult(
      outcome: RaidOutcome.wentHome,
      items: [
        ItemStack('food', 30),
        ItemStack('seed_food_rare', 1),
        ItemStack('seed_food_rare', 1),
        ItemStack('material', 9),
      ],
      companions: [(potatoId: id, down: true)],
    );
    final command = result.homecoming(catalog);
    expect(farm.apply(command), isNull);

    expect(farm.food, 190);
    expect(
      farm.seeds.count(const Seed(type: PotatoType.food, grade: Grade.rare)),
      5,
    );
    expect(farm.awayPotatoes, isEmpty);
    expect(farm.potatoById(id)!.tile, _tile);
  });

  test('companions carry their farm potato over to the run', () {
    final id = growOne();
    expect(companionsFor(farm, [id, 999]).single.potatoId, id);
  });
}
