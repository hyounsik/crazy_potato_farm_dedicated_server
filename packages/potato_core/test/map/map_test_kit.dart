import 'package:potato_core/potato_core.dart';

/// A recipe exercising every terrain piece on a small map. Sample data for
/// tests only.
MapRecipe sampleRecipe({bool rotate = true, int scatter = 40}) => MapRecipe(
  size: 32,
  entry: const TilePos(16, 29),
  exits: const [TilePos(2, 2), TilePos(29, 2)],
  clearRadius: 2,
  rotate: rotate,
  scatter: ScatterRule(count: scatter, bigChance: 0.3),
  terrain: const [
    TerrainPiece.blob(center: TilePos(16, 16), area: 30),
    TerrainPiece.wall(
      from: TilePos(4, 10),
      to: TilePos(12, 10),
      thickness: 2,
      gap: 3,
    ),
    TerrainPiece.ring(
      center: TilePos(25, 22),
      radius: 5,
      thickness: 2,
      facing: TilePos(-1, 0),
      gap: 3,
    ),
    TerrainPiece.chunk(chunk: 'pocket', origin: TilePos(4, 20)),
  ],
);

/// The same pocket as `fixtures/map/sample_chunk.tmx`, built in code so the
/// generator tests run on the web too (no file reading).
MapChunk sampleChunk() => MapChunk(
  width: 5,
  height: 4,
  solid: {
    for (var x = 0; x < 5; x++) TilePos(x, 0),
    const TilePos(0, 1),
    const TilePos(4, 1),
    const TilePos(0, 2),
    const TilePos(4, 2),
    const TilePos(0, 3),
    const TilePos(1, 3),
    const TilePos(3, 3),
    const TilePos(4, 3),
  },
  markers: const {
    'target': [TilePos(2, 1)],
    'gate': [TilePos(2, 3)],
  },
);

Map<String, MapChunk> chunksFor() => {'pocket': sampleChunk()};
