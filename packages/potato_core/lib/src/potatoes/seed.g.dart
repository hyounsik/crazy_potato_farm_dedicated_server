// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Seed _$SeedFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Seed',
  json,
  ($checkedConvert) {
    final val = _Seed(
      type: $checkedConvert('type', (v) => $enumDecode(_$PotatoTypeEnumMap, v)),
      grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
      level: $checkedConvert('level', (v) => (v as num).toInt()),
      ability: $checkedConvert('ability', (v) => v as String),
      style: $checkedConvert(
        'style',
        (v) => $enumDecodeNullable(_$CombatStyleEnumMap, v),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$SeedToJson(_Seed instance) => <String, dynamic>{
  'type': _$PotatoTypeEnumMap[instance.type]!,
  'grade': _$GradeEnumMap[instance.grade]!,
  'level': instance.level,
  'ability': instance.ability,
  'style': _$CombatStyleEnumMap[instance.style],
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

const _$CombatStyleEnumMap = {
  CombatStyle.melee: 'melee',
  CombatStyle.ranged: 'ranged',
  CombatStyle.escort: 'escort',
};

_SeedCount _$SeedCountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SeedCount', json, ($checkedConvert) {
      final val = _SeedCount(
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        count: $checkedConvert('count', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SeedCountToJson(_SeedCount instance) =>
    <String, dynamic>{'seed': instance.seed.toJson(), 'count': instance.count};
