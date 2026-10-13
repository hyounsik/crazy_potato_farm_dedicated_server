import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';

part 'potato_type_data.freezed.dart';
part 'potato_type_data.g.dart';

/// The four kinds of potato. Each kind behaves differently in code, so the
/// list is fixed here rather than in data.
@JsonEnum(fieldRename: FieldRename.snake)
enum PotatoType { food, combat, breeding, buff }

/// Numbers shared by every potato of one [PotatoType] (`potato_types.json`).
@freezed
abstract class PotatoTypeData with _$PotatoTypeData {
  const factory PotatoTypeData({
    required PotatoType type,

    /// Game time from planting a seed to a fully grown potato.
    required int growSeconds,

    /// Game time a fully grown potato lives before it dies and leaves a seed.
    required int lifespanSeconds,

    /// The building the farm needs before seeds of this type can be planted.
    /// Null means the type can always be planted.
    String? unlockBuilding,

    /// What a fully grown potato makes on the farm. Food potatoes only.
    ProductionData? production,

    /// Baby potatoes each potato of this type eats every upkeep interval
    /// (`rules.potatoes.upkeep_every_seconds`). Food potatoes eat nothing.
    @Default(0) int upkeep,
  }) = _PotatoTypeData;

  const PotatoTypeData._();

  factory PotatoTypeData.fromJson(Map<String, dynamic> json) =>
      _$PotatoTypeDataFromJson(json);

  Duration get growTime => Duration(seconds: growSeconds);

  Duration get lifespan => Duration(seconds: lifespanSeconds);
}

/// Baby potatoes (the currency) a potato makes while it works.
@freezed
abstract class ProductionData with _$ProductionData {
  const factory ProductionData({
    /// Working time between two batches.
    required int everySeconds,

    /// Baby potatoes in one batch, by the potato's grade.
    required Map<Grade, int> amount,

    /// Baby potatoes kept on the potato until harvested. Batches past this
    /// are lost, so a farm left alone stops piling up.
    required int storeMax,
  }) = _ProductionData;

  factory ProductionData.fromJson(Map<String, dynamic> json) =>
      _$ProductionDataFromJson(json);
}
