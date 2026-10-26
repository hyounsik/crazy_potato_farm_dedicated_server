import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// Strengthening gear at the workbench, and totems.
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
    const weapon = FarmCommand.enhanceGear(worn: GearKind.weapon);
    int weaponLevel(FarmSimulation farm) => farm.equipped.weapon!.enhance;

    test('spends food and materials; the first level always takes', () {
      giveMaterials(10);
      // The sample's first level is certain (chance 1.0).
      expect(farm.apply(weapon), isNull);
      expect(weaponLevel(farm), 1);
      expect(farm.food, 10000 - 20);
      expect(farm.materials['material'], 8);
      expect(
        farm.takeEvents(),
        contains(
          const FarmEvent.gearEnhanced(
            kind: GearKind.weapon,
            level: 1,
            worked: true,
          ),
        ),
      );
    });

    test('needs the materials, and stops at the top level', () {
      expect(farm.apply(weapon), FarmRejection.notEnoughMaterials);
      giveMaterials(1000);
      var tries = 0;
      while (weaponLevel(farm) < catalog.rules.workbench.maxLevel &&
          tries < 500) {
        farm.apply(weapon);
        tries++;
      }
      expect(weaponLevel(farm), catalog.rules.workbench.maxLevel);
      expect(
        tries,
        greaterThan(catalog.rules.workbench.maxLevel),
        reason: 'later levels sometimes fail',
      );
      expect(farm.apply(weapon), FarmRejection.atMost);
      expect(weaponLevel(reload(farm)), weaponLevel(farm));
    });

    test('a strengthened weapon hits harder in a run', () {
      final zone = catalog.zones.values.first.id;
      final start = catalog.rules.gear.start.weapon!;
      double damage(int level) => RaidSimulation.start(
        catalog: catalog,
        zone: zone,
        seed: 7,
        equipped: Equipped(weapon: start.copyWith(enhance: level)),
      ).playerShotDamage;

      final base = catalog.weapons[start.family]!.damage;
      expect(damage(0), base);
      expect(damage(3), closeTo(base * 1.3, 1e-9));
    });

    test(
      'a farm from before gear gets the starting gear, keeping its level',
      () {
        final json =
            jsonDecode(jsonEncode(FarmDocument.of(farm).toJson()))
                  as Map<String, dynamic>
              ..remove('equipped')
              ..['weapon_level'] = 4;
        final old = FarmDocument.decode(json).toSimulation(catalog);
        expect(old.equipped.weapon!.enhance, 4);
        expect(old.equipped.bag, catalog.rules.gear.start.bag);
      },
    );
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

    test('totems may stand right next to each other, not on one another '
        'nor next to anything else (2026-10-27)', () {
      putUp('totem_growth', const TilePos(8, 8));
      putUp('totem_harvest', const TilePos(9, 8));
      final building = farm.buildings.last;
      expect(
        farm.canPlace(building.rect, totem: true),
        isFalse,
        reason: 'not on one',
      );
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(10, 9), width: 1, height: 1),
          totem: true,
        ),
        isTrue,
        reason: 'corner to corner with a totem',
      );
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(10, 9), width: 1, height: 1),
        ),
        isFalse,
        reason: 'anything else keeps its distance',
      );
      final field = farm.fields.first.rect;
      expect(
        farm.canPlace(
          TileRect(
            origin: field.origin - const TilePos(1, 1),
            width: 1,
            height: 1,
          ),
          totem: true,
        ),
        isFalse,
        reason: 'a totem keeps its distance from a field',
      );
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
