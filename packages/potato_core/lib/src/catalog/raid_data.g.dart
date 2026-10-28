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
          pickupRadius: $checkedConvert(
            'pickup_radius',
            (v) => (v as num).toDouble(),
          ),
          food: $checkedConvert(
            'food',
            (v) => FoodRulesData.fromJson(v as Map<String, dynamic>),
          ),
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
          party: $checkedConvert(
            'party',
            (v) => v == null
                ? const PartyRulesData()
                : PartyRulesData.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stepMillis': 'step_millis',
        'pickupRadius': 'pickup_radius',
        'enemyAlertSeconds': 'enemy_alert_seconds',
      },
    );

Map<String, dynamic> _$RaidRulesDataToJson(_RaidRulesData instance) =>
    <String, dynamic>{
      'step_millis': instance.stepMillis,
      'player': instance.player.toJson(),
      'pickup_radius': instance.pickupRadius,
      'food': instance.food.toJson(),
      'enemy_alert_seconds': instance.enemyAlertSeconds,
      'companion': instance.companion.toJson(),
      'clones': instance.clones.toJson(),
      'party': instance.party.toJson(),
    };

_PartyRulesData _$PartyRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PartyRulesData',
      json,
      ($checkedConvert) {
        final val = _PartyRulesData(
          downSeconds: $checkedConvert(
            'down_seconds',
            (v) => (v as num?)?.toDouble() ?? 30,
          ),
          reviveSeconds: $checkedConvert(
            'revive_seconds',
            (v) => (v as num?)?.toDouble() ?? 4,
          ),
          reviveRadius: $checkedConvert(
            'revive_radius',
            (v) => (v as num?)?.toDouble() ?? 1.2,
          ),
          reviveDecay: $checkedConvert(
            'revive_decay',
            (v) => (v as num?)?.toDouble() ?? 0.5,
          ),
          revivedHp: $checkedConvert(
            'revived_hp',
            (v) => (v as num?)?.toDouble() ?? 0.3,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'downSeconds': 'down_seconds',
        'reviveSeconds': 'revive_seconds',
        'reviveRadius': 'revive_radius',
        'reviveDecay': 'revive_decay',
        'revivedHp': 'revived_hp',
      },
    );

Map<String, dynamic> _$PartyRulesDataToJson(_PartyRulesData instance) =>
    <String, dynamic>{
      'down_seconds': instance.downSeconds,
      'revive_seconds': instance.reviveSeconds,
      'revive_radius': instance.reviveRadius,
      'revive_decay': instance.reviveDecay,
      'revived_hp': instance.revivedHp,
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
          teleportDistance: $checkedConvert(
            'teleport_distance',
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
        'teleportDistance': 'teleport_distance',
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
      'teleport_distance': instance.teleportDistance,
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
          name: $checkedConvert(
            'name',
            (v) => const LocalizedTextConverter().fromJson(v as Object),
          ),
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
      'name': const LocalizedTextConverter().toJson(instance.name),
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
      boss: $checkedConvert(
        'boss',
        (v) => v == null ? null : BossData.fromJson(v as Map<String, dynamic>),
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
      'boss': instance.boss?.toJson(),
    };

const _$EnemyTemperEnumMap = {
  EnemyTemper.aggressive: 'aggressive',
  EnemyTemper.passive: 'passive',
};

const _$EnemyAttackEnumMap = {
  EnemyAttack.melee: 'melee',
  EnemyAttack.ranged: 'ranged',
};

_BossData _$BossDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_BossData',
  json,
  ($checkedConvert) {
    final val = _BossData(
      chargeEverySeconds: $checkedConvert(
        'charge_every_seconds',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      chargeTelegraphSeconds: $checkedConvert(
        'charge_telegraph_seconds',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      chargeSpeed: $checkedConvert(
        'charge_speed',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      chargeDistance: $checkedConvert(
        'charge_distance',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      chargeDamage: $checkedConvert(
        'charge_damage',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      sprayEverySeconds: $checkedConvert(
        'spray_every_seconds',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      sprayBullets: $checkedConvert(
        'spray_bullets',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      sprayDamage: $checkedConvert(
        'spray_damage',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      spraySpeed: $checkedConvert(
        'spray_speed',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      sprayRange: $checkedConvert(
        'spray_range',
        (v) => (v as num?)?.toDouble() ?? 0.0,
      ),
      jump: $checkedConvert(
        'jump',
        (v) =>
            v == null ? null : BossJumpData.fromJson(v as Map<String, dynamic>),
      ),
      burrow: $checkedConvert(
        'burrow',
        (v) => v == null
            ? null
            : BossBurrowData.fromJson(v as Map<String, dynamic>),
      ),
      clouds: $checkedConvert(
        'clouds',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => BossCloudData.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <BossCloudData>[],
      ),
      shots: $checkedConvert(
        'shots',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => BossShotData.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <BossShotData>[],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'chargeEverySeconds': 'charge_every_seconds',
    'chargeTelegraphSeconds': 'charge_telegraph_seconds',
    'chargeSpeed': 'charge_speed',
    'chargeDistance': 'charge_distance',
    'chargeDamage': 'charge_damage',
    'sprayEverySeconds': 'spray_every_seconds',
    'sprayBullets': 'spray_bullets',
    'sprayDamage': 'spray_damage',
    'spraySpeed': 'spray_speed',
    'sprayRange': 'spray_range',
  },
);

Map<String, dynamic> _$BossDataToJson(_BossData instance) => <String, dynamic>{
  'charge_every_seconds': instance.chargeEverySeconds,
  'charge_telegraph_seconds': instance.chargeTelegraphSeconds,
  'charge_speed': instance.chargeSpeed,
  'charge_distance': instance.chargeDistance,
  'charge_damage': instance.chargeDamage,
  'spray_every_seconds': instance.sprayEverySeconds,
  'spray_bullets': instance.sprayBullets,
  'spray_damage': instance.sprayDamage,
  'spray_speed': instance.spraySpeed,
  'spray_range': instance.sprayRange,
  'jump': instance.jump?.toJson(),
  'burrow': instance.burrow?.toJson(),
  'clouds': instance.clouds.map((e) => e.toJson()).toList(),
  'shots': instance.shots.map((e) => e.toJson()).toList(),
};

_BossJumpData _$BossJumpDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BossJumpData',
      json,
      ($checkedConvert) {
        final val = _BossJumpData(
          everySeconds: $checkedConvert(
            'every_seconds',
            (v) => (v as num).toDouble(),
          ),
          airSeconds: $checkedConvert(
            'air_seconds',
            (v) => (v as num).toDouble(),
          ),
          lockSeconds: $checkedConvert(
            'lock_seconds',
            (v) => (v as num?)?.toDouble() ?? 0.7,
          ),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'everySeconds': 'every_seconds',
        'airSeconds': 'air_seconds',
        'lockSeconds': 'lock_seconds',
      },
    );

Map<String, dynamic> _$BossJumpDataToJson(_BossJumpData instance) =>
    <String, dynamic>{
      'every_seconds': instance.everySeconds,
      'air_seconds': instance.airSeconds,
      'lock_seconds': instance.lockSeconds,
      'radius': instance.radius,
      'damage': instance.damage,
    };

_BossBurrowData _$BossBurrowDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BossBurrowData',
      json,
      ($checkedConvert) {
        final val = _BossBurrowData(
          everySeconds: $checkedConvert(
            'every_seconds',
            (v) => (v as num).toDouble(),
          ),
          followSeconds: $checkedConvert(
            'follow_seconds',
            (v) => (v as num).toDouble(),
          ),
          lockSeconds: $checkedConvert(
            'lock_seconds',
            (v) => (v as num?)?.toDouble() ?? 0.7,
          ),
          followUps: $checkedConvert(
            'follow_ups',
            (v) => (v as num?)?.toInt() ?? 2,
          ),
          followUpLockSeconds: $checkedConvert(
            'follow_up_lock_seconds',
            (v) => (v as num).toDouble(),
          ),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'everySeconds': 'every_seconds',
        'followSeconds': 'follow_seconds',
        'lockSeconds': 'lock_seconds',
        'followUps': 'follow_ups',
        'followUpLockSeconds': 'follow_up_lock_seconds',
      },
    );

Map<String, dynamic> _$BossBurrowDataToJson(_BossBurrowData instance) =>
    <String, dynamic>{
      'every_seconds': instance.everySeconds,
      'follow_seconds': instance.followSeconds,
      'lock_seconds': instance.lockSeconds,
      'follow_ups': instance.followUps,
      'follow_up_lock_seconds': instance.followUpLockSeconds,
      'radius': instance.radius,
      'damage': instance.damage,
    };

_BossCloudData _$BossCloudDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BossCloudData',
      json,
      ($checkedConvert) {
        final val = _BossCloudData(
          everySeconds: $checkedConvert(
            'every_seconds',
            (v) => (v as num).toDouble(),
          ),
          radius: $checkedConvert('radius', (v) => (v as num).toDouble()),
          seconds: $checkedConvert(
            'seconds',
            (v) => (v as num?)?.toDouble() ?? 3.0,
          ),
          spreadSeconds: $checkedConvert(
            'spread_seconds',
            (v) => (v as num).toDouble(),
          ),
          damagePerSecond: $checkedConvert(
            'damage_per_second',
            (v) => (v as num).toDouble(),
          ),
          fanDegrees: $checkedConvert(
            'fan_degrees',
            (v) => (v as num?)?.toDouble() ?? 0.0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'everySeconds': 'every_seconds',
        'spreadSeconds': 'spread_seconds',
        'damagePerSecond': 'damage_per_second',
        'fanDegrees': 'fan_degrees',
      },
    );

Map<String, dynamic> _$BossCloudDataToJson(_BossCloudData instance) =>
    <String, dynamic>{
      'every_seconds': instance.everySeconds,
      'radius': instance.radius,
      'seconds': instance.seconds,
      'spread_seconds': instance.spreadSeconds,
      'damage_per_second': instance.damagePerSecond,
      'fan_degrees': instance.fanDegrees,
    };

_BossShotData _$BossShotDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BossShotData',
      json,
      ($checkedConvert) {
        final val = _BossShotData(
          everySeconds: $checkedConvert(
            'every_seconds',
            (v) => (v as num).toDouble(),
          ),
          bullets: $checkedConvert('bullets', (v) => (v as num).toInt()),
          spreadDegrees: $checkedConvert(
            'spread_degrees',
            (v) => (v as num?)?.toDouble() ?? 0.0,
          ),
          damage: $checkedConvert('damage', (v) => (v as num).toDouble()),
          speed: $checkedConvert('speed', (v) => (v as num).toDouble()),
          range: $checkedConvert('range', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'everySeconds': 'every_seconds',
        'spreadDegrees': 'spread_degrees',
      },
    );

Map<String, dynamic> _$BossShotDataToJson(_BossShotData instance) =>
    <String, dynamic>{
      'every_seconds': instance.everySeconds,
      'bullets': instance.bullets,
      'spread_degrees': instance.spreadDegrees,
      'damage': instance.damage,
      'speed': instance.speed,
      'range': instance.range,
    };

_ZoneBossData _$ZoneBossDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ZoneBossData', json, ($checkedConvert) {
      final val = _ZoneBossData(
        enemy: $checkedConvert('enemy', (v) => v as String),
        loot: $checkedConvert('loot', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ZoneBossDataToJson(_ZoneBossData instance) =>
    <String, dynamic>{'enemy': instance.enemy, 'loot': instance.loot};

_ZoneData _$ZoneDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ZoneData', json, ($checkedConvert) {
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
      (v) =>
          v == null ? null : ZoneDangerData.fromJson(v as Map<String, dynamic>),
    ),
    boss: $checkedConvert(
      'boss',
      (v) =>
          v == null ? null : ZoneBossData.fromJson(v as Map<String, dynamic>),
    ),
    look: $checkedConvert('look', (v) => v as String? ?? 'grassland'),
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
  'boss': instance.boss?.toJson(),
  'look': instance.look,
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
