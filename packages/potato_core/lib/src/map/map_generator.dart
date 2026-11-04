import 'dart:math' as math;

import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/map/map_chunk.dart';
import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_recipe.dart';

/// Builds a map from [recipe] and [seed].
///
/// Places the recipe's terrain, scatters obstacles, turns the map, then
/// checks that every exit and marker can be walked to from the entry. A map
/// that fails is built again with the next attempt number, so every device
/// given the same seed lands on the same map; later attempts scatter fewer
/// obstacles. [chunks] holds the hand-made pieces the recipe names.
///
/// Throws [ArgumentError] for a recipe naming a missing chunk, and
/// [StateError] when no attempt passes (the recipe itself blocks a route).
MapData generateMap(
  MapRecipe recipe, {
  required int seed,
  Map<String, MapChunk> chunks = const {},
  int attempts = 8,
}) {
  for (final piece in recipe.terrain) {
    if (piece is ChunkPiece && !chunks.containsKey(piece.chunk)) {
      throw ArgumentError.value(piece.chunk, 'chunks', 'missing chunk');
    }
  }
  for (final pick in recipe.chunkPicks) {
    for (final name in pick.from) {
      if (!chunks.containsKey(name)) {
        throw ArgumentError.value(name, 'chunks', 'missing chunk');
      }
    }
  }
  for (var attempt = 0; attempt < attempts; attempt++) {
    // Fewer obstacles on each retry from the halfway point.
    final half = attempts ~/ 2;
    final scatter = attempt < half
        ? recipe.scatter.count
        : recipe.scatter.count * (attempts - attempt) ~/ (attempts - half + 1);
    final map = _Builder(
      recipe,
      chunks,
      GameRandom((seed + attempt * 0x9e3779b1) & 0xffffffff),
    ).build(scatter);
    if (_allReachable(map)) return map;
  }
  throw StateError('No passable map after $attempts attempts');
}

bool _allReachable(MapData map) {
  final reached = map.reachableFrom(map.entry);
  if (reached.isEmpty) return false;
  return map.exits.every(reached.contains) &&
      map.markers.values.every((tiles) => tiles.every(reached.contains));
}

/// One attempt's working state.
final class _Builder {
  _Builder(this.recipe, this.chunks, this.random)
    : size = recipe.size,
      tiles = List.filled(recipe.size * recipe.size, MapTile.open),
      heights = List.filled(recipe.size * recipe.size, MapHeight.low),
      floors = List.filled(recipe.size * recipe.size, MapFloor.plain);

  final MapRecipe recipe;
  final Map<String, MapChunk> chunks;
  final GameRandom random;
  final int size;
  final List<MapTile> tiles;
  final List<MapHeight> heights;
  final List<MapFloor> floors;

  /// Ramp tiles, kept clear of scattered obstacles.
  final List<TilePos> ramps = [];
  final Map<String, List<TilePos>> markers = {};
  final List<MapObstacle> obstacles = [];
  final List<MapObject> objects = [];

  /// Tiles of chunks picked by the seed, left as they were drawn.
  final Set<TilePos> chunkArea = {};

  /// Exits drawn in chunks.
  final List<TilePos> chunkExits = [];

  MapData build(int scatterCount) {
    final turns = recipe.rotate ? random.nextInt(4) : 0;
    for (final piece in recipe.terrain) {
      switch (piece) {
        case BlobPiece():
          _blob(piece);
        case WallPiece():
          _wall(piece);
        case RingPiece():
          _ring(piece);
        case ChunkPiece():
          _chunk(piece);
        case PlateauPiece():
          _plateau(piece);
        case HollowPiece():
          _hollow(piece);
        case FloorPiece():
          _floor(piece);
      }
    }
    _pickChunks();
    _pickExitSites();
    _scatter(scatterCount);
    return _turned(turns);
  }

  /// The recipe's fixed exits, then the sites picked for this seed.
  final List<TilePos> exits = [];

