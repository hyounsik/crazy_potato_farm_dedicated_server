// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RulesData _$RulesDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_RulesData',
  json,
  ($checkedConvert) {
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
      storage: $checkedConvert(
        'storage',
        (v) => StorageRulesData.fromJson(v as Map<String, dynamic>),
      ),
      mail: $checkedConvert(
        'mail',
        (v) => MailRulesData.fromJson(v as Map<String, dynamic>),
      ),
      workbench: $checkedConvert(
        'workbench',
        (v) => WorkbenchRulesData.fromJson(v as Map<String, dynamic>),
      ),
      totems: $checkedConvert(
        'totems',
        (v) => TotemRulesData.fromJson(v as Map<String, dynamic>),
      ),
      breeding: $checkedConvert(
        'breeding',
        (v) => BreedingRulesData.fromJson(v as Map<String, dynamic>),
      ),
      gear: $checkedConvert(
        'gear',
        (v) => GearRulesData.fromJson(v as Map<String, dynamic>),
      ),
      combatPower: $checkedConvert(
        'combat_power',
        (v) => CombatPowerRulesData.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'newFarm': 'new_farm', 'combatPower': 'combat_power'},
);

Map<String, dynamic> _$RulesDataToJson(_RulesData instance) =>
    <String, dynamic>{
      'farm': instance.farm.toJson(),
      'potatoes': instance.potatoes.toJson(),
      'pests': instance.pests.toJson(),
      'new_farm': instance.newFarm.toJson(),
      'raid': instance.raid.toJson(),
      'storage': instance.storage.toJson(),
      'mail': instance.mail.toJson(),
      'workbench': instance.workbench.toJson(),
      'totems': instance.totems.toJson(),
      'breeding': instance.breeding.toJson(),
      'gear': instance.gear.toJson(),
      'combat_power': instance.combatPower.toJson(),
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
          fieldFood: $checkedConvert('field_food', (v) => (v as num).toInt()),
          fieldTileFood: $checkedConvert(
            'field_tile_food',
            (v) => (v as num).toInt(),
          ),
          openArea: $checkedConvert(
            'open_area',
            (v) => TileRect.fromJson(v as Map<String, dynamic>),
          ),
          blockSize: $checkedConvert('block_size', (v) => (v as num).toInt()),
          blockFood: $checkedConvert('block_food', (v) => (v as num).toInt()),
          blockStepFood: $checkedConvert(
            'block_step_food',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stepMillis': 'step_millis',
        'offlineCapMinutes': 'offline_cap_minutes',
        'fieldMaxSize': 'field_max_size',
        'fieldFood': 'field_food',
        'fieldTileFood': 'field_tile_food',
        'openArea': 'open_area',
        'blockSize': 'block_size',
        'blockFood': 'block_food',
        'blockStepFood': 'block_step_food',
      },
    );

Map<String, dynamic> _$FarmRulesDataToJson(_FarmRulesData instance) =>
    <String, dynamic>{
      'step_millis': instance.stepMillis,
      'offline_cap_minutes': instance.offlineCapMinutes,
      'size': instance.size,
      'field_max_size': instance.fieldMaxSize,
      'field_food': instance.fieldFood,
      'field_tile_food': instance.fieldTileFood,
      'open_area': instance.openArea.toJson(),
      'block_size': instance.blockSize,
      'block_food': instance.blockFood,
      'block_step_food': instance.blockStepFood,
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
          reviveFood: $checkedConvert(
            'revive_food',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
            ),
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
          harvestRareChance: $checkedConvert(
            'harvest_rare_chance',
            (v) => (v as num).toDouble(),
          ),
          level: $checkedConvert(
            'level',
            (v) => LevelRulesData.fromJson(v as Map<String, dynamic>),
          ),
          combatStyles: $checkedConvert(
            'combat_styles',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                $enumDecode(_$CombatStyleEnumMap, k),
                CombatStyleData.fromJson(e as Map<String, dynamic>),
              ),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'gradeDropChance': 'grade_drop_chance',
        'reviveFood': 'revive_food',
        'upkeepEverySeconds': 'upkeep_every_seconds',
        'weakPercent': 'weak_percent',
        'breedingGradeUpChance': 'breeding_grade_up_chance',
        'harvestRareChance': 'harvest_rare_chance',
        'combatStyles': 'combat_styles',
      },
    );

