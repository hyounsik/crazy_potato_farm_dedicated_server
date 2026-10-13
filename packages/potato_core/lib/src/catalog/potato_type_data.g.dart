// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'potato_type_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PotatoTypeData _$PotatoTypeDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PotatoTypeData',
  json,
  ($checkedConvert) {
    final val = _PotatoTypeData(
      type: $checkedConvert('type', (v) => $enumDecode(_$PotatoTypeEnumMap, v)),
      growSeconds: $checkedConvert('grow_seconds', (v) => (v as num).toInt()),
      lifespanSeconds: $checkedConvert(
        'lifespan_seconds',
        (v) => (v as num).toInt(),
      ),
      unlockBuilding: $checkedConvert('unlock_building', (v) => v as String?),
      production: $checkedConvert(
        'production',
        (v) => v == null
            ? null
            : ProductionData.fromJson(v as Map<String, dynamic>),
      ),
      upkeep: $checkedConvert('upkeep', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {
    'growSeconds': 'grow_seconds',
    'lifespanSeconds': 'lifespan_seconds',
    'unlockBuilding': 'unlock_building',
  },
);

Map<String, dynamic> _$PotatoTypeDataToJson(_PotatoTypeData instance) =>
    <String, dynamic>{
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grow_seconds': instance.growSeconds,
      'lifespan_seconds': instance.lifespanSeconds,
      'unlock_building': instance.unlockBuilding,
      'production': instance.production?.toJson(),
      'upkeep': instance.upkeep,
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

_ProductionData _$ProductionDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ProductionData',
  json,
  ($checkedConvert) {
    final val = _ProductionData(
      everySeconds: $checkedConvert('every_seconds', (v) => (v as num).toInt()),
      amount: $checkedConvert(
        'amount',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
        ),
      ),
      storeMax: $checkedConvert('store_max', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'everySeconds': 'every_seconds', 'storeMax': 'store_max'},
);

Map<String, dynamic> _$ProductionDataToJson(_ProductionData instance) =>
    <String, dynamic>{
      'every_seconds': instance.everySeconds,
      'amount': instance.amount.map((k, e) => MapEntry(_$GradeEnumMap[k]!, e)),
      'store_max': instance.storeMax,
    };

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};
