import 'dart:collection';
import 'dart:math' as math;

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
  obstacle('o'),

  /// Ground cut away, a pond or a pit by the zone's look: nobody walks in,
  /// but shots and sight cross it (2026-10-25, 사용자: a floor tile, not a
  /// wall).
  hollow('~');

  const MapTile(this.symbol);

  /// One character per tile in the saved rows.
  final String symbol;
}

enum ObstacleKind { rock, tree }

/// A scattered obstacle [size] tiles wide and [blockedRows] tall from
/// [origin].
@freezed
abstract class MapObstacle with _$MapObstacle {
  const MapObstacle._();

  const factory MapObstacle({
    required TilePos origin,
    required int size,
    required ObstacleKind kind,

    /// Rows it blocks, when fewer than [size]: a big rock blocks only its
    /// bottom row (2026-10-18, user), so one can stand behind it. Null for a
    /// square.
    int? rows,
  }) = _MapObstacle;

  /// Rows it blocks from [origin] down.
  int get blockedRows => rows ?? size;

  /// The picture a rock draws in a zone of [look], as a placed object's id:
  /// ours in grassland, the look's own sheet cell elsewhere (desert
  /// sandstone and the rest). Null for trees, which fill their tiles.
  String? pictureId(String look) {
    if (kind != ObstacleKind.rock) return null;
    if (look == 'grassland') return 'own:rock${size > 1 ? 2 : 1}';
    return '$look:${size == 1 ? 3 + (origin.x + origin.y) % 2 : 7}';
  }

  factory MapObstacle.fromJson(Map<String, dynamic> json) =>
      _$MapObstacleFromJson(json);
}

/// A particular picture placed on a drawn map or chunk (2026-11-04, 사용자):
/// [id] says which, and what it looks like is for whoever draws the map. It
/// blocks [rows] rows of [width] tiles from [origin] down (none for a
/// decoration), and its picture stands on the bottom of those.
@freezed
abstract class MapObject with _$MapObject {
  const MapObject._();

  const factory MapObject({
    required String id,
    required TilePos origin,
    @Default(1) int width,
    @Default(1) int rows,
  }) = _MapObject;

  /// The tiles it blocks.
  Iterable<TilePos> get blocked sync* {
    for (var y = origin.y; y < origin.y + rows; y++) {
      for (var x = origin.x; x < origin.x + width; x++) {
        yield TilePos(x, y);
      }
    }
  }

  factory MapObject.fromJson(Map<String, dynamic> json) =>
      _$MapObjectFromJson(json);
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

/// The way a ramp climbs, set by hand in the map editor (2026-11-04, 사용자).
/// It only says how the ramp looks: bodies step on and off a ramp from any
/// side. A ramp without one takes its way from the high ground next to it.
enum RampWay {
  up(0, -1),
  right(1, 0),
  down(0, 1),
  left(-1, 0);

  const RampWay(this.dx, this.dy);

  final int dx;
  final int dy;

  /// This way after [quarterTurns] clockwise turns of the map.
  RampWay turned(int quarterTurns) =>
      values[(index + quarterTurns) % values.length];
}

/// What a walkable tile's ground does to those who walk on it (2026-11-03,
/// 사용자): the swamp's mud slows them, the ice field's ice lets them slide.
/// Flyers and dashes take no notice.
enum MapFloor {
  plain('.'),
  mud('m'),
  ice('i');

