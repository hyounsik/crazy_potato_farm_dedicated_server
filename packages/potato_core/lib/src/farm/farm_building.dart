import 'package:potato_core/src/catalog/building_data.dart';
import 'package:potato_core/src/common/tile.dart';

/// A building standing on the farm.
final class FarmBuilding {
  FarmBuilding({
    required this.id,
    required this.data,
    required this.origin,
    this.level = 1,
    this.litUntilTick = 0,
    this.readyTick = 0,
  });

  /// Shares the id sequence with fields and potatoes.
  final int id;
  final BuildingData data;

  /// The top-left tile. Changes when the building is moved.
  TilePos origin;

  /// From 1 up to the number of levels in [data].
  int level;

  /// For totems: the step its light goes out on, and the step it can be lit
  /// again after its wait.
  int litUntilTick;
  int readyTick;

  String get kind => data.id;

  TileRect get rect =>
      TileRect(origin: origin, width: data.width, height: data.height);

  /// The tile in front of the door ([doorBelow]). Paths start here; guards
  /// come out here.
  TilePos get door => doorBelow(rect);

  /// Potatoes of the housed type this building adds to the limit now.
  int get capacity => data.levels[level - 1].capacity;

  /// Dead potatoes this building keeps now.
  int get graves => data.levels[level - 1].graves;

  /// Potatoes this building keeps in the fridge now.
  int get stores => data.levels[level - 1].stores;

  /// Field tiles this building looks after now.
  int get fieldTiles => data.levels[level - 1].fieldTiles;

  /// Totems this building adds to the limit now.
  int get totems => data.levels[level - 1].totems;

  /// The cost of the next level, or null at the top.
  int? get upgradeCost =>
      level < data.levels.length ? data.levels[level].cost : null;
}

/// The tile in front of the door of what stands on [rect], just below it:
/// every door is in the middle of the bottom side, the left of the two
/// middle tiles on an even width (2026-10-26, 사용자), buildings and fields
/// alike, so a 1x1 field's is right below it. It may be off the open land
/// on the farm's edge.
TilePos doorBelow(TileRect rect) =>
    TilePos(rect.left + (rect.width - 1) ~/ 2, rect.bottom);
