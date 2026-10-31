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

    test('only as many as the limit allows, raised by giant totems '
        '(2026-10-30)', () {
      expect(farm.totemLimit, 3);
      putUp('totem_growth', const TilePos(8, 8));
      putUp('totem_growth', const TilePos(9, 8));
      putUp('totem_growth', const TilePos(10, 8));
      Object? fourth() => farm.apply(
        FarmCommand.build(kind: 'totem_growth', origin: const TilePos(8, 10)),
      );
      expect(fourth(), FarmRejection.totemLimit);
      final spot =
          [
            for (var y = 0; y < 24; y++)
              for (var x = 0; x < 24; x++) TilePos(x, y),
          ].firstWhere(
            (tile) =>
                ((tile.x - 9).abs() > 3 || (tile.y - 9).abs() > 3) &&
                farm.canPlace(TileRect(origin: tile, width: 2, height: 2)),
          );
      final giant = putUp('giant_totem', spot);
      expect(farm.totemLimit, 5);
      expect(fourth(), isNull);
      expect(
        farm.apply(FarmCommand.demolish(buildingId: giant)),
        FarmRejection.totemsNeedIt,
        reason: 'four totems stand, three without it',
      );
      final save = FarmDocument.of(farm).toJson();
      expect(save.containsKey('totem_limit'), isFalse);
    });

    test('1x1 buildings may touch any building on their sides and top, '
        'never on the tile in front of a door (2026-10-30)', () {
      const one = TilePos(10, 8);
      putUp('totem_growth', one);
      final totem = catalog.buildings['totem_growth']!;
      final house = catalog.buildings['house']!;
      final field = catalog.buildings['field_office']!;
      bool fits(TilePos origin, BuildingData data) => farm.canPlace(
        TileRect(origin: origin, width: data.width, height: data.height),
        building: data,
      );

      expect(totem.hugs, isTrue);
      expect(catalog.buildings['potato_cellar']!.hugs, isTrue);
      expect(catalog.buildings['statue']!.hugs, isTrue);
      expect(house.hugs, isFalse);
      expect(fits(one, totem), isFalse, reason: 'not on one');
      final statue = catalog.buildings['statue']!;
      expect(fits(const TilePos(9, 8), statue), isTrue, reason: 'beside');
      expect(fits(const TilePos(10, 9), statue), isFalse, reason: 'its door');
      expect(
        fits(const TilePos(10, 9), totem),
        isTrue,
        reason: 'totems touch on every side (2026-10-30)',
      );
      expect(
        fits(const TilePos(9, 9), statue),
        isTrue,
        reason: 'corner to corner, off the door',
      );
      expect(
        fits(const TilePos(8, 8), field),
        isTrue,
        reason: 'a bigger building may stand beside a 1x1 one',
      );
      expect(
        fits(const TilePos(9, 9), field),
        isFalse,
        reason: 'nor over its door',
      );
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(9, 8), width: 1, height: 1),
        ),
        isTrue,
        reason: 'a field may stand beside a 1x1 building (2026-10-31)',
      );
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(10, 9), width: 1, height: 1),
        ),
        isFalse,
        reason: 'but not over its door',
      );
    });

    test('1x1 buildings may touch a field on their sides and top, never '
        'on the tile in front of a door (2026-10-31)', () {
      final statue = catalog.buildings['statue']!;
      final house = catalog.buildings['house']!;
      // The starting field covers (12, 9) to (13, 10); its door is (12, 11).
      expect(farm.fields.first.rect.origin, const TilePos(12, 9));
      bool fits(TilePos origin, BuildingData data) => farm.canPlace(
        TileRect(origin: origin, width: data.width, height: data.height),
        building: data,
      );

      expect(fits(const TilePos(11, 9), statue), isTrue, reason: 'left');
      expect(fits(const TilePos(14, 9), statue), isTrue, reason: 'right');
      expect(
        fits(const TilePos(13, 11), statue),
        isTrue,
        reason: 'below, its top against the field',
      );
      expect(fits(const TilePos(11, 8), statue), isTrue, reason: 'corner');
      expect(fits(const TilePos(12, 11), statue), isFalse, reason: 'its door');
      expect(
        fits(const TilePos(12, 8), statue),
        isFalse,
        reason: 'above: its own door would open into the field',
      );
      expect(
        fits(const TilePos(14, 8), house),
        isFalse,
        reason: 'bigger buildings keep their distance',
      );
    });

    test('a 1x1 building may stand on top of a wider one, off its door '
        '(2026-10-30)', () {
      putUp('field_office', const TilePos(8, 8));
      final totem = catalog.buildings['totem_growth']!;
      // The office's door is below its left tile (8, 10).
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(9, 10), width: 1, height: 1),
          building: totem,
        ),
        isTrue,
      );
      expect(
        farm.canPlace(
          const TileRect(origin: TilePos(8, 10), width: 1, height: 1),
          building: totem,
        ),
        isFalse,
      );
    });

    test('graveyards may stand next to each other, even in front of a '
        'door (2026-10-30)', () {
      final graveyard = catalog.buildings['graveyard']!;
      expect(graveyard.snug, 'graveyard');
      expect(catalog.buildings['totem_growth']!.snug, 'totem');
      expect(catalog.buildings['house']!.snug, isNull);
      putUp('graveyard', const TilePos(8, 8));
      final below = TileRect(
        origin: TilePos(8, 8 + graveyard.height),
        width: graveyard.width,
        height: graveyard.height,
      );
      expect(farm.canPlace(below, building: graveyard), isTrue);
      expect(
        farm.canPlace(below, building: catalog.buildings['totem_growth']),
        isFalse,
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
