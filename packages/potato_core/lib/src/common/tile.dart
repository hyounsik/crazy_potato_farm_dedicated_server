import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile.freezed.dart';
part 'tile.g.dart';

/// A tile on a flat grid. Rules work in tiles; screens convert to pixels.
///
/// `x` grows to the right and `y` grows down, before any isometric view or
/// rotation, which only the screen applies.
@freezed
abstract class TilePos with _$TilePos {
  const factory TilePos(int x, int y) = _TilePos;

  const TilePos._();

  factory TilePos.fromJson(Map<String, dynamic> json) =>
      _$TilePosFromJson(json);

  static const TilePos zero = TilePos(0, 0);

  TilePos operator +(TilePos other) => TilePos(x + other.x, y + other.y);

  TilePos operator -(TilePos other) => TilePos(x - other.x, y - other.y);

  /// The four tiles that share an edge with this one.
  List<TilePos> get neighbors4 => [
    TilePos(x + 1, y),
    TilePos(x, y + 1),
    TilePos(x - 1, y),
    TilePos(x, y - 1),
  ];

  /// Steps between tiles when moving only along the grid.
  int manhattanDistanceTo(TilePos other) =>
      (x - other.x).abs() + (y - other.y).abs();
}

/// A rectangle of whole tiles: [origin] is the top-left tile.
@freezed
abstract class TileRect with _$TileRect {
  const factory TileRect({
    required TilePos origin,
    required int width,
    required int height,
  }) = _TileRect;

  const TileRect._();

  factory TileRect.fromJson(Map<String, dynamic> json) =>
      _$TileRectFromJson(json);

  int get left => origin.x;
  int get top => origin.y;

  /// One past the last column, like `List.sublist` ends.
  int get right => origin.x + width;

  /// One past the last row.
  int get bottom => origin.y + height;

  int get area => width * height;

  bool contains(TilePos tile) =>
      tile.x >= left && tile.x < right && tile.y >= top && tile.y < bottom;

  bool overlaps(TileRect other) =>
      left < other.right &&
      other.left < right &&
      top < other.bottom &&
      other.top < bottom;

  /// Every tile inside, row by row.
  Iterable<TilePos> get tiles sync* {
    for (var y = top; y < bottom; y++) {
      for (var x = left; x < right; x++) {
        yield TilePos(x, y);
      }
    }
  }
}