  /// Picks the recipe's exit sites, then its clone entry sites, on open
  /// ground with an open ring around them, spaced from the entry and each
  /// other. Fewer when room runs out.
  void _pickExitSites() {
    exits
      ..addAll(recipe.exits)
      ..addAll(chunkExits);
    final taken = [recipe.entry, ...exits];
    exits.addAll(_pickSites(recipe.exitSites, taken));
    if (recipe.cloneEntrySites > 0) {
      markers[cloneEntryMarker] = _pickSites(recipe.cloneEntrySites, taken);
    }
  }

  /// [count] open sites at least `exitSpacing` from [taken] and each other;
  /// each one picked joins [taken].
  List<TilePos> _pickSites(int count, List<TilePos> taken) {
    final spacing = recipe.exitSpacing;
    final picked = <TilePos>[];
    for (var tries = 0; picked.length < count && tries < count * 200; tries++) {
      final at = TilePos(
        1 + random.nextInt(size - 2),
        1 + random.nextInt(size - 2),
      );
      final near = taken.any(
        (p) => (p.x - at.x).abs() < spacing && (p.y - at.y).abs() < spacing,
      );
      if (near || chunkArea.contains(at) || !_freeAround(at.x, at.y, 1)) {
        continue;
      }
      picked.add(at);
      taken.add(at);
    }
    return picked;
  }

  bool _inside(int x, int y) => x >= 0 && y >= 0 && x < size && y < size;

  MapTile _at(int x, int y) => tiles[y * size + x];

  void _set(int x, int y, MapTile tile) {
    if (_inside(x, y)) tiles[y * size + x] = tile;
  }

  /// Grows from the centre by attaching random neighbours of tiles already
  /// in the blob, which gives a lumpy, connected shape.
  void _blob(BlobPiece piece) {
    final grown = <TilePos>[piece.center];
    final inBlob = {piece.center};
    final limit = piece.area * 20;
    for (var i = 0; i < limit && grown.length < piece.area; i++) {
      final from = grown[random.nextInt(grown.length)];
      final next = from.neighbors4[random.nextInt(4)];
      if (_inside(next.x, next.y) && inBlob.add(next)) grown.add(next);
    }
    for (final tile in grown) {
      _set(tile.x, tile.y, MapTile.terrain);
    }
  }

  /// Grows a pond or a pit over open low tiles like a blob.
  void _hollow(HollowPiece piece) {
    for (final tile in _growLow(piece.center, piece.area)) {
      _set(tile.x, tile.y, MapTile.hollow);
    }
  }

  /// Grows mud or ice over open low tiles like a hollow.
  void _floor(FloorPiece piece) {
    for (final tile in _growLow(piece.center, piece.area)) {
      floors[tile.y * size + tile.x] = piece.floor;
    }
  }

  /// About [area] connected open low tiles grown from [center] like a
  /// blob; none when [center] is not one.
  List<TilePos> _growLow(TilePos center, int area) {
    bool free(TilePos t) =>
        _inside(t.x, t.y) &&
        _at(t.x, t.y) == MapTile.open &&
        heights[t.y * size + t.x] == MapHeight.low;
    if (!free(center)) return const [];
    final grown = <TilePos>[center];
    final inside = {center};
    final limit = area * 20;
    for (var i = 0; i < limit && grown.length < area; i++) {
      final from = grown[random.nextInt(grown.length)];
      final next = from.neighbors4[random.nextInt(4)];
      if (free(next) && inside.add(next)) grown.add(next);
    }
    return grown;
  }

  /// Grows high ground over open tiles like a blob, then turns up to
  /// `ramps` edge tiles next to open low ground into ramps, spaced apart.
  void _plateau(PlateauPiece piece) {
    if (!_inside(piece.center.x, piece.center.y)) return;
    if (_at(piece.center.x, piece.center.y) != MapTile.open) return;
    final grown = <TilePos>[piece.center];
    final inside = {piece.center};
    final limit = piece.area * 20;
    for (var i = 0; i < limit && grown.length < piece.area; i++) {
      final from = grown[random.nextInt(grown.length)];
      final next = from.neighbors4[random.nextInt(4)];
      if (!_inside(next.x, next.y) || _at(next.x, next.y) != MapTile.open) {
        continue;
      }
      if (inside.add(next)) grown.add(next);
    }
    for (final tile in grown) {
      heights[tile.y * size + tile.x] = MapHeight.high;
    }
    final edges = [
      for (final tile in grown)
        if (tile.neighbors4.any(
          (n) =>
              _inside(n.x, n.y) &&
              _at(n.x, n.y) == MapTile.open &&
              heights[n.y * size + n.x] == MapHeight.low,
        ))
          tile,
    ];
    final picked = <TilePos>[];
    for (var tries = 0; picked.length < piece.ramps && tries < 200; tries++) {
      if (edges.isEmpty) break;
      final at = edges[random.nextInt(edges.length)];
      if (picked.any((p) => (p.x - at.x).abs() + (p.y - at.y).abs() < 6)) {
        continue;
      }
      picked.add(at);
      heights[at.y * size + at.x] = MapHeight.ramp;
    }
    ramps.addAll(picked);
  }

