import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';

part 'ability_data.freezed.dart';
part 'ability_data.g.dart';

/// How often an ability turns up, hidden from players.
@JsonEnum(fieldRename: FieldRename.snake)
enum Rarity { normal, low, veryLow }

@JsonEnum(fieldRename: FieldRename.snake)
enum EffectContext {
  /// On the farm and while exploring.
  always,
  farm,
  explore,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum EffectTarget {
  /// The potato itself.
  self,

  /// Every potato in the same field, and the field itself.
  field,

  /// The whole party while exploring.
  party,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum EffectKind { stat, periodic }

@JsonEnum(fieldRename: FieldRename.snake)
enum EffectOp {
  /// Multiplies: 1.1 is +10%. Every potato's percentages add up before they
  /// multiply the base once.
  mul,

  /// Adds to the value.
  add,
}

/// Stats the farm rules read from abilities. Others in the data (combat,
/// exploration) are kept for later and ignored on the farm.
abstract final class FarmStat {
  static const String lifespan = 'potato.lifespan';
  static const String agingRate = 'potato.aging_rate';
  static const String upkeep = 'potato.upkeep';
  static const String growthSpeed = 'potato.growth_speed';
  static const String foodYield = 'food.yield';
  static const String gradeUpChance = 'breeding.grade_up_chance';
  static const String blightChance = 'field.blight_chance';
  static const String harvestRareChance = 'field.harvest_rare_chance';
  static const String deathSeedGradeUpChance =
      'potato.death_seed_grade_up_chance';
  static const String bugClearSpeed = 'combat.pest_clear_speed';
  static const String blightClearSpeed = 'combat.disease_clear_speed';

  /// Baby potatoes harvested by hand or by a guard, on top of what was
  /// stored (the harvest totem).
  static const String harvestBonus = 'farm.harvest_bonus';
}

/// Periodic actions on the farm. Rules run [harvestFood]; [say] is for
/// screens only.
abstract final class FarmAction {
  /// Shows a speech bubble with the effect's text.
  static const String say = 'say';

  /// Takes baby potatoes stored in a field into the farm.
  static const String harvestFood = 'harvest_food';
}

/// One ability (`potato_abilities.json`). Player-facing text lives in the
/// same file but only the client reads it.
@freezed
abstract class AbilityData with _$AbilityData {
  const factory AbilityData({
    /// `<pool>.<name>`.
    required String id,
    required String pool,
    required List<AbilityEffectData> effects,
    required Rarity rarity,

    /// Replaces the rarity's weight when set. Whole numbers only.
    int? weight,
  }) = _AbilityData;

  factory AbilityData.fromJson(Map<String, dynamic> json) =>
      _$AbilityDataFromJson(json);
}

/// What an ability does: where, to whom, and what.
@freezed
abstract class AbilityEffectData with _$AbilityEffectData {
  const factory AbilityEffectData({
    required EffectContext context,
    required EffectTarget target,
    required EffectKind kind,

    /// For [EffectKind.stat].
    String? stat,
    EffectOp? op,

    /// Null until the balance phase sets it; [tempValue] stands in meanwhile.
    double? value,
    double? tempValue,

    /// For [EffectKind.periodic]: every so many seconds, run [action].
    /// Null until the balance phase; [tempIntervalSec] stands in.
    int? intervalSec,
    int? tempIntervalSec,
    String? action,

    /// The line a `say` action shows. Screens only; no rule reads it.
    String? text,
  }) = _AbilityEffectData;

  const AbilityEffectData._();

  factory AbilityEffectData.fromJson(Map<String, dynamic> json) =>
      _$AbilityEffectDataFromJson(json);

  /// The value in use: the set one, or the stand-in, or null for none.
  double? get valueInUse => value ?? tempValue;

  int? get intervalInUse => intervalSec ?? tempIntervalSec;

  bool get onFarm => context != EffectContext.explore;
}

/// A group abilities are drawn from: one shared by every type, and one per
/// type (its id is the type's name).
@freezed
abstract class AbilityPoolData with _$AbilityPoolData {
  const factory AbilityPoolData({
    required String id,
    required List<PotatoType> potatoTypes,
  }) = _AbilityPoolData;

  factory AbilityPoolData.fromJson(Map<String, dynamic> json) =>
      _$AbilityPoolDataFromJson(json);
}

/// How abilities are handed out.
@freezed
abstract class AbilityRulesData with _$AbilityRulesData {
  const factory AbilityRulesData({
    /// Ability slots by grade; the first is the seed's own.
    required Map<Grade, int> slotsByGrade,

    /// For slots after the first: odds of drawing from the shared pool
    /// against the type's own.
    required ExtraSlotPoolWeightData extraSlotPoolWeight,
    required Map<Rarity, int> rarityWeights,
  }) = _AbilityRulesData;

  factory AbilityRulesData.fromJson(Map<String, dynamic> json) =>
      _$AbilityRulesDataFromJson(json);
}

@freezed
abstract class ExtraSlotPoolWeightData with _$ExtraSlotPoolWeightData {
  const factory ExtraSlotPoolWeightData({
    required int common,
    required int unique,
  }) = _ExtraSlotPoolWeightData;

  factory ExtraSlotPoolWeightData.fromJson(Map<String, dynamic> json) =>
      _$ExtraSlotPoolWeightDataFromJson(json);
}
