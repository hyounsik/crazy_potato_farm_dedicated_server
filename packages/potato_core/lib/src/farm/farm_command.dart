import 'package:freezed_annotation/freezed_annotation.dart';
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

  /// Opens the locked [block] (in block units) next to open land, paying
  /// more the more blocks have been opened.
  const factory FarmCommand.openBlock({required TilePos block}) = OpenBlock;

  /// Makes a new empty field covering [rect], paying the 1x1 cost plus the
  /// tile cost for every tile past the first.
  const factory FarmCommand.makeField({required TileRect rect}) = MakeField;

  /// Changes field [fieldId] to cover [rect]: every potato must stay inside,
  /// and each tile added costs the tile price. Shrinking gives nothing back.
  const factory FarmCommand.resizeField({
    required int fieldId,
    required TileRect rect,
  }) = ResizeField;

  /// Moves field [fieldId], with its potatoes and pest, so its top-left tile
  /// is [origin].
  const factory FarmCommand.moveField({
    required int fieldId,
    required TilePos origin,
  }) = MoveField;

  /// Removes empty field [fieldId]. What it cost is not given back.
  const factory FarmCommand.removeField({required int fieldId}) = RemoveField;

  /// Moves building [buildingId] so its top-left tile is [origin].
  const factory FarmCommand.moveBuilding({
    required int buildingId,
    required TilePos origin,
  }) = MoveBuilding;

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

  /// Turns dead potato [potatoId] in a graveyard into its seed.
  const factory FarmCommand.revive({required int potatoId}) = Revive;

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
    @Default(<SeedCount>[]) List<SeedCount> seeds,
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

  /// A field side shorter than 1 or longer than the largest field.
  badSize,

  /// The block is already open, outside the farm, or not next to open land.
  cannotOpen,

  /// A field cannot shrink past its potatoes, nor be removed with any.
  fieldNotEmpty,

  /// The building comes with the farm and stays (the house).
  cannotRemove,
  maxLevel,
  noPest,
  fridgeFull,

  /// Only grown potatoes go into the fridge.
  stillGrowing,

  /// The potato is not in the fridge.
  notInFridge,

  /// No dead potato with that id in the graveyards.
  noGrave,
  noPotato,
  nothingToHarvest,

  /// Taking more baby potatoes than the farm has.
  notEnoughFood,

  /// A companion that is missing, still growing, already out, in the
  /// fridge, or of a type that never leaves the farm.
  cannotGo,
}
