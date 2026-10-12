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
    );
    return val;
  },
);

Map<String, dynamic> _$SeedToJson(_Seed instance) => <String, dynamic>{
  'type': _$PotatoTypeEnumMap[instance.type]!,
  'grade': _$GradeEnumMap[instance.grade]!,
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
