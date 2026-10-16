// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gear _$GearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Gear', json, ($checkedConvert) {
      final val = _Gear(
        kind: $checkedConvert('kind', (v) => $enumDecode(_$GearKindEnumMap, v)),
        family: $checkedConvert('family', (v) => v as String? ?? ''),
        grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
        level: $checkedConvert('level', (v) => (v as num).toInt()),
        enhance: $checkedConvert('enhance', (v) => (v as num?)?.toInt() ?? 0),
        slots: $checkedConvert(
          'slots',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$PotatoTypeEnumMap, e))
                  .toList() ??
              const <PotatoType>[],
        ),
      );
      return val;
    });

Map<String, dynamic> _$GearToJson(_Gear instance) => <String, dynamic>{
  'kind': _$GearKindEnumMap[instance.kind]!,
  'family': instance.family,
  'grade': _$GradeEnumMap[instance.grade]!,
  'level': instance.level,
  'enhance': instance.enhance,
  'slots': instance.slots.map((e) => _$PotatoTypeEnumMap[e]!).toList(),
};

const _$GearKindEnumMap = {
  GearKind.weapon: 'weapon',
  GearKind.bag: 'bag',
  GearKind.belt: 'belt',
};

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

_Equipped _$EquippedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Equipped', json, ($checkedConvert) {
      final val = _Equipped(
        weapon: $checkedConvert(
          'weapon',
          (v) => v == null ? null : Gear.fromJson(v as Map<String, dynamic>),
        ),
        bag: $checkedConvert(
          'bag',
          (v) => v == null ? null : Gear.fromJson(v as Map<String, dynamic>),
        ),
        belt: $checkedConvert(
          'belt',
          (v) => v == null ? null : Gear.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$EquippedToJson(_Equipped instance) => <String, dynamic>{
  'weapon': instance.weapon?.toJson(),
  'bag': instance.bag?.toJson(),
  'belt': instance.belt?.toJson(),
};
