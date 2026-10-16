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

/// One piece of equipment. Found in runs with the zone's score as its
/// level; the workbench raises [enhance]. It never wears out.
@freezed
abstract class Gear with _$Gear {
  const factory Gear({
    required GearKind kind,

    /// Weapons: the weapon's catalog id, which sets how it shoots.
    @Default('') String family,
    required Grade grade,
    required int level,
    @Default(0) int enhance,

    /// Belts: the potato type each slot takes.
    @Default(<PotatoType>[]) List<PotatoType> slots,
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
