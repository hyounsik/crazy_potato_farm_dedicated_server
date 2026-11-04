import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

/// The gear lab, the warehouse and the house table (2026-11-03, 사용자).
void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 3)
      ..food = 100000
      ..apply(const FarmCommand.unlockAll());
  });

  FarmRejection? buildAnywhere(String kind) {
    final size = catalog.rules.farm.size ~/ catalog.rules.farm.blockSize;
    for (var by = 0; by < size; by++) {
      for (var bx = 0; bx < size; bx++) {
        farm.apply(FarmCommand.openBlock(block: TilePos(bx, by)));
      }
    }
    final data = catalog.buildings[kind]!;
    for (var y = 0; y < catalog.rules.farm.size; y++) {
      for (var x = 0; x < catalog.rules.farm.size; x++) {
        final rect = TileRect(
          origin: TilePos(x, y),
          width: data.width,
          height: data.height,
        );
        if (farm.canPlace(rect, building: data)) {
          return farm.apply(
            FarmCommand.build(kind: kind, origin: TilePos(x, y)),
          );
        }
      }
    }
    return FarmRejection.blocked;
  }

  void buildAll(String kind) {
    for (final need in farm.missingFor(kind)) {
      if (farm.hasSeedLab && need == 'seed_lab') continue;
      expect(buildAnywhere(need), isNull, reason: need);
    }
    expect(buildAnywhere(kind), isNull, reason: kind);
  }

  Gear box(Grade grade, {int wear = 500, List<GearAbility>? abilities}) {
    final piece = Gear(
      kind: GearKind.weapon,
      family: 'rapid',
      grade: grade,
      level: 5,
      wear: wear,
      abilities: abilities ?? const [],
    );
    farm.apply(FarmCommand.returnHome(food: 0, gear: [piece]));
    return piece;
  }

  void runMinutes(int minutes) =>
      farm.runSteps(minutes * 60000 ~/ catalog.rules.farm.stepMillis);

  group('gear lab', () {
    test('the two labs do not wait for each other', () {
      expect(farm.missingFor('seed_lab'), isNot(contains('gear_lab')));
      expect(farm.missingFor('gear_lab'), isNot(contains('seed_lab')));
      expect(farm.missingFor('seed_lab'), isNot(contains('warehouse')));
    });

    test('a seed lab is not a gear lab', () {
      buildAll('seed_lab');
      expect(farm.hasSeedLab, isTrue);
      expect(farm.hasGearLab, isFalse);
      box(Grade.normal);
      expect(
        farm.apply(FarmCommand.repairGear(index: farm.gear.length - 1)),
        FarmRejection.noGearLab,
      );
    });

    test('a mend makes a piece as new, or breaks it up for materials', () {
      buildAll('gear_lab');
      final material = catalog.rules.workbench.material;
      var mended = 0;
      var broke = 0;
      for (var i = 0; i < 200; i++) {
        farm.food = 100000;
        farm.apply(FarmCommand.returnHome(food: 0, materials: {material: 10}));
        box(Grade.legendary);
        final index = farm.gear.length - 1;
        final before = farm.gear.length;
        expect(farm.apply(FarmCommand.repairGear(index: index)), isNull);
        if (farm.gear.length == before) {
          expect(farm.gear[index].wear, 0);
          mended++;
          farm.apply(FarmCommand.disassembleGear(index: index));
        } else {
          broke++;
        }
      }
      expect(mended, greaterThan(0));
      expect(broke, greaterThan(0));
    });

    test('better grades break more often, however little worn', () {
      buildAll('gear_lab');
      int breaks(Grade grade) {
        final material = catalog.rules.workbench.material;
        var broke = 0;
        for (var i = 0; i < 400; i++) {
          farm.food = 100000;
          farm.apply(
            FarmCommand.returnHome(food: 0, materials: {material: 10}),
          );
          box(grade, wear: 1);
          final index = farm.gear.length - 1;
          final before = farm.gear.length;
          farm.apply(FarmCommand.repairGear(index: index));
          if (farm.gear.length < before) {
            broke++;
          } else {
            farm.apply(FarmCommand.disassembleGear(index: index));
          }
        }
        return broke;
      }

      expect(breaks(Grade.legendary), greaterThan(breaks(Grade.normal)));
    });

    test('a piece as new has nothing to mend', () {
      buildAll('gear_lab');
      box(Grade.normal, wear: 0);
      expect(
        farm.apply(FarmCommand.repairGear(index: farm.gear.length - 1)),
        FarmRejection.notWorn,
      );
    });

    test('a roll is paid for and keeps the rest; normal has none to roll', () {
      buildAll('gear_lab');
      box(Grade.normal);
      expect(
        farm.apply(FarmCommand.rerollGear(index: farm.gear.length - 1)),
        FarmRejection.noAbilities,
      );
      box(
        Grade.legendary,
        abilities: const [
          GearAbility(id: 'hp', tier: 0),
          GearAbility(id: 'companion_hp', tier: 0),
        ],
      );
      final index = farm.gear.length - 1;
      final before = farm.food;
      expect(farm.apply(FarmCommand.rerollGear(index: index)), isNull);
      expect(farm.food, before - farm.gearRerollFood(farm.gear[index]));
      expect(farm.gear[index].level, 5);
      expect(farm.gear[index].wear, 500);
    });
  });

  group('warehouse', () {
    test('needs both labs, and adds room past the widened sizes', () {
      expect(
        farm.missingFor('warehouse'),
        containsAll(['seed_lab', 'gear_lab']),
      );
      final pouch = farm.pouchCapacity;
      final gear = farm.gearCapacity;
      buildAll('seed_lab');
      buildAll('gear_lab');
      expect(farm.missingFor('warehouse'), isEmpty);
      expect(buildAnywhere('warehouse'), isNull);
      expect(farm.pouchCapacity, pouch + 20);
      expect(farm.gearCapacity, gear + 10);
      expect(farm.pouchSlots + 20, farm.pouchCapacity);
    });

    test('cannot come down while what it holds would not fit', () {
      buildAll('seed_lab');
      buildAll('gear_lab');
      expect(buildAnywhere('warehouse'), isNull);
      final id = farm.buildings.firstWhere((b) => b.kind == 'warehouse').id;
      while (farm.gear.length <= farm.gearSlots) {
        box(Grade.normal);
      }
      expect(
        farm.apply(FarmCommand.demolish(buildingId: id)),
        FarmRejection.warehouseNotEmpty,
      );
    });
  });

  group('house table', () {
    const dish = 'grilled_berries';

    void open() => farm.apply(
      const FarmCommand.returnHome(
        food: 0,
        score: 5,
        zone: 'sample_danger',
        bossKilledIn: 'sample_danger',
      ),
    );

    test('a dish opens only by killing the boss and getting out', () {
      expect(
        farm.apply(const FarmCommand.eatMeal(meal: dish)),
        FarmRejection.mealLocked,
      );
      farm.apply(
        const FarmCommand.returnHome(food: 0, bossKilledIn: 'sample_danger'),
      );
      expect(
        farm.mealsOpen,
        isNot(contains(dish)),
        reason: 'killed it but did not escape',
      );
      farm.apply(
        const FarmCommand.returnHome(food: 0, score: 5, zone: 'sample_danger'),
      );
      expect(
        farm.mealsOpen,
        isNot(contains(dish)),
        reason: 'escaped without the kill',
      );
      open();
      expect(farm.mealsOpen, contains(dish));
    });

    test('steamed potatoes are open from the start (2026-11-04)', () {
      expect(farm.mealsOpen, {'steamed_potato'});
      expect(
        farm.apply(const FarmCommand.eatMeal(meal: 'steamed_potato')),
        isNull,
      );
    });

    test('two dishes last at once; a third only fills the belly until the '
        'oldest wears off (2026-11-04)', () {
      open();
      expect(farm.apply(const FarmCommand.eatMeal(meal: dish)), isNull);
      expect(farm.mealHpBonusOf(farm.kit), closeTo(0.1, 1e-9));
      runMinutes(30);
      expect(
        farm.apply(const FarmCommand.eatMeal(meal: 'steamed_potato')),
        isNull,
      );
      expect(farm.mealHpBonusOf(farm.kit), closeTo(0.2, 1e-9));
      final left = farm.mealsLeft();
      expect([for (final m in left) m.dish], [dish, 'steamed_potato']);
      expect(left.first.seconds, closeTo(30 * 60, 60));
      expect(left.last.seconds, closeTo(60 * 60, 60));
      expect(
        farm.apply(const FarmCommand.eatMeal(meal: dish)),
        FarmRejection.stillFull,
      );
      expect(farm.mealsLeft(), hasLength(2), reason: 'none renews');
      runMinutes(31);
      expect(farm.mealsLeft(), hasLength(1));
      expect(farm.apply(const FarmCommand.eatMeal(meal: dish)), isNull);
      runMinutes(61);
      expect(farm.mealHpBonusOf(farm.kit), 0);
    });

    test('the dishes and what opened are saved', () {
      open();
      farm.apply(const FarmCommand.eatMeal(meal: dish));
      farm.apply(const FarmCommand.eatMeal(meal: 'steamed_potato'));
      final loaded = FarmDocument.of(farm).toSimulation(catalog);
      expect(loaded.mealsOpen, contains(dish));
      expect(loaded.kit.meals, farm.kit.meals);
      expect(loaded.kit.meals, hasLength(2));
    });

    test('a save from before dishes stacked keeps its one dish', () {
      final json = FarmDocument.of(farm).toJson()
        ..remove('meals')
        ..['meal_until_tick'] = farm.tick + 100;
      final loaded = FarmDocument.fromJson(json).toSimulation(catalog);
      expect([for (final m in loaded.kit.meals) m.dish], ['steamed_potato']);
    });

    test('a run set out on after eating has more health', () {
      final plain = memberStartFor(farm, food: 0);
      open();
      farm.apply(const FarmCommand.eatMeal(meal: dish));
      final fed = memberStartFor(farm, food: 0);
      expect(plain.mealHpBonus, 0);
      expect(fed.mealHpBonus, closeTo(0.1, 1e-9));
      expect(
        RaidMemberStart.fromJson(fed.toJson()).mealHpBonus,
        closeTo(0.1, 1e-9),
      );
      // Shown on the run's status with the time it had left.
      final again = RaidMemberStart.fromJson(fed.toJson());
      expect([for (final m in again.meals) m.dish], [dish]);
      expect(again.meals.single.seconds, closeTo(3600, 1));
      final run = RaidSimulation.party(
        catalog: catalog,
        zone: 'sample_zone',
        seed: 1,
        members: [fed],
      );
      final saved = RaidSimulation.fromJson(run.toJson(), catalog);
      expect([for (final m in saved.members.first.meals) m.dish], [dish]);
    });
  });
}
