import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  group('FixedStepClock', () {
    test('keeps the leftover for the next call', () {
      final clock = FixedStepClock(const Duration(milliseconds: 100));
      expect(clock.advance(const Duration(milliseconds: 250)), 2);
      expect(clock.pending, const Duration(milliseconds: 50));
      expect(clock.alpha, closeTo(0.5, 1e-9));
      expect(clock.advance(const Duration(milliseconds: 60)), 1);
      expect(clock.pending, const Duration(milliseconds: 10));
    });

    test('gives the same total however the time is split', () {
      final whole = FixedStepClock(const Duration(milliseconds: 33));
      final split = FixedStepClock(const Duration(milliseconds: 33));
      var splitSteps = 0;
      for (var i = 0; i < 100; i++) {
        splitSteps += split.advance(const Duration(microseconds: 16667));
      }
      expect(splitSteps, whole.advance(const Duration(microseconds: 1666700)));
      expect(split.pending, whole.pending);
    });

    test('ignores negative time', () {
      final clock = FixedStepClock(const Duration(seconds: 1));
      clock.advance(const Duration(milliseconds: 500));
      expect(clock.advance(const Duration(hours: -3)), 0);
      expect(clock.pending, const Duration(milliseconds: 500));
    });

    test('caps long gaps at maxElapsed', () {
      final clock = FixedStepClock(const Duration(seconds: 1));
      final steps = clock.advance(
        const Duration(days: 30),
        maxElapsed: const Duration(hours: 24),
      );
      expect(steps, 24 * 60 * 60);
    });

    test('reset drops the partial step', () {
      final clock = FixedStepClock(const Duration(seconds: 1));
      clock.advance(const Duration(milliseconds: 900));
      clock.reset();
      expect(clock.pending, Duration.zero);
    });

    test('rejects a step that is not positive', () {
      expect(() => FixedStepClock(Duration.zero), throwsArgumentError);
    });
  });
}
