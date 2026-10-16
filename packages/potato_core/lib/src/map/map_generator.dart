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
      heights = List.filled(recipe.size * recipe.size, MapHeight.low);

  final MapRecipe recipe;
  final Map<String, MapChunk> chunks;
  final GameRandom random;
  final int size;
  final List<MapTile> tiles;
  final List<MapHeight> heights;

  /// Ramp tiles, kept clear of scattered obstacles.
  final List<TilePos> ramps = [];
  final Map<String, List<TilePos>> markers = {};
  final List<MapObstacle> obstacles = [];

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
      }
    }
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
    exits.addAll(recipe.exits);
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
      if (near || !_freeAround(at.x, at.y, 1)) continue;
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
    for (var dy = -r; dy <= r; dy++) {
      for (var dx = -r; dx <= r; dx++) {
        final x = piece.center.x + dx;
        final y = piece.center.y + dy;
        final d = dx * dx + dy * dy;
        if (clearR > 0 && d < clearR * clearR && _inside(x, y)) {
          clearing.add(TilePos(x, y));
        }
        if (d > outer || d < inner) continue;
        // The entrance: ahead of the centre and within gap/2 of the facing
        // line, compared squared to stay in whole numbers.
        final ahead = dx * fx + dy * fy;
        final across = dx * fy - dy * fx;
        if (ahead > 0 &&
            4 * across * across <= piece.gap * piece.gap * facingSquared) {
          continue;
        }
        _set(x, y, MapTile.terrain);
      }
    }
  }

  void _chunk(ChunkPiece piece) {
    final chunk = chunks[piece.chunk]!;
    for (final tile in chunk.solid) {
      final at = chunk.place(tile, piece.origin, piece.quarterTurns);
      _set(at.x, at.y, MapTile.terrain);
    }
    for (final MapEntry(key: name, value: points) in chunk.markers.entries) {
      markers.putIfAbsent(name, () => []).addAll([
        for (final p in points)
          chunk.place(p, piece.origin, piece.quarterTurns),
      ]);
    }
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
      if (nearKept || !_freeAround(x, y, s)) continue;
      for (var dy = 0; dy < s; dy++) {
        for (var dx = 0; dx < s; dx++) {
          _set(x + dx, y + dy, MapTile.obstacle);
        }
      }
      obstacles.add(MapObstacle(origin: TilePos(x, y), size: s, kind: kind));
      placed++;
    }
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
    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        final at = turn(TilePos(x, y));
        turned[at.y * size + at.x] = _at(x, y);
        turnedHeights[at.y * size + at.x] = heights[y * size + x];
      }
    }
    return MapData(
      size: size,
      tiles: turned,
      heights: turnedHeights,
      entry: turn(recipe.entry),
      exits: [for (final e in exits) turn(e)],
      markers: {
        for (final MapEntry(:key, :value) in markers.entries)
          key: [for (final t in value) turn(t)],
      },
      obstacles: [
        for (final o in obstacles)
          o.copyWith(
            // The block's new top-left is the turned corner nearest (0, 0).
            origin: _topLeft([
              turn(o.origin),
              turn(TilePos(o.origin.x + o.size - 1, o.origin.y + o.size - 1)),
            ]),
          ),
      ],
    );
  }

  static TilePos _topLeft(List<TilePos> corners) => TilePos(
    corners.map((c) => c.x).reduce((a, b) => a < b ? a : b),
    corners.map((c) => c.y).reduce((a, b) => a < b ? a : b),
  );
}
