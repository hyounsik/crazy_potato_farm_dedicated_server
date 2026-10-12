import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/potatoes/seed.dart';

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

  const factory FarmEvent.grown({
    required int fieldId,
    required TilePos tile,
    required int potatoId,
  }) = PotatoGrown;

  /// A potato reached the end of its life. [seedLeft] went into the pouch;
  /// baby potatoes still stored on it are lost.
  const factory FarmEvent.died({
    required int fieldId,
    required TilePos tile,
    required int potatoId,
    required Seed seedLeft,
  }) = PotatoDied;

  /// [food] baby potatoes moved from potatoes in a field to the farm.
  const factory FarmEvent.harvested({required int fieldId, required int food}) =
      FoodHarvested;

  factory FarmEvent.fromJson(Map<String, dynamic> json) =>
      _$FarmEventFromJson(json);
}
