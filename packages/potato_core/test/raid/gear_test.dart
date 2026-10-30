import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

/// Gear in runs: what it does, finding and swapping it, dropping items,
/// and losing it.
void main() {
  late Catalog catalog;

  const smallBag = Gear(kind: GearKind.bag, grade: Grade.normal, level: 1);
  const bigBag = Gear(kind: GearKind.bag, grade: Grade.legendary, level: 1);
  const rareRapid = Gear(
    kind: GearKind.weapon,
    family: 'rapid',
    grade: Grade.rare,
    level: 10,
  );

  setUpAll(() => catalog = sampleCatalog());

  RaidSimulation run({
    Equipped equipped = const Equipped(),
    String zone = 'sample_zone',
    int progress = 0,
    List<CompanionStart> team = const [],
    Catalog? using,
  }) => RaidSimulation.start(
    catalog: using ?? catalog,
    zone: zone,
    seed: 3,
    food: 30,
    equipped: equipped,
    progress: progress,
    companions: team,
  );

  ItemStack stackOf(Gear gear) =>
      ItemStack.ofGear(catalog.gearItemOf(gear)!, gear);

  test('bare hands: the bare weapon and bag', () {
    final bare = run();
    expect(bare.player.weapon, catalog.rules.gear.bareWeapon);
    expect(bare.bag.capacity, catalog.rules.gear.bareBagSlots);
  });

  test('the worn bag sets the slots; the weapon its grade and level', () {
    final stats = GearStats(catalog);
    final r = run(
      equipped: const Equipped(weapon: rareRapid, bag: bigBag),
    );
    expect(r.bag.capacity, catalog.rules.gear.bagSlots[Grade.legendary]);
    expect(r.player.weapon, 'rapid');
    final base = catalog.weapons['rapid']!.damage;
    expect(
      r.playerShotDamage,
      closeTo(base * stats.damageScale(rareRapid), 1e-9),
    );
    expect(
      stats.damageScale(rareRapid),
      closeTo(
        1.25 * levelGrowth(catalog.rules.gear.levelDamagePermille, 10),
        1e-9,
      ),
    );
  });

  test('a belt slot makes its potato stronger', () {
    const belt = Gear(
      kind: GearKind.belt,
      grade: Grade.legendary,
      level: 0,
      slots: [PotatoType.combat],
    );
    const fighter = CompanionStart(
      potatoId: 1,
      type: PotatoType.combat,
      grade: Grade.normal,
      abilities: ['combat.plain'],
      style: CombatStyle.melee,
    );
    final plain = run(team: [fighter]).companions.single;
    final boosted = run(
      equipped: const Equipped(belt: belt),
      team: [fighter],
    ).companions.single;
    final boost = GearStats(catalog).beltBoost(belt);
    expect(boost, greaterThan(0));
    expect(boosted.maxHp, closeTo(plain.maxHp * (1 + boost), 1e-9));
  });

  test('gear found takes the zone score as its level; belts roll slots', () {
    final withGear = sampleCatalogWith((files) {
      final tables = (files['loot_tables'] as Map)['loot_tables'] as List;
      final spot = tables.firstWhere((t) => (t as Map)['id'] == 'spot') as Map;
      spot['entries'] = [
        {'item': 'gear_belt_rare', 'weight': 1, 'min': 1, 'max': 1},
      ];
    });
    final r = run(using: withGear);
    final found = r.piles
        .where((p) => p.kind == PileKind.spot)
        .expand((p) => p.loot.items)
        .map((s) => s.gear!)
        .toList();
    expect(found, isNotEmpty);
    for (final belt in found) {
      expect(belt.level, withGear.zones['sample_zone']!.score);
      expect(belt.slots, hasLength(withGear.rules.gear.beltSlots[Grade.rare]));
    }
  });

  test('a bag adds a little max health by its level (2026-10-30)', () {
    final plain = run().player.maxHp;
    const leveled = Gear(kind: GearKind.bag, grade: Grade.normal, level: 50);
    final bonus = GearStats(catalog).bagHp(leveled);
    expect(bonus, closeTo(0.1, 1e-9), reason: '+2% per ten levels');
    expect(
      run(equipped: const Equipped(bag: leveled)).player.maxHp,
      closeTo(plain * 1.1, 1e-9),
    );
  });

  group('found levels (2026-10-30)', () {
    late final zone = catalog.zones['sample_zone']!.copyWith(
      score: 15,
      levelMin: 15,
      levelMax: 24,
    );
    Gear weapon(int level) =>
        Gear(kind: GearKind.weapon, grade: Grade.normal, level: level);
    final random = GameRandom(7);

    test('the party average plus 0 to 2, inside the zone range', () {
      final levels = LootLevels(
        zone,
        worn: [
          Equipped(weapon: weapon(18)),
          Equipped(weapon: weapon(20)),
        ],
        seedLevels: [
          {PotatoType.combat: 30},
          {PotatoType.combat: 30},
        ],
      );
      for (var i = 0; i < 50; i++) {
        expect(levels.gear(GearKind.weapon, random), inInclusiveRange(19, 21));
        expect(levels.seed(PotatoType.combat, random), 24, reason: 'top');
      }
    });

    test('bare hands and missing types start at the bottom', () {
      final levels = LootLevels(
        zone,
        worn: [
          const Equipped(),
          Equipped(weapon: weapon(3)),
        ],
        seedLevels: [const {}],
      );
      for (var i = 0; i < 50; i++) {
        expect(levels.gear(GearKind.bag, random), inInclusiveRange(15, 17));
        expect(levels.gear(GearKind.weapon, random), inInclusiveRange(15, 17));
        expect(levels.seed(PotatoType.food, random), inInclusiveRange(15, 17));
      }
    });

    test('B: every kind from the average of the best owned of each', () {
      final levels = LootLevels(
        zone,
        mode: LootLevelMode.ownedAverage,
        worn: [const Equipped()],
        owned: [
          {GearKind.weapon: 21, GearKind.bag: 18, GearKind.belt: 15},
        ],
        seedLevels: [const {}],
      );
      for (var i = 0; i < 50; i++) {
        for (final kind in GearKind.values) {
          expect(levels.gear(kind, random), inInclusiveRange(18, 20));
        }
      }
    });

    test('C: each kind from the best owned of that kind', () {
      final levels = LootLevels(
        zone,
        mode: LootLevelMode.ownedBest,
        worn: [const Equipped()],
        owned: [
          {GearKind.weapon: 21},
          {GearKind.weapon: 19, GearKind.bag: 20},
        ],
        seedLevels: [const {}],
      );
      for (var i = 0; i < 50; i++) {
        expect(levels.gear(GearKind.weapon, random), inInclusiveRange(20, 22));
        expect(levels.gear(GearKind.bag, random), inInclusiveRange(18, 20));
      }
    });

    test('owned counts only pieces that are not broken and can be worn', () {
      final owned = LootLevels.ownedLevels(
        GearStats(catalog),
        [
          weapon(25),
          weapon(12).copyWith(wear: catalog.rules.gear.durability),
          weapon(9),
          const Gear(kind: GearKind.belt, grade: Grade.normal, level: 4),
        ],
        catalog.rules.gear.useMargin,
        stored: const {GearKind.bag: 7, GearKind.belt: 6},
      );
      expect(owned, {GearKind.weapon: 9, GearKind.bag: 7, GearKind.belt: 6});
    });
  });

  test(
    'wearing from the bag swaps; a smaller bag drops what no longer fits',
    () {
      final r = run(equipped: const Equipped(bag: bigBag));
      // Pieces of gear never stack, so each keeps its slot.
      for (var i = 0; i < r.bag.capacity; i++) {
        r.bag.slots[i] ??= stackOf(rareRapid.copyWith(level: i));
      }
      r.bag.replace(0, stackOf(smallBag));
      expect(r.apply(const EquipFromBag(0)), isNull);
      expect(r.player.equipped.bag, smallBag);
      expect(r.bag.capacity, catalog.rules.gear.bagSlots[Grade.normal]);
      expect(
        r.bag.slots.first!.gear,
        bigBag,
        reason: 'the old bag takes the slot',
      );
      final dropped = r.piles.where((p) => p.kind == PileKind.bundle).single;
      final left =
          catalog.rules.gear.bagSlots[Grade.legendary]! -
          catalog.rules.gear.bagSlots[Grade.normal]!;
      expect(dropped.loot.items.fold(0, (n, s) => n + s.count), left);
      expect(dropped.position, r.player.position);
    },
  );

  test('gear past progress plus the margin cannot be worn', () {
    final r = run();
    final margin = catalog.rules.gear.useMargin;
    r.bag.replace(0, stackOf(rareRapid.copyWith(level: margin + 1)));
    expect(r.apply(const EquipFromBag(0)), RaidRejection.cannotWear);
    expect(r.apply(const EquipFromBag(1)), RaidRejection.noGear);
  });

  test('the belt cannot be changed during a run (2026-10-28)', () {
    const one = Gear(
      kind: GearKind.belt,
      grade: Grade.normal,
      level: 0,
      slots: [PotatoType.buff],
    );
    final r = run(equipped: const Equipped(belt: one));
    r.bag.replace(0, stackOf(one));
    expect(r.apply(const EquipFromBag(0)), RaidRejection.beltLocked);
    expect(r.apply(const Unequip(GearKind.belt)), RaidRejection.beltLocked);
    expect(r.player.equipped.belt, one);
  });

  test('taking off the bag keeps it and drops what no longer fits', () {
    final r = run(equipped: const Equipped(bag: bigBag));
    for (var i = 0; i < r.bag.capacity; i++) {
      r.bag.slots[i] = stackOf(rareRapid.copyWith(level: i));
    }
    expect(r.apply(const Unequip(GearKind.bag)), isNull);
    expect(r.player.equipped.bag, isNull);
    expect(r.bag.slots.first!.gear, bigBag);
    expect(r.piles.where((p) => p.kind == PileKind.bundle), hasLength(1));
  });

  test('items can be dropped in a bundle and put into a pile', () {
    final r = run();
    r.bag.replace(1, ItemStack('material', 5));
    expect(r.apply(const DropItem(1)), isNull);
    expect(r.bag.slots[1], isNull);
    final bundle = r.piles.singleWhere((p) => p.kind == PileKind.bundle);
    expect(bundle.loot.items.single.count, 5);

    r.bag.replace(2, ItemStack('material', 3));
    expect(r.apply(PutInPile(bundle.id, 2)), isNull);
    expect(bundle.loot.items.single.count, 8, reason: 'merged with the rest');
    expect(r.apply(const DropItem(2)), RaidRejection.emptySlot);
  });

  test('a lost danger run keeps each worn piece by its own roll', () {
    Catalog losing(double chance) => sampleCatalogWith((files) {
      (rulesOf(files)['gear'] as Map)['loss_chance'] = chance;
    });
    const worn = Equipped(weapon: rareRapid, bag: bigBag);
    RaidResult fail(Catalog using) {
      final r = run(using: using, zone: 'sample_danger', equipped: worn)
        ..player.hp = 0
        ..player.sinceHit = 0;
      r.step();
      return r.result!;
    }

    expect(fail(losing(1)).equipped, const Equipped());
    // Kept pieces come home a little worn (2026-10-30).
    final kept = GearStats(catalog).afterRun(worn, 0.1);
    expect(fail(losing(0)).equipped, kept);
    final home = fail(losing(0)).homecoming(catalog) as ReturnHome;
    expect(home.equipped, kept);
  });

  group('wear (2026-10-30)', () {
    late final stats = GearStats(catalog);

    test('a run wears what is worn by the time spent, up to a cap', () {
      final rules = catalog.rules.gear;
      Gear weapon(double seconds) =>
          stats.afterRun(const Equipped(weapon: rareRapid), seconds).weapon!;
      expect(weapon(0).wear, 0);
      expect(weapon(60).wear, rules.wearPerMinute.ceil());
      expect(weapon(3600).wear, rules.wearPerRunMax);
    });

    test('broken: a weapon keeps its family at a quarter of level 1; '
        'a bag works as bare hands', () {
      final broken = catalog.rules.gear.durability;
      expect(stats.isBroken(rareRapid.copyWith(wear: broken)), isTrue);
      expect(
        stats.bagSlots(bigBag.copyWith(wear: broken)),
        stats.bagSlots(null),
      );
      final weapon = rareRapid.copyWith(wear: broken);
      expect(stats.weaponOf(weapon), 'rapid');
      final plain = rareRapid.copyWith(grade: Grade.normal, level: 1);
      expect(
        stats.damageScale(weapon),
        closeTo(stats.damageScale(plain) / 4, 1e-9),
      );
      expect(stats.weaponDps(weapon), greaterThan(stats.weaponDps(null)));
      // Weaker than bare hands, it shoots as bare hands.
      final weak = GearStats(
        sampleCatalogWith((files) {
          (rulesOf(files)['gear'] as Map)['broken_damage'] = 0.01;
        }),
      );
      expect(weak.weaponOf(weapon), weak.weaponOf(null));
      expect(weak.weaponDps(weapon), weak.weaponDps(null));
    });
  });

  test('gear in the bag comes home to the box; the worn set too', () {
    final r = run(equipped: const Equipped(weapon: rareRapid));
    r.bag.replace(3, stackOf(bigBag));
    r.apply(const GoHome());
    final home = r.result!.homecoming(catalog) as ReturnHome;
    expect(home.gear, [bigBag]);
    expect(home.equipped, const Equipped(weapon: rareRapid));
  });

  test('saving with gear and going on equals never stopping', () {
    final a = run(
      equipped: const Equipped(weapon: rareRapid, bag: bigBag),
    );
    final b = RaidSimulation.fromJson(
      jsonDecode(jsonEncode(a.toJson())) as Map<String, dynamic>,
      catalog,
    );
    for (var i = 0; i < 300; i++) {
      a.step();
      b.step();
    }
    expect(jsonEncode(b.toJson()), jsonEncode(a.toJson()));
  });

  test('stored gear levels come along and survive saving', () {
    final a = RaidSimulation.start(
      catalog: catalog,
      zone: 'sample_zone',
      seed: 3,
      storedGearLevels: const {GearKind.weapon: 12},
    );
    final b = RaidSimulation.fromJson(
      jsonDecode(jsonEncode(a.toJson())) as Map<String, dynamic>,
      catalog,
    );
    expect(b.storedGearLevels, [
      {GearKind.weapon: 12},
    ]);
  });

  group('combat power', () {
    test('better gear and fighters raise it; the verdict follows', () {
      final stats = GearStats(catalog);
      final bare = stats.combatPower(const Equipped(), const []);
      final armed = stats.combatPower(
        const Equipped(weapon: rareRapid),
        const [],
      );
      final party = stats.combatPower(const Equipped(weapon: rareRapid), const [
        (type: PotatoType.combat, level: 5, style: CombatStyle.melee),
      ]);
      expect(armed, greaterThan(bare));
      expect(party, greaterThan(armed));
      final need = stats.recommendedPower(10);
      expect(stats.recommendedPower(20), greaterThan(need));
      expect(stats.verdict(need * 2, need), PowerVerdict.easy);
      expect(stats.verdict(need, need), PowerVerdict.fair);
      expect(stats.verdict(need ~/ 2, need), PowerVerdict.risky);
    });
  });
}
