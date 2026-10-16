import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/common/tile.dart';

part 'map_recipe.freezed.dart';
part 'map_recipe.g.dart';

/// How to build one exploration map: fixed terrain pieces plus obstacles
/// scattered by the seed. Loaded from catalog data.
///
/// Every shape is computed in whole tiles with `GameRandom`, so the same
/// recipe and seed give the same map on every platform.
@freezed
abstract class MapRecipe with _$MapRecipe {
  const factory MapRecipe({
    /// Tiles along one side of the square map.
    required int size,

    /// Where the player starts.
    required TilePos entry,

    /// Places the player may leave from, all reachable from [entry].
    @Default(<TilePos>[]) List<TilePos> exits,

    /// Extra exit sites the generator picks per seed on open ground, at
    /// least [exitSpacing] tiles (Chebyshev) from the entry and each other.
    /// They follow the fixed [exits] in the built map.
    @Default(0) int exitSites,
    @Default(0) int exitSpacing,

    /// Places clones walk in from, picked per seed like exit sites and kept
    /// as the [cloneEntryMarker] marker.
    @Default(0) int cloneEntrySites,

    /// Scattered obstacles stay at least this many tiles (Chebyshev) from
    /// [entry], [exits] and chunk markers.
    required int clearRadius,

    /// Terrain placed as given, before scattering.
    @Default(<TerrainPiece>[]) List<TerrainPiece> terrain,

    required ScatterRule scatter,

    /// Turns the whole map a random quarter turn per seed, so the same
    /// terrain reads differently from run to run.
    @Default(true) bool rotate,
  }) = _MapRecipe;

  factory MapRecipe.fromJson(Map<String, dynamic> json) =>
      _$MapRecipeFromJson(json);
}

/// The map marker holding a ring's clearing: the boss area.
const String bossAreaMarker = 'clearing';

/// The map marker holding the clone entry sites.
const String cloneEntryMarker = 'clone_entry';

/// Loose obstacles sprinkled over open ground.
@freezed
abstract class ScatterRule with _$ScatterRule {
  const factory ScatterRule({
    /// How many to place. Fewer when the map runs out of room.
    required int count,

    /// Chance that one is 2×2 instead of 1×1.
    @Default(0.0) double bigChance,
  }) = _ScatterRule;

  factory ScatterRule.fromJson(Map<String, dynamic> json) =>
      _$ScatterRuleFromJson(json);
}

/// One fixed piece of blocking terrain.
@Freezed(unionKey: 'type')
sealed class TerrainPiece with _$TerrainPiece {
  /// An irregular mass of about [area] tiles grown from [center]; its shape
  /// comes from the map seed.
  const factory TerrainPiece.blob({
    required TilePos center,
    required int area,
  }) = BlobPiece;

  /// A band from [from] to [to], [thickness] tiles thick, with an opening
  /// [gap] tiles long in the middle.
  const factory TerrainPiece.wall({
    required TilePos from,
    required TilePos to,
    required int thickness,
    required int gap,
  }) = WallPiece;

  /// A ring around an open clearing: outer [radius], [thickness] tiles
  /// thick, with one entrance [gap] tiles wide facing [facing] (a step of -1,
  /// 0 or 1 on each axis). The clearing's tiles are marked `clearing`.
  const factory TerrainPiece.ring({
    required TilePos center,
    required int radius,
    required int thickness,
    required TilePos facing,
    required int gap,
  }) = RingPiece;

  /// A hand-made [MapChunk] named [chunk], its top-left at [origin], turned
  /// [quarterTurns] times clockwise.
  const factory TerrainPiece.chunk({
    required String chunk,
    required TilePos origin,
    @Default(0) int quarterTurns,
  }) = ChunkPiece;

  factory TerrainPiece.fromJson(Map<String, dynamic> json) =>
      _$TerrainPieceFromJson(json);
}
