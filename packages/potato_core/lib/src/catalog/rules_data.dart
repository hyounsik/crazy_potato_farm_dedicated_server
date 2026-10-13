import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/tile.dart';

part 'rules_data.freezed.dart';
part 'rules_data.g.dart';

/// Balance constants that belong to no single catalog entry (`rules.json`).
@freezed
abstract class RulesData with _$RulesData {
  const factory RulesData({
    required FarmRulesData farm,
    required PotatoRulesData potatoes,
    required NewFarmData newFarm,
    required RaidRulesData raid,
  }) = _RulesData;

  factory RulesData.fromJson(Map<String, dynamic> json) =>
      _$RulesDataFromJson(json);
}

@freezed
abstract class FarmRulesData with _$FarmRulesData {
  const factory FarmRulesData({
    /// Game time one farm `step` covers, both while the app runs and when
    /// catching up after it was closed.
    required int stepMillis,

    /// Longest time away that still counts when catching up. Time past it is
    /// treated as paused.
    required int offlineCapMinutes,

    /// Tiles along one side of the square farm.
    required int size,

    /// Tiles along the longer side of the largest field.
    required int fieldMaxSize,
  }) = _FarmRulesData;

  const FarmRulesData._();

  factory FarmRulesData.fromJson(Map<String, dynamic> json) =>
      _$FarmRulesDataFromJson(json);

  Duration get step => Duration(milliseconds: stepMillis);

  Duration get offlineCap => Duration(minutes: offlineCapMinutes);
}

@freezed
abstract class PotatoRulesData with _$PotatoRulesData {
  const factory PotatoRulesData({
    /// Chance that the seed a dead potato leaves is one grade lower.
    required double gradeDropChance,
  }) = _PotatoRulesData;

  factory PotatoRulesData.fromJson(Map<String, dynamic> json) =>
      _$PotatoRulesDataFromJson(json);
}

/// What a newly made farm starts with.
@freezed
abstract class NewFarmData with _$NewFarmData {
  const factory NewFarmData({
    /// Baby potatoes.
    required int food,
    required List<TileRect> fields,
    required List<SeedStackData> seeds,
  }) = _NewFarmData;

  factory NewFarmData.fromJson(Map<String, dynamic> json) =>
      _$NewFarmDataFromJson(json);
}

/// A number of identical seeds.
@freezed
abstract class SeedStackData with _$SeedStackData {
  const factory SeedStackData({
    required PotatoType type,
    required Grade grade,
    required int count,
  }) = _SeedStackData;

  factory SeedStackData.fromJson(Map<String, dynamic> json) =>
      _$SeedStackDataFromJson(json);
}
