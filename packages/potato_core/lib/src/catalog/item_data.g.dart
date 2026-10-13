// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemData _$ItemDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ItemData', json, ($checkedConvert) {
      final val = _ItemData(
        id: $checkedConvert('id', (v) => v as String),
        kind: $checkedConvert('kind', (v) => $enumDecode(_$ItemKindEnumMap, v)),
        stack: $checkedConvert('stack', (v) => (v as num).toInt()),
        seed: $checkedConvert(
          'seed',
          (v) => v == null ? null : Seed.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ItemDataToJson(_ItemData instance) => <String, dynamic>{
  'id': instance.id,
  'kind': _$ItemKindEnumMap[instance.kind]!,
  'stack': instance.stack,
  'seed': instance.seed?.toJson(),
};

const _$ItemKindEnumMap = {
  ItemKind.food: 'food',
  ItemKind.seed: 'seed',
  ItemKind.material: 'material',
};

_LootTableData _$LootTableDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LootTableData', json, ($checkedConvert) {
      final val = _LootTableData(
        id: $checkedConvert('id', (v) => v as String),
        rollsMin: $checkedConvert('rolls_min', (v) => (v as num).toInt()),
        rollsMax: $checkedConvert('rolls_max', (v) => (v as num).toInt()),
        entries: $checkedConvert(
          'entries',
          (v) => (v as List<dynamic>)
              .map((e) => LootEntryData.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'rollsMin': 'rolls_min', 'rollsMax': 'rolls_max'});

Map<String, dynamic> _$LootTableDataToJson(_LootTableData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rolls_min': instance.rollsMin,
      'rolls_max': instance.rollsMax,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

_LootEntryData _$LootEntryDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LootEntryData', json, ($checkedConvert) {
      final val = _LootEntryData(
        item: $checkedConvert('item', (v) => v as String),
        weight: $checkedConvert('weight', (v) => (v as num).toInt()),
        min: $checkedConvert('min', (v) => (v as num).toInt()),
        max: $checkedConvert('max', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$LootEntryDataToJson(_LootEntryData instance) =>
    <String, dynamic>{
      'item': instance.item,
      'weight': instance.weight,
      'min': instance.min,
      'max': instance.max,
    };
