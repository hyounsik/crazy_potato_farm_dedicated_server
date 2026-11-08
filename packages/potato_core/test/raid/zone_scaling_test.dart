import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

/// What a zone's score does to enemies and loot (2026-10-29), and levels
/// compounding.
void main() {
  const scaling = ZoneScalingRulesData(
    enemyHpPermille: 30,
    enemyDamagePermille: 10,
    lootAmountPermille: 30,
    rareWeightPermille: 20,
    legendaryWeightPermille: 40,
  );

  test('levels compound: ten levels count the same at any height', () {
    expect(levelGrowth(30, 0), 1);
    expect(levelGrowth(30, 1), closeTo(1.03, 1e-12));
    expect(
      levelGrowth(30, 40) / levelGrowth(30, 30),
      closeTo(levelGrowth(30, 10), 1e-9),
    );
    expect(levelGrowth(0, 50), 1);
  });

  test('scores raise enemies, loot amounts and better grades', () {
    expect(scaling.enemyHp(10), closeTo(levelGrowth(30, 10), 1e-12));
    expect(scaling.enemyDamage(10), closeTo(levelGrowth(10, 10), 1e-12));
    expect(scaling.lootAmount(10), closeTo(1.3, 1e-12));
    expect(scaling.gradeWeight(Grade.normal, 10), 1);
    expect(scaling.gradeWeight(Grade.rare, 10), closeTo(1.2, 1e-12));
    expect(scaling.gradeWeight(Grade.legendary, 10), closeTo(1.4, 1e-12));
    expect(const ZoneScalingRulesData().enemyHp(99), 1);
  });

  test('plain loot comes in larger amounts; seeds stay one each', () {
    const table = LootTableData(
      id: 't',
      rollsMin: 1,
      rollsMax: 1,
      entries: [LootEntryData(item: 'food', weight: 1, min: 10, max: 10)],
    );
    int stack(String item) => 1000;
    final pile = LootPile.roll(table, stack, GameRandom(1), amount: 1.5);
    expect(pile.items.single.count, 15);
    final none = LootPile.roll(
      const LootTableData(
        id: 'z',
        rollsMin: 1,
        rollsMax: 1,
        entries: [LootEntryData(item: 'food', weight: 1, min: 0, max: 0)],
      ),
      stack,
      GameRandom(1),
      amount: 3,
    );
    expect(none.items.fold(0, (sum, s) => sum + s.count), 0);
  });

  test('enemies in a scored zone have more health', () {
    final plain = sampleCatalog();
    final scaled = sampleCatalogWith(
      (files) => rulesOf(files)['zone_scaling'] = {'enemy_hp_permille': 30},
    );
    RaidSimulation run(Catalog catalog) => RaidSimulation.start(
      catalog: catalog,
      zone: 'sample_zone',
      seed: 3,
      food: 30,
    );
    final a = run(plain);
    final b = run(scaled);
    final score = plain.zones['sample_zone']!.score;
    expect(b.enemies, hasLength(a.enemies.length));
    expect(a.enemies, isNotEmpty);
    for (final (i, enemy) in a.enemies.indexed) {
      expect(
        b.enemies[i].maxHp,
        closeTo(enemy.maxHp * levelGrowth(30, score), 1e-9),
      );
    }
  });

  test('a picked danger difficulty plays the zone at that score and keeps '
      'it through a save (2026-11-08)', () {
    final catalog = sampleCatalogWith(
      (files) => rulesOf(files)['zone_scaling'] = {'enemy_hp_permille': 30},
    );
    RaidSimulation run({int? score}) => RaidSimulation.start(
      catalog: catalog,
      zone: 'sample_danger',
      seed: 3,
      food: 30,
      score: score,
    );
    final own = run();
    final harder = run(score: 13);
    expect(own.zone.score, 3);
    expect(harder.zone.score, 13);
    expect(harder.enemies, hasLength(own.enemies.length));
    for (final (i, enemy) in own.enemies.indexed) {
      expect(
        harder.enemies[i].maxHp,
        closeTo(enemy.maxHp * levelGrowth(30, 10), 1e-9),
      );
    }
    final saved = RaidSimulation.fromJson(harder.toJson(), catalog);
    expect(saved.zone.score, 13);
  });

  test('a picked score takes the level range of the region that holds it', () {
    final catalog = sampleCatalogWith((files) {
      final zones = (files['zones']! as Map<String, dynamic>)['zones']!;
      for (final zone in zones as List<Object?>) {
        final z = zone! as Map<String, dynamic>;
        if (z['id'] == 'sample_zone') {
          z
            ..['level_min'] = 10
            ..['level_max'] = 19;
        }
      }
    });
    final picked = catalog.zoneAt('sample_danger', score: 12)!;
    expect(picked.score, 12);
    expect((picked.levelMin, picked.levelMax), (10, 19));
    final beyond = catalog.zoneAt('sample_danger', score: 40)!;
    expect((beyond.levelMin, beyond.levelMax), (40, 40));
    expect(catalog.zoneAt('sample_danger'), catalog.zones['sample_danger']);
  });

  test('the recommended power grows with the score, compounding', () {
    final catalog = sampleCatalogWith((files) {
      rulesOf(files)['combat_power']
        ..['recommended_base'] = 100
        ..['recommended_per_score'] = 0
        ..['recommended_growth_permille'] = 30;
    });
    final stats = GearStats(catalog);
    expect(stats.recommendedPower(0), 100);
    expect(stats.recommendedPower(10), (100 * levelGrowth(30, 10)).round());
  });
}
