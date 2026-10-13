import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';

part 'building_data.freezed.dart';
part 'building_data.g.dart';

/// A kind of building the player can put on the farm (`buildings.json`).
@freezed
abstract class BuildingData with _$BuildingData {
  const factory BuildingData({
    required String id,

    /// Tiles taken along x and y.
    required int width,
    required int height,

    /// The potato type this building unlocks and looks after, if any. Every
    /// building of the type adds its capacity to the type's limit.
    PotatoType? houses,

    /// Level 1 first. Level 1's cost is the cost to build; each later
    /// level's cost is the cost to upgrade to it.
    required List<BuildingLevelData> levels,
  }) = _BuildingData;

  factory BuildingData.fromJson(Map<String, dynamic> json) =>
      _$BuildingDataFromJson(json);
}

@freezed
abstract class BuildingLevelData with _$BuildingLevelData {
  const factory BuildingLevelData({
    /// Baby potatoes paid to reach this level.
    required int cost,

    /// Potatoes of the housed type this building adds to the limit.
    @Default(0) int capacity,

    /// Dead potatoes this building keeps for reviving (graveyards).
    @Default(0) int graves,
  }) = _BuildingLevelData;

  factory BuildingLevelData.fromJson(Map<String, dynamic> json) =>
      _$BuildingLevelDataFromJson(json);
}
