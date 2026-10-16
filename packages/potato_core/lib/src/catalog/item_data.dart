import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';

part 'item_data.freezed.dart';
part 'item_data.g.dart';

enum ItemKind {
  /// Baby potatoes: eaten while exploring, the farm's currency at home.
  food,

  /// A potato seed; goes to the seed pouch at home.
  seed,

  material,

  /// A piece of equipment; goes to the equipment box at home.
  gear,
}

/// One kind of item a bag can hold (`items.json`).
@freezed
abstract class ItemData with _$ItemData {
  const factory ItemData({
    required String id,
    required ItemKind kind,

    /// How many fit in one bag slot.
    required int stack,

    /// What kind of seed a seed item is; required for [ItemKind.seed] only.
    /// Each seed found gets its own level, ability and style.
    SeedKindData? seed,

    /// What kind of equipment a gear item is; required for [ItemKind.gear]
    /// only. Each piece found gets its own level (and belt slots).
    GearKindData? gear,
  }) = _ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);
}

/// A seed's type and grade, before the rest is rolled.
@freezed
abstract class SeedKindData with _$SeedKindData {
  const factory SeedKindData({required PotatoType type, required Grade grade}) =
      _SeedKindData;

  factory SeedKindData.fromJson(Map<String, dynamic> json) =>
      _$SeedKindDataFromJson(json);
}

/// A gear item's slot, weapon family and grade, before the rest is rolled.
@freezed
abstract class GearKindData with _$GearKindData {
  const factory GearKindData({
    required GearKind kind,
    @Default('') String family,
    required Grade grade,
  }) = _GearKindData;

  factory GearKindData.fromJson(Map<String, dynamic> json) =>
      _$GearKindDataFromJson(json);
}

/// What a gathering spot or a defeated enemy can give (`loot_tables.json`).
///
/// Rolls between [rollsMin] and [rollsMax] times; each roll picks one entry
/// by weight and an amount between its min and max.
@freezed
abstract class LootTableData with _$LootTableData {
  const factory LootTableData({
    required String id,
    required int rollsMin,
    required int rollsMax,
    required List<LootEntryData> entries,
  }) = _LootTableData;

  factory LootTableData.fromJson(Map<String, dynamic> json) =>
      _$LootTableDataFromJson(json);
}

@freezed
abstract class LootEntryData with _$LootEntryData {
  const factory LootEntryData({
    required String item,
    required int weight,
    required int min,
    required int max,
  }) = _LootEntryData;

  factory LootEntryData.fromJson(Map<String, dynamic> json) =>
      _$LootEntryDataFromJson(json);
}
