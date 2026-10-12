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
}
