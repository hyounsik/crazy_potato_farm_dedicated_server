// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RulesData _$RulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RulesData', json, ($checkedConvert) {
      final val = _RulesData(
        farm: $checkedConvert(
          'farm',
          (v) => FarmRulesData.fromJson(v as Map<String, dynamic>),
        ),
        potatoes: $checkedConvert(
          'potatoes',
          (v) => PotatoRulesData.fromJson(v as Map<String, dynamic>),
        ),
        newFarm: $checkedConvert(
          'new_farm',
          (v) => NewFarmData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'newFarm': 'new_farm'});

Map<String, dynamic> _$RulesDataToJson(_RulesData instance) =>
    <String, dynamic>{
      'farm': instance.farm.toJson(),
      'potatoes': instance.potatoes.toJson(),
      'new_farm': instance.newFarm.toJson(),
    };

_FarmRulesData _$FarmRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_FarmRulesData',
      json,
      ($checkedConvert) {
        final val = _FarmRulesData(
          stepMillis: $checkedConvert('step_millis', (v) => (v as num).toInt()),
          offlineCapMinutes: $checkedConvert(
            'offline_cap_minutes',
            (v) => (v as num).toInt(),
          ),
          size: $checkedConvert('size', (v) => (v as num).toInt()),
          fieldMaxSize: $checkedConvert(
            'field_max_size',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stepMillis': 'step_millis',
        'offlineCapMinutes': 'offline_cap_minutes',
        'fieldMaxSize': 'field_max_size',
      },
    );

Map<String, dynamic> _$FarmRulesDataToJson(_FarmRulesData instance) =>
    <String, dynamic>{
      'step_millis': instance.stepMillis,
      'offline_cap_minutes': instance.offlineCapMinutes,
      'size': instance.size,
      'field_max_size': instance.fieldMaxSize,
    };

_PotatoRulesData _$PotatoRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PotatoRulesData', json, ($checkedConvert) {
      final val = _PotatoRulesData(
        gradeDropChance: $checkedConvert(
          'grade_drop_chance',
          (v) => (v as num).toDouble(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'gradeDropChance': 'grade_drop_chance'});

Map<String, dynamic> _$PotatoRulesDataToJson(_PotatoRulesData instance) =>
    <String, dynamic>{'grade_drop_chance': instance.gradeDropChance};

_NewFarmData _$NewFarmDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NewFarmData', json, ($checkedConvert) {
      final val = _NewFarmData(
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        fields: $checkedConvert(
          'fields',
          (v) => (v as List<dynamic>)
              .map((e) => TileRect.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        seeds: $checkedConvert(
          'seeds',
          (v) => (v as List<dynamic>)
              .map((e) => SeedStackData.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NewFarmDataToJson(_NewFarmData instance) =>
    <String, dynamic>{
      'food': instance.food,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
    };

_SeedStackData _$SeedStackDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SeedStackData', json, ($checkedConvert) {
      final val = _SeedStackData(
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$PotatoTypeEnumMap, v),
        ),
        grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
        count: $checkedConvert('count', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SeedStackDataToJson(_SeedStackData instance) =>
    <String, dynamic>{
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grade': _$GradeEnumMap[instance.grade]!,
      'count': instance.count,
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};
