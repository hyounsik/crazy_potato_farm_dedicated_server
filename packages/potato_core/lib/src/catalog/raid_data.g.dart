// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raid_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RaidRulesData _$RaidRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RaidRulesData',
      json,
      ($checkedConvert) {
        final val = _RaidRulesData(
          stepMillis: $checkedConvert('step_millis', (v) => (v as num).toInt()),
          player: $checkedConvert(
            'player',
            (v) => PlayerRulesData.fromJson(v as Map<String, dynamic>),
          ),
          bagSlots: $checkedConvert('bag_slots', (v) => (v as num).toInt()),
          pickupRadius: $checkedConvert(
            'pickup_radius',
            (v) => (v as num).toDouble(),
          ),
          food: $checkedConvert(
            'food',
            (v) => FoodRulesData.fromJson(v as Map<String, dynamic>),
          ),
          startWeapon: $checkedConvert('start_weapon', (v) => v as String),
          enemyAlertSeconds: $checkedConvert(
            'enemy_alert_seconds',
            (v) => (v as num).toDouble(),
          ),
          companion: $checkedConvert(
            'companion',
            (v) => CompanionRulesData.fromJson(v as Map<String, dynamic>),
          ),
          clones: $checkedConvert(
            'clones',
            (v) => CloneRulesData.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stepMillis': 'step_millis',
        'bagSlots': 'bag_slots',
        'pickupRadius': 'pickup_radius',
        'startWeapon': 'start_weapon',
        'enemyAlertSeconds': 'enemy_alert_seconds',
      },
    );

Map<String, dynamic> _$RaidRulesDataToJson(_RaidRulesData instance) =>
    <String, dynamic>{
      'step_millis': instance.stepMillis,
      'player': instance.player.toJson(),
      'bag_slots': instance.bagSlots,
      'pickup_radius': instance.pickupRadius,
      'food': instance.food.toJson(),
      'start_weapon': instance.startWeapon,
      'enemy_alert_seconds': instance.enemyAlertSeconds,
      'companion': instance.companion.toJson(),
      'clones': instance.clones.toJson(),
    };

_PlayerRulesData _$PlayerRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PlayerRulesData',
      json,
      ($checkedConvert) {
        final val = _PlayerRulesData(
          speed: $checkedConvert('speed', (v) => (v as num).toDouble()),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          maxHp: $checkedConvert('max_hp', (v) => (v as num).toDouble()),
          regenDelaySeconds: $checkedConvert(
            'regen_delay_seconds',
            (v) => (v as num).toDouble(),
          ),
          regenPerSecond: $checkedConvert(
            'regen_per_second',
            (v) => (v as num).toDouble(),
          ),
          sight: $checkedConvert('sight', (v) => (v as num).toDouble()),
          dashDistance: $checkedConvert(
            'dash_distance',
            (v) => (v as num).toDouble(),
          ),
          dashSeconds: $checkedConvert(
            'dash_seconds',
            (v) => (v as num).toDouble(),
          ),
          dashCooldownSeconds: $checkedConvert(
            'dash_cooldown_seconds',
            (v) => (v as num).toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxHp': 'max_hp',
        'regenDelaySeconds': 'regen_delay_seconds',
        'regenPerSecond': 'regen_per_second',
        'dashDistance': 'dash_distance',
        'dashSeconds': 'dash_seconds',
        'dashCooldownSeconds': 'dash_cooldown_seconds',
      },
    );

Map<String, dynamic> _$PlayerRulesDataToJson(_PlayerRulesData instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'radius': instance.radius,
      'max_hp': instance.maxHp,
      'regen_delay_seconds': instance.regenDelaySeconds,
      'regen_per_second': instance.regenPerSecond,
      'sight': instance.sight,
      'dash_distance': instance.dashDistance,
      'dash_seconds': instance.dashSeconds,
      'dash_cooldown_seconds': instance.dashCooldownSeconds,
    };

_FoodRulesData _$FoodRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_FoodRulesData',
      json,
      ($checkedConvert) {
        final val = _FoodRulesData(
          item: $checkedConvert('item', (v) => v as String),
          perSecond: $checkedConvert(
            'per_second',
            (v) => (v as num).toDouble(),
          ),
          regenExtraPerSecond: $checkedConvert(
            'regen_extra_per_second',
            (v) => (v as num).toDouble(),
          ),
          hungrySpeedMultiplier: $checkedConvert(
            'hungry_speed_multiplier',
            (v) => (v as num).toDouble(),
          ),
          hungryReturnSeconds: $checkedConvert(
            'hungry_return_seconds',
            (v) => (v as num).toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'perSecond': 'per_second',
        'regenExtraPerSecond': 'regen_extra_per_second',
        'hungrySpeedMultiplier': 'hungry_speed_multiplier',
        'hungryReturnSeconds': 'hungry_return_seconds',
      },
    );

Map<String, dynamic> _$FoodRulesDataToJson(_FoodRulesData instance) =>
    <String, dynamic>{
      'item': instance.item,
      'per_second': instance.perSecond,
      'regen_extra_per_second': instance.regenExtraPerSecond,
      'hungry_speed_multiplier': instance.hungrySpeedMultiplier,
      'hungry_return_seconds': instance.hungryReturnSeconds,
    };

_CompanionRulesData _$CompanionRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CompanionRulesData',
      json,
      ($checkedConvert) {
        final val = _CompanionRulesData(
          maxHp: $checkedConvert('max_hp', (v) => (v as num).toDouble()),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          speedMultiplier: $checkedConvert(
            'speed_multiplier',
            (v) => (v as num).toDouble(),
          ),
          followDistance: $checkedConvert(
            'follow_distance',
            (v) => (v as num).toDouble(),
          ),
          catchUpDistance: $checkedConvert(
            'catch_up_distance',
            (v) => (v as num).toDouble(),
          ),
          regenDelaySeconds: $checkedConvert(
            'regen_delay_seconds',
            (v) => (v as num).toDouble(),
          ),
          regenPercentPerSecond: $checkedConvert(
            'regen_percent_per_second',
            (v) => (v as num).toDouble(),
          ),
          regenFoodPerSecond: $checkedConvert(
            'regen_food_per_second',
            (v) => (v as num).toDouble(),
          ),
          producePerSecond: $checkedConvert(
            'produce_per_second',
            (v) => (v as num).toDouble(),
          ),
          attackRange: $checkedConvert(
            'attack_range',
            (v) => (v as num).toDouble(),
          ),
          defenseRange: $checkedConvert(
            'defense_range',
            (v) => (v as num).toDouble(),
          ),
          styles: $checkedConvert(
            'styles',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                $enumDecode(_$CombatStyleEnumMap, k),
                CompanionStyleData.fromJson(e as Map<String, dynamic>),
              ),
            ),
          ),
          levelHpPermille: $checkedConvert(
            'level_hp_permille',
            (v) => (v as num).toInt(),
          ),
          levelAttackPermille: $checkedConvert(
            'level_attack_permille',
            (v) => (v as num).toInt(),
          ),
          aggroPulseRange: $checkedConvert(
            'aggro_pulse_range',
            (v) => (v as num).toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxHp': 'max_hp',
        'speedMultiplier': 'speed_multiplier',
        'followDistance': 'follow_distance',
        'catchUpDistance': 'catch_up_distance',
        'regenDelaySeconds': 'regen_delay_seconds',
        'regenPercentPerSecond': 'regen_percent_per_second',
        'regenFoodPerSecond': 'regen_food_per_second',
        'producePerSecond': 'produce_per_second',
        'attackRange': 'attack_range',
        'defenseRange': 'defense_range',
        'levelHpPermille': 'level_hp_permille',
        'levelAttackPermille': 'level_attack_permille',
        'aggroPulseRange': 'aggro_pulse_range',
      },
    );

Map<String, dynamic> _$CompanionRulesDataToJson(_CompanionRulesData instance) =>
    <String, dynamic>{
      'max_hp': instance.maxHp,
      'radius': instance.radius,
      'speed_multiplier': instance.speedMultiplier,
      'follow_distance': instance.followDistance,
      'catch_up_distance': instance.catchUpDistance,
      'regen_delay_seconds': instance.regenDelaySeconds,
      'regen_percent_per_second': instance.regenPercentPerSecond,
      'regen_food_per_second': instance.regenFoodPerSecond,
      'produce_per_second': instance.producePerSecond,
      'attack_range': instance.attackRange,
      'defense_range': instance.defenseRange,
      'styles': instance.styles.map(
        (k, e) => MapEntry(_$CombatStyleEnumMap[k]!, e.toJson()),
      ),
      'level_hp_permille': instance.levelHpPermille,
      'level_attack_permille': instance.levelAttackPermille,
      'aggro_pulse_range': instance.aggroPulseRange,
    };

const _$CombatStyleEnumMap = {
  CombatStyle.melee: 'melee',
  CombatStyle.ranged: 'ranged',
  CombatStyle.escort: 'escort',
};

_CloneRulesData _$CloneRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CloneRulesData',
      json,
      ($checkedConvert) {
        final val = _CloneRulesData(
          sightMultiplier: $checkedConvert(
            'sight_multiplier',
            (v) => (v as num).toDouble(),
          ),
          speedMultiplier: $checkedConvert(
            'speed_multiplier',
            (v) => (v as num).toDouble(),
          ),
          maxHp: $checkedConvert('max_hp', (v) => (v as num).toDouble()),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          lowHpRatio: $checkedConvert(
            'low_hp_ratio',
            (v) => (v as num).toDouble(),
          ),
          staySecondsMin: $checkedConvert(
            'stay_seconds_min',
            (v) => (v as num).toDouble(),
          ),
          staySecondsMax: $checkedConvert(
            'stay_seconds_max',
            (v) => (v as num).toDouble(),
          ),
          waitSightMultiplier: $checkedConvert(
            'wait_sight_multiplier',
            (v) => (v as num).toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'sightMultiplier': 'sight_multiplier',
        'speedMultiplier': 'speed_multiplier',
        'maxHp': 'max_hp',
        'lowHpRatio': 'low_hp_ratio',
        'staySecondsMin': 'stay_seconds_min',
        'staySecondsMax': 'stay_seconds_max',
        'waitSightMultiplier': 'wait_sight_multiplier',
      },
    );

Map<String, dynamic> _$CloneRulesDataToJson(_CloneRulesData instance) =>
    <String, dynamic>{
      'sight_multiplier': instance.sightMultiplier,
      'speed_multiplier': instance.speedMultiplier,
      'max_hp': instance.maxHp,
      'radius': instance.radius,
      'low_hp_ratio': instance.lowHpRatio,
      'stay_seconds_min': instance.staySecondsMin,
      'stay_seconds_max': instance.staySecondsMax,
      'wait_sight_multiplier': instance.waitSightMultiplier,
    };

_DefaultCloneData _$DefaultCloneDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_DefaultCloneData',
      json,
      ($checkedConvert) {
        final val = _DefaultCloneData(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          weapon: $checkedConvert('weapon', (v) => v as String),
          weaponLevel: $checkedConvert(
            'weapon_level',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          bagSlots: $checkedConvert('bag_slots', (v) => (v as num).toInt()),
          scoreMin: $checkedConvert('score_min', (v) => (v as num).toInt()),
          scoreMax: $checkedConvert('score_max', (v) => (v as num).toInt()),
          companions: $checkedConvert(
            'companions',
            (v) =>
                (v as List<dynamic>?)
                    ?.map(
                      (e) => CloneCompanionData.fromJson(
                        e as Map<String, dynamic>,
                      ),
                    )
                    .toList() ??
                const <CloneCompanionData>[],
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'weaponLevel': 'weapon_level',
        'bagSlots': 'bag_slots',
        'scoreMin': 'score_min',
        'scoreMax': 'score_max',
      },
    );

Map<String, dynamic> _$DefaultCloneDataToJson(_DefaultCloneData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weapon': instance.weapon,
      'weapon_level': instance.weaponLevel,
      'bag_slots': instance.bagSlots,
      'score_min': instance.scoreMin,
      'score_max': instance.scoreMax,
      'companions': instance.companions.map((e) => e.toJson()).toList(),
    };

_CloneCompanionData _$CloneCompanionDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CloneCompanionData', json, ($checkedConvert) {
      final val = _CloneCompanionData(
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$PotatoTypeEnumMap, v),
        ),
        grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
        level: $checkedConvert('level', (v) => (v as num?)?.toInt() ?? 0),
        abilities: $checkedConvert(
          'abilities',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        style: $checkedConvert(
          'style',
          (v) => $enumDecodeNullable(_$CombatStyleEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CloneCompanionDataToJson(_CloneCompanionData instance) =>
    <String, dynamic>{
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grade': _$GradeEnumMap[instance.grade]!,
      'level': instance.level,
      'abilities': instance.abilities,
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

_CompanionStyleData _$CompanionStyleDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CompanionStyleData',
  json,
  ($checkedConvert) {
    final val = _CompanionStyleData(
      maxHp: $checkedConvert('max_hp', (v) => (v as num).toDouble()),
      damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
      interval: $checkedConvert('interval', (v) => (v as num).toDouble()),
      speedMultiplier: $checkedConvert(
        'speed_multiplier',
        (v) => (v as num).toDouble(),
      ),
      preferredDistance: $checkedConvert(
        'preferred_distance',
        (v) => (v as num).toDouble(),
      ),
      reach: $checkedConvert('reach', (v) => (v as num?)?.toDouble() ?? 0.0),
      range: $checkedConvert('range', (v) => (v as num?)?.toDouble() ?? 0.0),
      bulletSpeed: $checkedConvert(
        'bullet_speed',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxHp': 'max_hp',
    'speedMultiplier': 'speed_multiplier',
    'preferredDistance': 'preferred_distance',
    'bulletSpeed': 'bullet_speed',
  },
);

Map<String, dynamic> _$CompanionStyleDataToJson(_CompanionStyleData instance) =>
    <String, dynamic>{
      'max_hp': instance.maxHp,
      'damage': instance.damage,
      'interval': instance.interval,
      'speed_multiplier': instance.speedMultiplier,
      'preferred_distance': instance.preferredDistance,
      'reach': instance.reach,
      'range': instance.range,
      'bullet_speed': instance.bulletSpeed,
    };

_WeaponData _$WeaponDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_WeaponData',
  json,
  ($checkedConvert) {
    final val = _WeaponData(
      id: $checkedConvert('id', (v) => v as String),
      range: $checkedConvert('range', (v) => (v as num).toDouble()),
      interval: $checkedConvert('interval', (v) => (v as num).toDouble()),
      damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
      bulletSpeed: $checkedConvert(
        'bullet_speed',
        (v) => (v as num).toDouble(),
      ),
      pellets: $checkedConvert('pellets', (v) => (v as num?)?.toInt() ?? 1),
      spreadDegrees: $checkedConvert(
        'spread_degrees',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      aimSeconds: $checkedConvert(
        'aim_seconds',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      preferredDistance: $checkedConvert(
        'preferred_distance',
        (v) => (v as num?)?.toDouble() ?? 1.5,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'bulletSpeed': 'bullet_speed',
    'spreadDegrees': 'spread_degrees',
    'aimSeconds': 'aim_seconds',
    'preferredDistance': 'preferred_distance',
  },
);

Map<String, dynamic> _$WeaponDataToJson(_WeaponData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'range': instance.range,
      'interval': instance.interval,
      'damage': instance.damage,
      'bullet_speed': instance.bulletSpeed,
      'pellets': instance.pellets,
      'spread_degrees': instance.spreadDegrees,
      'aim_seconds': instance.aimSeconds,
      'preferred_distance': instance.preferredDistance,
    };

_EnemyData _$EnemyDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_EnemyData',
  json,
  ($checkedConvert) {
    final val = _EnemyData(
      id: $checkedConvert('id', (v) => v as String),
      temper: $checkedConvert(
        'temper',
        (v) => $enumDecode(_$EnemyTemperEnumMap, v),
      ),
      attack: $checkedConvert(
        'attack',
        (v) => $enumDecode(_$EnemyAttackEnumMap, v),
      ),
      maxHp: $checkedConvert('max_hp', (v) => (v as num).toDouble()),
      radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
      damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
      attackInterval: $checkedConvert(
        'attack_interval',
        (v) => (v as num).toDouble(),
      ),
      reach: $checkedConvert('reach', (v) => (v as num?)?.toDouble() ?? 0.0),
      range: $checkedConvert('range', (v) => (v as num?)?.toDouble() ?? 0.0),
      bulletSpeed: $checkedConvert(
        'bullet_speed',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxHp': 'max_hp',
    'attackInterval': 'attack_interval',
    'bulletSpeed': 'bullet_speed',
  },
);

Map<String, dynamic> _$EnemyDataToJson(_EnemyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temper': _$EnemyTemperEnumMap[instance.temper]!,
      'attack': _$EnemyAttackEnumMap[instance.attack]!,
      'max_hp': instance.maxHp,
      'radius': instance.radius,
      'damage': instance.damage,
      'attack_interval': instance.attackInterval,
      'reach': instance.reach,
      'range': instance.range,
      'bullet_speed': instance.bulletSpeed,
    };

const _$EnemyTemperEnumMap = {
  EnemyTemper.aggressive: 'aggressive',
  EnemyTemper.passive: 'passive',
};

const _$EnemyAttackEnumMap = {
  EnemyAttack.melee: 'melee',
  EnemyAttack.ranged: 'ranged',
};

_ZoneData _$ZoneDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ZoneData', json, ($checkedConvert) {
      final val = _ZoneData(
        id: $checkedConvert('id', (v) => v as String),
        score: $checkedConvert('score', (v) => (v as num).toInt()),
        map: $checkedConvert(
          'map',
          (v) => MapRecipe.fromJson(v as Map<String, dynamic>),
        ),
        enemies: $checkedConvert(
          'enemies',
          (v) => ZoneEnemiesData.fromJson(v as Map<String, dynamic>),
        ),
        gathering: $checkedConvert(
          'gathering',
          (v) => ZoneGatheringData.fromJson(v as Map<String, dynamic>),
        ),
        drops: $checkedConvert(
          'drops',
          (v) => ZoneDropsData.fromJson(v as Map<String, dynamic>),
        ),
        danger: $checkedConvert(
          'danger',
          (v) => v == null
              ? null
              : ZoneDangerData.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ZoneDataToJson(_ZoneData instance) => <String, dynamic>{
  'id': instance.id,
  'score': instance.score,
  'map': instance.map.toJson(),
  'enemies': instance.enemies.toJson(),
  'gathering': instance.gathering.toJson(),
  'drops': instance.drops.toJson(),
  'danger': instance.danger?.toJson(),
};

_ZoneEnemiesData _$ZoneEnemiesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ZoneEnemiesData',
      json,
      ($checkedConvert) {
        final val = _ZoneEnemiesData(
          count: $checkedConvert('count', (v) => (v as num).toInt()),
          kinds: $checkedConvert(
            'kinds',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => WeightedEnemyData.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          packs: $checkedConvert('packs', (v) => (v as num?)?.toInt() ?? 0),
          packSizeMin: $checkedConvert(
            'pack_size_min',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          packSizeMax: $checkedConvert(
            'pack_size_max',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          packKinds: $checkedConvert(
            'pack_kinds',
            (v) =>
                (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                const <String>[],
          ),
          keepAway: $checkedConvert('keep_away', (v) => (v as num).toDouble()),
          sightMultiplier: $checkedConvert(
            'sight_multiplier',
            (v) => (v as num).toDouble(),
          ),
          speedMultiplier: $checkedConvert(
            'speed_multiplier',
            (v) => (v as num).toDouble(),
          ),
          hpMultiplier: $checkedConvert(
            'hp_multiplier',
            (v) => (v as num?)?.toDouble() ?? 1.0,
          ),
          damageMultiplier: $checkedConvert(
            'damage_multiplier',
            (v) => (v as num?)?.toDouble() ?? 1.0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'packSizeMin': 'pack_size_min',
        'packSizeMax': 'pack_size_max',
        'packKinds': 'pack_kinds',
        'keepAway': 'keep_away',
        'sightMultiplier': 'sight_multiplier',
        'speedMultiplier': 'speed_multiplier',
        'hpMultiplier': 'hp_multiplier',
        'damageMultiplier': 'damage_multiplier',
      },
    );

Map<String, dynamic> _$ZoneEnemiesDataToJson(_ZoneEnemiesData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'kinds': instance.kinds.map((e) => e.toJson()).toList(),
      'packs': instance.packs,
      'pack_size_min': instance.packSizeMin,
      'pack_size_max': instance.packSizeMax,
      'pack_kinds': instance.packKinds,
      'keep_away': instance.keepAway,
      'sight_multiplier': instance.sightMultiplier,
      'speed_multiplier': instance.speedMultiplier,
      'hp_multiplier': instance.hpMultiplier,
      'damage_multiplier': instance.damageMultiplier,
    };

_WeightedEnemyData _$WeightedEnemyDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WeightedEnemyData', json, ($checkedConvert) {
      final val = _WeightedEnemyData(
        enemy: $checkedConvert('enemy', (v) => v as String),
        weight: $checkedConvert('weight', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$WeightedEnemyDataToJson(_WeightedEnemyData instance) =>
    <String, dynamic>{'enemy': instance.enemy, 'weight': instance.weight};

_ZoneGatheringData _$ZoneGatheringDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ZoneGatheringData', json, ($checkedConvert) {
      final val = _ZoneGatheringData(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        spacing: $checkedConvert('spacing', (v) => (v as num).toDouble()),
        loot: $checkedConvert('loot', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ZoneGatheringDataToJson(_ZoneGatheringData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'spacing': instance.spacing,
      'loot': instance.loot,
    };

_ZoneDangerData _$ZoneDangerDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ZoneDangerData',
      json,
      ($checkedConvert) {
        final val = _ZoneDangerData(
          openExits: $checkedConvert('open_exits', (v) => (v as num).toInt()),
          revealSeconds: $checkedConvert(
            'reveal_seconds',
            (v) => (v as num).toDouble(),
          ),
          exitRadius: $checkedConvert(
            'exit_radius',
            (v) => (v as num).toDouble(),
          ),
          countdownSeconds: $checkedConvert(
            'countdown_seconds',
            (v) => (v as num).toDouble(),
          ),
          waitSightMultiplier: $checkedConvert(
            'wait_sight_multiplier',
            (v) => (v as num).toDouble(),
          ),
          hungryDamagePerSecond: $checkedConvert(
            'hungry_damage_per_second',
            (v) => (v as num).toDouble(),
          ),
          clonesAtStart: $checkedConvert(
            'clones_at_start',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          cloneEverySeconds: $checkedConvert(
            'clone_every_seconds',
            (v) => (v as num?)?.toDouble() ?? 0.0,
          ),
          clonesMax: $checkedConvert(
            'clones_max',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'openExits': 'open_exits',
        'revealSeconds': 'reveal_seconds',
        'exitRadius': 'exit_radius',
        'countdownSeconds': 'countdown_seconds',
        'waitSightMultiplier': 'wait_sight_multiplier',
        'hungryDamagePerSecond': 'hungry_damage_per_second',
        'clonesAtStart': 'clones_at_start',
        'cloneEverySeconds': 'clone_every_seconds',
        'clonesMax': 'clones_max',
      },
    );

Map<String, dynamic> _$ZoneDangerDataToJson(_ZoneDangerData instance) =>
    <String, dynamic>{
      'open_exits': instance.openExits,
      'reveal_seconds': instance.revealSeconds,
      'exit_radius': instance.exitRadius,
      'countdown_seconds': instance.countdownSeconds,
      'wait_sight_multiplier': instance.waitSightMultiplier,
      'hungry_damage_per_second': instance.hungryDamagePerSecond,
      'clones_at_start': instance.clonesAtStart,
      'clone_every_seconds': instance.cloneEverySeconds,
      'clones_max': instance.clonesMax,
    };

_ZoneDropsData _$ZoneDropsDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ZoneDropsData',
      json,
      ($checkedConvert) {
        final val = _ZoneDropsData(
          bundleChance: $checkedConvert(
            'bundle_chance',
            (v) => (v as num).toDouble(),
          ),
          bundle: $checkedConvert('bundle', (v) => v as String),
          itemChance: $checkedConvert(
            'item_chance',
            (v) => (v as num).toDouble(),
          ),
          item: $checkedConvert('item', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'bundleChance': 'bundle_chance',
        'itemChance': 'item_chance',
      },
    );

Map<String, dynamic> _$ZoneDropsDataToJson(_ZoneDropsData instance) =>
    <String, dynamic>{
      'bundle_chance': instance.bundleChance,
      'bundle': instance.bundle,
      'item_chance': instance.itemChance,
      'item': instance.item,
    };