  void _wall(WallPiece piece) {
    final line = _line(piece.from, piece.to);
    // A square brush `thickness` tiles across around each line tile.
    final low = -(piece.thickness - 1) ~/ 2;
    final high = piece.thickness ~/ 2;
    final gapStart = (line.length - piece.gap) ~/ 2;
    final gapEnd = gapStart + piece.gap;
    void brush(TilePos at, MapTile tile) {
      for (var dy = low; dy <= high; dy++) {
        for (var dx = low; dx <= high; dx++) {
          _set(at.x + dx, at.y + dy, tile);
        }
      }
    }

    for (final tile in line) {
      brush(tile, MapTile.terrain);
    }
    // Carve the opening last so the band around it cannot close it again.
    for (var i = gapStart; i < gapEnd && i < line.length; i++) {
      if (i >= 0) brush(line[i], MapTile.open);
    }
  }

  /// Tiles on the straight line from [a] to [b] (Bresenham).
  static List<TilePos> _line(TilePos a, TilePos b) {
    final dx = (b.x - a.x).abs();
    final dy = -(b.y - a.y).abs();
    final sx = a.x < b.x ? 1 : -1;
    final sy = a.y < b.y ? 1 : -1;
    var (x, y, error) = (a.x, a.y, dx + dy);
    final tiles = <TilePos>[];
    while (true) {
      tiles.add(TilePos(x, y));
      if (x == b.x && y == b.y) return tiles;
      final twice = 2 * error;
      if (twice >= dy) {
        error += dy;
        x += sx;
      }
      if (twice <= dx) {
        error += dx;
        y += sy;
      }
    }
  }

  void _ring(RingPiece piece) {
    final r = piece.radius;
    final outer = r * r;
    final innerR = r - piece.thickness;
    final inner = innerR * innerR;
    final clearR = innerR - 1;
    final fx = piece.facing.x;
    final fy = piece.facing.y;
    final facingSquared = fx * fx + fy * fy;
    final clearing = markers.putIfAbsent('clearing', () => []);
    final wall = <TilePos>[];
    final within = <TilePos>[];
    for (var dy = -r; dy <= r; dy++) {
      for (var dx = -r; dx <= r; dx++) {
        final x = piece.center.x + dx;
        final y = piece.center.y + dy;
        if (!_inside(x, y)) continue;
        final d = dx * dx + dy * dy;
        if (clearR > 0 && d < clearR * clearR) clearing.add(TilePos(x, y));
        if (d < inner) within.add(TilePos(x, y));
        if (d > outer || d < inner) continue;
        // The entrance: ahead of the centre and within gap/2 of the facing
        // line, compared squared to stay in whole numbers.
        final ahead = dx * fx + dy * fy;
        final across = dx * fy - dy * fx;
        if (piece.gaps == 0 &&
            ahead > 0 &&
            4 * across * across <= piece.gap * piece.gap * facingSquared) {
          continue;
        }
        wall.add(TilePos(x, y));
      }
    }
    for (final opening in _ringGaps(piece, wall)) {
      wall.removeWhere(
        (t) =>
            4 *
                ((t.x - opening.x) * (t.x - opening.x) +
                    (t.y - opening.y) * (t.y - opening.y)) <=
            piece.gap * piece.gap,
      );
    }
    for (final t in wall) {
      switch (piece.wall) {
        case RingWall.terrain:
          _set(t.x, t.y, MapTile.terrain);
        case RingWall.high:
          if (_at(t.x, t.y) == MapTile.open) {
            heights[t.y * size + t.x] = MapHeight.high;
          }
        case RingWall.hollow:
          if (_at(t.x, t.y) == MapTile.open) _set(t.x, t.y, MapTile.hollow);
      }
    }
    _ringFloor(piece, within, clearing);
  }

