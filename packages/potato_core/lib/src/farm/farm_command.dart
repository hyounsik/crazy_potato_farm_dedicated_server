import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/potatoes/seed.dart';

part 'farm_command.freezed.dart';
part 'farm_command.g.dart';

/// Something the player asks the farm to do. See `FarmSimulation.apply`.
@freezed
sealed class FarmCommand with _$FarmCommand {
  /// Plants one [seed] from the pouch on an empty [tile] of a field.
  const factory FarmCommand.plant({
    required int fieldId,
    required TilePos tile,
    required Seed seed,
  }) = PlantSeed;

  /// Takes the baby potatoes stored on the potato at [tile].
  const factory FarmCommand.harvest({
    required int fieldId,
    required TilePos tile,
  }) = HarvestPotato;

  /// Takes the baby potatoes stored on every potato in a field.
  const factory FarmCommand.harvestField({required int fieldId}) = HarvestField;

  /// Puts up a new building of [kind] (a `buildings.json` id) with its
  /// top-left tile at [origin], paying its level 1 cost.
  const factory FarmCommand.build({
    required String kind,
    required TilePos origin,
  }) = BuildBuilding;

  /// Raises a building one level, paying that level's cost.
  const factory FarmCommand.upgrade({required int buildingId}) =
      UpgradeBuilding;

  /// Takes a building down. Nothing is paid back. Potatoes it looks after
  /// stay; ones growing inside move to another building of the kind, or to
  /// the fridge.
  const factory FarmCommand.demolish({required int buildingId}) =
      DemolishBuilding;

  /// Puts one combat [seed] from the pouch into a training ground to grow.
  const factory FarmCommand.train({
    required int buildingId,
    required Seed seed,
  }) = TrainSeed;

  /// The player tapped a field's pest the required number of times.
  const factory FarmCommand.clearPest({required int fieldId}) = ClearPest;

  /// Takes a grown planted potato or a grown guard into the fridge.
  const factory FarmCommand.uproot({required int potatoId}) = Uproot;

  /// Plants a potato from the fridge on an empty field tile.
  const factory FarmCommand.replant({
    required int potatoId,
    required int fieldId,
    required TilePos tile,
  }) = Replant;

  /// Sends a combat potato from the fridge back to a training ground.
  const factory FarmCommand.retrain({
    required int potatoId,
    required int buildingId,
  }) = Retrain;

  /// Sets out exploring with [food] baby potatoes and the potatoes
  /// [potatoIds] as companions. They leave the farm until [returnHome].
  const factory FarmCommand.depart({
    required int food,
    @Default(<int>[]) List<int> potatoIds,
  }) = Depart;

  /// Comes back from exploring: [food] and [seeds] go into the farm, and
  /// the companions [potatoIds] go back to where they were, or to the fridge
  /// when that place is gone or taken.
  const factory FarmCommand.returnHome({
    required int food,
    @Default(<SeedStackData>[]) List<SeedStackData> seeds,
    @Default(<int>[]) List<int> potatoIds,
  }) = ReturnHome;

  factory FarmCommand.fromJson(Map<String, dynamic> json) =>
      _$FarmCommandFromJson(json);
}

/// Why the farm refused a command. The screen turns these into messages.
enum FarmRejection {
  noSuchField,
  outsideField,
  tileTaken,
  noSeed,

  /// The farm lacks the building that unlocks this potato type.
  typeLocked,

  /// The type's buildings already look after as many potatoes as they can.
  atCapacity,

  /// Combat seeds grow in training grounds, other seeds in fields.
  wrongPlace,
  noSuchBuilding,

  /// The spot is outside the open land, or too close to another building
  /// (buildings keep one free tile between them, corners included).
  blocked,
  maxLevel,
  noPest,
  fridgeFull,

  /// Only grown potatoes go into the fridge.
  stillGrowing,

  /// The potato is not in the fridge.
  notInFridge,
  noPotato,
  nothingToHarvest,

  /// Taking more baby potatoes than the farm has.
  notEnoughFood,

  /// A companion that is missing, still growing, already out, in the
  /// fridge, or of a type that never leaves the farm.
  cannotGo,
}
