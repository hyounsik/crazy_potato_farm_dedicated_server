import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// Strengthening the weapon at the workbench, and totems.
void main() {
  late Catalog catalog;
  late FarmSimulation farm;
  const tile = TilePos(12, 9);

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 10000;
  });

  FarmSimulation reload(FarmSimulation farm) {
    final json = jsonDecode(
      jsonEncode(FarmDocument.of(farm).toJson()),
    ) as Map<String, dynamic>;
    return FarmDocument.decode(json).toSimulation(catalog);
  }

  void giveMaterials(int count) => farm.apply(
    FarmCommand.returnHome(food: 0, materials: {'material': count}),
  );

  group('workbench', () {
    test('spends food and materials; the first level always takes', () {
      giveMaterials(10);
      // The sample's first level is certain (chance 1.0).
      expect(farm.apply(const FarmCommand.enhanceWeapon()), isNull);
      expect(farm.weaponLevel, 1);
      expect(farm.food, 10000 - 20);
      expect(farm.materials['material'], 8);
      expect(
        farm.takeEvents(),
        contains(const FarmEvent.weaponEnhanced(level: 1, worked: true)),
      );
    });

    test('needs the materials, and stops at the top level', () {
      expect(
        farm.apply(const FarmCommand.enhanceWeapon()),
        FarmRejection.notEnoughMaterials,
      );
      giveMaterials(1000);
      var tries = 0;
      while (farm.weaponLevel < catalog.rules.workbench.maxLevel &&
          tries < 500) {
        farm.apply(const FarmCommand.enhanceWeapon());
        tries++;
      }
      expect(farm.weaponLevel, catalog.rules.workbench.maxLevel);
      expect(
        tries,
        greaterThan(catalog.rules.workbench.maxLevel),
        reason: 'later levels sometimes fail',
      );
      expect(
        farm.apply(const FarmCommand.enhanceWeapon()),
        FarmRejection.atMost,
      );
      expect(reload(farm).weaponLevel, farm.weaponLevel);
    });

    test('a strengthened weapon hits harder in a run', () {
      final zone = catalog.zones.values.first.id;
      double damage(int level) => RaidSimulation.start(
        catalog: catalog,
        zone: zone,
        seed: 7,
        weaponLevel: level,
      ).playerShotDamage;

      final base = catalog.weapons[catalog.rules.raid.startWeapon]!.damage;
      expect(damage(0), base);
      expect(damage(3), closeTo(base * 1.3, 1e-9));
    });
  });

  group('totems', () {
    int putUp(String kind, TilePos origin) {
      expect(farm.apply(FarmCommand.build(kind: kind, origin: origin)), isNull);
      return farm.buildings.last.id;
    }

    test('only as many as the limit allows, raised for food', () {
      putUp('totem_growth', const TilePos(8, 8));
      putUp('totem_growth', const TilePos(10, 8));
      expect(
        farm.apply(
          FarmCommand.build(kind: 'totem_growth', origin: const TilePos(8, 10)),
        ),
        FarmRejection.totemLimit,
      );
      expect(farm.apply(const FarmCommand.raiseTotemLimit()), isNull);
      expect(farm.totemLimit, 3);
      putUp('totem_growth', const TilePos(8, 10));
    });

    test('a lit growth totem speeds growth, then goes out and waits', () {
      final id = putUp('totem_growth', const TilePos(8, 8));
      final seed = plainSeed(PotatoType.food, Grade.normal);
      farm.seeds.add(seed);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seed));
      final potato = farm.field(1)!.potatoAt(tile)!;

      expect(farm.apply(FarmCommand.lightTotem(buildingId: id)), isNull);
      expect(farm.isLit(farm.building(id)!), isTrue);
      expect(
        farm.apply(FarmCommand.lightTotem(buildingId: id)),
        FarmRejection.cannotLight,
      );
      final data = catalog.potatoType(PotatoType.food);
      farm.runSteps(10);
      // +50% while lit: 10 seconds of growth count as 15.
      expect(potato.growthOf(data), closeTo(15 / data.growSeconds, 1e-9));

      farm.runSteps(50);
      expect(farm.isLit(farm.building(id)!), isFalse);
      expect(farm.takeEvents(), contains(FarmEvent.totemOut(buildingId: id)));
      expect(
        farm.apply(FarmCommand.lightTotem(buildingId: id)),
        FarmRejection.cannotLight,
        reason: 'still waiting',
      );
      farm.runSteps(120);
      expect(farm.apply(FarmCommand.lightTotem(buildingId: id)), isNull);
    });

    test('a lit harvest totem brings in more baby potatoes', () {
      final id = putUp('totem_harvest', const TilePos(8, 8));
      final seed = plainSeed(PotatoType.food, Grade.normal);
      farm.seeds.add(seed);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seed));
      final potato = farm.field(1)!.potatoAt(tile)!;
      potato.stored = 4;
      farm.apply(FarmCommand.lightTotem(buildingId: id));
      final before = farm.food;
      farm.apply(FarmCommand.harvest(fieldId: 1, tile: tile));
      expect(farm.food, before + 8);
    });

    test('a lit totem is saved lit', () {
      final id = putUp('totem_growth', const TilePos(8, 8));
      farm.apply(FarmCommand.lightTotem(buildingId: id));
      final loaded = reload(farm);
      expect(loaded.isLit(loaded.building(id)!), isTrue);
      expect(loaded.totemLimit, farm.totemLimit);
    });
  });
}
