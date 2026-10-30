import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/pest.dart';
import 'package:potato_core/src/potatoes/seed.dart';

import 'package:potato_core/src/items/gear.dart';

part 'farm_event.freezed.dart';
part 'farm_event.g.dart';

/// Something that happened on the farm, for screens to react to (a sound, a
/// message, a summary after catching up). The farm state is already changed
/// when the event is reported.
@freezed
sealed class FarmEvent with _$FarmEvent {
  const factory FarmEvent.planted({
    required int fieldId,
    required TilePos tile,
    required int potatoId,
    required Seed seed,
  }) = PotatoPlanted;

  /// A potato finished growing. [fieldId] and [tile] are null for a combat
  /// potato, which grows in a training ground and starts guarding.
  const factory FarmEvent.grown({
    int? fieldId,
    TilePos? tile,
    required int potatoId,
  }) = PotatoGrown;

  /// A potato reached the end of its life where it stood: in a field
  /// ([fieldId], [tile]), guarding (standing at [at]), or in the fridge.
  /// It is [buried] in a graveyard, or gone when the farm has none. Baby
  /// potatoes still stored on it are lost.
  const factory FarmEvent.died({
    int? fieldId,
    TilePos? tile,
    TilePos? at,
    required int potatoId,
    required PotatoType type,
    required bool buried,
  }) = PotatoDied;

  /// The graveyards were full, so the oldest grave [potatoId] was lost.
  const factory FarmEvent.graveLost({required int potatoId}) = GraveLost;

  /// Dead potato [potatoId] came back as [seed]. [from] was its grade; the
  /// seed may be a grade lower (or, with an ability, higher).
  const factory FarmEvent.revived({
    required int potatoId,
    required Grade from,
    required Seed seed,
  }) = PotatoRevived;

  /// A seed came with the pouch full and waits in the overflow.
  const factory FarmEvent.seedOverflowed({required Seed seed}) = SeedOverflowed;

  /// A waiting seed ran out of time and became [food] baby potatoes.
  const factory FarmEvent.overflowExpired({
    required Seed seed,
    required int food,
  }) = OverflowExpired;

  const factory FarmEvent.mailArrived({required int mailId}) = MailArrived;

  /// Story event [event] is done and opened [unlocks]; its letter follows.
  const factory FarmEvent.storyDone({
    required String event,
    @Default(<String>[]) List<String> unlocks,
  }) = StoryDone;

  /// The workbench tried to raise a piece of [kind] to [level]; [worked]
  /// says whether it took.
  const factory FarmEvent.gearEnhanced({
    required GearKind kind,
    required int level,
    required bool worked,
  }) = GearEnhanced;

  /// A piece broke down into [materials].
  const factory FarmEvent.gearDisassembled({required int materials}) =
      GearDisassembled;

  const factory FarmEvent.totemLit({required int buildingId}) = TotemLit;

  /// Breeding potato [potatoId] in field [fieldId] made [seed]; it waits on
  /// the potato until harvested.
  const factory FarmEvent.seedMade({
    required int fieldId,
    required int potatoId,
    required Seed seed,
  }) = SeedMade;

  const factory FarmEvent.totemOut({required int buildingId}) = TotemOut;

  const factory FarmEvent.blockOpened({
    required TilePos block,
    required int food,
  }) = BlockOpened;

  const factory FarmEvent.fieldMade({
    required int fieldId,
    required TileRect rect,
  }) = FieldMade;

  /// A field was resized, moved or removed ([rect] is null when removed).
  const factory FarmEvent.fieldChanged({required int fieldId, TileRect? rect}) =
      FieldChanged;

  const factory FarmEvent.buildingMoved({
    required int buildingId,
    required TilePos origin,
  }) = BuildingMoved;

  const factory FarmEvent.built({
    required int buildingId,
    required String kind,
    required TilePos origin,
  }) = BuildingBuilt;

  const factory FarmEvent.upgraded({
    required int buildingId,
    required int level,
  }) = BuildingUpgraded;

  /// [toFridge] lists potatoes that were growing inside and had nowhere
  /// else to go.
  const factory FarmEvent.demolished({
    required int buildingId,
    @Default(<int>[]) List<int> toFridge,
  }) = BuildingDemolished;

  const factory FarmEvent.trained({
    required int buildingId,
    required int potatoId,
    required Seed seed,
  }) = SeedTrained;

  const factory FarmEvent.pestAppeared({
    required int fieldId,
    required PestKind kind,
  }) = PestAppeared;

  /// [food] baby potatoes and [seed], if any, went into the farm as the
  /// reward.
  const factory FarmEvent.pestCleared({
    required int fieldId,
    required PestKind kind,
    required bool byTap,
    required int food,
    Seed? seed,
  }) = PestCleared;

  /// These potatoes could not be paid for and work slower until they are.
  const factory FarmEvent.weakened({required List<int> potatoIds}) =
      PotatoesWeakened;

  const factory FarmEvent.recovered({required List<int> potatoIds}) =
      PotatoesRecovered;

  const factory FarmEvent.uprooted({required int potatoId}) = PotatoUprooted;

  /// A potato in the fridge was let go for good.
  const factory FarmEvent.released({required int potatoId}) = PotatoReleased;

  /// A potato left the fridge for a field or a training ground.
  const factory FarmEvent.takenOut({required int potatoId}) = PotatoTakenOut;

  /// [food] baby potatoes moved from potatoes in a field to the farm, and
  /// sometimes a [seed] with them (a rare harvest).
  /// [food] baby potatoes and the [seeds] breeding potatoes made came in
  /// from field [fieldId]; [seed] is a rare one found with the food.
  const factory FarmEvent.harvested({
    required int fieldId,
    required int food,
    Seed? seed,
    @Default(<Seed>[]) List<Seed> seeds,
  }) = FoodHarvested;

  const factory FarmEvent.departed({
    required int food,
    required List<int> potatoIds,
  }) = Departed;

  /// [potatoIds] came home; those in [toFridge] found their place gone or
  /// taken and went to the fridge.
  const factory FarmEvent.returned({
    required int food,
    required int seeds,
    required List<int> potatoIds,
    @Default(<int>[]) List<int> toFridge,

    /// Companions lost in a failed danger run: gone, no grave, no seed.
    @Default(<int>[]) List<int> lost,
  }) = Returned;

  factory FarmEvent.fromJson(Map<String, dynamic> json) =>
      _$FarmEventFromJson(json);
}
