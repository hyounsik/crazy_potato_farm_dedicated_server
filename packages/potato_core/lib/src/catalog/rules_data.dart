import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/localized_text.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/potatoes/potato_effects.dart';
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
    required StorageRulesData storage,
    required MailRulesData mail,
    required WorkbenchRulesData workbench,
    required TotemRulesData totems,
    required BreedingRulesData breeding,
    required GearRulesData gear,
    required CombatPowerRulesData combatPower,
    @Default(ZoneScalingRulesData()) ZoneScalingRulesData zoneScaling,
    @Default(SeedLabRulesData()) SeedLabRulesData seedLab,
    @Default(GearLabRulesData()) GearLabRulesData gearLab,
    @Default(MealRulesData()) MealRulesData meals,
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

    /// Field tiles every farm looks after to begin with (2026-10-28, user:
    /// 36). Each field office adds its own (`BuildingLevelData.fieldTiles`).
    /// Data from before it reads as 36.
    @Default(36) int fieldTiles,

    /// Baby potatoes a new 1x1 field costs.
    required int fieldFood,

    /// Baby potatoes each tile past the first adds to a new field's cost.
    required int fieldTileFood,

    /// The land open at the start, in whole blocks. The rest is locked and
    /// opened a block at a time.
    required TileRect openArea,

    /// Tiles along one side of a block, the unit locked land opens in.
    required int blockSize,

    /// Baby potatoes the first block opened costs.
    required int blockFood,

    /// What each block opened before adds to the next one's cost, when
    /// [blockSteps] is empty.
    required int blockStepFood,

    /// What each block adds to the next one's cost, by group of
    /// [blockStepEvery] blocks (2026-10-28, user: 40, 80, 200, 480 for
    /// four groups of 8; to be tuned after playing). The last step holds
    /// past the list's end. Empty uses [blockStepFood] for every block.
    @Default(<int>[]) List<int> blockSteps,

    /// Blocks in each group of [blockSteps].
    @Default(8) int blockStepEvery,
  }) = _FarmRulesData;

  const FarmRulesData._();

  factory FarmRulesData.fromJson(Map<String, dynamic> json) =>
      _$FarmRulesDataFromJson(json);

  Duration get step => Duration(milliseconds: stepMillis);

  Duration get offlineCap => Duration(minutes: offlineCapMinutes);

  /// The block holding [tile], in block units.
  TilePos blockOf(TilePos tile) =>
      TilePos(tile.x ~/ blockSize, tile.y ~/ blockSize);

  /// The tiles [block] covers.
  TileRect blockRect(TilePos block) => TileRect(
    origin: TilePos(block.x * blockSize, block.y * blockSize),
    width: blockSize,
    height: blockSize,
  );

  /// The blocks open at the start: those [openArea] covers.
  Set<TilePos> get startBlocks => {
    for (final tile in openArea.tiles) blockOf(tile),
  };
}

