import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';

part 'gear.freezed.dart';
part 'gear.g.dart';

/// The three equipment slots.
@JsonEnum(fieldRename: FieldRename.snake)
enum GearKind {
  /// How the player fights.
  weapon,

  /// How much the player carries.
  bag,

  /// Which potatoes come along, and how much stronger they are.
  belt,
}

/// What a gear ability changes (2026-11-01, 사용자: gear abilities, like
/// potatoes'). Values are percent; negative ones lower the stat.
@JsonEnum(fieldRename: FieldRename.snake)
enum GearStat {
  /// The wearer's max health.
  hp,

  /// Max health of the wearer's companions.
  companionHp,

  /// Baby potatoes the wearer eats in a run, as it goes and to heal.
  foodUse,

  /// The weapon's damage.
  damage,

  /// The weapon's range.
  range,

  /// How wide the weapon's shots spread.
  spread,

  /// How fast the weapon fires (shots per second).
  fireRate,

  /// Percent points added to the belt's boost.
  beltBonus,
}

/// An ability on a piece of gear: catalog ability [id] at [tier] (0 is the
/// most common). The value is looked up, so balance changes reach found
/// gear too.
@freezed
abstract class GearAbility with _$GearAbility {
  const factory GearAbility({required String id, required int tier}) =
      _GearAbility;

  factory GearAbility.fromJson(Map<String, dynamic> json) =>
      _$GearAbilityFromJson(json);
}

/// One piece of equipment. Found in runs with a level from the party's
/// (`LootLevels`); the workbench raises [enhance]. Runs wear it out: once
/// [wear] reaches `GearRulesData.durability` it is broken for good and only
/// good for breaking up (2026-10-30, 사용자).
@freezed
abstract class Gear with _$Gear {
  const factory Gear({
    required GearKind kind,

    /// Weapons: the weapon's catalog id, which sets how it shoots.
    @Default('') String family,
    required Grade grade,
    required int level,
    @Default(0) int enhance,

    /// How worn it is; 0 is as new, so pieces saved before wear are too.
    @Default(0) int wear,

    /// Belts: the potato type each slot takes.
    @Default(<PotatoType>[]) List<PotatoType> slots,

    /// Abilities rolled when found: none for normal, one for rare, two for
    /// legendary (2026-11-01, 사용자). Gear found before has none.
    @Default(<GearAbility>[]) List<GearAbility> abilities,
  }) = _Gear;

  factory Gear.fromJson(Map<String, dynamic> json) => _$GearFromJson(json);
}

/// What is worn: null slots are bare hands.
@freezed
abstract class Equipped with _$Equipped {
  const factory Equipped({Gear? weapon, Gear? bag, Gear? belt}) = _Equipped;

  const Equipped._();

  factory Equipped.fromJson(Map<String, dynamic> json) =>
      _$EquippedFromJson(json);

  Gear? of(GearKind kind) => switch (kind) {
    GearKind.weapon => weapon,
    GearKind.bag => bag,
    GearKind.belt => belt,
  };

  /// This with [kind]'s slot set to [gear].
  Equipped wearing(GearKind kind, Gear? gear) => switch (kind) {
    GearKind.weapon => copyWith(weapon: gear),
    GearKind.bag => copyWith(bag: gear),
    GearKind.belt => copyWith(belt: gear),
  };

  Iterable<Gear> get all => [?weapon, ?bag, ?belt];
}
