// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuildingData _$BuildingDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuildingData', json, ($checkedConvert) {
      final val = _BuildingData(
        id: $checkedConvert('id', (v) => v as String),
        width: $checkedConvert('width', (v) => (v as num).toInt()),
        height: $checkedConvert('height', (v) => (v as num).toInt()),
        houses: $checkedConvert(
          'houses',
          (v) => $enumDecodeNullable(_$PotatoTypeEnumMap, v),
        ),
        buildable: $checkedConvert('buildable', (v) => v as bool? ?? true),
        removable: $checkedConvert('removable', (v) => v as bool? ?? true),
        single: $checkedConvert('single', (v) => v as bool? ?? false),
        totem: $checkedConvert(
          'totem',
          (v) =>
              v == null ? null : TotemData.fromJson(v as Map<String, dynamic>),
        ),
        levels: $checkedConvert(
          'levels',
          (v) => (v as List<dynamic>)
              .map((e) => BuildingLevelData.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BuildingDataToJson(_BuildingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'houses': _$PotatoTypeEnumMap[instance.houses],
      'buildable': instance.buildable,
      'removable': instance.removable,
      'single': instance.single,
      'totem': instance.totem?.toJson(),
      'levels': instance.levels.map((e) => e.toJson()).toList(),
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

_BuildingLevelData _$BuildingLevelDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuildingLevelData', json, ($checkedConvert) {
      final val = _BuildingLevelData(
        cost: $checkedConvert('cost', (v) => (v as num).toInt()),
        capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt() ?? 0),
        graves: $checkedConvert('graves', (v) => (v as num?)?.toInt() ?? 0),
        stores: $checkedConvert('stores', (v) => (v as num?)?.toInt() ?? 0),
      );
      return val;
    });

Map<String, dynamic> _$BuildingLevelDataToJson(_BuildingLevelData instance) =>
    <String, dynamic>{
      'cost': instance.cost,
      'capacity': instance.capacity,
      'graves': instance.graves,
      'stores': instance.stores,
    };

_TotemData _$TotemDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TotemData', json, ($checkedConvert) {
      final val = _TotemData(
        stats: $checkedConvert(
          'stats',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        percent: $checkedConvert('percent', (v) => (v as num).toDouble()),
        seconds: $checkedConvert('seconds', (v) => (v as num).toInt()),
        cooldownSeconds: $checkedConvert(
          'cooldown_seconds',
          (v) => (v as num).toInt(),
        ),
        food: $checkedConvert('food', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'cooldownSeconds': 'cooldown_seconds'});

Map<String, dynamic> _$TotemDataToJson(_TotemData instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'percent': instance.percent,
      'seconds': instance.seconds,
      'cooldown_seconds': instance.cooldownSeconds,
      'food': instance.food,
    };
