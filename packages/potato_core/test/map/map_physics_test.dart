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

  group('a low picture keeps walkers off only its own shape (2026-11-10)', () {
    // A stone half a tile tall and narrower than its tile at (3, 3).
    MapData stone() => MapData(
      size: 8,
      tiles: [
        for (var y = 0; y < 8; y++)
          for (var x = 0; x < 8; x++)
            x == 3 && y == 3 ? MapTile.obstacle : MapTile.open,
      ],
      entry: const TilePos(1, 1),
      objects: const [MapObject(id: 'look:1', origin: TilePos(3, 3))],
    );

    // Walks down from above in small steps until it stops.
    double stopFromAbove(MapData map) {
      var at = const Vec2(3.5, 2);
      for (var i = 0; i < 600; i++) {
        at = map.move(at, const Vec2(0, 0.005), 0.22);
      }
      return at.y;
    }

    test('without its box the whole tile blocks', () {
      expect(stopFromAbove(stone()), closeTo(3 - 0.22, 0.01));
    });

    test('with it a walker from above comes down to the picture', () {
      final map = stone()
        ..fitPictures('grassland', const {
          'look:1': [-0.3, 0.3, 0.5],
        });
      // Solid from 0.25 below the picture's top: 4 - (0.5 - 0.25).
      expect(stopFromAbove(map), closeTo(4 - 0.25 - 0.22, 0.01));
      // Beside the narrower stone there is room to pass.
      expect(map.overlapsCircle(const Vec2(3.08, 3.9), 0.06), isFalse);
      // Sight and paths still take the whole tile.
      expect(map.isBlocked(3, 3), isTrue);
    });
  });
}
