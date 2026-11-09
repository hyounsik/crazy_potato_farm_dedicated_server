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

    expect(
      farm.apply(
        FarmCommand.depart(zone: 'sample_zone', food: 50, potatoIds: [id]),
      ),
      isNull,
    );
    expect(farm.food, 150);
    expect(farm.awayPotatoes.single.id, id);
    expect(farm.takeEvents(), [
      FarmEvent.departed(food: 50, potatoIds: [id]),
    ]);
  });

  test('an away potato stands still and frees its tile', () {
    final id = growOne();
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 0, potatoIds: [id]),
    );
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
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 0, potatoIds: [id]),
    );
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
      farm.apply(FarmCommand.depart(zone: 'nowhere', food: 0)),
      FarmRejection.unknownZone,
    );
    expect(
      farm.apply(FarmCommand.depart(zone: 'sample_zone', food: 201)),
      FarmRejection.notEnoughFood,
    );
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    final sprout = farm.field(1)!.potatoAt(_tile)!.id;
    expect(
      farm.apply(
        FarmCommand.depart(zone: 'sample_zone', food: 0, potatoIds: [sprout]),
      ),
      FarmRejection.cannotGo,
      reason: 'still growing',
    );
    expect(
      farm.apply(
        FarmCommand.depart(zone: 'sample_zone', food: 0, potatoIds: [999]),
      ),
      FarmRejection.cannotGo,
    );
    expect(farm.food, 200, reason: 'a refused departure changes nothing');
  });

  test('a run result comes home into the farm', () {
    final id = growOne();
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 40, potatoIds: [id]),
    );

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
    expect(farm.progress, 0, reason: 'only a cleared region raises it');
  });

  test('a lost danger run brings nothing and the lost companions are gone', () {
    final id = growOne();
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 40, potatoIds: [id]),
    );
    farm.takeEvents();
    final result = RaidResult(
      outcome: RaidOutcome.fainted,
      items: [ItemStack('food', 30), ItemStack('material', 9)],
      companions: [(potatoId: id, down: false, gone: true)],
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

  test('a lost danger run brings home the companions it did not lose '
      '(2026-11-05)', () {
    final id = growOne();
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 40, potatoIds: [id]),
    );
    farm.takeEvents();
    final result = RaidResult(
      outcome: RaidOutcome.fainted,
      items: [ItemStack('food', 30)],
      companions: [(potatoId: id, down: true, gone: false)],
      score: 12,
      lost: true,
    );
    expect(farm.apply(result.homecoming(catalog)), isNull);
    expect(farm.potatoById(id), isNotNull);
    expect(farm.progress, 0);
  });

  test('a companion that fell in a danger zone stays gone after leaving', () {
    final id = growOne();
    farm.apply(
      FarmCommand.depart(zone: 'sample_zone', food: 40, potatoIds: [id]),
    );
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
    expect(farm.progress, 0, reason: 'escaping a danger zone clears nothing');
    expect(farm.takeEvents().whereType<Returned>().single.lost, [id]);
  });

  RaidResult bossRun(String zone, {RaidOutcome? outcome}) => RaidResult(
    outcome: outcome ?? RaidOutcome.wentHome,
    items: const [],
    companions: const [],
    score: 3,
    zone: zone,
    lost: false,
    bossKilled: true,
  );

  /// The sample catalog with its danger zone shut until cleared.
  FarmSimulation lockedFarm() {
    final locked = sampleCatalogWith(
      (files) => (files['story']! as Map<String, dynamic>)['locked'] = [
        'zone:sample_danger',
      ],
    );
    return FarmSimulation.newFarm(locked, seed: 1);
  }

  test('clearing a region opens its zones and raises progress '
      '(2026-11-08)', () {
    final farm = lockedFarm();
    final catalog = farm.catalog;
    expect(farm.zoneOpen('sample_danger'), isFalse);
    expect(farm.dangerScores('sample_danger'), (min: 3, max: 3));
    farm.apply(bossRun('sample_zone').homecoming(catalog));
    expect(farm.takeEvents().whereType<RegionCleared>().single.opens, [
      'sample_danger',
    ]);
    expect(farm.clearedZones, ['sample_zone']);
    expect(farm.zoneOpen('sample_danger'), isTrue);
    expect(farm.progress, 3);
    expect(farm.dangerScores('sample_zone'), isNull, reason: 'a safe zone');
    final saved = FarmDocument.of(farm).toSimulation(catalog);
    expect(saved.progress, 3);
    expect(saved.zoneOpen('sample_danger'), isTrue);
  });

  test('a boss falling in a danger zone clears nothing', () {
    farm.apply(bossRun('sample_danger').homecoming(catalog));
    expect(farm.clearedZones, isEmpty);
    expect(farm.progress, 0);
  });

  test("a guest's run brings the haul home but clears nothing "
      '(2026-11-08)', () {
    final farm = lockedFarm();
    final result = RaidResult(
      outcome: RaidOutcome.wentHome,
      items: [ItemStack('food', 5)],
      companions: const [],
      score: 3,
      zone: 'sample_zone',
      lost: false,
      bossKilled: true,
    );
    final before = farm.food;
    expect(farm.apply(result.homecoming(catalog, asGuest: true)), isNull);
    expect(farm.food, before + 5);
    expect(farm.clearedZones, isEmpty);
    expect(farm.zoneOpen('sample_danger'), isFalse);
    expect(farm.totals.escapes, isEmpty);
    expect(farm.totals.bossKills, isEmpty);
  });

  test('a later region cleared counts the ones before it (2026-11-09)', () {
    final two = sampleCatalogWith((files) {
      final zones = (files['zones']! as Map<String, dynamic>)['zones']!;
      for (final zone in zones as List<Object?>) {
        final z = zone! as Map<String, dynamic>;
        if (z['id'] == 'sample_danger') {
          z['score'] = 1;
          z['clear_opens'] = <String>[];
          z.remove('danger');
        }
      }
    });
    final farm = FarmSimulation.newFarm(two, seed: 1);
    expect(farm.clearedZones, isEmpty);
    farm.apply(
      const FarmCommand.returnHome(food: 0, bossKilledIn: 'sample_zone'),
    );
    expect(farm.clearedZones, containsAll(['sample_zone', 'sample_danger']));
  });

  test('any danger zone may be played from the first region up '
      '(2026-11-09)', () {
    final raised = sampleCatalogWith((files) {
      final zones = (files['zones']! as Map<String, dynamic>)['zones']!;
      for (final zone in zones as List<Object?>) {
        final z = zone! as Map<String, dynamic>;
        if (z['id'] == 'sample_danger') z['score'] = 55;
      }
    });
    final farm = FarmSimulation.newFarm(raised, seed: 1);
    final lowest = raised.zones['sample_zone']!.score;
    expect(farm.dangerScores('sample_danger'), (min: lowest, max: 55));
  });

  test('seed chances add up from the gathering table', () {
    final chances = catalog.seedChances('sample_zone');
    final table =
        catalog.lootTables[catalog.zones['sample_zone']!.gathering.loot]!;
    final seeds = table.entries.where(
      (e) => catalog.items[e.item]?.seed != null,
    );
    final total = table.entries.fold(
      0,
      (sum, e) =>
          sum +
          catalog.lootWeight(
            e.item,
            e.weight,
            catalog.zones['sample_zone']!.score,
          ),
    );
    final expected =
        seeds.fold(
          0,
          (sum, e) =>
              sum +
              catalog.lootWeight(
                e.item,
                e.weight,
                catalog.zones['sample_zone']!.score,
              ),
        ) /
        total;
    expect(chances.values.fold(0.0, (a, b) => a + b), closeTo(expected, 1e-9));
  });

  test('a danger difficulty past progress is refused (2026-11-08)', () {
    final open = sampleCatalogWith((files) {
      final zones = (files['zones']! as Map<String, dynamic>)['zones']!;
      for (final zone in zones as List<Object?>) {
        final z = zone! as Map<String, dynamic>;
        if (z['id'] == 'sample_zone') z['score'] = 9;
      }
    });
    final cleared = FarmSimulation.newFarm(open, seed: 1)..food = 100;
    cleared.apply(
      RaidResult(
        outcome: RaidOutcome.wentHome,
        items: const [],
        companions: const [],
        score: 9,
        zone: 'sample_zone',
        lost: false,
        bossKilled: true,
      ).homecoming(open),
    );
    expect(cleared.dangerScores('sample_danger'), (min: 3, max: 9));
    expect(
      cleared.apply(
        const FarmCommand.depart(zone: 'sample_danger', food: 0, score: 10),
      ),
      FarmRejection.locked,
    );
    expect(
      cleared.apply(
        const FarmCommand.depart(zone: 'sample_zone', food: 0, score: 9),
      ),
      FarmRejection.locked,
      reason: 'a safe zone has no difficulty to pick',
    );
    expect(
      cleared.apply(
        const FarmCommand.depart(zone: 'sample_danger', food: 0, score: 9),
      ),
      isNull,
    );
  });

  test('companions carry their farm potato over to the run', () {
    final id = growOne();
    expect(companionsFor(farm, [id, 999]).single.potatoId, id);
  });
}
