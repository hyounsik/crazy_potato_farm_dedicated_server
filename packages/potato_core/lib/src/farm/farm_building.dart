import 'package:potato_core/src/catalog/building_data.dart';
import 'package:potato_core/src/potatoes/seed.dart';
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
    List<Seed> storedSeeds = const [],
  }) : storedSeeds = List.of(storedSeeds);

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

  /// For compost yards: seeds its breeding potatoes made, waiting to be
  /// taken.
  final List<Seed> storedSeeds;

  String get kind => data.id;

  TileRect get rect =>
      TileRect(origin: origin, width: data.width, height: data.height);

  /// Potatoes of the housed type this building adds to the limit now.
  int get capacity => data.levels[level - 1].capacity;

  /// Dead potatoes this building keeps now.
  int get graves => data.levels[level - 1].graves;

  /// Potatoes this building keeps in the fridge now.
  int get stores => data.levels[level - 1].stores;

  /// The cost of the next level, or null at the top.
  int? get upgradeCost =>
      level < data.levels.length ? data.levels[level].cost : null;
}
