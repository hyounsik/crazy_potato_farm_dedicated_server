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
        pests: $checkedConvert(
          'pests',
          (v) => PestRulesData.fromJson(v as Map<String, dynamic>),
        ),
        newFarm: $checkedConvert(
          'new_farm',
          (v) => NewFarmData.fromJson(v as Map<String, dynamic>),
        ),
        raid: $checkedConvert(
          'raid',
          (v) => RaidRulesData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'newFarm': 'new_farm'});

Map<String, dynamic> _$RulesDataToJson(_RulesData instance) =>
    <String, dynamic>{
      'farm': instance.farm.toJson(),
      'potatoes': instance.potatoes.toJson(),
      'pests': instance.pests.toJson(),
      'new_farm': instance.newFarm.toJson(),
      'raid': instance.raid.toJson(),
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
          openArea: $checkedConvert(
            'open_area',
            (v) => TileRect.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stepMillis': 'step_millis',
        'offlineCapMinutes': 'offline_cap_minutes',
        'fieldMaxSize': 'field_max_size',
        'openArea': 'open_area',
      },
    );

Map<String, dynamic> _$FarmRulesDataToJson(_FarmRulesData instance) =>
    <String, dynamic>{
      'step_millis': instance.stepMillis,
      'offline_cap_minutes': instance.offlineCapMinutes,
      'size': instance.size,
      'field_max_size': instance.fieldMaxSize,
      'open_area': instance.openArea.toJson(),
    };

