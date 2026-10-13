import 'dart:math' as math;

import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/map/map_data.dart';

/// Movement, collision, sight and paths over a map's blocked tiles. Bodies
/// are circles in tile coordinates.
extension MapPhysics on MapData {
  /// Whether a circle at [center] overlaps any blocked tile.
  bool overlapsCircle(Vec2 center, double radius) {
    final minX = (center.x - radius).floor();
    final maxX = (center.x + radius).floor();
    final minY = (center.y - radius).floor();
    final maxY = (center.y + radius).floor();
    for (var y = minY; y <= maxY; y++) {
      for (var x = minX; x <= maxX; x++) {
        if (!isBlocked(x, y)) continue;
        final dx = center.x - center.x.clamp(x.toDouble(), x + 1.0);
        final dy = center.y - center.y.clamp(y.toDouble(), y + 1.0);
        if (dx * dx + dy * dy < radius * radius) return true;
      }
    }
    return false;
  }

  /// Moves a circle by [delta] one axis at a time, so it slides along walls
  /// instead of sticking to them.
  Vec2 move(Vec2 from, Vec2 delta, double radius) {
    var next = from;
    final stepX = Vec2(next.x + delta.x, next.y);
    if (!overlapsCircle(stepX, radius)) next = stepX;
    final stepY = Vec2(next.x, next.y + delta.y);
    if (!overlapsCircle(stepY, radius)) next = stepY;
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
          if (isBlocked(nx, ny)) continue;
          final diagonal = dx != 0 && dy != 0;
          if (diagonal && (isBlocked(cx + dx, cy) || isBlocked(cx, cy + dy))) {
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
      if (i == path.length - 1 || !hasLineOfSight(anchor, path[i + 1])) {
        smooth.add(path[i]);
        anchor = path[i];
      }
    }
    return smooth;
  }
}
