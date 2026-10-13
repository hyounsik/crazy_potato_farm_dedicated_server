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

  /// Sets out exploring with [food] baby potatoes and the potatoes
  /// [potatoIds] as companions. They leave the farm until [returnHome].
  const factory FarmCommand.depart({
    required int food,
    @Default(<int>[]) List<int> potatoIds,
  }) = Depart;

  /// Comes back from exploring: [food] and [seeds] go into the farm, and
  /// the companions [potatoIds] go back to their tiles.
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
  noPotato,
  nothingToHarvest,

  /// Taking more baby potatoes than the farm has.
  notEnoughFood,

  /// A companion that is missing, still growing, already out, or of a type
  /// that never leaves the farm.
  cannotGo,
}