  /// [piece]'s openings: tiles of [wall] picked by the seed, spread round
  /// it (2026-11-04, 사용자: loose, here and there, no single entrance).
  List<TilePos> _ringGaps(RingPiece piece, List<TilePos> wall) {
    if (piece.gaps <= 0 || wall.isEmpty) return const [];
    final picked = <TilePos>[];
    // Apart by about the ring's length shared out, at least two gaps' worth.
    final spread = math.max(piece.gap * 2, 2 * piece.radius * 3 ~/ piece.gaps);
    for (var tries = 0; picked.length < piece.gaps && tries < 200; tries++) {
      final at = wall[random.nextInt(wall.length)];
      final near = picked.any(
        (p) =>
            (p.x - at.x) * (p.x - at.x) + (p.y - at.y) * (p.y - at.y) <
            spread * spread,
      );
      if (!near) picked.add(at);
    }
    return picked;
  }

  /// Lays [piece]'s floor inside the ring: single spots about the clearing,
  /// or every low tile but the centre.
  void _ringFloor(
    RingPiece piece,
    List<TilePos> within,
    List<TilePos> clearing,
  ) {
    final floor = piece.floor;
    if (floor == null) return;
    bool free(TilePos t) =>
        t != piece.center &&
        _at(t.x, t.y) == MapTile.open &&
        heights[t.y * size + t.x] == MapHeight.low;
    if (piece.floorSpots <= 0) {
      for (final t in within.where(free)) {
        floors[t.y * size + t.x] = floor;
      }
      return;
    }
    final open = clearing.where(free).toList();
    for (var i = 0; i < piece.floorSpots && open.isNotEmpty; i++) {
      final t = open.removeAt(random.nextInt(open.length));
      floors[t.y * size + t.x] = floor;
    }
  }

  void _chunk(ChunkPiece piece) =>
      _lay(chunks[piece.chunk]!, piece.origin, piece.quarterTurns);

  /// Lays [chunk] with its top-left at [origin], turned [quarterTurns] times
  /// clockwise.
  void _lay(MapChunk chunk, TilePos origin, int quarterTurns) {
    TilePos place(TilePos tile) => chunk.place(tile, origin, quarterTurns);
    for (final tile in chunk.solid) {
      final at = place(tile);
      _set(at.x, at.y, MapTile.terrain);
    }
    for (final tile in chunk.hollows) {
      final at = place(tile);
      _set(at.x, at.y, MapTile.hollow);
    }
    for (final MapEntry(key: tile, value: height) in chunk.heights.entries) {
      final at = place(tile);
      if (!_inside(at.x, at.y)) continue;
      heights[at.y * size + at.x] = height;
      if (height == MapHeight.ramp) ramps.add(at);
    }
    for (final MapEntry(key: tile, value: floor) in chunk.floors.entries) {
      final at = place(tile);
      if (_inside(at.x, at.y)) floors[at.y * size + at.x] = floor;
    }
    for (final MapEntry(key: name, value: points) in chunk.markers.entries) {
      markers.putIfAbsent(name, () => []).addAll(points.map(place));
    }
    chunkExits.addAll(chunk.exits.map(place));
    for (final o in chunk.obstacles) {
      // Stored big rocks block a row of their square; the end of the build
      // cuts every one down again once it knows which way up it is.
      final square = TilePos(o.origin.x, o.origin.y - (o.size - o.blockedRows));
      final corner = _topLeft([
        place(square),
        place(TilePos(square.x + o.size - 1, square.y + o.size - 1)),
      ]);
      for (var dy = 0; dy < o.size; dy++) {
        for (var dx = 0; dx < o.size; dx++) {
          _set(corner.x + dx, corner.y + dy, MapTile.obstacle);
        }
      }
      obstacles.add(MapObstacle(origin: corner, size: o.size, kind: o.kind));
    }
    for (final o in chunk.objects) {
      final object = _turnedObject(o, place);
      objects.add(object);
      for (final t in object.blocked) {
        _set(t.x, t.y, MapTile.obstacle);
      }
    }
  }