  const MapFloor(this.symbol);

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
    List<MapObject> objects = const [],
    List<MapHeight>? heights,
    List<MapFloor>? floors,
    Map<TilePos, RampWay> rampWays = const {},
  }) : _tiles = List.unmodifiable(tiles),
       rampWays = Map.unmodifiable(rampWays),
       _heights = List.unmodifiable(
         heights ?? List.filled(size * size, MapHeight.low),
       ),
       _floors = List.unmodifiable(
         floors ?? List.filled(size * size, MapFloor.plain),
       ),
       exits = List.unmodifiable(exits),
       markers = UnmodifiableMapView({
         for (final MapEntry(:key, :value) in markers.entries)
           key: List<TilePos>.unmodifiable(value),
       }),
       obstacles = List.unmodifiable(obstacles),
       objects = List.unmodifiable(objects) {
    if (tiles.length != size * size) {
      throw ArgumentError.value(tiles.length, 'tiles', 'must be size²');
    }
    if (_heights.length != size * size) {
      throw ArgumentError.value(_heights.length, 'heights', 'must be size²');
    }
    if (_floors.length != size * size) {
      throw ArgumentError.value(_floors.length, 'floors', 'must be size²');
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
      objects: [
        for (final o in json['objects'] as List<Object?>? ?? const [])
          MapObject.fromJson(o! as Map<String, dynamic>),
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
      rampWays: {
        for (final r in json['ramp_ways'] as List<Object?>? ?? const [])
          TilePos.fromJson(r! as Map<String, dynamic>): RampWay.values.byName(
            (r as Map<String, dynamic>)['way'] as String,
          ),
      },
      floors: switch (json['floors']) {
        final List<Object?> rows => [
          for (final row in rows.cast<String>())
            for (final symbol in row.split(''))
              MapFloor.values.firstWhere(
                (f) => f.symbol == symbol,
                orElse: () =>
                    throw FormatException('Unknown map floor "$symbol"'),
              ),
        ],
        _ => null,
      },
    );
  }

  final int size;
  final List<MapTile> _tiles;
  final List<MapHeight> _heights;
  final List<MapFloor> _floors;
  final TilePos entry;
  final List<TilePos> exits;

  /// Named places, e.g. `clearing` tiles inside rings or points drawn in
  /// chunks.
  final Map<String, List<TilePos>> markers;
  final List<MapObstacle> obstacles;

  /// Pictures placed by hand; generated scatter is in [obstacles].
  final List<MapObject> objects;

  /// The ramps given a way by hand.
  final Map<TilePos, RampWay> rampWays;

  MapTile tileAt(int x, int y) => _tiles[y * size + x];

  /// The part of a blocked tile that keeps walkers off, by tile index, when
  /// its picture is lower or narrower than the tile ([fitPictures]): left,
  /// top, right, bottom in tile units. Empty means none of it.
  final Map<int, (double, double, double, double)> _solid = {};

  /// Least height a fitted picture keeps solid, in tiles.
  static const double _leastSolid = 0.15;

  /// How much lower than its picture a fitted obstacle's solid part is: a
  /// walker's radius and a little, so one stopped above it stands behind
  /// the picture rather than in front of a gap.
  static const double _underTop = 0.25;

  /// How much narrower than its picture, each side.
  static const double _inside = 0.05;

  /// Fits the solid part of placed objects and scattered rocks to their
  /// pictures in a zone of [look] ([boxes] as in `RaidRulesData`): a stone
  /// lower than its tile blocks only its lower part (2026-11-10, 사용자).
  /// Paths, sight and shots still take the whole tiles.
  void fitPictures(String look, Map<String, List<double>> boxes) {
    _solid.clear();
    if (boxes.isEmpty) return;
    void fit(String? id, double middle, int top, int left, int w, int rows) {
      final box = boxes[id];
      if (box == null || box.length < 3) return;
      final bottom = (top + rows).toDouble();
      final solid = (
        middle + box[0] + _inside,
        bottom - math.max(_leastSolid, box[2] - _underTop),
        middle + box[1] - _inside,
        bottom,
      );
      for (var y = top; y < top + rows; y++) {
        for (var x = left; x < left + w; x++) {
          if (!isInside(x, y)) continue;
          _solid[y * size + x] = (
            math.max(x.toDouble(), solid.$1),
            math.max(y.toDouble(), solid.$2),
            math.min(x + 1.0, solid.$3),
            math.min(y + 1.0, solid.$4),
          );
        }
      }
    }

    for (final o in obstacles) {
      fit(
        o.pictureId(look),
        o.origin.x + o.size / 2,
        o.origin.y + o.size - o.blockedRows,
        o.origin.x,
        o.size,
        o.blockedRows,
      );
    }
    for (final o in objects) {
      fit(
        o.id,
        o.origin.x + o.width / 2,
        o.origin.y,
        o.origin.x,
        o.width,
        o.rows,
      );
    }
  }

  /// What keeps walkers off blocked tile ([x], [y]): the whole tile, or the
  /// part [fitPictures] left; null when nothing does.
  (double, double, double, double)? solidOf(int x, int y) {
    final part = isInside(x, y) ? _solid[y * size + x] : null;
    if (part == null) return (x.toDouble(), y.toDouble(), x + 1.0, y + 1.0);
    return part.$1 < part.$3 && part.$2 < part.$4 ? part : null;
  }

  bool isInside(int x, int y) => x >= 0 && y >= 0 && x < size && y < size;

  /// Whether walkers cannot stand on tile ([x], [y]). Outside the map
  /// counts as blocked.
  bool isBlocked(int x, int y) =>
      !isInside(x, y) || _tiles[y * size + x] != MapTile.open;

  /// Whether tile ([x], [y]) stops shots and sight: terrain and obstacles
  /// stand up, a [MapTile.hollow] does not. Outside the map stops them.
  bool blocksShots(int x, int y) {
    if (!isInside(x, y)) return true;
    final tile = _tiles[y * size + x];
    return tile == MapTile.terrain || tile == MapTile.obstacle;
  }

  /// Outside the map counts as low.
  MapHeight heightAt(int x, int y) =>
      isInside(x, y) ? _heights[y * size + x] : MapHeight.low;

  /// Whether the map has any high ground.
  bool get hasHeights => _heights.any((h) => h != MapHeight.low);

  /// Outside the map counts as plain.
  MapFloor floorAt(int x, int y) =>
      isInside(x, y) ? _floors[y * size + x] : MapFloor.plain;

  /// Whether the map has any mud or ice.
  bool get hasFloors => _floors.any((f) => f != MapFloor.plain);

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
    if (objects.isNotEmpty) 'objects': [for (final o in objects) o.toJson()],
    if (rampWays.isNotEmpty)
      'ramp_ways': [
        for (final MapEntry(key: tile, value: way) in rampWays.entries)
          {...tile.toJson(), 'way': way.name},
      ],
    if (hasHeights)
      'heights': [
        for (var y = 0; y < size; y++)
          [for (var x = 0; x < size; x++) heightAt(x, y).symbol].join(),
      ],
    if (hasFloors)
      'floors': [
        for (var y = 0; y < size; y++)
          [for (var x = 0; x < size; x++) floorAt(x, y).symbol].join(),
      ],
  };
}