Map<String, dynamic> _$PotatoRulesDataToJson(_PotatoRulesData instance) =>
    <String, dynamic>{
      'grade_drop_chance': instance.gradeDropChance,
      'revive_food': instance.reviveFood.map(
        (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
      ),
      'upkeep_every_seconds': instance.upkeepEverySeconds,
      'weak_percent': instance.weakPercent,
      'breeding_grade_up_chance': instance.breedingGradeUpChance,
      'guards': instance.guards.toJson(),
      'fridge': instance.fridge.toJson(),
      'harvest_rare_chance': instance.harvestRareChance,
      'level': instance.level.toJson(),
      'combat_styles': instance.combatStyles.map(
        (k, e) => MapEntry(_$CombatStyleEnumMap[k]!, e.toJson()),
      ),
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

_LevelRulesData _$LevelRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_LevelRulesData',
      json,
      ($checkedConvert) {
        final val = _LevelRulesData(
          foodYieldPermille: $checkedConvert(
            'food_yield_permille',
            (v) => (v as num).toInt(),
          ),
          gradeUpChancePermille: $checkedConvert(
            'grade_up_chance_permille',
            (v) => (v as num).toInt(),
          ),
          upkeepPermille: $checkedConvert(
            'upkeep_permille',
            (v) => (v as num).toInt(),
          ),
          buffPowerPermille: $checkedConvert(
            'buff_power_permille',
            (v) => (v as num).toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'foodYieldPermille': 'food_yield_permille',
        'gradeUpChancePermille': 'grade_up_chance_permille',
        'upkeepPermille': 'upkeep_permille',
        'buffPowerPermille': 'buff_power_permille',
      },
    );

Map<String, dynamic> _$LevelRulesDataToJson(_LevelRulesData instance) =>
    <String, dynamic>{
      'food_yield_permille': instance.foodYieldPermille,
      'grade_up_chance_permille': instance.gradeUpChancePermille,
      'upkeep_permille': instance.upkeepPermille,
      'buff_power_permille': instance.buffPowerPermille,
    };

_CombatStyleData _$CombatStyleDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CombatStyleData', json, ($checkedConvert) {
      final val = _CombatStyleData(
        walkPercent: $checkedConvert('walk_percent', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'walkPercent': 'walk_percent'});

Map<String, dynamic> _$CombatStyleDataToJson(_CombatStyleData instance) =>
    <String, dynamic>{'walk_percent': instance.walkPercent};

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
        agingPercent: $checkedConvert(
          'aging_percent',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'agingPercent': 'aging_percent'});

Map<String, dynamic> _$FridgeRulesDataToJson(_FridgeRulesData instance) =>
    <String, dynamic>{'aging_percent': instance.agingPercent};

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
      storedPerBug: $checkedConvert(
        'stored_per_bug',
        (v) => (v as num).toInt(),
      ),
      quietSeconds: $checkedConvert('quiet_seconds', (v) => (v as num).toInt()),
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
    'storedPerBug': 'stored_per_bug',
    'quietSeconds': 'quiet_seconds',
    'eatEverySeconds': 'eat_every_seconds',
    'eatAmount': 'eat_amount',
    'clearSeconds': 'clear_seconds',
  },
);