_PotatoRulesData _$PotatoRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PotatoRulesData',
      json,
      ($checkedConvert) {
        final val = _PotatoRulesData(
          gradeDropChance: $checkedConvert(
            'grade_drop_chance',
            (v) => (v as num).toDouble(),
          ),
          upkeepEverySeconds: $checkedConvert(
            'upkeep_every_seconds',
            (v) => (v as num).toInt(),
          ),
          weakPercent: $checkedConvert(
            'weak_percent',
            (v) => (v as num).toInt(),
          ),
          breedingGradeUpChance: $checkedConvert(
            'breeding_grade_up_chance',
            (v) => (v as num).toDouble(),
          ),
          guards: $checkedConvert(
            'guards',
            (v) => GuardRulesData.fromJson(v as Map<String, dynamic>),
          ),
          fridge: $checkedConvert(
            'fridge',
            (v) => FridgeRulesData.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'gradeDropChance': 'grade_drop_chance',
        'upkeepEverySeconds': 'upkeep_every_seconds',
        'weakPercent': 'weak_percent',
        'breedingGradeUpChance': 'breeding_grade_up_chance',
      },
    );

Map<String, dynamic> _$PotatoRulesDataToJson(_PotatoRulesData instance) =>
    <String, dynamic>{
      'grade_drop_chance': instance.gradeDropChance,
      'upkeep_every_seconds': instance.upkeepEverySeconds,
      'weak_percent': instance.weakPercent,
      'breeding_grade_up_chance': instance.breedingGradeUpChance,
      'guards': instance.guards.toJson(),
      'fridge': instance.fridge.toJson(),
    };

_GuardRulesData _$GuardRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_GuardRulesData', json, ($checkedConvert) {
      final val = _GuardRulesData(
        walkMillisPerTile: $checkedConvert(
          'walk_millis_per_tile',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'walkMillisPerTile': 'walk_millis_per_tile'});

Map<String, dynamic> _$GuardRulesDataToJson(_GuardRulesData instance) =>
    <String, dynamic>{'walk_millis_per_tile': instance.walkMillisPerTile};

_FridgeRulesData _$FridgeRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FridgeRulesData', json, ($checkedConvert) {
      final val = _FridgeRulesData(
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        agingPercent: $checkedConvert(
          'aging_percent',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'agingPercent': 'aging_percent'});

Map<String, dynamic> _$FridgeRulesDataToJson(_FridgeRulesData instance) =>
    <String, dynamic>{
      'size': instance.size,
      'aging_percent': instance.agingPercent,
    };

_PestRulesData _$PestRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PestRulesData', json, ($checkedConvert) {
      final val = _PestRulesData(
        checkEverySeconds: $checkedConvert(
          'check_every_seconds',
          (v) => (v as num).toInt(),
        ),
        bug: $checkedConvert(
          'bug',
          (v) => BugRulesData.fromJson(v as Map<String, dynamic>),
        ),
        blight: $checkedConvert(
          'blight',
          (v) => BlightRulesData.fromJson(v as Map<String, dynamic>),
        ),
        taps: $checkedConvert('taps', (v) => (v as num).toInt()),
        reward: $checkedConvert(
          'reward',
          (v) => PestRewardData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'checkEverySeconds': 'check_every_seconds'});

Map<String, dynamic> _$PestRulesDataToJson(_PestRulesData instance) =>
    <String, dynamic>{
      'check_every_seconds': instance.checkEverySeconds,
      'bug': instance.bug.toJson(),
      'blight': instance.blight.toJson(),
      'taps': instance.taps,
      'reward': instance.reward.toJson(),
    };

_BugRulesData _$BugRulesDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_BugRulesData',
  json,
  ($checkedConvert) {
    final val = _BugRulesData(
      chancePerStored: $checkedConvert(
        'chance_per_stored',
        (v) => (v as num).toDouble(),
      ),
      chanceMax: $checkedConvert('chance_max', (v) => (v as num).toDouble()),
      eatEverySeconds: $checkedConvert(
        'eat_every_seconds',
        (v) => (v as num).toInt(),
      ),
      eatAmount: $checkedConvert('eat_amount', (v) => (v as num).toInt()),
      clearSeconds: $checkedConvert('clear_seconds', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'chancePerStored': 'chance_per_stored',
    'chanceMax': 'chance_max',
    'eatEverySeconds': 'eat_every_seconds',
    'eatAmount': 'eat_amount',
    'clearSeconds': 'clear_seconds',
  },
);

Map<String, dynamic> _$BugRulesDataToJson(_BugRulesData instance) =>
    <String, dynamic>{
      'chance_per_stored': instance.chancePerStored,
      'chance_max': instance.chanceMax,
      'eat_every_seconds': instance.eatEverySeconds,
      'eat_amount': instance.eatAmount,
      'clear_seconds': instance.clearSeconds,
    };

_BlightRulesData _$BlightRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BlightRulesData',
      json,
      ($checkedConvert) {
        final val = _BlightRulesData(
          chance: $checkedConvert('chance', (v) => (v as num).toDouble()),
          extraAgingPercent: $checkedConvert(
            'extra_aging_percent',
            (v) => (v as num).toInt(),
          ),
          clearSeconds: $checkedConvert(
            'clear_seconds',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'extraAgingPercent': 'extra_aging_percent',
        'clearSeconds': 'clear_seconds',
      },
    );

Map<String, dynamic> _$BlightRulesDataToJson(_BlightRulesData instance) =>
    <String, dynamic>{
      'chance': instance.chance,
      'extra_aging_percent': instance.extraAgingPercent,
      'clear_seconds': instance.clearSeconds,
    };

_PestRewardData _$PestRewardDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PestRewardData',
      json,
      ($checkedConvert) {
        final val = _PestRewardData(
          foodMin: $checkedConvert('food_min', (v) => (v as num).toInt()),
          foodMax: $checkedConvert('food_max', (v) => (v as num).toInt()),
          seedChance: $checkedConvert(
            'seed_chance',
            (v) => (v as num).toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'foodMin': 'food_min',
        'foodMax': 'food_max',
        'seedChance': 'seed_chance',
      },
    );

Map<String, dynamic> _$PestRewardDataToJson(_PestRewardData instance) =>
    <String, dynamic>{
      'food_min': instance.foodMin,
      'food_max': instance.foodMax,
      'seed_chance': instance.seedChance,
    };

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
