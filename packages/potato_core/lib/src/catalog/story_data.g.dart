// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryData _$StoryDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_StoryData',
  json,
  ($checkedConvert) {
    final val = _StoryData(
      locked: $checkedConvert(
        'locked',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ??
            const <String>[],
      ),
      events: $checkedConvert(
        'events',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => StoryEventData.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <StoryEventData>[],
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$StoryDataToJson(_StoryData instance) =>
    <String, dynamic>{
      'locked': instance.locked,
      'events': instance.events.map((e) => e.toJson()).toList(),
    };

_StoryEventData _$StoryEventDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StoryEventData', json, ($checkedConvert) {
  final val = _StoryEventData(
    id: $checkedConvert('id', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String? ?? ''),
    after: $checkedConvert(
      'after',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    goals: $checkedConvert(
      'goals',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => StoryGoalData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StoryGoalData>[],
    ),
    unlocks: $checkedConvert(
      'unlocks',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
    ),
    food: $checkedConvert('food', (v) => (v as num?)?.toInt() ?? 0),
    seeds: $checkedConvert(
      'seeds',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => SeedStackData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SeedStackData>[],
    ),
  );
  return val;
});

Map<String, dynamic> _$StoryEventDataToJson(_StoryEventData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'after': instance.after,
      'goals': instance.goals.map((e) => e.toJson()).toList(),
      'unlocks': instance.unlocks,
      'food': instance.food,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
    };

_StoryGoalData _$StoryGoalDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StoryGoalData', json, ($checkedConvert) {
      final val = _StoryGoalData(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$StoryGoalKindEnumMap, v),
        ),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt() ?? 1),
        building: $checkedConvert('building', (v) => v as String?),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$PotatoTypeEnumMap, v),
        ),
        zone: $checkedConvert('zone', (v) => v as String?),
        danger: $checkedConvert('danger', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$StoryGoalDataToJson(_StoryGoalData instance) =>
    <String, dynamic>{
      'kind': _$StoryGoalKindEnumMap[instance.kind]!,
      'count': instance.count,
      'building': instance.building,
      'type': _$PotatoTypeEnumMap[instance.type],
      'zone': instance.zone,
      'danger': instance.danger,
    };

const _$StoryGoalKindEnumMap = {
  StoryGoalKind.fields: 'fields',
  StoryGoalKind.buildings: 'buildings',
  StoryGoalKind.potatoes: 'potatoes',
  StoryGoalKind.food: 'food',
  StoryGoalKind.escapes: 'escapes',
  StoryGoalKind.progress: 'progress',
  StoryGoalKind.power: 'power',
  StoryGoalKind.pestsAppeared: 'pests_appeared',
  StoryGoalKind.pestsCleared: 'pests_cleared',
  StoryGoalKind.potatoesDied: 'potatoes_died',
  StoryGoalKind.potatoesTrained: 'potatoes_trained',
  StoryGoalKind.wait: 'wait',
};

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};
