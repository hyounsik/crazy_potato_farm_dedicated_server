import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// The truck bed and the bag that comes back from a run (`multiplayer.md`,
/// 2026-10-28).
void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  const rapid = Gear(
    kind: GearKind.weapon,
    family: 'rapid',
    grade: Grade.normal,
    level: 1,
  );

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 100;
  });

  List<ItemStack> filled(Bag bag) => [...bag.slots.whereType<ItemStack>()];

  test('a farm has an empty bed of the fixed size and an empty bag', () {
    expect(farm.bed.capacity, catalog.rules.storage.bedSlots);
    expect(filled(farm.bed), isEmpty);
    expect(farm.bagItems, isEmpty);
  });

  test('baby potatoes, seeds, materials and gear load onto the bed', () {
    final rare = plainSeed(PotatoType.food, Grade.rare);
    final before = farm.seeds.count(rare);
    farm.apply(
      FarmCommand.returnHome(
        food: 0,
        seeds: [SeedCount(seed: rare, count: 2)],
        materials: {'material': 5},
        gear: [rapid],
      ),
    );

    expect(
      farm.apply(const FarmCommand.loadBed(item: 'food', count: 30)),
      null,
    );
    expect(
      farm.apply(FarmCommand.loadBed(item: 'seed_food_rare', seed: rare)),
      null,
    );
    expect(
      farm.apply(const FarmCommand.loadBed(item: 'material', count: 5)),
      null,
    );
    expect(
      farm.apply(
        const FarmCommand.loadBed(item: 'gear_rapid_normal', gearIndex: 0),
      ),
      null,
    );

    expect(farm.food, 70);
    expect(farm.seeds.count(rare), before + 1);
    expect(farm.materials, isEmpty);
    expect(farm.gear, isEmpty);
    expect(
      [for (final s in filled(farm.bed)) s.item],
      ['food', 'seed_food_rare', 'material', 'gear_rapid_normal'],
    );
  });

  test('loading more than storage has changes nothing', () {
    expect(
      farm.apply(const FarmCommand.loadBed(item: 'food', count: 101)),
      FarmRejection.notStored,
    );
    expect(
      farm.apply(const FarmCommand.loadBed(item: 'material')),
      FarmRejection.notStored,
    );
    expect(farm.food, 100);
    expect(filled(farm.bed), isEmpty);
  });

  test('a full bed keeps what does not fit in storage', () {
    final slots = catalog.rules.storage.bedSlots;
    final stack = catalog.stackOf('material');
    farm.apply(FarmCommand.returnHome(food: 0, materials: {'material': 999}));
    expect(
      farm.apply(FarmCommand.loadBed(item: 'material', count: slots * stack)),
      null,
    );
    expect(
      farm.apply(const FarmCommand.loadBed(item: 'material')),
      FarmRejection.bedFull,
    );
    expect(farm.materials['material'], 999 - slots * stack);
  });

  test('unloading the bed puts the stack back into storage', () {
    farm.apply(const FarmCommand.loadBed(item: 'food', count: 30));
    expect(farm.apply(const FarmCommand.unloadBed(slot: 0)), null);
    expect(farm.food, 100);
    expect(
      farm.apply(const FarmCommand.unloadBed(slot: 0)),
      FarmRejection.emptySlot,
    );
  });

  test('a run comes back into the bag, which then goes into storage', () {
    final rare = plainSeed(PotatoType.food, Grade.rare);
    final before = farm.seeds.count(rare);
    final result = RaidResult(
      outcome: RaidOutcome.wentHome,
      items: [
        ItemStack('food', 30),
        ItemStack('seed_food_rare', 1, seed: rare),
        ItemStack('material', 9),
      ],
      companions: const [],
      score: 3,
      lost: false,
    );
    expect(farm.apply(result.homecoming(catalog, toBag: true)), null);
    expect(farm.food, 100, reason: 'the bag is not storage');
    expect(farm.bagItems.map((s) => s.item), [
      'food',
      'seed_food_rare',
      'material',
    ]);
    expect(farm.progress, 3);

    expect(farm.apply(const FarmCommand.unloadBag(slot: 2)), null);
    expect(farm.materials, {'material': 9});
    expect(farm.apply(const FarmCommand.unpackBag()), null);
    expect(farm.food, 130);
    expect(farm.seeds.count(rare), before + 1);
    expect(farm.bagItems, isEmpty);
  });

  test('a lost run empties the bag', () {
    farm.apply(
      FarmCommand.returnHome(food: 0, bag: [ItemStack('material', 4)]),
    );
    expect(farm.bagItems, isNotEmpty);
    final lost = RaidResult(
      outcome: RaidOutcome.fainted,
      items: const [],
      companions: const [],
      score: 0,
      lost: true,
    );
    farm.apply(lost.homecoming(catalog, toBag: true));
    expect(farm.bagItems, isEmpty);
  });

  test('the bag sets out with the next run', () {
    farm.apply(
      FarmCommand.returnHome(food: 0, bag: [ItemStack('material', 4)]),
    );
    final start = memberStartFor(farm, food: 10);
    final run = RaidSimulation.party(
      catalog: catalog,
      zone: 'sample_zone',
      seed: 1,
      members: [start],
    );
    expect(run.bag.countOf('material'), 4);
    expect(run.bag.countOf('food'), 10);
    expect(
      RaidMemberStart.fromJson(start.toJson()).bag.single.count,
      4,
      reason: 'the bag travels to the host',
    );
  });

  test('the bed and the bag are saved', () {
    farm.apply(const FarmCommand.loadBed(item: 'food', count: 30));
    farm.apply(
      FarmCommand.returnHome(food: 0, bag: [ItemStack('material', 4)]),
    );
    final json = FarmDocument.of(farm).toJson();
    final back = FarmDocument.decode(json).toSimulation(catalog);
    expect(back.bed.capacity, catalog.rules.storage.bedSlots);
    expect(back.bed.countOf('food'), 30);
    expect(back.bag.countOf('material'), 4);
  });
}
