import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  group('GameRandom', () {
    test('matches the xoshiro128** reference output', () {
      // Reference values from the C implementation with state {1, 2, 3, 4}.
      final random = GameRandom.fromState([1, 2, 3, 4]);
      expect(List.generate(6, (_) => random.nextUint32()), [
        11520,
        0,
        5927040,
        70819200,
        2031721883,
        1637235492,
      ]);
    });

    test('seeds through splitmix32 like the C reference', () {
      final random = GameRandom(42);
      expect(random.state, [939911724, 3948730756, 321366731, 3317318717]);
      expect(List.generate(4, (_) => random.nextUint32()), [
        2837322924,
        544945897,
        479756282,
        3500138142,
      ]);
    });

    test('continues the same sequence after saving and restoring', () {
      final original = GameRandom(7);
      for (var i = 0; i < 10; i++) {
        original.nextUint32();
      }
      final restored = GameRandom.fromState(original.state);
      expect(
        List.generate(20, (_) => restored.nextUint32()),
        List.generate(20, (_) => original.nextUint32()),
      );
    });

    test('rejects invalid state', () {
      expect(() => GameRandom.fromState([0, 0, 0, 0]), throwsArgumentError);
      expect(() => GameRandom.fromState([1, 2, 3]), throwsArgumentError);
      expect(
        () => GameRandom.fromState([1, 2, 3, 0x100000000]),
        throwsArgumentError,
      );
    });

    test('nextInt stays in range and reaches every value', () {
      final random = GameRandom(1);
      final seen = <int>{};
      for (var i = 0; i < 1000; i++) {
        final value = random.nextInt(6);
        expect(value, inInclusiveRange(0, 5));
        seen.add(value);
      }
      expect(seen, hasLength(6));
      expect(GameRandom(1).nextInt(1), 0);
      expect(() => random.nextInt(0), throwsRangeError);
    });

    test('nextDouble stays in [0, 1)', () {
      final random = GameRandom(2);
      for (var i = 0; i < 1000; i++) {
        final value = random.nextDouble();
        expect(value, greaterThanOrEqualTo(0));
        expect(value, lessThan(1));
      }
    });

    test('chance follows the probability roughly', () {
      final random = GameRandom(3);
      final hits = List.generate(10000, (_) => random.chance(0.3)).where((hit) {
        return hit;
      }).length;
      expect(hits, inInclusiveRange(2800, 3200));
      expect(random.chance(0), isFalse);
      expect(random.chance(1), isTrue);
    });
  });
}
