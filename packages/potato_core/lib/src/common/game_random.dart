const int _mask32 = 0xffffffff;

/// A seeded random number generator whose state can be saved and restored.
///
/// Simulations draw every random outcome (pests, drops, abilities) from their
/// own [GameRandom] and store [state] in the save, so the same save and the
/// same elapsed time give the same result.
///
/// Uses xoshiro128** with 32-bit arithmetic only. `dart:math` `Random` does
/// not promise the same sequence across Dart versions and platforms, and
/// 64-bit multiplication is not exact on the web, where integers are doubles.
final class GameRandom {
  /// Creates a generator from a 32-bit [seed] (higher bits are ignored).
  ///
  /// The four state words come from splitmix32, so nearby seeds still give
  /// unrelated sequences and the state is never all zero.
  factory GameRandom(int seed) {
    var counter = seed & _mask32;
    int next() {
      counter = (counter + 0x9e3779b9) & _mask32;
      var z = counter;
      z = _mul32(z ^ (z >>> 16), 0x85ebca6b);
      z = _mul32(z ^ (z >>> 13), 0xc2b2ae35);
      return z ^ (z >>> 16);
    }

    return GameRandom._(next(), next(), next(), next());
  }

  /// Restores a generator from a [state] saved earlier.
  factory GameRandom.fromState(List<int> state) {
    if (state.length != 4) {
      throw ArgumentError.value(state, 'state', 'must have 4 words');
    }
    if (state.any((word) => word < 0 || word > _mask32)) {
      throw ArgumentError.value(state, 'state', 'words must be 32-bit');
    }
    if (state.every((word) => word == 0)) {
      throw ArgumentError.value(state, 'state', 'must not be all zero');
    }
    return GameRandom._(state[0], state[1], state[2], state[3]);
  }

  GameRandom._(this._s0, this._s1, this._s2, this._s3);

  int _s0;
  int _s1;
  int _s2;
  int _s3;

  /// The four 32-bit state words to store in a save.
  List<int> get state => List.unmodifiable([_s0, _s1, _s2, _s3]);

  /// The next value in `[0, 2^32)`.
  int nextUint32() {
    final result = _mul32(_rotl(_mul32(_s1, 5), 7), 9);
    final t = (_s1 << 9) & _mask32;
    _s2 ^= _s0;
    _s3 ^= _s1;
    _s1 ^= _s2;
    _s0 ^= _s3;
    _s2 ^= t;
    _s3 = _rotl(_s3, 11);
    return result;
  }

  /// A uniformly distributed value in `[0, max)`. [max] is 1 to 2^32.
  int nextInt(int max) {
    if (max < 1 || max > 0x100000000) {
      throw RangeError.range(max, 1, 0x100000000, 'max');
    }
    // Rejects the low values that would make `% max` favor small results.
    final threshold = (0x100000000 - max) % max;
    while (true) {
      final value = nextUint32();
      if (value >= threshold) return value % max;
    }
  }

  /// A value in `[0, 1)` with 32 bits of precision.
  double nextDouble() => nextUint32() / 0x100000000;

  /// True with probability [probability] (clamped to 0..1).
  bool chance(double probability) => nextDouble() < probability;

  static int _rotl(int x, int k) => ((x << k) | (x >>> (32 - k))) & _mask32;

  /// `a * b mod 2^32` without products above 2^53, which the web rounds.
  static int _mul32(int a, int b) {
    final low = (a & 0xffff) * b;
    final high = (((a >>> 16) * b) & 0xffff) << 16;
    return (low + high) & _mask32;
  }
}
