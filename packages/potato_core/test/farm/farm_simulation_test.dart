import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _normal = plainSeed(PotatoType.food, Grade.normal);
const _tile = TilePos(12, 9);

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  /// Plain normal food seeds in the pouch before the test. Rolled new-farm
  /// seeds can be plain too, so it is not always 8.
  late int start;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1);
    farm.seeds
      ..add(_normal, 8)
      ..add(plainSeed(PotatoType.food, Grade.legendary));
    start = farm.seeds.count(_normal);
  });

  FarmRejection? plant([TilePos tile = _tile, Seed? seed]) => farm.apply(
    FarmCommand.plant(fieldId: 1, tile: tile, seed: seed ?? _normal),
  );

  test('a new farm follows new_farm in the catalog', () {
    final farm = FarmSimulation.newFarm(catalog, seed: 1);
    expect(farm.food, 200);
    expect(farm.fields.single.rect.area, 4);
    expect(countOf(farm.seeds, PotatoType.food, Grade.normal), 8);
    expect(countOf(farm.seeds, PotatoType.combat), 2);
    expect(farm.tick, 0);
  });

  test('new farm seeds get an ability of their type, and combat a style', () {
    final farm = FarmSimulation.newFarm(catalog, seed: 1);
    for (final seed in farm.seeds.counts.keys) {
      expect(catalog.abilities[seed.ability]!.pool, seed.type.name);
      expect(seed.style == null, seed.type != PotatoType.combat);
    }
    expect(
      FarmDocument.of(FarmSimulation.newFarm(catalog, seed: 1)),
      FarmDocument.of(farm),
      reason: 'the same farm seed rolls the same seeds',
    );
  });

  group('plant', () {
    test('takes a seed and reports it', () {
      expect(plant(), isNull);
      expect(farm.seeds.count(_normal), start - 1);
      expect(farm.field(1)!.potatoAt(_tile)!.grade, Grade.normal);
      expect(farm.takeEvents(), [
        FarmEvent.planted(fieldId: 1, tile: _tile, potatoId: 2, seed: _normal),
      ]);
      expect(farm.takeEvents(), isEmpty);
    });

    test('refuses bad requests and keeps the seed', () {
      expect(
        farm.apply(FarmCommand.plant(fieldId: 9, tile: _tile, seed: _normal)),
        FarmRejection.noSuchField,
      );
      expect(plant(const TilePos(0, 0)), FarmRejection.outsideField);
      plant();
      expect(plant(), FarmRejection.tileTaken);
      expect(
        plant(const TilePos(13, 9), plainSeed(PotatoType.buff, Grade.normal)),
        FarmRejection.typeLocked,
      );
      expect(
        plant(
          const TilePos(13, 9),
          plainSeed(PotatoType.food, Grade.legendary),
        ),
        isNull,
      );
      expect(
        plant(
          const TilePos(12, 10),
          plainSeed(PotatoType.food, Grade.legendary),
        ),
        FarmRejection.noSeed,
      );
      expect(farm.seeds.count(_normal), start - 1);
    });
  });

  group('step', () {
    test('grows, makes food, and harvests', () {
      plant();
      farm.takeEvents();
      farm.runSteps(120);
      expect(farm.takeEvents(), [
        FarmEvent.grown(fieldId: 1, tile: _tile, potatoId: 2),
      ]);
      expect(
        farm.apply(FarmCommand.harvestField(fieldId: 1)),
        FarmRejection.nothingToHarvest,
      );

      farm.runSteps(60);
      expect(farm.apply(FarmCommand.harvest(fieldId: 1, tile: _tile)), isNull);
      expect(farm.food, 202);
      expect(farm.takeEvents(), [FarmEvent.harvested(fieldId: 1, food: 2)]);
      expect(farm.elapsed, const Duration(minutes: 3));
    });

    test('without a graveyard a dead potato is gone', () {
      plant();
      farm.takeEvents();
      final seeds = farm.seeds.counts.values.fold(0, (a, b) => a + b);
      farm.runSteps(120 + 1800);
      final died = farm.takeEvents().whereType<PotatoDied>().single;
      expect(died.buried, isFalse);
      expect(died.tile, _tile);
      expect(farm.field(1)!.potatoes, isEmpty);
      expect(farm.graves, isEmpty);
      expect(farm.seeds.counts.values.fold(0, (a, b) => a + b), seeds);
    });

    test('a graveyard keeps the dead until revived as a seed', () {
      farm.food = 1000;
      farm.apply(
        FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
      );
      plant();
      final id = farm.field(1)!.potatoAt(_tile)!.id;
      farm.runSteps(120 + 1800);
      final died = farm.takeEvents().whereType<PotatoDied>().single;
      expect(died.buried, isTrue);
      expect(farm.graves.single.id, id);

      final before = start - 1;
      final grave = farm.graves.single;
      expect(farm.reviveCost(grave), 10);
      farm.food = 9;
      expect(
        farm.apply(FarmCommand.revive(potatoId: id)),
        FarmRejection.notEnoughFood,
      );
      expect(farm.graves.single.id, id);
      farm.food = 25;
      expect(farm.apply(FarmCommand.revive(potatoId: id)), isNull);
      expect(farm.food, 15);
      final revived = farm.takeEvents().whereType<PotatoRevived>().single;
      expect(revived.from, Grade.normal);
      expect(revived.seed.ability, 'food.plain');
      expect(farm.seeds.count(_normal), before + 1);
      expect(farm.graves, isEmpty);
      expect(
        farm.apply(FarmCommand.revive(potatoId: id)),
        FarmRejection.noGrave,
      );
    });

    test('a full graveyard loses its oldest grave', () {
      farm.food = 1000;
      farm.apply(
        FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
      );
      farm.seeds.add(_normal, 4);
      final tiles = farm.field(1)!.rect.tiles.toList();
      final ids = <int>[];
      for (final tile in tiles) {
        plant(tile);
        ids.add(farm.field(1)!.potatoAt(tile)!.id);
      }
      farm.takeEvents();
      farm.runSteps(120 + 1800);
      // The sample graveyard keeps 3; four died.
      expect(farm.graves.map((p) => p.id), ids.skip(1));
      expect(
        farm.takeEvents().whereType<GraveLost>().single.potatoId,
        ids.first,
      );
    });

    test('grade drops follow the farm random sequence', () {
      // Plant the four tiles with legendary-free rare seeds, let them die,
      // and expect the same drops for the same farm seed.
      List<Grade> run(int seed) {
        final farm = FarmSimulation.newFarm(catalog, seed: seed);
        final rare = plainSeed(PotatoType.food, Grade.rare);
        farm.seeds.add(rare, 3);
        farm.food = 1000;
        farm.apply(
          FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
        );
        for (final tile in farm.field(1)!.rect.tiles.take(3)) {
          farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: rare));
        }
        farm.runSteps(120 + 1800);
        return [
          for (final grave in farm.graves.toList())
            if (farm.apply(FarmCommand.revive(potatoId: grave.id)) == null)
              farm.takeEvents().whereType<PotatoRevived>().last.seed.grade,
        ];
      }

      expect(run(5), run(5));
      expect(run(5), isNotEmpty);
    });
  });
}
