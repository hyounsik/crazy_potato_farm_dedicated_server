import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// The seed pouch's size and overflow, materials, and the mailbox.
void main() {
  late Catalog catalog;
  late FarmSimulation farm;
  final normal = plainSeed(PotatoType.food, Grade.normal);
  final rare = plainSeed(PotatoType.food, Grade.rare);

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 1000;
  });

  /// Fills the pouch to the last slot.
  void fill() => farm.seeds.add(normal, farm.pouchRoom);

  FarmSimulation reload(FarmSimulation farm) {
    final json = jsonDecode(
      jsonEncode(FarmDocument.of(farm).toJson()),
    ) as Map<String, dynamic>;
    return FarmDocument.decode(json).toSimulation(catalog);
  }

  group('seed pouch', () {
    test('seeds past a full pouch wait, then turn into baby potatoes', () {
      fill();
      final had = farm.seeds.count(rare);
      expect(farm.pouchRoom, 0);
      farm.apply(
        FarmCommand.returnHome(
          food: 0,
          seeds: [SeedCount(seed: rare, count: 1)],
        ),
      );
      expect(farm.seeds.count(rare), had);
      expect(farm.overflow.single.seed, rare);
      expect(farm.takeEvents(), contains(FarmEvent.seedOverflowed(seed: rare)));

      final before = farm.food;
      farm.runSteps(catalog.rules.storage.overflowSeconds - 1);
      expect(farm.overflow, hasLength(1));
      farm.step();
      expect(farm.overflow, isEmpty);
      expect(farm.food, greaterThanOrEqualTo(before + 15));
      expect(
        farm.takeEvents(),
        contains(FarmEvent.overflowExpired(seed: rare, food: 15)),
      );
    });

    test('a waiting seed comes in once there is room', () {
      fill();
      final had = farm.seeds.count(rare);
      farm.apply(
        FarmCommand.returnHome(
          food: 0,
          seeds: [SeedCount(seed: rare, count: 1)],
        ),
      );
      expect(
        farm.apply(FarmCommand.takeOverflow(seed: rare)),
        FarmRejection.pouchFull,
      );
      expect(farm.apply(FarmCommand.sellSeed(seed: normal)), isNull);
      expect(farm.food, 1000 + 5);
      expect(farm.apply(FarmCommand.takeOverflow(seed: rare)), isNull);
      expect(farm.seeds.count(rare), had + 1);
      expect(farm.overflow, isEmpty);
    });

    test('widens a step at a time up to its most', () {
      final storage = catalog.rules.storage;
      expect(farm.pouchSlots, storage.pouchSlots);
      expect(farm.apply(const FarmCommand.widenPouch()), isNull);
      expect(farm.pouchSlots, storage.pouchSlots + storage.pouchStep);
      expect(farm.food, 1000 - storage.pouchStepFood);
      while (farm.pouchSlots < storage.pouchMax) {
        farm.apply(const FarmCommand.widenPouch());
      }
      expect(farm.apply(const FarmCommand.widenPouch()), FarmRejection.atMost);
      expect(farm.apply(const FarmCommand.widenGearBox()), isNull);
      expect(farm.gearSlots, storage.gearSlots + storage.gearStep);
    });
  });

  test('materials brought home are kept', () {
    farm
      ..apply(const FarmCommand.returnHome(food: 0, materials: {'scrap': 3}))
      ..apply(const FarmCommand.returnHome(food: 0, materials: {'scrap': 2}));
    expect(farm.materials, {'scrap': 5});
  });

  group('mail', () {
    test('a new farm has its start letter, unread', () {
      final letter = farm.mail.single;
      expect(letter.kind, MailKind.start);
      expect(farm.unreadMail, 1);
      expect(farm.apply(FarmCommand.readMail(mailId: letter.id)), isNull);
      expect(farm.unreadMail, 0);
      expect(
        farm.apply(FarmCommand.claimMail(mailId: letter.id)),
        FarmRejection.nothingToClaim,
      );
    });

    test('a building brings a letter with a seed of its type', () {
      farm.apply(
        FarmCommand.build(kind: 'training_ground', origin: const TilePos(8, 8)),
      );
      final letter = farm.mail.last;
      expect(letter.kind, MailKind.building);
      expect(letter.building, 'training_ground');
      final seed = letter.seeds.single;
      expect(seed.type, PotatoType.combat);
      expect(seed.level, catalog.rules.mail.buildingSeedLevel);

      final before = farm.seeds.count(seed);
      expect(farm.apply(FarmCommand.claimMail(mailId: letter.id)), isNull);
      expect(farm.seeds.count(seed), before + 1);
      expect(letter.claimed, isTrue);
      expect(
        farm.apply(FarmCommand.claimMail(mailId: letter.id)),
        FarmRejection.nothingToClaim,
      );
    });

    test('keeps only the newest letters', () {
      final keep = catalog.rules.mail.keep;
      for (var i = 0; i < keep; i++) {
        farm.apply(
          FarmCommand.build(
            kind: 'statue',
            origin: TilePos(8 + i % 4 * 2, 13 + i ~/ 4 * 2),
          ),
        );
      }
      expect(farm.mail, hasLength(keep));
      expect(farm.mail.any((m) => m.kind == MailKind.start), isFalse);
    });
  });

  test('pouch size, waiting seeds, materials and mail are saved', () {
    farm.apply(const FarmCommand.widenPouch());
    fill();
    farm
      ..apply(
        FarmCommand.returnHome(
          food: 0,
          seeds: [SeedCount(seed: rare, count: 1)],
          materials: const {'scrap': 4},
        ),
      )
      ..apply(
        FarmCommand.build(kind: 'training_ground', origin: const TilePos(8, 8)),
      );
    final loaded = reload(farm);
    expect(loaded.pouchSlots, farm.pouchSlots);
    expect(loaded.overflow.single.seed, rare);
    expect(
      loaded.overflow.single.expiresTick,
      farm.overflow.single.expiresTick,
    );
    expect(loaded.materials, {'scrap': 4});
    expect(loaded.mail.map((m) => m.kind), farm.mail.map((m) => m.kind));
    expect(loaded.mail.last.seeds, farm.mail.last.seeds);
  });
}
