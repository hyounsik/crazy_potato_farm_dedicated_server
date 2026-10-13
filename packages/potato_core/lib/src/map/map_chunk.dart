import 'package:potato_core/src/common/tile.dart';
import 'package:tiled/tiled.dart';

/// A hand-made piece of map drawn in Tiled: blocked tiles and named marker
/// points, in its own tile coordinates.
///
/// Tiled file rules:
/// - A tile layer named `solid`: every non-empty tile blocks.
/// - An object layer named `markers`: each point object's name is its marker
///   (e.g. `exit`); several objects may share a name.
final class MapChunk {
  MapChunk({
    required this.width,
    required this.height,
    required Set<TilePos> solid,
    Map<String, List<TilePos>> markers = const {},
  }) : solid = Set.unmodifiable(solid),
       markers = Map.unmodifiable({
         for (final MapEntry(:key, :value) in markers.entries)
           key: List<TilePos>.unmodifiable(value),
       });

  /// Reads a Tiled `.tmx` file's text. Both orthogonal and isometric maps
  /// work; only tile coordinates are kept.
  factory MapChunk.fromTmx(String tmx) {
    final map = TiledMap.parseTmx(tmx);
    final solid = <TilePos>{};
    final markers = <String, List<TilePos>>{};
    for (final layer in map.layers) {
      if (layer is TileLayer && layer.name == 'solid') {
        final rows = layer.tileData ?? const <List<Gid>>[];
        for (final (y, row) in rows.indexed) {
          for (final (x, gid) in row.indexed) {
            if (gid.tile != 0) solid.add(TilePos(x, y));
          }
        }
      } else if (layer is ObjectGroup && layer.name == 'markers') {
        // Isometric maps measure object positions in tile-height pixels on
        // both axes; orthogonal maps use the tile's own width and height.
        final isometric = map.orientation == MapOrientation.isometric;
        final unitX = isometric ? map.tileHeight : map.tileWidth;
        final unitY = map.tileHeight;
        for (final object in layer.objects) {
          final tile = TilePos(
            (object.x / unitX).floor(),
            (object.y / unitY).floor(),
          );
          markers.putIfAbsent(object.name, () => []).add(tile);
        }
      }
    }
    return MapChunk(
      width: map.width,
      height: map.height,
      solid: solid,
      markers: markers,
    );
  }

  final int width;
  final int height;
  final Set<TilePos> solid;
  final Map<String, List<TilePos>> markers;

  /// Where [tile] of this chunk lands when the chunk is turned
  /// [quarterTurns] times clockwise and its top-left put at [origin].
  TilePos place(TilePos tile, TilePos origin, int quarterTurns) {
    final turned = turnInBox(tile, width, height, quarterTurns);
    return TilePos(origin.x + turned.x, origin.y + turned.y);
  }
}

/// Turns [tile] inside a [width]×[height] box [quarterTurns] times
/// clockwise, keeping the result's top-left at (0, 0).
TilePos turnInBox(TilePos tile, int width, int height, int quarterTurns) {
  var (x, y, w, h) = (tile.x, tile.y, width, height);
  for (var i = 0; i < quarterTurns % 4; i++) {
    (x, y, w, h) = (h - 1 - y, x, h, w);
  }
  return TilePos(x, y);
}
