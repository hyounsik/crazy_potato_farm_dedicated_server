import 'dart:math' as math;

import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/map/map_data.dart';

/// Movement, collision, sight and paths over a map's blocked tiles. Bodies
/// are circles in tile coordinates.
extension MapPhysics on MapData {
  /// The level a body standing at [at] moves on, or null on a ramp (it may
  /// step either way).
  MapHeight? levelAt(Vec2 at) {
    final height = heightAt(at.x.floor(), at.y.floor());
    return height == MapHeight.ramp ? null : height;
  }

  /// Whether one standing at [a] can see one at [b] by height: low ground
  /// and ramps never see high ground. Obstacles are [hasLineOfSight]'s.
  bool seesLevel(Vec2 a, Vec2 b) =>
      heightAt(b.x.floor(), b.y.floor()) != MapHeight.high ||
      heightAt(a.x.floor(), a.y.floor()) == MapHeight.high;

  /// Whether one at [a] can see and shoot one at [b]: by height, and with
  /// no obstacle between.
  bool canSee(Vec2 a, Vec2 b) => seesLevel(a, b) && hasLineOfSight(a, b);

  /// Whether a circle at [center] overlaps any blocked tile, or, for a
  /// body moving on [level], any tile of the other level (cliffs).
  bool overlapsCircle(Vec2 center, double radius, {MapHeight? level}) {
    final minX = (center.x - radius).floor();
    final maxX = (center.x + radius).floor();
    final minY = (center.y - radius).floor();
    final maxY = (center.y + radius).floor();
    for (var y = minY; y <= maxY; y++) {
      for (var x = minX; x <= maxX; x++) {
        final cliff =
            level != null &&
            heightAt(x, y) != level &&
            heightAt(x, y) != MapHeight.ramp;
        if (!isBlocked(x, y) && !cliff) continue;
        final dx = center.x - center.x.clamp(x.toDouble(), x + 1.0);
        final dy = center.y - center.y.clamp(y.toDouble(), y + 1.0);
        if (dx * dx + dy * dy < radius * radius) return true;
      }
    }
    return false;
  }

  /// Moves a circle by [delta] one axis at a time, so it slides along walls
  /// (and cliffs, for the level it stands on) instead of sticking to them.
  Vec2 move(Vec2 from, Vec2 delta, double radius) {
    final level = levelAt(from);
    var next = from;
    final stepX = Vec2(next.x + delta.x, next.y);
    if (!overlapsCircle(stepX, radius, level: level)) next = stepX;
    final stepY = Vec2(next.x, next.y + delta.y);
    if (!overlapsCircle(stepY, radius, level: level)) next = stepY;
    return next;
  }

  /// Whether a straight line from [a] to [b] crosses no blocked tile. Shots
  /// stop at obstacles, and auto-aim skips targets behind them.
  bool hasLineOfSight(Vec2 a, Vec2 b) {
    final steps = math.max(1, (a.distanceTo(b) / 0.1).ceil());
    for (var i = 1; i < steps; i++) {
      final t = i / steps;
      final x = a.x + (b.x - a.x) * t;
      final y = a.y + (b.y - a.y) * t;
      if (isBlocked(x.floor(), y.floor())) return false;
    }
    return true;
  }

  /// Shortest walkable route from [from] to [to] (8 directions, no cutting
  /// blocked corners), as waypoints at tile centres ending at [to]. Waypoints
  /// a straight line can skip are dropped. Empty when [to] cannot be reached.
  List<Vec2> findPath(Vec2 from, Vec2 to) {
    final sx = from.x.floor();
    final sy = from.y.floor();
    final gx = to.x.floor();
    final gy = to.y.floor();
    if (isBlocked(gx, gy)) return const [];
    // Straight-line shortcuts must not hop a cliff either.
    bool clear(Vec2 a, Vec2 b) => hasLineOfSight(a, b) && _sameWalk(a, b);
    if (sx == gx && sy == gy) return [to];

    int key(int x, int y) => y * size + x;
    double estimate(int x, int y) {
      final dx = (x - gx).abs();
      final dy = (y - gy).abs();
      return math.max(dx, dy) + (math.sqrt2 - 1) * math.min(dx, dy);
    }

    final goal = key(gx, gy);
    final cameFrom = <int, int>{};
    final cost = <int, double>{key(sx, sy): 0};
    final open = <int, double>{key(sx, sy): estimate(sx, sy)};
    while (open.isNotEmpty) {
      var current = open.keys.first;
      for (final entry in open.entries) {
        if (entry.value < open[current]!) current = entry.key;
      }
      if (current == goal) break;
      open.remove(current);
      final cx = current % size;
      final cy = current ~/ size;
      for (var dy = -1; dy <= 1; dy++) {
        for (var dx = -1; dx <= 1; dx++) {
          if (dx == 0 && dy == 0) continue;
          final nx = cx + dx;
          final ny = cy + dy;
          if (!canStep(cx, cy, nx, ny)) continue;
          final diagonal = dx != 0 && dy != 0;
          if (diagonal &&
              (!canStep(cx, cy, cx + dx, cy) ||
                  !canStep(cx, cy, cx, cy + dy))) {
            continue;
          }
          final next = key(nx, ny);
          final g = cost[current]! + (diagonal ? math.sqrt2 : 1);
          if (g >= (cost[next] ?? double.infinity)) continue;
          cost[next] = g;
          cameFrom[next] = current;
          open[next] = g + estimate(nx, ny);
        }
      }
    }
    if (!cameFrom.containsKey(goal)) return const [];

    final tiles = <Vec2>[];
    for (var k = goal; cameFrom.containsKey(k); k = cameFrom[k]!) {
      tiles.add(Vec2(k % size + 0.5, k ~/ size + 0.5));
    }
    final path = tiles.reversed.toList()..last = to;
    final smooth = <Vec2>[];
    var anchor = from;
    for (var i = 0; i < path.length; i++) {
      if (i == path.length - 1 || !clear(anchor, path[i + 1])) {
        smooth.add(path[i]);
        anchor = path[i];
      }
    }
    return smooth;
  }

  /// Whether walking straight from [a] to [b] never steps between levels
  /// except over ramps.
  bool _sameWalk(Vec2 a, Vec2 b) {
    final steps = math.max(1, (a.distanceTo(b) / 0.1).ceil());
    var px = a.x.floor();
    var py = a.y.floor();
    for (var i = 1; i <= steps; i++) {
      final t = i / steps;
      final x = (a.x + (b.x - a.x) * t).floor();
      final y = (a.y + (b.y - a.y) * t).floor();
      if (x == px && y == py) continue;
      if (!canStep(px, py, x, y)) return false;
      px = x;
      py = y;
    }
    return true;
  }
}
