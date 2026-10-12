import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  group('TilePos', () {
    test('adds, subtracts and compares by value', () {
      expect(const TilePos(1, 2) + const TilePos(3, 4), const TilePos(4, 6));
      expect(const TilePos(1, 2) - const TilePos(3, 4), const TilePos(-2, -2));
      expect(TilePos(1, 2), const TilePos(1, 2));
      expect(TilePos(1, 2).hashCode, const TilePos(1, 2).hashCode);
    });

    test('lists the four edge neighbors', () {
      expect(
        const TilePos(0, 0).neighbors4,
        unorderedEquals(const [
          TilePos(1, 0),
          TilePos(-1, 0),
          TilePos(0, 1),
          TilePos(0, -1),
        ]),
      );
      expect(const TilePos(0, 0).manhattanDistanceTo(const TilePos(2, -3)), 5);
    });

    test('round-trips through JSON', () {
      const tile = TilePos(3, -1);
      expect(tile.toJson(), {'x': 3, 'y': -1});
      expect(TilePos.fromJson(tile.toJson()), tile);
    });
  });

  group('TileRect', () {
    const rect = TileRect(origin: TilePos(2, 3), width: 2, height: 3);

    test('contains its tiles and nothing past the edges', () {
      expect(rect.contains(const TilePos(2, 3)), isTrue);
      expect(rect.contains(const TilePos(3, 5)), isTrue);
      expect(rect.contains(const TilePos(4, 3)), isFalse);
      expect(rect.contains(const TilePos(2, 6)), isFalse);
      expect(rect.tiles, hasLength(rect.area));
      expect(rect.tiles.first, const TilePos(2, 3));
      expect(rect.tiles.last, const TilePos(3, 5));
    });

    test('overlaps only when tiles are shared', () {
      expect(
        rect.overlaps(
          const TileRect(origin: TilePos(3, 5), width: 1, height: 1),
        ),
        isTrue,
      );
      expect(
        rect.overlaps(
          const TileRect(origin: TilePos(4, 3), width: 1, height: 1),
        ),
        isFalse,
      );
    });

    test('round-trips through JSON with snake_case keys', () {
      expect(rect.toJson(), {
        'origin': {'x': 2, 'y': 3},
        'width': 2,
        'height': 3,
      });
      expect(TileRect.fromJson(rect.toJson()), rect);
    });
  });
}
