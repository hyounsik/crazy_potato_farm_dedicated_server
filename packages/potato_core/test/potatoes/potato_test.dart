import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

void main() {
  final food = sampleCatalog().potatoType(PotatoType.food);
  // Sample food potato: grows in 120 s, lives 1800 s, makes 1/2/3 every 30 s,
  // keeps at most 12.

  Potato potato([Grade grade = Grade.normal]) =>
      Potato(id: 1, type: PotatoType.food, grade: grade);

  group('Potato.live', () {
    test('grows first, then reports growing once', () {
      final p = potato();
      expect(p.live(119000, food), (grew: false, died: false));
      expect(p.isGrown(food), isFalse);
      expect(p.live(1000, food), (grew: true, died: false));
      expect(p.isGrown(food), isTrue);
      expect(p.live(1000, food), (grew: false, died: false));
    });

    test('counts time past growth in the same step as work', () {
      final p = potato()..live(150000, food);
      expect(p.livedMillis, 30000);
      expect(p.stored, 1);
    });

    test('makes food by grade and stops at the store limit', () {
      final p = potato(Grade.rare)..live(120000, food);
      p.live(90000, food);
      expect(p.stored, 6);
      p.live(600000, food);
      expect(p.stored, 12);
      expect(p.takeStored(), 12);
      expect(p.stored, 0);
    });

    test('dies at the end of its lifespan', () {
      final p = potato()..live(120000, food);
      expect(p.live(1799000, food).died, isFalse);
      expect(p.lifeLeftOf(food), closeTo(1 / 1800, 1e-9));
      expect(p.live(1000, food).died, isTrue);
    });

    test('gives the same result for any step size', () {
      final big = potato()..live(500000, food);
      final small = potato();
      for (var i = 0; i < 500; i++) {
        small.live(1000, food);
      }
      expect(
        (small.grownMillis, small.livedMillis, small.stored),
        (big.grownMillis, big.livedMillis, big.stored),
      );
    });
  });

  test('SeedPouch adds and takes', () {
    final pouch = SeedPouch();
    const seed = Seed(type: PotatoType.food, grade: Grade.rare);
    pouch.add(seed, 2);
    expect(pouch.take(seed), isTrue);
    expect(pouch.take(seed), isTrue);
    expect(pouch.take(seed), isFalse);
    expect(pouch.counts, isEmpty);
  });
}
