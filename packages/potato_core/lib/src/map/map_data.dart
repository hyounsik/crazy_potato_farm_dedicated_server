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
  }) : _tiles = List.unmodifiable(tiles),
       exits = List.unmodifiable(exits),
       markers = UnmodifiableMapView({
         for (final MapEntry(:key, :value) in markers.entries)
           key: List<TilePos>.unmodifiable(value),
       }),
       obstacles = List.unmodifiable(obstacles) {
    if (tiles.length != size * size) {
      throw ArgumentError.value(tiles.length, 'tiles', 'must be size²');
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
    );
  }

  final int size;
  final List<MapTile> _tiles;
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

  /// Open tiles a walker can reach from [from] stepping along the grid.
  Set<TilePos> reachableFrom(TilePos from) {
    final reached = <TilePos>{};
    if (isBlocked(from.x, from.y)) return reached;
    final queue = Queue<TilePos>()..add(from);
    reached.add(from);
    while (queue.isNotEmpty) {
      for (final next in queue.removeFirst().neighbors4) {
        if (!isBlocked(next.x, next.y) && reached.add(next)) queue.add(next);
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
  };
}
