import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

/// Gear abilities (2026-11-01, 사용자): none for normal, one for rare, two
/// for legendary, from one pool weighed by rarity, an ability once a piece.
void main() {
  late Catalog catalog;
  late GearStats stats;

  List<Map<String, Object>> tiers(num a, num b, num c) => [
    {'rarity': 'normal', 'percent': a},
    {'rarity': 'low', 'percent': b},
    {'rarity': 'very_low', 'percent': c},
  ];

  setUpAll(() {
    catalog = sampleCatalogWith((files) {
      final gear =
          (files['rules']! as Map<String, dynamic>)['gear']
              as Map<String, dynamic>;
      gear['abilities'] = [
        {'id': 'hp', 'stat': 'hp', 'tiers': tiers(3, 5, 8)},
        {'id': 'food_use', 'stat': 'food_use', 'tiers': tiers(-10, -15, -20)},
        {
          'id': 'weapon.damage',
          'stat': 'damage',
          'kinds': ['weapon'],
          'tiers': tiers(5, 10, 15),
        },
        {
          'id': 'weapon.range',
          'stat': 'range',
          'kinds': ['weapon'],
          'tiers': tiers(3, 6, 9),
        },
        {
          'id': 'shotgun.spread',
          'stat': 'spread',
          'kinds': ['weapon'],
          'families': ['spread'],
          'tiers': tiers(-3, -6, -9),
        },
        {
          'id': 'belt.bonus',
          'stat': 'belt_bonus',
          'kinds': ['belt'],
          'tiers': tiers(3, 6, 9),
        },
      ];
    });
    stats = GearStats(catalog);
  });

  test('grade sets how many, each fits the piece and comes once', () {
    final random = GameRandom(7);
    for (var i = 0; i < 200; i++) {
      expect(
        stats.rollAbilities(GearKind.weapon, 'rapid', Grade.normal, random),
        isEmpty,
      );
      expect(
        stats.rollAbilities(GearKind.bag, '', Grade.rare, random),
        hasLength(1),
      );
      final rapid = stats.rollAbilities(
        GearKind.weapon,
        'rapid',
        Grade.legendary,
        random,
      );
      expect(rapid, hasLength(2));
      expect(rapid.map((a) => a.id).toSet(), hasLength(2));
      for (final a in rapid) {
        expect(a.id, isNot(anyOf('shotgun.spread', 'belt.bonus')));
      }
      final belt = stats.rollAbilities(
        GearKind.belt,
        '',
        Grade.legendary,
        random,
      );
      for (final a in belt) {
        expect(a.id, isNot(startsWith('weapon.')));
      }
    }
  });

  test('the common tier comes most often', () {
    final random = GameRandom(3);
    final byTier = [0, 0, 0];
    for (var i = 0; i < 3000; i++) {
      final a = stats.rollAbilities(GearKind.bag, '', Grade.rare, random);
      byTier[a.single.tier]++;
    }
    expect(byTier[0], greaterThan(byTier[1]));
    expect(byTier[1], greaterThan(byTier[2]));
  });

  test('abilities change the numbers, a broken piece loses them', () {
    const plain = Gear(
      kind: GearKind.weapon,
      family: 'spread',
      grade: Grade.legendary,
      level: 1,
    );
    final strong = plain.copyWith(
      abilities: const [
        GearAbility(id: 'weapon.damage', tier: 1),
        GearAbility(id: 'shotgun.spread', tier: 2),
      ],
    );
    expect(
      stats.damageScale(strong),
      closeTo(stats.damageScale(plain) * 1.1, 1e-9),
    );
    final gun = catalog.weapons['spread']!;
    expect(
      stats.tuned(gun, strong).spreadDegrees,
      closeTo(gun.spreadDegrees * 0.91, 1e-9),
    );
    expect(stats.tuned(gun, strong).range, gun.range);

    final bag = Gear(
      kind: GearKind.bag,
      grade: Grade.rare,
      level: 0,
      abilities: const [GearAbility(id: 'hp', tier: 0)],
    );
    expect(stats.hpBonus(Equipped(bag: bag)), closeTo(0.03, 1e-9));
    final broken = bag.copyWith(wear: catalog.rules.gear.durability);
    expect(stats.hpBonus(Equipped(bag: broken)), 0);

    final belt = Gear(
      kind: GearKind.belt,
      grade: Grade.normal,
      level: 0,
      slots: const [PotatoType.combat],
      abilities: const [GearAbility(id: 'belt.bonus', tier: 0)],
    );
    expect(
      stats.beltBoost(belt),
      closeTo(stats.beltBoost(belt.copyWith(abilities: const [])) + 0.03, 1e-9),
    );
    expect(
      stats.factorOf(
        Equipped(
          bag: bag.copyWith(
            abilities: const [GearAbility(id: 'food_use', tier: 2)],
          ),
        ),
        GearStat.foodUse,
      ),
      closeTo(0.8, 1e-9),
    );
  });

  test('gear keeps its abilities through a save', () {
    const piece = Gear(
      kind: GearKind.weapon,
      family: 'rapid',
      grade: Grade.rare,
      level: 3,
      abilities: [GearAbility(id: 'weapon.range', tier: 1)],
    );
    expect(Gear.fromJson(piece.toJson()), piece);
    expect(
      Gear.fromJson(
        const Gear(kind: GearKind.bag, grade: Grade.normal, level: 1).toJson(),
      ).abilities,
      isEmpty,
    );
  });
}
