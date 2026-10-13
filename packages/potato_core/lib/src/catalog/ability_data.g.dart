// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AbilityData _$AbilityDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_AbilityData',
  json,
  ($checkedConvert) {
    final val = _AbilityData(
      id: $checkedConvert('id', (v) => v as String),
      pool: $checkedConvert('pool', (v) => v as String),
      effects: $checkedConvert(
        'effects',
        (v) => (v as List<dynamic>)
            .map((e) => AbilityEffectData.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      rarity: $checkedConvert('rarity', (v) => $enumDecode(_$RarityEnumMap, v)),
      weight: $checkedConvert('weight', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
);

Map<String, dynamic> _$AbilityDataToJson(_AbilityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pool': instance.pool,
      'effects': instance.effects.map((e) => e.toJson()).toList(),
      'rarity': _$RarityEnumMap[instance.rarity]!,
      'weight': instance.weight,
    };

const _$RarityEnumMap = {
  Rarity.normal: 'normal',
  Rarity.low: 'low',
  Rarity.veryLow: 'very_low',
};

_AbilityEffectData _$AbilityEffectDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AbilityEffectData',
  json,
  ($checkedConvert) {
    final val = _AbilityEffectData(
      context: $checkedConvert(
        'context',
        (v) => $enumDecode(_$EffectContextEnumMap, v),
      ),
      target: $checkedConvert(
        'target',
        (v) => $enumDecode(_$EffectTargetEnumMap, v),
      ),
      kind: $checkedConvert('kind', (v) => $enumDecode(_$EffectKindEnumMap, v)),
      stat: $checkedConvert('stat', (v) => v as String?),
      op: $checkedConvert(
        'op',
        (v) => $enumDecodeNullable(_$EffectOpEnumMap, v),
      ),
      value: $checkedConvert('value', (v) => (v as num?)?.toDouble()),
      tempValue: $checkedConvert('temp_value', (v) => (v as num?)?.toDouble()),
      intervalSec: $checkedConvert('interval_sec', (v) => (v as num?)?.toInt()),
      tempIntervalSec: $checkedConvert(
        'temp_interval_sec',
        (v) => (v as num?)?.toInt(),
      ),
      action: $checkedConvert('action', (v) => v as String?),
      text: $checkedConvert('text', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'tempValue': 'temp_value',
    'intervalSec': 'interval_sec',
    'tempIntervalSec': 'temp_interval_sec',
  },
);

Map<String, dynamic> _$AbilityEffectDataToJson(_AbilityEffectData instance) =>
    <String, dynamic>{
      'context': _$EffectContextEnumMap[instance.context]!,
      'target': _$EffectTargetEnumMap[instance.target]!,
      'kind': _$EffectKindEnumMap[instance.kind]!,
      'stat': instance.stat,
      'op': _$EffectOpEnumMap[instance.op],
      'value': instance.value,
      'temp_value': instance.tempValue,
      'interval_sec': instance.intervalSec,
      'temp_interval_sec': instance.tempIntervalSec,
      'action': instance.action,
      'text': instance.text,
    };

const _$EffectContextEnumMap = {
  EffectContext.always: 'always',
  EffectContext.farm: 'farm',
  EffectContext.explore: 'explore',
};

const _$EffectTargetEnumMap = {
  EffectTarget.self: 'self',
  EffectTarget.field: 'field',
  EffectTarget.party: 'party',
};

const _$EffectKindEnumMap = {
  EffectKind.stat: 'stat',
  EffectKind.periodic: 'periodic',
};

const _$EffectOpEnumMap = {EffectOp.mul: 'mul', EffectOp.add: 'add'};

_AbilityPoolData _$AbilityPoolDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AbilityPoolData', json, ($checkedConvert) {
      final val = _AbilityPoolData(
        id: $checkedConvert('id', (v) => v as String),
        potatoTypes: $checkedConvert(
          'potato_types',
          (v) => (v as List<dynamic>)
              .map((e) => $enumDecode(_$PotatoTypeEnumMap, e))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'potatoTypes': 'potato_types'});

Map<String, dynamic> _$AbilityPoolDataToJson(_AbilityPoolData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'potato_types': instance.potatoTypes
          .map((e) => _$PotatoTypeEnumMap[e]!)
          .toList(),
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

_AbilityRulesData _$AbilityRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AbilityRulesData',
      json,
      ($checkedConvert) {
        final val = _AbilityRulesData(
          slotsByGrade: $checkedConvert(
            'slots_by_grade',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
            ),
          ),
          extraSlotPoolWeight: $checkedConvert(
            'extra_slot_pool_weight',
            (v) => ExtraSlotPoolWeightData.fromJson(v as Map<String, dynamic>),
          ),
          rarityWeights: $checkedConvert(
            'rarity_weights',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry($enumDecode(_$RarityEnumMap, k), (e as num).toInt()),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'slotsByGrade': 'slots_by_grade',
        'extraSlotPoolWeight': 'extra_slot_pool_weight',
        'rarityWeights': 'rarity_weights',
      },
    );

Map<String, dynamic> _$AbilityRulesDataToJson(_AbilityRulesData instance) =>
    <String, dynamic>{
      'slots_by_grade': instance.slotsByGrade.map(
        (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
      ),
      'extra_slot_pool_weight': instance.extraSlotPoolWeight.toJson(),
      'rarity_weights': instance.rarityWeights.map(
        (k, e) => MapEntry(_$RarityEnumMap[k]!, e),
      ),
    };

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};

_ExtraSlotPoolWeightData _$ExtraSlotPoolWeightDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExtraSlotPoolWeightData', json, ($checkedConvert) {
  final val = _ExtraSlotPoolWeightData(
    common: $checkedConvert('common', (v) => (v as num).toInt()),
    unique: $checkedConvert('unique', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ExtraSlotPoolWeightDataToJson(
  _ExtraSlotPoolWeightData instance,
) => <String, dynamic>{'common': instance.common, 'unique': instance.unique};