  /// [o] with its tiles moved by [move]. The picture stands up whichever way
  /// the map turns, so its shape stays and it lands where its tiles' middle
  /// went, as near as whole tiles allow.
  static MapObject _turnedObject(MapObject o, TilePos Function(TilePos) move) {
    final rows = o.rows == 0 ? 1 : o.rows;
    final corners = [
      move(o.origin),
      move(TilePos(o.origin.x + o.width - 1, o.origin.y + rows - 1)),
    ];
    final first = _topLeft(corners);
    final last = _bottomRight(corners);
    return o.copyWith(
      origin: TilePos(
        first.x + (last.x - first.x + 1 - o.width) ~/ 2,
        first.y + (last.y - first.y + 1 - rows) ~/ 2,
      ),
    );
  }

  /// Places the recipe's picked chunks on free ground: each whole box and a
  /// ring of tiles round it open, low and plain, away from the entry and
  /// exits. A chunk that finds no room is left out.
  void _pickChunks() {
    for (final pick in recipe.chunkPicks) {
      for (var i = 0; i < pick.count; i++) {
        final chunk = chunks[pick.from[random.nextInt(pick.from.length)]]!;
        final turns = random.nextInt(4);
        final across = turns.isOdd ? chunk.height : chunk.width;
        final down = turns.isOdd ? chunk.width : chunk.height;
        if (size - across - 1 <= 1 || size - down - 1 <= 1) continue;
        for (var tries = 0; tries < 200; tries++) {
          final at = TilePos(
            1 + random.nextInt(size - across - 1),
            1 + random.nextInt(size - down - 1),
          );
          if (!_freeBox(at, across, down)) continue;
          _lay(chunk, at, turns);
          for (var y = at.y; y < at.y + down; y++) {
            for (var x = at.x; x < at.x + across; x++) {
              chunkArea.add(TilePos(x, y));
            }
          }
          break;
        }
      }
    }
  }

  bool _freeBox(TilePos at, int across, int down) {
    final clear = recipe.clearRadius;
    for (final p in [recipe.entry, ...recipe.exits, ...chunkExits]) {
      if (p.x >= at.x - clear &&
          p.x < at.x + across + clear &&
          p.y >= at.y - clear &&
          p.y < at.y + down + clear) {
        return false;
      }
    }
    for (var y = at.y - 1; y <= at.y + down; y++) {
      for (var x = at.x - 1; x <= at.x + across; x++) {
        if (!_inside(x, y) ||
            _at(x, y) != MapTile.open ||
            chunkArea.contains(TilePos(x, y)) ||
            heights[y * size + x] != MapHeight.low ||
            floors[y * size + x] != MapFloor.plain) {
          return false;
        }
      }
    }
    return true;
  }

  /// Scatters 1×1 and 2×2 obstacles on open ground, keeping a free tile
  /// around each so routes never close, off the map's edge, and away from
  /// the entry, exits and markers.
  void _scatter(int count) {
    final keepClear = [
      recipe.entry,
      ...exits,
      ...ramps,
      for (final points in markers.values) ...points,
    ];
    final clear = recipe.clearRadius;
    var placed = 0;
    for (var tries = 0; placed < count && tries < count * 50; tries++) {
      final big = random.chance(recipe.scatter.bigChance);
      final s = big ? 2 : 1;
      final x = 1 + random.nextInt(size - s - 1);
      final y = 1 + random.nextInt(size - s - 1);
      final kind = random.nextInt(2) == 0
          ? ObstacleKind.rock
          : ObstacleKind.tree;

      final nearKept = keepClear.any(
        (p) =>
            p.x >= x - clear &&
            p.x < x + s + clear &&
            p.y >= y - clear &&
            p.y < y + s + clear,
      );
      if (nearKept || !_freeAround(x, y, s) || _touchesChunk(x, y, s)) {
        continue;
      }
      for (var dy = 0; dy < s; dy++) {
        for (var dx = 0; dx < s; dx++) {
          _set(x + dx, y + dy, MapTile.obstacle);
        }
      }
      obstacles.add(MapObstacle(origin: TilePos(x, y), size: s, kind: kind));
      placed++;
    }
  }

