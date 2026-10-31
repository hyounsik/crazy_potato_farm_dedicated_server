import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// The seed lab: built last, it turns a seed into another type
/// (2026-10-31, 사용자).
void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 3)
      ..food = 100000
      ..apply(const FarmCommand.unlockAll());
  });

  /// Builds [kind] on the first free spot, opening all the land first.
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

  /// Puts up one of every kind the lab waits for, then the lab.
  void buildLab() {
    for (final kind in farm.missingFor('seed_lab')) {
      expect(buildAnywhere(kind), isNull, reason: kind);
    }
    expect(buildAnywhere('seed_lab'), isNull);
  }

  group('costs', () {
    const lab = SeedLabRulesData();

    test('the band goes up every ten levels: 1-9 first, 90-99 tenth', () {
      expect(lab.band(1), 1);
      expect(lab.band(9), 1);
      expect(lab.band(10), 2);
      expect(lab.band(99), 10);
    });

    test('a turn costs 10 a band, doubled for a pick, x2 rare, x3 '
        'legendary', () {
      expect(lab.turnFood(Grade.normal, 1, picked: false), 10);
      expect(lab.turnFood(Grade.normal, 1, picked: true), 20);
      expect(lab.turnFood(Grade.normal, 95, picked: false), 100);
      expect(lab.turnFood(Grade.normal, 95, picked: true), 200);
      expect(lab.turnFood(Grade.rare, 15, picked: false), 40);
      expect(lab.turnFood(Grade.legendary, 95, picked: true), 600);
    });

    test('keeping the grade: dearer steps toward 100%', () {
      expect(lab.keepChance(Grade.normal, 0), 100);
      expect(lab.keepSteps(Grade.normal), 0);
      expect(lab.keepChance(Grade.rare, 0), 70);
      expect(lab.keepChance(Grade.rare, 3), 100);
      expect(lab.keepChance(Grade.legendary, 5), 100);
      // Rare 10 x (1, 2, 5), legendary 20 x (1, 1, 2, 3, 5), per band.
      expect(lab.keepStepsFood(Grade.rare, 1, 3), 80);
      expect(lab.keepStepsFood(Grade.legendary, 1, 5), 240);
      expect(lab.keepStepsFood(Grade.legendary, 1, 2), 40);
      expect(lab.keepStepsFood(Grade.legendary, 95, 5), 2400);
    });
  });

  test('the lab waits for every other kind but totems', () {
    expect(farm.missingFor('seed_lab'), isNotEmpty);
    expect(farm.missingFor('seed_lab'), contains('graveyard'));
    expect(farm.missingFor('seed_lab'), isNot(contains('totem_growth')));
    expect(farm.missingFor('graveyard'), isEmpty);
    expect(buildAnywhere('seed_lab'), FarmRejection.needsAllBuildings);
    buildLab();
    expect(farm.hasSeedLab, isTrue);
  });

  test('turning a seed needs the lab', () {
    final seed = plainSeed(PotatoType.food);
    farm.seeds.add(seed);
    expect(
      farm.apply(FarmCommand.convertSeed(seed: seed)),
      FarmRejection.noSeedLab,
    );
  });

  group('with the lab', () {
    setUp(buildLab);

    test('a picked type, paid for, level kept', () {
      final seed = plainSeed(PotatoType.food).copyWith(level: 12);
      farm.seeds.add(seed);
      final before = farm.food;
      farm.takeEvents();
      expect(
        farm.apply(
          FarmCommand.convertSeed(seed: seed, to: PotatoType.breeding),
        ),
        isNull,
      );
      expect(farm.food, before - 40);
      final event = farm.takeEvents().whereType<SeedConverted>().single;
      expect(event.from, seed);
      expect(event.seed.type, PotatoType.breeding);
      expect(event.seed.grade, Grade.normal);
      expect(event.seed.level, 12);
      expect(farm.seeds.count(seed), 0);
      expect(farm.seeds.count(event.seed), 1);
    });

    test('a random turn never gives the same type', () {
      final seed = plainSeed(PotatoType.combat);
      for (var i = 0; i < 30; i++) {
        farm.seeds.add(seed);
        farm.apply(FarmCommand.convertSeed(seed: seed));
        final turned = farm.takeEvents().whereType<SeedConverted>().single;
        expect(turned.seed.type, isNot(PotatoType.combat));
      }
    });

    test('the same type, too many steps, or too little food is refused', () {
      final seed = plainSeed(PotatoType.food, Grade.rare);
      farm.seeds.add(seed);
      expect(
        farm.apply(FarmCommand.convertSeed(seed: seed, to: PotatoType.food)),
        FarmRejection.sameType,
      );
      expect(
        farm.apply(FarmCommand.convertSeed(seed: seed, keep: 4)),
        FarmRejection.badKeep,
      );
      farm.food = 10;
      expect(
        farm.apply(FarmCommand.convertSeed(seed: seed)),
        FarmRejection.notEnoughFood,
      );
      expect(farm.seeds.count(seed), 1);
    });

    test('a legendary seed kept for sure stays legendary; unpaid, it '
        'sometimes drops to rare', () {
      final seed = plainSeed(PotatoType.food, Grade.legendary);
      for (var i = 0; i < 20; i++) {
        farm.seeds.add(seed);
        farm.apply(FarmCommand.convertSeed(seed: seed, keep: 5));
      }
      final sure = farm.takeEvents().whereType<SeedConverted>();
      expect(sure.map((e) => e.seed.grade), everyElement(Grade.legendary));
      for (var i = 0; i < 40; i++) {
        farm.seeds.add(seed);
        farm.apply(FarmCommand.convertSeed(seed: seed));
      }
      final grades = farm
          .takeEvents()
          .whereType<SeedConverted>()
          .map((e) => e.seed.grade)
          .toSet();
      expect(grades, {Grade.legendary, Grade.rare});
    });
  });
}
