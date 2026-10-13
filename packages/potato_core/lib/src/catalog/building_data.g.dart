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
      );
      return val;
    });

Map<String, dynamic> _$BuildingLevelDataToJson(_BuildingLevelData instance) =>
    <String, dynamic>{'cost': instance.cost, 'capacity': instance.capacity};
