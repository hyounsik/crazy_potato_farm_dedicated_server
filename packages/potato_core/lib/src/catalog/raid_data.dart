import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/map/map_recipe.dart';

part 'raid_data.freezed.dart';
part 'raid_data.g.dart';

/// Exploration constants shared by every zone (`rules.json` → `raid`).
/// Distances are in tiles, speeds in tiles per second, times in seconds.
@freezed
abstract class RaidRulesData with _$RaidRulesData {
  const factory RaidRulesData({
    /// Game time one run `step` covers.
    required int stepMillis,
    required PlayerRulesData player,
    required int bagSlots,

    /// How close the player must stand to open a pile or a gathering spot.
    required double pickupRadius,
    required FoodRulesData food,

    /// The weapon every run starts with, until equipment exists.
    required String startWeapon,

    /// How long an enemy keeps chasing whoever hit it, even out of sight.
    required double enemyAlertSeconds,
    required CompanionRulesData companion,
  }) = _RaidRulesData;

  factory RaidRulesData.fromJson(Map<String, dynamic> json) =>
      _$RaidRulesDataFromJson(json);
}

@freezed
abstract class PlayerRulesData with _$PlayerRulesData {
  const factory PlayerRulesData({
    required double speed,
    required double radius,
    required double maxHp,

    /// Health starts refilling this long after the last hit.
    required double regenDelaySeconds,
    required double regenPerSecond,

    /// How far the player sees; enemy sight is a share of it.
    required double sight,
    required double dashDistance,
    required double dashSeconds,
    required double dashCooldownSeconds,
  }) = _PlayerRulesData;

  factory PlayerRulesData.fromJson(Map<String, dynamic> json) =>
      _$PlayerRulesDataFromJson(json);
}

/// Food is an item in the bag, eaten all the time.
@freezed
abstract class FoodRulesData with _$FoodRulesData {
  const factory FoodRulesData({
    /// The item eaten (an [ItemKind.food] item).
    required String item,
    required double perSecond,

    /// Eaten on top while health refills.
    required double regenExtraPerSecond,

    /// Speed share while hungry (no food in the bag).
    required double hungrySpeedMultiplier,

    /// Hungry this long, the run ends and the player returns with the bag.
    required double hungryReturnSeconds,
  }) = _FoodRulesData;

  factory FoodRulesData.fromJson(Map<String, dynamic> json) =>
      _$FoodRulesDataFromJson(json);
}

/// Potatoes brought along.
@freezed
abstract class CompanionRulesData with _$CompanionRulesData {
  const factory CompanionRulesData({
    required double maxHp,
    required double radius,

    /// Speed share of the player's.
    required double speedMultiplier,
    required double followDistance,

    /// Farther than this from the player, a companion runs to catch up.
    required double catchUpDistance,
    required double regenDelaySeconds,

    /// Share of max health refilled per second.
    required double regenPercentPerSecond,

    /// Food eaten per second by each companion while it heals.
    required double regenFoodPerSecond,

    /// Food a food potato makes per second.
    required double producePerSecond,
  }) = _CompanionRulesData;

  factory CompanionRulesData.fromJson(Map<String, dynamic> json) =>
      _$CompanionRulesDataFromJson(json);
}

/// An auto-aiming weapon (`weapons.json`).
@freezed
abstract class WeaponData with _$WeaponData {
  const factory WeaponData({
    required String id,

    /// Auto-aim reach.
    required double range,

    /// Seconds between shots.
    required double interval,
    required double damage,
    required double bulletSpeed,

    /// Shots per trigger, fanned evenly over [spreadDegrees]; a single shot
    /// wobbles randomly within it.
    @Default(1) int pellets,
    @Default(0.0) double spreadDegrees,

    /// Seconds of aiming at one target before a shot; switching targets
    /// starts over. Zero fires right away.
    @Default(0.0) double aimSeconds,
  }) = _WeaponData;

  factory WeaponData.fromJson(Map<String, dynamic> json) =>
      _$WeaponDataFromJson(json);
}

enum EnemyTemper {
  /// Attacks whoever enters its sight.
  aggressive,

  /// Only fights back after being hit.
  passive,
}

enum EnemyAttack { melee, ranged }

/// A wild enemy kind (`enemies.json`).
@freezed
abstract class EnemyData with _$EnemyData {
  const factory EnemyData({
    required String id,
    required EnemyTemper temper,
    required EnemyAttack attack,
    required double maxHp,
    required double radius,
    required double damage,
    required double attackInterval,

    /// Melee: gap between bodies within which it hits.
    @Default(0.0) double reach,

    /// Ranged: shooting distance.
    @Default(0.0) double range,
    @Default(0.0) double bulletSpeed,
  }) = _EnemyData;

  factory EnemyData.fromJson(Map<String, dynamic> json) =>
      _$EnemyDataFromJson(json);
}

/// One zone to explore (`zones.json`): its map and what fills it.
@freezed
abstract class ZoneData with _$ZoneData {
  const factory ZoneData({
    required String id,
    required MapRecipe map,
    required ZoneEnemiesData enemies,
    required ZoneGatheringData gathering,
    required ZoneDropsData drops,
  }) = _ZoneData;

  factory ZoneData.fromJson(Map<String, dynamic> json) =>
      _$ZoneDataFromJson(json);
}

@freezed
abstract class ZoneEnemiesData with _$ZoneEnemiesData {
  const factory ZoneEnemiesData({
    /// Lone enemies, each picked by weight from [kinds].
    required int count,
    required List<WeightedEnemyData> kinds,

    /// Groups standing close together.
    @Default(0) int packs,
    @Default(0) int packSizeMin,
    @Default(0) int packSizeMax,
    @Default(<String>[]) List<String> packKinds,

    /// No enemy starts closer than this to the entry.
    required double keepAway,

    /// Shares of the player's sight and speed.
    required double sightMultiplier,
    required double speedMultiplier,
  }) = _ZoneEnemiesData;

  factory ZoneEnemiesData.fromJson(Map<String, dynamic> json) =>
      _$ZoneEnemiesDataFromJson(json);
}

@freezed
abstract class WeightedEnemyData with _$WeightedEnemyData {
  const factory WeightedEnemyData({
    required String enemy,
    required int weight,
  }) = _WeightedEnemyData;

  factory WeightedEnemyData.fromJson(Map<String, dynamic> json) =>
      _$WeightedEnemyDataFromJson(json);
}

/// Gathering spots: passable places holding loot rolled at the start.
@freezed
abstract class ZoneGatheringData with _$ZoneGatheringData {
  const factory ZoneGatheringData({
    required int count,

    /// Least distance between two spots.
    required double spacing,

    /// Loot table id.
    required String loot,
  }) = _ZoneGatheringData;

  factory ZoneGatheringData.fromJson(Map<String, dynamic> json) =>
      _$ZoneGatheringDataFromJson(json);
}

/// What a defeated enemy leaves: rarely a bundle (opened like a spot),
/// otherwise maybe one item on the floor picked up by walking over it.
@freezed
abstract class ZoneDropsData with _$ZoneDropsData {
  const factory ZoneDropsData({
    required double bundleChance,
    required String bundle,
    required double itemChance,
    required String item,
  }) = _ZoneDropsData;

  factory ZoneDropsData.fromJson(Map<String, dynamic> json) =>
      _$ZoneDropsDataFromJson(json);
}