Map<String, dynamic> _$BugRulesDataToJson(_BugRulesData instance) =>
    <String, dynamic>{
      'stored_per_bug': instance.storedPerBug,
      'quiet_seconds': instance.quietSeconds,
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

_StorageRulesData _$StorageRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_StorageRulesData',
      json,
      ($checkedConvert) {
        final val = _StorageRulesData(
          pouchSlots: $checkedConvert('pouch_slots', (v) => (v as num).toInt()),
          pouchStep: $checkedConvert('pouch_step', (v) => (v as num).toInt()),
          pouchStepFood: $checkedConvert(
            'pouch_step_food',
            (v) => (v as num).toInt(),
          ),
          pouchMax: $checkedConvert('pouch_max', (v) => (v as num).toInt()),
          gearSlots: $checkedConvert('gear_slots', (v) => (v as num).toInt()),
          gearStep: $checkedConvert('gear_step', (v) => (v as num).toInt()),
          gearStepFood: $checkedConvert(
            'gear_step_food',
            (v) => (v as num).toInt(),
          ),
          gearMax: $checkedConvert('gear_max', (v) => (v as num).toInt()),
          overflowSeconds: $checkedConvert(
            'overflow_seconds',
            (v) => (v as num).toInt(),
          ),
          seedFood: $checkedConvert(
            'seed_food',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'pouchSlots': 'pouch_slots',
        'pouchStep': 'pouch_step',
        'pouchStepFood': 'pouch_step_food',
        'pouchMax': 'pouch_max',
        'gearSlots': 'gear_slots',
        'gearStep': 'gear_step',
        'gearStepFood': 'gear_step_food',
        'gearMax': 'gear_max',
        'overflowSeconds': 'overflow_seconds',
        'seedFood': 'seed_food',
      },
    );

Map<String, dynamic> _$StorageRulesDataToJson(
  _StorageRulesData instance,
) => <String, dynamic>{
  'pouch_slots': instance.pouchSlots,
  'pouch_step': instance.pouchStep,
  'pouch_step_food': instance.pouchStepFood,
  'pouch_max': instance.pouchMax,
  'gear_slots': instance.gearSlots,
  'gear_step': instance.gearStep,
  'gear_step_food': instance.gearStepFood,
  'gear_max': instance.gearMax,
  'overflow_seconds': instance.overflowSeconds,
  'seed_food': instance.seedFood.map((k, e) => MapEntry(_$GradeEnumMap[k]!, e)),
};

_WorkbenchRulesData _$WorkbenchRulesDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_WorkbenchRulesData',
  json,
  ($checkedConvert) {
    final val = _WorkbenchRulesData(
      maxLevel: $checkedConvert('max_level', (v) => (v as num).toInt()),
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      foodStep: $checkedConvert('food_step', (v) => (v as num).toInt()),
      material: $checkedConvert('material', (v) => v as String),
      materials: $checkedConvert('materials', (v) => (v as num).toInt()),
      materialsStep: $checkedConvert(
        'materials_step',
        (v) => (v as num).toInt(),
      ),
      chance: $checkedConvert('chance', (v) => (v as num).toDouble()),
      chanceStep: $checkedConvert('chance_step', (v) => (v as num).toDouble()),
      minChance: $checkedConvert('min_chance', (v) => (v as num).toDouble()),
      damagePercent: $checkedConvert(
        'damage_percent',
        (v) => (v as num).toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxLevel': 'max_level',
    'foodStep': 'food_step',
    'materialsStep': 'materials_step',
    'chanceStep': 'chance_step',
    'minChance': 'min_chance',
    'damagePercent': 'damage_percent',
  },
);

Map<String, dynamic> _$WorkbenchRulesDataToJson(_WorkbenchRulesData instance) =>
    <String, dynamic>{
      'max_level': instance.maxLevel,
      'food': instance.food,
      'food_step': instance.foodStep,
      'material': instance.material,
      'materials': instance.materials,
      'materials_step': instance.materialsStep,
      'chance': instance.chance,
      'chance_step': instance.chanceStep,
      'min_chance': instance.minChance,
      'damage_percent': instance.damagePercent,
    };

_GearRulesData _$GearRulesDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_GearRulesData',
  json,
  ($checkedConvert) {
    final val = _GearRulesData(
      bareWeapon: $checkedConvert('bare_weapon', (v) => v as String),
      bareBagSlots: $checkedConvert(
        'bare_bag_slots',
        (v) => (v as num).toInt(),
      ),
      bareBeltSlots: $checkedConvert(
        'bare_belt_slots',
        (v) => (v as num).toInt(),
      ),
      gradeDamage: $checkedConvert(
        'grade_damage',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toDouble()),
        ),
      ),
      levelDamagePermille: $checkedConvert(
        'level_damage_permille',
        (v) => (v as num).toInt(),
      ),
      bagSlots: $checkedConvert(
        'bag_slots',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
        ),
      ),
      bagEnhanceSlots: $checkedConvert(
        'bag_enhance_slots',
        (v) => (v as num).toInt(),
      ),
      beltSlots: $checkedConvert(
        'belt_slots',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
        ),
      ),
      beltPercent: $checkedConvert(
        'belt_percent',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toDouble()),
        ),
      ),
      beltPercentPerTenLevels: $checkedConvert(
        'belt_percent_per_ten_levels',
        (v) => (v as num).toDouble(),
      ),
      beltEnhancePercent: $checkedConvert(
        'belt_enhance_percent',
        (v) => (v as num).toDouble(),
      ),
      disassemble: $checkedConvert(
        'disassemble',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$GradeEnumMap, k), (e as num).toInt()),
        ),
      ),
      enhanceRefundPercent: $checkedConvert(
        'enhance_refund_percent',
        (v) => (v as num).toInt(),
      ),
      lossChance: $checkedConvert('loss_chance', (v) => (v as num).toDouble()),
      useMargin: $checkedConvert('use_margin', (v) => (v as num).toInt()),
      start: $checkedConvert(
        'start',
        (v) => Equipped.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'bareWeapon': 'bare_weapon',
    'bareBagSlots': 'bare_bag_slots',
    'bareBeltSlots': 'bare_belt_slots',
    'gradeDamage': 'grade_damage',
    'levelDamagePermille': 'level_damage_permille',
    'bagSlots': 'bag_slots',
    'bagEnhanceSlots': 'bag_enhance_slots',
    'beltSlots': 'belt_slots',
    'beltPercent': 'belt_percent',
    'beltPercentPerTenLevels': 'belt_percent_per_ten_levels',
    'beltEnhancePercent': 'belt_enhance_percent',
    'enhanceRefundPercent': 'enhance_refund_percent',
    'lossChance': 'loss_chance',
    'useMargin': 'use_margin',
  },
);

