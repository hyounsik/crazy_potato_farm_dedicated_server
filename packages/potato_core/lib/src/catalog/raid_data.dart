import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/map/map_recipe.dart';
import 'package:potato_core/src/potatoes/seed.dart';

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
    required CloneRulesData clones,
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

    /// How far from the player combat potatoes take on enemies: in attack
    /// mode any enemy, in defense mode only those going for the party.
    required double attackRange,
    required double defenseRange,

    /// How each combat style fights. Other potatoes use [maxHp] and
    /// [speedMultiplier] and do not fight.
    required Map<CombatStyle, CompanionStyleData> styles,

    /// What each level adds to a companion's health and attack, in
    /// thousandths: 30 means +3% per level.
    required int levelHpPermille,
    required int levelAttackPermille,

    /// Enemies this close to a potato that calls them come for it.
    required double aggroPulseRange,
  }) = _CompanionRulesData;

  factory CompanionRulesData.fromJson(Map<String, dynamic> json) =>
      _$CompanionRulesDataFromJson(json);
}

/// Clones: competitors playing by the player's rules, a little slower and
/// shorter-sighted so the player can always get away.
@freezed
abstract class CloneRulesData with _$CloneRulesData {
  const factory CloneRulesData({
    /// Shares of the player's sight and speed.
    required double sightMultiplier,
    required double speedMultiplier,
    required double maxHp,
    required double radius,

    /// Below this share of health (after a fight) it heads out.
    required double lowHpRatio,

    /// How long one stays before heading out, picked between these.
    required double staySecondsMin,
    required double staySecondsMax,

    /// While the player's signal counts down, clone sight grows up to this
    /// share at zero.
    required double waitSightMultiplier,
  }) = _CloneRulesData;

  factory CloneRulesData.fromJson(Map<String, dynamic> json) =>
      _$CloneRulesDataFromJson(json);
}

/// A clone that ships with the game (`default_clones.json`), used until a
/// pool of real players' clones exists, and whenever the pool lacks one.
@freezed
abstract class DefaultCloneData with _$DefaultCloneData {
  const factory DefaultCloneData({
    required String id,

    /// Shown over its head.
    required String name,
    required String weapon,
    @Default(0) int weaponLevel,
    required int bagSlots,

    /// Zone scores it fits, both ends included.
    required int scoreMin,
    required int scoreMax,
    @Default(<CloneCompanionData>[]) List<CloneCompanionData> companions,
  }) = _DefaultCloneData;

  factory DefaultCloneData.fromJson(Map<String, dynamic> json) =>
      _$DefaultCloneDataFromJson(json);
}

/// A potato a clone brings along.
@freezed
abstract class CloneCompanionData with _$CloneCompanionData {
  const factory CloneCompanionData({
    required PotatoType type,
    required Grade grade,
    @Default(0) int level,
    required List<String> abilities,
    CombatStyle? style,
  }) = _CloneCompanionData;

  factory CloneCompanionData.fromJson(Map<String, dynamic> json) =>
      _$CloneCompanionDataFromJson(json);
}

/// One combat style's fighting values. Melee and guard hit within [reach];
/// ranged shoots up to [range].
@freezed
abstract class CompanionStyleData with _$CompanionStyleData {
  const factory CompanionStyleData({
    required double maxHp,
    required double damage,

    /// Seconds between attacks.
    required double interval,

    /// Speed share of the player's.
    required double speedMultiplier,

    /// The gap it keeps: melee next to the enemy, ranged back from it,
    /// guard this far out from the player toward the enemy.
    required double preferredDistance,
    @Default(0.0) double reach,
    @Default(0.0) double range,
    @Default(0.0) double bulletSpeed,
  }) = _CompanionStyleData;

  factory CompanionStyleData.fromJson(Map<String, dynamic> json) =>
      _$CompanionStyleDataFromJson(json);
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

    /// The gap a clone with this weapon keeps from what it fights.
    @Default(1.5) double preferredDistance,
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

    /// Set for a boss: it guards the boss area and has extra attacks.
    BossData? boss,
  }) = _EnemyData;

  factory EnemyData.fromJson(Map<String, dynamic> json) =>
      _$EnemyDataFromJson(json);
}

/// A boss's extra attacks. A charge is shown on the floor for
/// [chargeTelegraphSeconds], then runs straight at [chargeSpeed] for up to
/// [chargeDistance], hurting each body it runs into once; obstacles and the
/// edge of the boss area stop it, and a dash dodges it. A spray fires
/// [sprayBullets] shots evenly all around.
@freezed
abstract class BossData with _$BossData {
  const factory BossData({
    required double chargeEverySeconds,
    required double chargeTelegraphSeconds,
    required double chargeSpeed,
    required double chargeDistance,
    required double chargeDamage,
    required double sprayEverySeconds,
    required int sprayBullets,
    required double sprayDamage,
    required double spraySpeed,
    required double sprayRange,
  }) = _BossData;

  factory BossData.fromJson(Map<String, dynamic> json) =>
      _$BossDataFromJson(json);
}

/// The boss guarding a zone's boss area (the map's clearing).
@freezed
abstract class ZoneBossData with _$ZoneBossData {
  const factory ZoneBossData({
    /// An enemy with [EnemyData.boss] set.
    required String enemy,

    /// Loot table of the bundle it leaves.
    required String loot,
  }) = _ZoneBossData;

  factory ZoneBossData.fromJson(Map<String, dynamic> json) =>
      _$ZoneBossDataFromJson(json);
}

/// One zone to explore (`zones.json`): its map and what fills it.
@freezed
abstract class ZoneData with _$ZoneData {
  const factory ZoneData({
    required String id,

    /// The region score: the level of the seeds found here.
    required int score,
    required MapRecipe map,
    required ZoneEnemiesData enemies,
    required ZoneGatheringData gathering,
    required ZoneDropsData drops,

    /// Set for a danger zone: leaving takes an open exit and a signal, and
    /// failing loses what was brought. Null for a safe zone.
    ZoneDangerData? danger,

    /// Who guards the map's clearing, if anyone.
    ZoneBossData? boss,
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

    /// Shares of each kind's health and damage: the same enemies, stronger
    /// in harder zones.
    @Default(1.0) double hpMultiplier,
    @Default(1.0) double damageMultiplier,
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

/// How a danger zone is left, and what hunger does there.
@freezed
abstract class ZoneDangerData with _$ZoneDangerData {
  const factory ZoneDangerData({
    /// How many of the map's exits open in a run.
    required int openExits,

    /// Open exits stay hidden until seen; after this long all show.
    required double revealSeconds,

    /// How close to an exit's centre counts as standing in it.
    required double exitRadius,

    /// The wait after a signal. It runs out whatever happens; the player
    /// leaves only when standing in that exit at zero.
    required double countdownSeconds,

    /// Aggressive enemies' sight grows during the wait, up to this share at
    /// zero.
    required double waitSightMultiplier,

    /// Health lost per second while hungry. There is no walking home.
    required double hungryDamagePerSecond,

    /// Clones walking in with the player, then one more every
    /// [cloneEverySeconds] until [clonesMax] have come in all.
    @Default(0) int clonesAtStart,
    @Default(0.0) double cloneEverySeconds,
    @Default(0) int clonesMax,
  }) = _ZoneDangerData;

  factory ZoneDangerData.fromJson(Map<String, dynamic> json) =>
      _$ZoneDangerDataFromJson(json);
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