  /// Whether the s×s square at (x, y) or its ring lands on a picked chunk.
  bool _touchesChunk(int x, int y, int s) {
    if (chunkArea.isEmpty) return false;
    for (var ty = y - 1; ty <= y + s; ty++) {
      for (var tx = x - 1; tx <= x + s; tx++) {
        if (chunkArea.contains(TilePos(tx, ty))) return true;
      }
    }
    return false;
  }

  /// Whether the s×s square at (x, y) and the ring of tiles around it are all
  /// open.
  bool _freeAround(int x, int y, int s) {
    for (var ty = y - 1; ty <= y + s; ty++) {
      for (var tx = x - 1; tx <= x + s; tx++) {
        if (!_inside(tx, ty) || _at(tx, ty) != MapTile.open) return false;
      }
    }
    return true;
  }

  /// The finished map, turned [turns] quarter turns clockwise.
  MapData _turned(int turns) {
    TilePos turn(TilePos tile) => turnInBox(tile, size, size, turns);
    final turned = List.filled(size * size, MapTile.open);
    final turnedHeights = List.filled(size * size, MapHeight.low);
    final turnedFloors = List.filled(size * size, MapFloor.plain);
    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        final at = turn(TilePos(x, y));
        turned[at.y * size + at.x] = _at(x, y);
        turnedHeights[at.y * size + at.x] = heights[y * size + x];
        turnedFloors[at.y * size + at.x] = floors[y * size + x];
      }
    }
    final turnedObstacles = [
      for (final o in obstacles)
        o.copyWith(
          // The block's new top-left is the turned corner nearest (0, 0).
          origin: _topLeft([
            turn(o.origin),
            turn(TilePos(o.origin.x + o.size - 1, o.origin.y + o.size - 1)),
          ]),
        ),
    ];
    // A big rock blocks only its bottom row once turned, the row behind it
    // open again (2026-10-18, user: one can stand behind it). Its ring of
    // free tiles is kept, so routes stay open.
    for (final (i, o) in turnedObstacles.indexed) {
      if (o.kind != ObstacleKind.rock || o.size < 2) continue;
      for (var dy = 0; dy < o.size - 1; dy++) {
        for (var dx = 0; dx < o.size; dx++) {
          turned[(o.origin.y + dy) * size + o.origin.x + dx] = MapTile.open;
        }
      }
      turnedObstacles[i] = o.copyWith(
        origin: TilePos(o.origin.x, o.origin.y + o.size - 1),
        rows: 1,
      );
    }
    // Objects keep their shape: only their blocked tiles move.
    final turnedObjects = [for (final o in objects) _turnedObject(o, turn)];
    for (final o in objects) {
      for (final t in o.blocked) {
        final at = turn(t);
        turned[at.y * size + at.x] = MapTile.open;
      }
    }
    for (final o in turnedObjects) {
      for (final t in o.blocked) {
        if (_inside(t.x, t.y)) turned[t.y * size + t.x] = MapTile.obstacle;
      }
    }
    return MapData(
      size: size,
      tiles: turned,
      heights: turnedHeights,
      floors: turnedFloors,
      entry: turn(recipe.entry),
      exits: [for (final e in exits) turn(e)],
      markers: {
        for (final MapEntry(:key, :value) in markers.entries)
          key: [for (final t in value) turn(t)],
      },
      obstacles: turnedObstacles,
      objects: turnedObjects,
    );
  }

  static TilePos _topLeft(List<TilePos> corners) => TilePos(
    corners.map((c) => c.x).reduce((a, b) => a < b ? a : b),
    corners.map((c) => c.y).reduce((a, b) => a < b ? a : b),
  );

  static TilePos _bottomRight(List<TilePos> corners) => TilePos(
    corners.map((c) => c.x).reduce((a, b) => a > b ? a : b),
    corners.map((c) => c.y).reduce((a, b) => a > b ? a : b),
  );
}