Map<String, dynamic> _$GearRulesDataToJson(
  _GearRulesData instance,
) => <String, dynamic>{
  'bare_weapon': instance.bareWeapon,
  'bare_bag_slots': instance.bareBagSlots,
  'bare_belt_slots': instance.bareBeltSlots,
  'grade_damage': instance.gradeDamage.map(
    (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
  ),
  'level_damage_permille': instance.levelDamagePermille,
  'bag_slots': instance.bagSlots.map((k, e) => MapEntry(_$GradeEnumMap[k]!, e)),
  'bag_enhance_slots': instance.bagEnhanceSlots,
  'belt_slots': instance.beltSlots.map(
    (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
  ),
  'belt_percent': instance.beltPercent.map(
    (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
  ),
  'belt_percent_per_ten_levels': instance.beltPercentPerTenLevels,
  'belt_enhance_percent': instance.beltEnhancePercent,
  'disassemble': instance.disassemble.map(
    (k, e) => MapEntry(_$GradeEnumMap[k]!, e),
  ),
  'enhance_refund_percent': instance.enhanceRefundPercent,
  'loss_chance': instance.lossChance,
  'use_margin': instance.useMargin,
  'start': instance.start.toJson(),
};

_CombatPowerRulesData _$CombatPowerRulesDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CombatPowerRulesData',
  json,
  ($checkedConvert) {
    final val = _CombatPowerRulesData(
      weaponDps: $checkedConvert('weapon_dps', (v) => (v as num).toDouble()),
      potatoHp: $checkedConvert('potato_hp', (v) => (v as num).toDouble()),
      potatoDps: $checkedConvert('potato_dps', (v) => (v as num).toDouble()),
      helper: $checkedConvert('helper', (v) => (v as num).toDouble()),
      recommendedBase: $checkedConvert(
        'recommended_base',
        (v) => (v as num).toDouble(),
      ),
      recommendedPerScore: $checkedConvert(
        'recommended_per_score',
        (v) => (v as num).toDouble(),
      ),
      easyRatio: $checkedConvert('easy_ratio', (v) => (v as num).toDouble()),
      fairRatio: $checkedConvert('fair_ratio', (v) => (v as num).toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'weaponDps': 'weapon_dps',
    'potatoHp': 'potato_hp',
    'potatoDps': 'potato_dps',
    'recommendedBase': 'recommended_base',
    'recommendedPerScore': 'recommended_per_score',
    'easyRatio': 'easy_ratio',
    'fairRatio': 'fair_ratio',
  },
);

Map<String, dynamic> _$CombatPowerRulesDataToJson(
  _CombatPowerRulesData instance,
) => <String, dynamic>{
  'weapon_dps': instance.weaponDps,
  'potato_hp': instance.potatoHp,
  'potato_dps': instance.potatoDps,
  'helper': instance.helper,
  'recommended_base': instance.recommendedBase,
  'recommended_per_score': instance.recommendedPerScore,
  'easy_ratio': instance.easyRatio,
  'fair_ratio': instance.fairRatio,
};

_BreedingRulesData _$BreedingRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BreedingRulesData',
      json,
      ($checkedConvert) {
        final val = _BreedingRulesData(
          seedEverySeconds: $checkedConvert(
            'seed_every_seconds',
            (v) => (v as num).toInt(),
          ),
          storeMax: $checkedConvert('store_max', (v) => (v as num?)?.toInt()),
          typeWeights: $checkedConvert(
            'type_weights',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                $enumDecode(_$PotatoTypeEnumMap, k),
                (e as num).toInt(),
              ),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'seedEverySeconds': 'seed_every_seconds',
        'storeMax': 'store_max',
        'typeWeights': 'type_weights',
      },
    );

Map<String, dynamic> _$BreedingRulesDataToJson(_BreedingRulesData instance) =>
    <String, dynamic>{
      'seed_every_seconds': instance.seedEverySeconds,
      'store_max': instance.storeMax,
      'type_weights': instance.typeWeights.map(
        (k, e) => MapEntry(_$PotatoTypeEnumMap[k]!, e),
      ),
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

_TotemRulesData _$TotemRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TotemRulesData',
      json,
      ($checkedConvert) {
        final val = _TotemRulesData(
          startLimit: $checkedConvert('start_limit', (v) => (v as num).toInt()),
          limitStepFood: $checkedConvert(
            'limit_step_food',
            (v) => (v as num).toInt(),
          ),
          maxLimit: $checkedConvert('max_limit', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'startLimit': 'start_limit',
        'limitStepFood': 'limit_step_food',
        'maxLimit': 'max_limit',
      },
    );

Map<String, dynamic> _$TotemRulesDataToJson(_TotemRulesData instance) =>
    <String, dynamic>{
      'start_limit': instance.startLimit,
      'limit_step_food': instance.limitStepFood,
      'max_limit': instance.maxLimit,
    };

_MailRulesData _$MailRulesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MailRulesData', json, ($checkedConvert) {
      final val = _MailRulesData(
        keep: $checkedConvert('keep', (v) => (v as num).toInt()),
        buildingSeedLevel: $checkedConvert(
          'building_seed_level',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'buildingSeedLevel': 'building_seed_level'});

Map<String, dynamic> _$MailRulesDataToJson(_MailRulesData instance) =>
    <String, dynamic>{
      'keep': instance.keep,
      'building_seed_level': instance.buildingSeedLevel,
    };

_StartBuildingData _$StartBuildingDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StartBuildingData', json, ($checkedConvert) {
      final val = _StartBuildingData(
        kind: $checkedConvert('kind', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StartBuildingDataToJson(_StartBuildingData instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'origin': instance.origin.toJson(),
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
        buildings: $checkedConvert(
          'buildings',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        StartBuildingData.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const <StartBuildingData>[],
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
      'buildings': instance.buildings.map((e) => e.toJson()).toList(),
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
        level: $checkedConvert('level', (v) => (v as num).toInt()),
        ability: $checkedConvert('ability', (v) => v as String?),
        style: $checkedConvert(
          'style',
          (v) => $enumDecodeNullable(_$CombatStyleEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SeedStackDataToJson(_SeedStackData instance) =>
    <String, dynamic>{
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grade': _$GradeEnumMap[instance.grade]!,
      'count': instance.count,
      'level': instance.level,
      'ability': instance.ability,
      'style': _$CombatStyleEnumMap[instance.style],
    };