@freezed
abstract class PotatoRulesData with _$PotatoRulesData {
  const factory PotatoRulesData({
    /// Chance that the seed a potato fallen in a run leaves is one grade
    /// lower. Reviving no longer drops it (2026-11-05, 사용자): a revive
    /// works or fails instead ([reviveChance]).
    required double gradeDropChance,

    /// Chance that reviving a dead potato at the graveyard works, by its
    /// grade (2026-11-05, 사용자). A failed revive loses the potato and the
    /// baby potatoes paid.
    @Default({Grade.normal: 0.8, Grade.rare: 0.6, Grade.legendary: 0.4})
    Map<Grade, double> reviveChance,

    /// The same at a shrine (2026-11-05, 사용자: twice as likely, 100% for
    /// normal potatoes), which costs [shrineReviveCostTimes] times as much.
    @Default({Grade.normal: 1.0, Grade.rare: 0.8, Grade.legendary: 0.6})
    Map<Grade, double> shrineReviveChance,
    @Default({Grade.normal: 1.2, Grade.rare: 1.5, Grade.legendary: 2.5})
    Map<Grade, double> shrineReviveCostTimes,

    /// Baby potatoes it costs to revive a dead potato as a seed, by its
    /// grade, per cost band of its level: the seed lab's bands, 1-9 the
    /// first (2026-11-01, 사용자: by level and grade, cheaper than the lab).
    required Map<Grade, int> reviveFood,

    /// Chance that a potato let go from the cellar goes to a graveyard (as
    /// if it had died); otherwise it leaves the farm for good (2026-10-31,
    /// 사용자).
    @Default(0.7) double releaseGraveChance,

    /// What a potato's grade adds, always, on top of its level (2026-11-01,
    /// 사용자: grade should count for more than ability slots). A combat
    /// potato's attack, in percent.
    @Default({Grade.normal: 0, Grade.rare: 10, Grade.legendary: 25})
    Map<Grade, int> gradeAttackPercent,

    /// A buff potato's buff power, in percent.
    @Default({Grade.normal: 0, Grade.rare: 10, Grade.legendary: 25})
    Map<Grade, int> gradeBuffPercent,

    /// Points added to a breeding potato's chance that a seed comes out a
    /// grade higher, in percent.
    @Default({Grade.normal: 0, Grade.rare: 5, Grade.legendary: 10})
    Map<Grade, int> gradeUpPercent,

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

  const PotatoRulesData._();

  factory PotatoRulesData.fromJson(Map<String, dynamic> json) =>
      _$PotatoRulesDataFromJson(json);

  /// What a combat potato of [grade] multiplies its attack by.
  double attackOf(Grade grade) => 1 + (gradeAttackPercent[grade] ?? 0) / 100;

  /// What a buff potato of [grade] multiplies its buff power by.
  double buffOf(Grade grade) => 1 + (gradeBuffPercent[grade] ?? 0) / 100;

  /// What a breeding potato of [grade] adds to its grade-up chance.
  double gradeUpOf(Grade grade) => (gradeUpPercent[grade] ?? 0) / 100;
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

    /// How much faster a guard clears pests, and how much more a harvesting
    /// one brings in, for each of its levels, in thousandths over 1,
    /// compounding (2026-10-30, 사용자: like attack).
    @Default(30) int levelPermille,
  }) = _GuardRulesData;

  factory GuardRulesData.fromJson(Map<String, dynamic> json) =>
      _$GuardRulesDataFromJson(json);
}

/// The potato fridge (the potato cellar on screen): potatoes taken out of
/// fields and training grounds. How many it holds comes from the cellar
/// building's level.
@freezed
abstract class FridgeRulesData with _$FridgeRulesData {
  const factory FridgeRulesData({
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

    /// How much longer guards take on a pest for each level of its field's
    /// potatoes (their average), in thousandths over 1, compounding
    /// (2026-10-30, 사용자: like enemies by zone score).
    @Default(30) int levelPermille,
  }) = _PestRulesData;

  factory PestRulesData.fromJson(Map<String, dynamic> json) =>
      _$PestRulesDataFromJson(json);
}

