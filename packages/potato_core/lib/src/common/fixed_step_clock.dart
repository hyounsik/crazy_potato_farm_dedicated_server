/// Turns uneven elapsed time into a whole number of fixed steps.
///
/// Frame times differ by device and load, so rules never advance by them
/// directly. The caller feeds in elapsed time, runs `step` the returned number
/// of times, and draws between the last two states with [alpha].
///
/// Counts in whole microseconds so the same inputs give the same number of
/// steps on every platform.
final class FixedStepClock {
  FixedStepClock(this.step) : _stepMicros = step.inMicroseconds {
    if (_stepMicros <= 0) {
      throw ArgumentError.value(step, 'step', 'must be positive');
    }
  }

  /// The fixed amount of game time one `step` covers.
  final Duration step;
  final int _stepMicros;

  int _pendingMicros = 0;

  /// Time collected that does not yet fill a whole step.
  Duration get pending => Duration(microseconds: _pendingMicros);

  /// How far into the next step the clock is, from 0 up to (not including) 1.
  double get alpha => _pendingMicros / _stepMicros;

  /// Adds [elapsed] and returns how many steps to run now.
  ///
  /// Negative time counts as zero, so a clock set backwards never rewinds the
  /// game. With [maxElapsed], longer gaps count as [maxElapsed]: the time past
  /// it is treated as paused (the offline progress cap, or a long frame hitch).
  int advance(Duration elapsed, {Duration? maxElapsed}) {
    var micros = elapsed.inMicroseconds;
    if (micros < 0) micros = 0;
    if (maxElapsed != null && micros > maxElapsed.inMicroseconds) {
      micros = maxElapsed.inMicroseconds;
    }
    final total = _pendingMicros + micros;
    _pendingMicros = total % _stepMicros;
    return total ~/ _stepMicros;
  }

  /// Drops the collected partial step.
  void reset() => _pendingMicros = 0;
}
