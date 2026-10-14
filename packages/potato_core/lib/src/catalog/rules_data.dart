import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/potatoes/seed.dart';

part 'rules_data.freezed.dart';
part 'rules_data.g.dart';

/// Balance constants that belong to no single catalog entry (`rules.json`).
@freezed
abstract class RulesData with _$RulesData {
  const factory RulesData({
    required FarmRulesData farm,
    required PotatoRulesData potatoes,
    required PestRulesData pests,
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

    /// Baby potatoes a new 1x1 field costs.
    required int fieldFood,

    /// Baby potatoes each tile past the first adds to a new field's cost.
    required int fieldTileFood,

    /// The part of the farm that can be built on. Fixed until locked blocks
    /// can be opened.
    required TileRect openArea,
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

    /// Baby potatoes it costs to revive a dead potato as a seed, by its
    /// grade.
    required Map<Grade, int> reviveFood,

    /// Game time between two upkeep payments. A multiple of the farm step.
    required int upkeepEverySeconds,

    /// How hard a weak (unfed) potato works, in percent: guards walk and
    /// clear pests, and breeding potatoes raise grades, at this rate.
    required int weakPercent,

    /// Chance that a seed planted in a field with a grown breeding potato
    /// comes up one grade higher.
    required double breedingGradeUpChance,
    required GuardRulesData guards,
    required FridgeRulesData fridge,

    /// Chance that harvesting a field also gives a normal seed of the type
    /// planted most there, before abilities raise it.
    required double harvestRareChance,
    required LevelRulesData level,

    /// How each combat style changes guards on the farm.
    required Map<CombatStyle, CombatStyleData> combatStyles,
  }) = _PotatoRulesData;

  factory PotatoRulesData.fromJson(Map<String, dynamic> json) =>
      _$PotatoRulesDataFromJson(json);
}

/// What each level adds to a potato's main job, in thousandths: 50 means
/// +5% per level. Values are placeholders until the balance phase.
@freezed
abstract class LevelRulesData with _$LevelRulesData {
  const factory LevelRulesData({
    required int foodYieldPermille,
    required int gradeUpChancePermille,
    required int upkeepPermille,

    /// How much stronger a buff potato's abilities get.
    required int buffPowerPermille,
  }) = _LevelRulesData;

  factory LevelRulesData.fromJson(Map<String, dynamic> json) =>
      _$LevelRulesDataFromJson(json);
}

@freezed
abstract class CombatStyleData with _$CombatStyleData {
  const factory CombatStyleData({
    /// Walking pace on the farm, in percent of the base.
    required int walkPercent,
  }) = _CombatStyleData;

  factory CombatStyleData.fromJson(Map<String, dynamic> json) =>
      _$CombatStyleDataFromJson(json);
}

/// Grown combat potatoes walking the farm.
@freezed
abstract class GuardRulesData with _$GuardRulesData {
  const factory GuardRulesData({
    /// Game time to walk one tile.
    required int walkMillisPerTile,
  }) = _GuardRulesData;

  factory GuardRulesData.fromJson(Map<String, dynamic> json) =>
      _$GuardRulesDataFromJson(json);
}

/// The potato fridge: potatoes taken out of fields and training grounds.
@freezed
abstract class FridgeRulesData with _$FridgeRulesData {
  const factory FridgeRulesData({
    /// Potatoes it holds. Companions coming home may go past it.
    required int size,

    /// How fast life runs out inside, in percent of normal.
    required int agingPercent,
  }) = _FridgeRulesData;

  factory FridgeRulesData.fromJson(Map<String, dynamic> json) =>
      _$FridgeRulesDataFromJson(json);
}

/// Bugs and blight appearing on fields.
@freezed
abstract class PestRulesData with _$PestRulesData {
  const factory PestRulesData({
    /// Game time between two rolls for new pests. A multiple of the farm
    /// step.
    required int checkEverySeconds,
    required BugRulesData bug,
    required BlightRulesData blight,

    /// Taps in a row that clear a pest by hand.
    required int taps,

    /// What clearing a pest gives.
    required PestRewardData reward,
  }) = _PestRulesData;

  factory PestRulesData.fromJson(Map<String, dynamic> json) =>
      _$PestRulesDataFromJson(json);
}

/// Bugs eat the baby potatoes stored on a field's potatoes.
@freezed
abstract class BugRulesData with _$BugRulesData {
  const factory BugRulesData({
    /// Chance per check for each stored baby potato in the field.
    required double chancePerStored,

    /// The chance never goes past this, however much is stored.
    required double chanceMax,

    /// Game time between two bites.
    required int eatEverySeconds,

    /// Baby potatoes eaten per bite.
    required int eatAmount,

    /// Game time one guard at full strength needs to clear it.
    required int clearSeconds,
  }) = _BugRulesData;

  factory BugRulesData.fromJson(Map<String, dynamic> json) =>
      _$BugRulesDataFromJson(json);
}

/// Blight makes a field's potatoes use up their life faster.
@freezed
abstract class BlightRulesData with _$BlightRulesData {
  const factory BlightRulesData({
    /// Chance per check for a field with at least one potato.
    required double chance,

    /// Extra life used, in percent of the time passing: 100 doubles aging.
    required int extraAgingPercent,

    /// Game time one guard at full strength needs to clear it.
    required int clearSeconds,
  }) = _BlightRulesData;

  factory BlightRulesData.fromJson(Map<String, dynamic> json) =>
      _$BlightRulesDataFromJson(json);
}

@freezed
abstract class PestRewardData with _$PestRewardData {
  const factory PestRewardData({
    required int foodMin,
    required int foodMax,

    /// Chance of a normal seed of the type most planted in the field.
    required double seedChance,
  }) = _PestRewardData;

  factory PestRewardData.fromJson(Map<String, dynamic> json) =>
      _$PestRewardDataFromJson(json);
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

/// A number of seeds a new farm starts with. Each gets its own ability
/// (and style) when the farm is made.
@freezed
abstract class SeedStackData with _$SeedStackData {
  const factory SeedStackData({
    required PotatoType type,
    required Grade grade,
    required int count,
    required int level,

    /// A fixed first ability (an id in the type's own pool), instead of one
    /// rolled by hidden rarity.
    String? ability,

    /// A fixed combat style, instead of a random one. Combat seeds only.
    CombatStyle? style,
  }) = _SeedStackData;

  factory SeedStackData.fromJson(Map<String, dynamic> json) =>
      _$SeedStackDataFromJson(json);
}
