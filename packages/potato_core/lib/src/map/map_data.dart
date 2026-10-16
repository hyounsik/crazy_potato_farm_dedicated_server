import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/common/tile.dart';

part 'map_data.freezed.dart';
part 'map_data.g.dart';

/// What fills a tile of an exploration map.
enum MapTile {
  open('.'),

  /// Fixed terrain from the recipe (blobs, walls, rings, chunks).
  terrain('#'),

  /// A scattered obstacle; see [MapData.obstacles] for its look and size.
  obstacle('o');

  const MapTile(this.symbol);

  /// One character per tile in the saved rows.
  final String symbol;
}

enum ObstacleKind { rock, tree }

/// A scattered obstacle covering [size]×[size] tiles from [origin].
@freezed
abstract class MapObstacle with _$MapObstacle {
  const factory MapObstacle({
    required TilePos origin,
    required int size,
    required ObstacleKind kind,
  }) = _MapObstacle;

  factory MapObstacle.fromJson(Map<String, dynamic> json) =>
      _$MapObstacleFromJson(json);
}

/// How high a tile is. Bodies move between [low] and [high] only over
/// [ramp] tiles; from [low] ground nothing on [high] ground can be seen.
enum MapHeight {
  low('0'),
  high('1'),

  /// A slope joining low and high ground; seen as low.
  ramp('/');

  const MapHeight(this.symbol);

  final String symbol;
}

/// A finished exploration map, wherever it came from (generated or drawn).
///
/// Game code only reads this. A run's save keeps the map itself rather than
/// its seed, so an app update that changes the generator never changes a map
/// already being played.
final class MapData {
  MapData({
    required this.size,
    required List<MapTile> tiles,
    required this.entry,
    List<TilePos> exits = const [],
    Map<String, List<TilePos>> markers = const {},
    List<MapObstacle> obstacles = const [],
    List<MapHeight>? heights,
  }) : _tiles = List.unmodifiable(tiles),
       _heights = List.unmodifiable(
         heights ?? List.filled(size * size, MapHeight.low),
       ),
       exits = List.unmodifiable(exits),
       markers = UnmodifiableMapView({
         for (final MapEntry(:key, :value) in markers.entries)
           key: List<TilePos>.unmodifiable(value),
       }),
       obstacles = List.unmodifiable(obstacles) {
    if (tiles.length != size * size) {
      throw ArgumentError.value(tiles.length, 'tiles', 'must be size²');
    }
    if (_heights.length != size * size) {
      throw ArgumentError.value(_heights.length, 'heights', 'must be size²');
    }
  }

  factory MapData.fromJson(Map<String, dynamic> json) {
    final size = json['size'] as int;
    final rows = (json['rows'] as List<Object?>).cast<String>();
    final bySymbol = {for (final t in MapTile.values) t.symbol: t};
    if (rows.length != size || rows.any((r) => r.length != size)) {
      throw const FormatException('Map rows do not match its size');
    }
    final tiles = [
      for (final row in rows)
        for (final symbol in row.split(''))
          bySymbol[symbol] ??
              (throw FormatException('Unknown map tile "$symbol"')),
    ];
    return MapData(
      size: size,
      tiles: tiles,
      entry: TilePos.fromJson(json['entry'] as Map<String, dynamic>),
      exits: [
        for (final e in json['exits'] as List<Object?>)
          TilePos.fromJson(e! as Map<String, dynamic>),
      ],
      markers: {
        for (final MapEntry(:key, :value)
            in (json['markers'] as Map<String, dynamic>).entries)
          key: [
            for (final t in value as List<Object?>)
              TilePos.fromJson(t! as Map<String, dynamic>),
          ],
      },
      obstacles: [
        for (final o in json['obstacles'] as List<Object?>)
          MapObstacle.fromJson(o! as Map<String, dynamic>),
      ],
      heights: switch (json['heights']) {
        final List<Object?> rows => [
          for (final row in rows.cast<String>())
            for (final symbol in row.split(''))
              MapHeight.values.firstWhere(
                (h) => h.symbol == symbol,
                orElse: () =>
                    throw FormatException('Unknown map height "$symbol"'),
              ),
        ],
        _ => null,
      },
    );
  }

  final int size;
  final List<MapTile> _tiles;
  final List<MapHeight> _heights;
  final TilePos entry;
  final List<TilePos> exits;

  /// Named places, e.g. `clearing` tiles inside rings or points drawn in
  /// chunks.
  final Map<String, List<TilePos>> markers;
  final List<MapObstacle> obstacles;

  MapTile tileAt(int x, int y) => _tiles[y * size + x];

  bool isInside(int x, int y) => x >= 0 && y >= 0 && x < size && y < size;

  /// Outside the map counts as blocked.
  bool isBlocked(int x, int y) =>
      !isInside(x, y) || _tiles[y * size + x] != MapTile.open;

  /// Outside the map counts as low.
  MapHeight heightAt(int x, int y) =>
      isInside(x, y) ? _heights[y * size + x] : MapHeight.low;

  /// Whether the map has any high ground.
  bool get hasHeights => _heights.any((h) => h != MapHeight.low);

  /// Whether a walker may step from tile (fx, fy) to the open tile (tx, ty):
  /// on the same level, or onto or off a ramp.
  bool canStep(int fx, int fy, int tx, int ty) {
    if (isBlocked(tx, ty)) return false;
    final from = heightAt(fx, fy);
    final to = heightAt(tx, ty);
    return from == to || from == MapHeight.ramp || to == MapHeight.ramp;
  }

  /// Open tiles a walker can reach from [from] stepping along the grid
  /// (over ramps between levels).
  Set<TilePos> reachableFrom(TilePos from) {
    final reached = <TilePos>{};
    if (isBlocked(from.x, from.y)) return reached;
    final queue = Queue<TilePos>()..add(from);
    reached.add(from);
    while (queue.isNotEmpty) {
      final at = queue.removeFirst();
      for (final next in at.neighbors4) {
        if (canStep(at.x, at.y, next.x, next.y) && reached.add(next)) {
          queue.add(next);
        }
      }
    }
    return reached;
  }

  Map<String, dynamic> toJson() => {
    'size': size,
    'rows': [
      for (var y = 0; y < size; y++)
        [for (var x = 0; x < size; x++) tileAt(x, y).symbol].join(),
    ],
    'entry': entry.toJson(),
    'exits': [for (final e in exits) e.toJson()],
    'markers': {
      for (final MapEntry(:key, :value) in markers.entries)
        key: [for (final t in value) t.toJson()],
    },
    'obstacles': [for (final o in obstacles) o.toJson()],
    if (hasHeights)
      'heights': [
        for (var y = 0; y < size; y++)
          [for (var x = 0; x < size; x++) heightAt(x, y).symbol].join(),
      ],
  };
}
