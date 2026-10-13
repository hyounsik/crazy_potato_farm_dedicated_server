import 'dart:math' as math;

/// A point or direction on the flat world plane, in tiles.
///
/// Exploration runs in these continuous coordinates; drawing turns them into
/// the quarter view. Immutable: every operation returns a new value.
final class Vec2 {
  const Vec2(this.x, this.y);

  factory Vec2.fromJson(List<Object?> json) =>
      Vec2((json[0]! as num).toDouble(), (json[1]! as num).toDouble());

  static const Vec2 zero = Vec2(0, 0);

  final double x;
  final double y;

  Vec2 operator +(Vec2 other) => Vec2(x + other.x, y + other.y);
  Vec2 operator -(Vec2 other) => Vec2(x - other.x, y - other.y);
  Vec2 operator *(double factor) => Vec2(x * factor, y * factor);
  Vec2 operator /(double divisor) => Vec2(x / divisor, y / divisor);

  double get lengthSquared => x * x + y * y;
  double get length => math.sqrt(lengthSquared);
  bool get isZero => x == 0 && y == 0;

  double dot(Vec2 other) => x * other.x + y * other.y;
  double distanceTo(Vec2 other) => (this - other).length;

  /// Length 1 in the same direction; zero stays zero.
  Vec2 normalized() {
    final l = length;
    return l == 0 ? zero : Vec2(x / l, y / l);
  }

  /// The same direction with length [to].
  Vec2 scaledTo(double to) => normalized() * to;

  /// Turned [radians] counter-clockwise.
  Vec2 rotated(double radians) {
    final c = math.cos(radians);
    final s = math.sin(radians);
    return Vec2(x * c - y * s, x * s + y * c);
  }

  List<double> toJson() => [x, y];

  @override
  bool operator ==(Object other) =>
      other is Vec2 && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Vec2($x, $y)';
}
