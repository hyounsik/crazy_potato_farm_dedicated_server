import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  // An 8x8 map with a wall down x = 4 from y = 0 to 5; the way round is at
  // the bottom.
  final map = MapData(
    size: 8,
    tiles: [
      for (var y = 0; y < 8; y++)
        for (var x = 0; x < 8; x++)
          x == 4 && y <= 5 ? MapTile.terrain : MapTile.open,
    ],
    entry: const TilePos(1, 1),
  );

  test('circles overlap blocked tiles and the edge', () {
    expect(map.overlapsCircle(const Vec2(3.9, 2.5), 0.2), isTrue);
    expect(map.overlapsCircle(const Vec2(3.5, 2.5), 0.2), isFalse);
    expect(map.overlapsCircle(const Vec2(0.1, 2.5), 0.2), isTrue);
  });

  test('moving into a wall slides along it', () {
    final moved = map.move(const Vec2(3.5, 2.5), const Vec2(1, 1), 0.2);
    expect(moved.x, 3.5);
    expect(moved.y, 3.5);
  });

  test('walls block sight', () {
    expect(
      map.hasLineOfSight(const Vec2(2.5, 2.5), const Vec2(6.5, 2.5)),
      isFalse,
    );
    expect(
      map.hasLineOfSight(const Vec2(2.5, 6.5), const Vec2(6.5, 6.5)),
      isTrue,
    );
  });

  test('paths go round walls', () {
    final path = map.findPath(const Vec2(2.5, 1.5), const Vec2(6.5, 1.5));
    expect(path.last, const Vec2(6.5, 1.5));
    expect(path.any((p) => p.y > 6), isTrue, reason: 'passes below the wall');
    expect(map.findPath(const Vec2(2.5, 1.5), const Vec2(4.5, 1.5)), isEmpty);
  });

  group('a pond or a pit (2026-10-25)', () {
    // The same wall, but hollow: walkers go round, shots and sight cross.
    final pond = MapData(
      size: 8,
      tiles: [
        for (var y = 0; y < 8; y++)
          for (var x = 0; x < 8; x++)
            x == 4 && y <= 5 ? MapTile.hollow : MapTile.open,
      ],
      entry: const TilePos(1, 1),
    );

    test('blocks walking, not shots or sight', () {
      expect(pond.isBlocked(4, 2), isTrue);
      expect(pond.blocksShots(4, 2), isFalse);
      expect(pond.overlapsCircle(const Vec2(3.9, 2.5), 0.2), isTrue);
      expect(
        pond.hasLineOfSight(const Vec2(2.5, 2.5), const Vec2(6.5, 2.5)),
        isTrue,
      );
    });

    test('paths go round it, never straight across', () {
      final path = pond.findPath(const Vec2(2.5, 2.5), const Vec2(6.5, 2.5));
      expect(path, isNotEmpty);
      expect(path.any((p) => p.y > 5), isTrue);
    });
  });
}
