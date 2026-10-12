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

  FarmRejection? plant([TilePos tile = _tile, Seed seed = _normal]) =>
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seed));

  test('a new farm follows new_farm in the catalog', () {
    expect(farm.food, 200);
    expect(farm.fields.single.rect.area, 4);
    expect(farm.seeds.count(_normal), 8);
    expect(farm.tick, 0);
  });

  group('plant', () {
    test('takes a seed and reports it', () {
      expect(plant(), isNull);
      expect(farm.seeds.count(_normal), 7);
      expect(farm.field(1)!.potatoAt(_tile)!.grade, Grade.normal);
      expect(farm.takeEvents(), [
        const FarmEvent.planted(
          fieldId: 1,
          tile: _tile,
          potatoId: 2,
          seed: _normal,
        ),
      ]);
      expect(farm.takeEvents(), isEmpty);
    });

    test('refuses bad requests and keeps the seed', () {
      expect(
        farm.apply(
          const FarmCommand.plant(fieldId: 9, tile: _tile, seed: _normal),
        ),
        FarmRejection.noSuchField,
      );
      expect(plant(const TilePos(0, 0)), FarmRejection.outsideField);
      plant();
      expect(plant(), FarmRejection.tileTaken);
      expect(
        plant(
          const TilePos(13, 9),
          const Seed(type: PotatoType.buff, grade: Grade.normal),
        ),
        FarmRejection.typeLocked,
      );
      expect(
        plant(
          const TilePos(13, 9),
          const Seed(type: PotatoType.food, grade: Grade.legendary),
        ),
        isNull,
      );
      expect(
        plant(
          const TilePos(12, 10),
          const Seed(type: PotatoType.food, grade: Grade.legendary),
        ),
        FarmRejection.noSeed,
      );
      expect(farm.seeds.count(_normal), 7);
    });
  });

  group('step', () {
    test('grows, makes food, and harvests', () {
      plant();
      farm.takeEvents();
      farm.runSteps(120);
      expect(farm.takeEvents(), [
        const FarmEvent.grown(fieldId: 1, tile: _tile, potatoId: 2),
      ]);
      expect(
        farm.apply(const FarmCommand.harvestField(fieldId: 1)),
        FarmRejection.nothingToHarvest,
      );

      farm.runSteps(60);
      expect(
        farm.apply(const FarmCommand.harvest(fieldId: 1, tile: _tile)),
        isNull,
      );
      expect(farm.food, 202);
      expect(farm.takeEvents(), [
        const FarmEvent.harvested(fieldId: 1, food: 2),
      ]);
      expect(farm.elapsed, const Duration(minutes: 3));
    });

    test('a dead potato leaves a seed in the pouch', () {
      plant();
      farm.takeEvents();
      farm.runSteps(120 + 1800);
      final died = farm.takeEvents().whereType<PotatoDied>().single;
      expect(died.seedLeft.type, PotatoType.food);
      expect(farm.field(1)!.potatoes, isEmpty);
      expect(farm.seeds.count(died.seedLeft), died.seedLeft == _normal ? 8 : 1);
    });

    test('grade drops follow the farm random sequence', () {
      // Plant the four tiles with legendary-free rare seeds, let them die,
      // and expect the same drops for the same farm seed.
      List<Grade> run(int seed) {
        final farm = FarmSimulation.newFarm(catalog, seed: seed);
        const rare = Seed(type: PotatoType.food, grade: Grade.rare);
        for (final tile in farm.field(1)!.rect.tiles.take(3)) {
          farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: rare));
        }
        farm.runSteps(120 + 1800);
        return [
          for (final event in farm.takeEvents().whereType<PotatoDied>())
            event.seedLeft.grade,
        ];
      }

      expect(run(5), run(5));
      expect(run(5), hasLength(3));
    });
  });
}