/// Bugs eat the baby potatoes stored on a field (2026-10-26): they come
/// once [storedPerBug] are stored there, one more for each [storedPerBug]
/// more, and leave as the store shrinks; each bites on its own, so a field
/// left alone stops piling up where it makes as much as they eat.
@freezed
abstract class BugRulesData with _$BugRulesData {
  const factory BugRulesData({
    /// Baby potatoes stored in a field for each bug on it.
    required int storedPerBug,

    /// Game time after bugs are cleared before they can come back to that
    /// field.
    required int quietSeconds,

    /// Game time between two bites of one bug.
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

/// What a newly made farm starts with.
/// The house's seed pouch and equipment box, and seeds that do not fit.
/// Values are placeholders until the balance phase.
@freezed
abstract class StorageRulesData with _$StorageRulesData {
  const factory StorageRulesData({
    /// Seeds a new farm's pouch holds, one per slot.
    required int pouchSlots,

    /// Slots one widening adds, its price, and the most the pouch holds
    /// (until house sizes are worked out).
    required int pouchStep,
    required int pouchStepFood,
    required int pouchMax,

    /// What each widening adds to the price of the next (2026-11-01,
    /// 사용자: 50 more every time). The same for both.
    @Default(50) int stepFoodRise,

    /// The same for the equipment box.
    required int gearSlots,
    required int gearStep,
    required int gearStepFood,
    required int gearMax,

    /// How long a seed that did not fit waits before it turns into baby
    /// potatoes.
    required int overflowSeconds,

    /// Baby potatoes a seed turns into, by grade.
    required Map<Grade, int> seedFood,

    /// Slots in the truck bed, the same for everyone and never widened
    /// (`multiplayer.md`, 2026-10-28).
    @Default(8) int bedSlots,

    /// Slots a warehouse adds to the seed pouch and the equipment box, past
    /// their widened sizes (2026-11-03, 사용자).
    @Default(20) int warehousePouch,
    @Default(10) int warehouseGear,
  }) = _StorageRulesData;

  const StorageRulesData._();

  factory StorageRulesData.fromJson(Map<String, dynamic> json) =>
      _$StorageRulesDataFromJson(json);

  /// Baby potatoes widening the pouch from [slots] costs.
  int pouchWidenFood(int slots) =>
      _widenFood(pouchStepFood, slots - pouchSlots, pouchStep);

  /// Baby potatoes widening the equipment box from [slots] costs.
  int gearWidenFood(int slots) =>
      _widenFood(gearStepFood, slots - gearSlots, gearStep);

  int _widenFood(int first, int added, int step) {
    final done = step <= 0 ? 0 : math.max(0, (added + step - 1) ~/ step);
    return first + stepFoodRise * done;
  }
}

/// Strengthening the weapon at the house's workbench. Values are
/// placeholders until the balance phase.
@freezed
abstract class WorkbenchRulesData with _$WorkbenchRulesData {
  const factory WorkbenchRulesData({
    required int maxLevel,

    /// Baby potatoes for the first level, and what each level adds.
    required int food,
    required int foodStep,

    /// The material item spent, how many for the first level, and what
    /// each level adds.
    required String material,
    required int materials,
    required int materialsStep,

    /// Chance the first level works, what each level takes off, and the
    /// lowest it gets.
    required double chance,
    required double chanceStep,
    required double minChance,

    /// Weapon damage each level adds, in percent.
    required double damagePercent,
  }) = _WorkbenchRulesData;

  const WorkbenchRulesData._();

  factory WorkbenchRulesData.fromJson(Map<String, dynamic> json) =>
      _$WorkbenchRulesDataFromJson(json);

  /// What going from [level] to the next costs, and its chance.
  ({int food, int materials, double chance}) nextFrom(int level) => (
    food: food + level * foodStep,
    materials: materials + level * materialsStep,
    chance: chance - level * chanceStep < minChance
        ? minChance
        : chance - level * chanceStep,
  );
}

/// What gear found in a run grows from (2026-10-30, 사용자). "Owned" is
/// every piece the member could wear now, not broken and within their
/// progress: in the farm's storage, in the bag and worn.
@JsonEnum(fieldRename: FieldRename.snake)
enum LootLevelMode {
  /// A: what the party wears of the found kind.
  worn,

  /// B: the average of the best owned piece of each kind, for every kind.
  ownedAverage,

  /// C: the best owned piece of the found kind.
  ownedBest,
}

/// Equipment. Values are placeholders until the balance phase.
@freezed
abstract class GearRulesData with _$GearRulesData {
  const factory GearRulesData({
    /// Bare hands: the weapon used with none, the bag slots, and belt slots
    /// that take any potato.
    required String bareWeapon,
    required int bareBagSlots,
    required int bareBeltSlots,

    /// Weapons: damage share by grade, and how much each level multiplies
    /// it by, in thousandths over 1 (compounding, see [levelGrowth]). The
    /// workbench adds `workbench.damage_percent` a level.
    required Map<Grade, double> gradeDamage,
    required int levelDamagePermille,

    /// Bags: slots by grade, and slots each workbench level adds.
    required Map<Grade, int> bagSlots,
    required int bagEnhanceSlots,

    /// Belts: slots by grade, and how much stronger a potato in a slot
    /// gets at its job, in percent by grade, per ten levels, and per
    /// workbench level.
    required Map<Grade, int> beltSlots,
    required Map<Grade, double> beltPercent,
    required double beltPercentPerTenLevels,
    required double beltEnhancePercent,

    /// The wearer's max health a bag adds per ten levels, in percent
    /// (2026-10-30, 사용자: a little health as bags level up).
    @Default(0) double bagHpPercentPerTenLevels,

    /// Materials a piece breaks down into by grade, plus this share of what
    /// its workbench levels took.
    required Map<Grade, int> disassemble,
    required int enhanceRefundPercent,

    /// Wear a piece takes before it breaks, how much a minute of a run adds
    /// to each worn piece, and the most one run adds (2026-10-30, 사용자:
    /// by time spent, with a cap).
    @Default(100) int durability,
    @Default(2) double wearPerMinute,
    @Default(20) int wearPerRunMax,

    /// A broken weapon's damage, as a share of a plain level 1 weapon of its
    /// family (2026-10-30, 사용자: a quarter, still above bare hands).
    @Default(0.25) double brokenDamage,

    /// Chance each worn piece is lost when a danger run fails.
    required double lossChance,

    /// Gear can be worn up to the farm's progress plus this.
    required int useMargin,

    /// How the level of gear found in a run is set (2026-10-30, 사용자:
    /// kept apart to try each). → `LootLevels`
    @Default(LootLevelMode.worn) LootLevelMode lootLevelMode,

    /// What a new farm wears.
    required Equipped start,

    /// Abilities found gear rolls, by grade (2026-11-01, 사용자).
    @Default({Grade.normal: 0, Grade.rare: 1, Grade.legendary: 2})
    Map<Grade, int> abilitySlots,

    /// How heavily each tier's rarity weighs when rolling.
    @Default({Rarity.normal: 100, Rarity.low: 30, Rarity.veryLow: 5})
    Map<Rarity, int> abilityRarityWeights,

    /// Every gear ability. All the tiers of all that fit a piece go in one
    /// pool weighed by rarity (사용자); an ability comes once a piece.
    @Default(<GearAbilityData>[]) List<GearAbilityData> abilities,
  }) = _GearRulesData;

  const GearRulesData._();

  factory GearRulesData.fromJson(Map<String, dynamic> json) =>
      _$GearRulesDataFromJson(json);

  GearAbilityData? ability(String id) {
    for (final data in abilities) {
      if (data.id == id) return data;
    }
    return null;
  }
}

/// A gear ability: what it changes, which pieces can have it, and its
/// tiers from the most common.
@freezed
abstract class GearAbilityData with _$GearAbilityData {
  const factory GearAbilityData({
    required String id,
    required GearStat stat,

    /// Kinds of gear it goes on; empty is every kind.
    @Default(<GearKind>[]) List<GearKind> kinds,

    /// Weapon families it goes on; empty is every family.
    @Default(<String>[]) List<String> families,
    required List<GearAbilityTierData> tiers,
  }) = _GearAbilityData;

  const GearAbilityData._();

  factory GearAbilityData.fromJson(Map<String, dynamic> json) =>
      _$GearAbilityDataFromJson(json);

  /// Whether a piece of [kind] (and weapon [family]) can have it.
  bool fits(GearKind kind, String family) =>
      (kinds.isEmpty || kinds.contains(kind)) &&
      (families.isEmpty || families.contains(family));
}

@freezed
abstract class GearAbilityTierData with _$GearAbilityTierData {
  const factory GearAbilityTierData({
    required Rarity rarity,
    required double percent,
  }) = _GearAbilityTierData;

  factory GearAbilityTierData.fromJson(Map<String, dynamic> json) =>
      _$GearAbilityTierDataFromJson(json);
}

/// One number for how strong a party is, against what a zone's score
/// calls for. Weights are placeholders until the balance phase.
@freezed
abstract class CombatPowerRulesData with _$CombatPowerRulesData {
  const factory CombatPowerRulesData({
    /// Points per point of weapon damage per second.
    required double weaponDps,

    /// Points per point of a combat potato's health, and of its damage
    /// per second.
    required double potatoHp,
    required double potatoDps,

    /// Flat points for each food or buff potato along.
    required double helper,

    /// What a zone calls for: this plus so much a score point, multiplied
    /// by [recommendedGrowthPermille] a score point (compounding, so it
    /// keeps up with gear and enemies growing by level).
    required double recommendedBase,
    required double recommendedPerScore,
    @Default(0) int recommendedGrowthPermille,

    /// Power over recommended at or above [easyRatio] is easy; at or above
    /// [fairRatio], fair; under it, risky.
    required double easyRatio,
    required double fairRatio,
  }) = _CombatPowerRulesData;

  factory CombatPowerRulesData.fromJson(Map<String, dynamic> json) =>
      _$CombatPowerRulesDataFromJson(json);
}

/// What a zone's score does besides the level of what it gives
/// (2026-10-29, user: higher zones are harder and give more and better
/// loot). All 0 leaves scores out of it.
@freezed
abstract class ZoneScalingRulesData with _$ZoneScalingRulesData {
  const factory ZoneScalingRulesData({
    /// Enemy health and damage each score point multiplies by, in
    /// thousandths over 1 (compounding, see [levelGrowth]).
    @Default(0) int enemyHpPermille,
    @Default(0) int enemyDamagePermille,

    /// What each score point adds to the amount of plain loot (baby
    /// potatoes, materials), in thousandths.
    @Default(0) int lootAmountPermille,

    /// What each score point adds to the weight of rare and legendary
    /// seeds and gear in loot tables, in thousandths.
    @Default(0) int rareWeightPermille,
    @Default(0) int legendaryWeightPermille,
  }) = _ZoneScalingRulesData;

  const ZoneScalingRulesData._();

  factory ZoneScalingRulesData.fromJson(Map<String, dynamic> json) =>
      _$ZoneScalingRulesDataFromJson(json);

  double enemyHp(int score) => levelGrowth(enemyHpPermille, score);

  double enemyDamage(int score) => levelGrowth(enemyDamagePermille, score);

  double lootAmount(int score) => 1 + score * lootAmountPermille / 1000;

  /// How much heavier an entry of [grade] weighs at [score].
  double gradeWeight(Grade grade, int score) => switch (grade) {
    Grade.normal => 1,
    Grade.rare => 1 + score * rareWeightPermille / 1000,
    Grade.legendary => 1 + score * legendaryWeightPermille / 1000,
  };
}

/// What [level] levels multiply a value by when each one multiplies it by
/// 1 + [permille] / 1000. Levels compound so ten levels count the same at
/// any height (2026-10-29: gear grows by level first, and ten workbench
/// levels come to about what the next zone's ten levels give).
double levelGrowth(int permille, int level) =>
    math.pow(1 + permille / 1000, level).toDouble();

/// Breeding potatoes making seeds in fields (2026-10-26, user; before, in
/// compost yards). Values are placeholders until the balance phase.
@freezed
abstract class BreedingRulesData with _$BreedingRulesData {
  const factory BreedingRulesData({
    /// Working time between two seeds from one grown breeding potato at
    /// base speed (see `FarmStat.seedSpeed`).
    required int seedEverySeconds,

    /// Seeds one breeding potato holds before it stops making more; null for
    /// no limit (2026-10-26).
    int? storeMax,

    /// How often each type comes up.
    required Map<PotatoType, int> typeWeights,
  }) = _BreedingRulesData;

  factory BreedingRulesData.fromJson(Map<String, dynamic> json) =>
      _$BreedingRulesDataFromJson(json);
}

/// How many totems can stand on the farm. Values are placeholders.
@freezed
abstract class TotemRulesData with _$TotemRulesData {
  const factory TotemRulesData({
    /// Totems a farm may put up without giant totems.
    required int startLimit,
  }) = _TotemRulesData;

  factory TotemRulesData.fromJson(Map<String, dynamic> json) =>
      _$TotemRulesDataFromJson(json);
}

/// The mailbox. Values are placeholders until the balance phase.
@freezed
abstract class MailRulesData with _$MailRulesData {
  const factory MailRulesData({
    /// Letters kept; the oldest go first.
    required int keep,

    /// Level of the seed a letter brings when a building goes up.
    required int buildingSeedLevel,
  }) = _MailRulesData;

  factory MailRulesData.fromJson(Map<String, dynamic> json) =>
      _$MailRulesDataFromJson(json);
}

/// A building a new farm starts with, by its `buildings.json` id.
@freezed
abstract class StartBuildingData with _$StartBuildingData {
  const factory StartBuildingData({
    required String kind,
    required TilePos origin,
  }) = _StartBuildingData;

  factory StartBuildingData.fromJson(Map<String, dynamic> json) =>
      _$StartBuildingDataFromJson(json);
}

@freezed
abstract class NewFarmData with _$NewFarmData {
  const factory NewFarmData({
    /// Baby potatoes.
    required int food,
    required List<TileRect> fields,

    /// Buildings a new farm starts with, such as the house.
    @Default(<StartBuildingData>[]) List<StartBuildingData> buildings,
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

/// What the seed lab charges to turn a seed into another type, and how
/// likely the seed keeps its grade (2026-10-31, 사용자). Costs go up a step
/// every [bandLevels] levels: 1-9 is the first band, 90-99 the tenth.
@freezed
abstract class GearLabRulesData with _$GearLabRulesData {
  /// The gear lab (2026-11-03, 사용자): rolling a piece's abilities anew and
  /// mending it. Costs go by level band and grade, as the seed lab's do
  /// ([SeedLabRulesData.band], [SeedLabRulesData.gradeTimes]). A mend may
  /// fail and break the piece into materials, more likely the better its
  /// grade however worn it is (사용자: or mending early keeps it for ever).
  const factory GearLabRulesData({
    /// Baby potatoes one roll of a normal piece costs, per band.
    @Default(10) int rerollBandFood,

    /// Baby potatoes one mend of a normal piece costs, per band.
    @Default(10) int repairBandFood,

    /// Materials one mend costs, by grade.
    @Default({Grade.normal: 1, Grade.rare: 2, Grade.legendary: 3})
    Map<Grade, int> repairMaterials,

    /// The chance a mend holds, by grade; otherwise the piece breaks up.
    @Default({Grade.normal: 0.95, Grade.rare: 0.85, Grade.legendary: 0.7})
    Map<Grade, double> repairChance,
  }) = _GearLabRulesData;

  factory GearLabRulesData.fromJson(Map<String, dynamic> json) =>
      _$GearLabRulesDataFromJson(json);
}

/// One region's dish at the house table (2026-11-03, 사용자): open once its
/// [zone]'s boss was killed and the player escaped.
@freezed
abstract class MealData with _$MealData {
  const factory MealData({
    required String id,

    /// The zone whose boss, felled and got out of, opens it; none for a
    /// dish open from the start (2026-11-04, 사용자: steamed potatoes).
    String? zone,
    @LocalizedTextConverter() required LocalizedText name,

    /// What it does, by [DishEffectData.id] (2026-11-04, 사용자: each dish
    /// its own).
    @Default(<String>[]) List<String> effects,
  }) = _MealData;

  factory MealData.fromJson(Map<String, dynamic> json) =>
      _$MealDataFromJson(json);
}

/// Who a dish's effect reaches on a run: the one who ate it, their own
/// potatoes, or both.
@JsonEnum(fieldRename: FieldRename.snake)
enum DishTarget {
  user,
  potatoes,
  both;

  bool get reachesUser => this != potatoes;
  bool get reachesPotatoes => this != user;
}

/// One thing a dish does on runs (2026-11-04, 사용자): a run stat
/// (`RaidStat`) raised or lowered as potato abilities do. The same stat
/// from two dishes adds up, like abilities.
@freezed
abstract class DishEffectData with _$DishEffectData {
  const factory DishEffectData({
    required String id,
    required DishTarget target,
    required String stat,
    @Default(EffectOp.mul) EffectOp op,
    required double value,

    /// What it changes, without the amount (the screen adds it).
    @LocalizedTextConverter() required LocalizedText name,
  }) = _DishEffectData;

  const DishEffectData._();

  factory DishEffectData.fromJson(Map<String, dynamic> json) =>
      _$DishEffectDataFromJson(json);

  /// As an ability effect, to sum with [StatSum].
  AbilityEffectData get asAbility => AbilityEffectData(
    context: EffectContext.explore,
    target: EffectTarget.self,
    kind: EffectKind.stat,
    stat: stat,
    op: op,
    value: value,
  );
}

/// What eating does on runs for [seconds], each dish its [DishEffectData]s
/// (2026-11-04, 사용자). Up to [maxMeals] last at once, the same dish twice
/// too, each adding its own; none renews, and a run set out on with them
/// keeps them to the end *(제안)*.
@freezed
abstract class MealRulesData with _$MealRulesData {
  const factory MealRulesData({
    @Default(3600) int seconds,

    /// Dishes that may last at once (2026-11-04, 사용자: two).
    @Default(2) int maxMeals,
    @Default(<DishEffectData>[]) List<DishEffectData> effects,
    @Default(<MealData>[]) List<MealData> dishes,
  }) = _MealRulesData;

  const MealRulesData._();

  /// The effects of [dishes] (ids, eaten ones: a dish twice counts twice)
  /// that reach the user, and those that reach their potatoes.
  ({StatSums user, StatSums potatoes}) sumsOf(Iterable<String> dishes) {
    final user = <String, StatSum>{};
    final potatoes = <String, StatSum>{};
    for (final id in dishes) {
      final dish = this.dishes.where((d) => d.id == id).firstOrNull;
      for (final effectId in dish?.effects ?? const <String>[]) {
        final effect = effects.where((e) => e.id == effectId).firstOrNull;
        if (effect == null) continue;
        if (effect.target.reachesUser) {
          user
              .putIfAbsent(effect.stat, StatSum.new)
              .addEffect(effect.asAbility, 1);
        }
        if (effect.target.reachesPotatoes) {
          potatoes
              .putIfAbsent(effect.stat, StatSum.new)
              .addEffect(effect.asAbility, 1);
        }
      }
    }
    return (user: user, potatoes: potatoes);
  }

  factory MealRulesData.fromJson(Map<String, dynamic> json) =>
      _$MealRulesDataFromJson(json);
}

@freezed
abstract class SeedLabRulesData with _$SeedLabRulesData {
  const factory SeedLabRulesData({
    /// Levels in each cost band.
    @Default(10) int bandLevels,

    /// Baby potatoes a random turn of a normal seed costs, per band.
    @Default(10) int bandFood,

    /// What a seed of each grade multiplies the turn's cost by.
    @Default({Grade.normal: 1, Grade.rare: 2, Grade.legendary: 3})
    Map<Grade, int> gradeTimes,

    /// Baby potatoes one roll of a normal seed's abilities costs, per band
    /// (2026-11-01, 사용자: by level and grade, raised from 5 the same day);
    /// times [gradeTimes].
    @Default(10) int rerollBandFood,

    /// What naming the new type multiplies the turn's cost by (사용자: the
    /// pick costs as much again).
    @Default(2) int pickTimes,

    /// The chance of keeping the grade with nothing paid, in percent. A
    /// seed that loses it drops one grade.
    @Default({Grade.normal: 100, Grade.rare: 70, Grade.legendary: 50})
    Map<Grade, int> keepPercent,

    /// Percent each paid keep step adds, up to 100.
    @Default(10) int keepStepPercent,

    /// Baby potatoes one keep step costs before its multiplier, per band.
    @Default({Grade.rare: 10, Grade.legendary: 20}) Map<Grade, int> keepFood,

    /// The multiplier of each keep step in turn, so the last steps cost
    /// more (사용자: the sure keep is the dear one). Their number is the
    /// steps there are.
    @Default({
      Grade.rare: [1, 2, 5],
      Grade.legendary: [1, 1, 2, 3, 5],
    })
    Map<Grade, List<int>> keepStepTimes,
  }) = _SeedLabRulesData;

  const SeedLabRulesData._();

  factory SeedLabRulesData.fromJson(Map<String, dynamic> json) =>
      _$SeedLabRulesDataFromJson(json);

  /// The cost band of a seed of [level], 1 for levels 0-9.
  int band(int level) => level ~/ bandLevels + 1;

  /// Baby potatoes turning a seed of [grade] and [level] costs, more when
  /// the new type is [picked].
  int turnFood(Grade grade, int level, {required bool picked}) =>
      bandFood *
      band(level) *
      (gradeTimes[grade] ?? 1) *
      (picked ? pickTimes : 1);

  /// Baby potatoes rolling the abilities of a seed of [grade] and [level]
  /// costs.
  int rerollFood(Grade grade, int level) =>
      rerollBandFood * band(level) * (gradeTimes[grade] ?? 1);

  /// Keep steps a seed of [grade] may pay for.
  int keepSteps(Grade grade) => keepStepTimes[grade]?.length ?? 0;

  /// Baby potatoes the first [steps] keep steps cost for a seed of [grade]
  /// and [level].
  int keepStepsFood(Grade grade, int level, int steps) {
    final times = keepStepTimes[grade] ?? const <int>[];
    var total = 0;
    for (var i = 0; i < steps && i < times.length; i++) {
      total += times[i];
    }
    return total * (keepFood[grade] ?? 0) * band(level);
  }

  /// The chance of keeping [grade] with [steps] paid, in percent.
  int keepChance(Grade grade, int steps) =>
      math.min(100, (keepPercent[grade] ?? 100) + steps * keepStepPercent);
}
