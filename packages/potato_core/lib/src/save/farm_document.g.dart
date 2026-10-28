// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FarmDocument _$FarmDocumentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_FarmDocument',
  json,
  ($checkedConvert) {
    final val = _FarmDocument(
      formatVersion: $checkedConvert(
        'format_version',
        (v) => (v as num).toInt(),
      ),
      tick: $checkedConvert('tick', (v) => (v as num).toInt()),
      nextId: $checkedConvert('next_id', (v) => (v as num).toInt()),
      randomState: $checkedConvert(
        'random_state',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      seeds: $checkedConvert(
        'seeds',
        (v) => (v as List<dynamic>)
            .map((e) => SeedCount.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      fields: $checkedConvert(
        'fields',
        (v) => (v as List<dynamic>)
            .map((e) => FieldDocument.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      buildings: $checkedConvert(
        'buildings',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => BuildingDocument.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const <BuildingDocument>[],
      ),
      guards: $checkedConvert(
        'guards',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => GuardDocument.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <GuardDocument>[],
      ),
      returnedSeeds: $checkedConvert(
        'returned_seeds',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Seed.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Seed>[],
      ),
      fridge: $checkedConvert(
        'fridge',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => PotatoDocument.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <PotatoDocument>[],
      ),
      away: $checkedConvert(
        'away',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => AwayDocument.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <AwayDocument>[],
      ),
      graves: $checkedConvert(
        'graves',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => PotatoDocument.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <PotatoDocument>[],
      ),
      openBlocks: $checkedConvert(
        'open_blocks',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TilePos.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      pouchSlots: $checkedConvert('pouch_slots', (v) => (v as num?)?.toInt()),
      gearSlots: $checkedConvert('gear_slots', (v) => (v as num?)?.toInt()),
      overflow: $checkedConvert(
        'overflow',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => OverflowDocument.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const <OverflowDocument>[],
      ),
      materials: $checkedConvert(
        'materials',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, (e as num).toInt()),
            ) ??
            const <String, int>{},
      ),
      mail: $checkedConvert(
        'mail',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => MailDocument.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <MailDocument>[],
      ),
      weaponLevel: $checkedConvert(
        'weapon_level',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      gear: $checkedConvert(
        'gear',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Gear.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Gear>[],
      ),
      equipped: $checkedConvert(
        'equipped',
        (v) => v == null ? null : Equipped.fromJson(v as Map<String, dynamic>),
      ),
      progress: $checkedConvert('progress', (v) => (v as num?)?.toInt() ?? 0),
      totemLimit: $checkedConvert('totem_limit', (v) => (v as num?)?.toInt()),
      totals: $checkedConvert(
        'totals',
        (v) => v as Map<String, dynamic>? ?? const <String, dynamic>{},
      ),
      storyDone: $checkedConvert(
        'story_done',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, (e as num).toInt()),
            ) ??
            const <String, int>{},
      ),
      storySkipped: $checkedConvert(
        'story_skipped',
        (v) => v as bool? ?? false,
      ),
      missingBuildings: $checkedConvert(
        'missing_buildings',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ??
            const <String>[],
      ),
      bed: $checkedConvert(
        'bed',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => e == null
                      ? null
                      : ItemStack.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const <ItemStack?>[],
      ),
      bag: $checkedConvert(
        'bag',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => e == null
                      ? null
                      : ItemStack.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const <ItemStack?>[],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'formatVersion': 'format_version',
    'nextId': 'next_id',
    'randomState': 'random_state',
    'returnedSeeds': 'returned_seeds',
    'openBlocks': 'open_blocks',
    'pouchSlots': 'pouch_slots',
    'gearSlots': 'gear_slots',
    'weaponLevel': 'weapon_level',
    'totemLimit': 'totem_limit',
    'storyDone': 'story_done',
    'storySkipped': 'story_skipped',
    'missingBuildings': 'missing_buildings',
  },
);

Map<String, dynamic> _$FarmDocumentToJson(_FarmDocument instance) =>
    <String, dynamic>{
      'format_version': instance.formatVersion,
      'tick': instance.tick,
      'next_id': instance.nextId,
      'random_state': instance.randomState,
      'food': instance.food,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'buildings': instance.buildings.map((e) => e.toJson()).toList(),
      'guards': instance.guards.map((e) => e.toJson()).toList(),
      'returned_seeds': instance.returnedSeeds.map((e) => e.toJson()).toList(),
      'fridge': instance.fridge.map((e) => e.toJson()).toList(),
      'away': instance.away.map((e) => e.toJson()).toList(),
      'graves': instance.graves.map((e) => e.toJson()).toList(),
      'open_blocks': instance.openBlocks?.map((e) => e.toJson()).toList(),
      'pouch_slots': instance.pouchSlots,
      'gear_slots': instance.gearSlots,
      'overflow': instance.overflow.map((e) => e.toJson()).toList(),
      'materials': instance.materials,
      'mail': instance.mail.map((e) => e.toJson()).toList(),
      'weapon_level': instance.weaponLevel,
      'gear': instance.gear.map((e) => e.toJson()).toList(),
      'equipped': instance.equipped?.toJson(),
      'progress': instance.progress,
      'totem_limit': instance.totemLimit,
      'totals': instance.totals,
      'story_done': instance.storyDone,
      'story_skipped': instance.storySkipped,
      'missing_buildings': instance.missingBuildings,
      'bed': instance.bed.map((e) => e?.toJson()).toList(),
      'bag': instance.bag.map((e) => e?.toJson()).toList(),
    };

_FieldDocument _$FieldDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_FieldDocument', json, ($checkedConvert) {
      final val = _FieldDocument(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        rect: $checkedConvert(
          'rect',
          (v) => TileRect.fromJson(v as Map<String, dynamic>),
        ),
        potatoes: $checkedConvert(
          'potatoes',
          (v) => (v as List<dynamic>)
              .map((e) => PotatoDocument.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        pest: $checkedConvert(
          'pest',
          (v) => v == null
              ? null
              : PestDocument.fromJson(v as Map<String, dynamic>),
        ),
        leftover: $checkedConvert('leftover', (v) => (v as num?)?.toInt() ?? 0),
        quietUntilTick: $checkedConvert(
          'quiet_until_tick',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
      );
      return val;
    }, fieldKeyMap: const {'quietUntilTick': 'quiet_until_tick'});

Map<String, dynamic> _$FieldDocumentToJson(_FieldDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rect': instance.rect.toJson(),
      'potatoes': instance.potatoes.map((e) => e.toJson()).toList(),
      'pest': instance.pest?.toJson(),
      'leftover': instance.leftover,
      'quiet_until_tick': instance.quietUntilTick,
    };

_PestDocument _$PestDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PestDocument',
      json,
      ($checkedConvert) {
        final val = _PestDocument(
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(_$PestKindEnumMap, v),
          ),
          clearedMillis: $checkedConvert(
            'cleared_millis',
            (v) => (v as num).toInt(),
          ),
          biteMillis: $checkedConvert('bite_millis', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'clearedMillis': 'cleared_millis',
        'biteMillis': 'bite_millis',
      },
    );

Map<String, dynamic> _$PestDocumentToJson(_PestDocument instance) =>
    <String, dynamic>{
      'kind': _$PestKindEnumMap[instance.kind]!,
      'cleared_millis': instance.clearedMillis,
      'bite_millis': instance.biteMillis,
    };

const _$PestKindEnumMap = {PestKind.bug: 'bug', PestKind.blight: 'blight'};

_BuildingDocument _$BuildingDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_BuildingDocument',
      json,
      ($checkedConvert) {
        final val = _BuildingDocument(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          kind: $checkedConvert('kind', (v) => v as String),
          origin: $checkedConvert(
            'origin',
            (v) => TilePos.fromJson(v as Map<String, dynamic>),
          ),
          level: $checkedConvert('level', (v) => (v as num).toInt()),
          litUntilTick: $checkedConvert(
            'lit_until_tick',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          readyTick: $checkedConvert(
            'ready_tick',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'litUntilTick': 'lit_until_tick',
        'readyTick': 'ready_tick',
      },
    );

Map<String, dynamic> _$BuildingDocumentToJson(_BuildingDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'origin': instance.origin.toJson(),
      'level': instance.level,
      'lit_until_tick': instance.litUntilTick,
      'ready_tick': instance.readyTick,
    };

_GuardDocument _$GuardDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_GuardDocument',
      json,
      ($checkedConvert) {
        final val = _GuardDocument(
          potato: $checkedConvert(
            'potato',
            (v) => PotatoDocument.fromJson(v as Map<String, dynamic>),
          ),
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          at: $checkedConvert(
            'at',
            (v) => TilePos.fromJson(v as Map<String, dynamic>),
          ),
          targetFieldId: $checkedConvert(
            'target_field_id',
            (v) => (v as num?)?.toInt(),
          ),
          harvesting: $checkedConvert('harvesting', (v) => v as bool? ?? false),
          walkTo: $checkedConvert(
            'walk_to',
            (v) =>
                v == null ? null : TilePos.fromJson(v as Map<String, dynamic>),
          ),
          walkMillis: $checkedConvert('walk_millis', (v) => (v as num).toInt()),
          walkTotalMillis: $checkedConvert(
            'walk_total_millis',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'buildingId': 'building_id',
        'targetFieldId': 'target_field_id',
        'walkTo': 'walk_to',
        'walkMillis': 'walk_millis',
        'walkTotalMillis': 'walk_total_millis',
      },
    );

Map<String, dynamic> _$GuardDocumentToJson(_GuardDocument instance) =>
    <String, dynamic>{
      'potato': instance.potato.toJson(),
      'building_id': instance.buildingId,
      'at': instance.at.toJson(),
      'target_field_id': instance.targetFieldId,
      'harvesting': instance.harvesting,
      'walk_to': instance.walkTo?.toJson(),
      'walk_millis': instance.walkMillis,
      'walk_total_millis': instance.walkTotalMillis,
    };

_AwayDocument _$AwayDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AwayDocument', json, ($checkedConvert) {
      final val = _AwayDocument(
        potato: $checkedConvert(
          'potato',
          (v) => PotatoDocument.fromJson(v as Map<String, dynamic>),
        ),
        fieldId: $checkedConvert('field_id', (v) => (v as num?)?.toInt()),
        buildingId: $checkedConvert('building_id', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', 'buildingId': 'building_id'});

Map<String, dynamic> _$AwayDocumentToJson(_AwayDocument instance) =>
    <String, dynamic>{
      'potato': instance.potato.toJson(),
      'field_id': instance.fieldId,
      'building_id': instance.buildingId,
    };

_PotatoDocument _$PotatoDocumentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_PotatoDocument',
  json,
  ($checkedConvert) {
    final val = _PotatoDocument(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => v == null ? null : TilePos.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert('type', (v) => $enumDecode(_$PotatoTypeEnumMap, v)),
      grade: $checkedConvert('grade', (v) => $enumDecode(_$GradeEnumMap, v)),
      level: $checkedConvert('level', (v) => (v as num).toInt()),
      abilities: $checkedConvert(
        'abilities',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      style: $checkedConvert(
        'style',
        (v) => $enumDecodeNullable(_$CombatStyleEnumMap, v),
      ),
      grownMillis: $checkedConvert('grown_millis', (v) => (v as num).toInt()),
      livedMillis: $checkedConvert('lived_millis', (v) => (v as num).toInt()),
      productionMillis: $checkedConvert(
        'production_millis',
        (v) => (v as num).toInt(),
      ),
      stored: $checkedConvert('stored', (v) => (v as num).toInt()),
      seeds: $checkedConvert(
        'seeds',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Seed.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Seed>[],
      ),
      weak: $checkedConvert('weak', (v) => v as bool? ?? false),
    );
    return val;
  },
  fieldKeyMap: const {
    'grownMillis': 'grown_millis',
    'livedMillis': 'lived_millis',
    'productionMillis': 'production_millis',
  },
);

Map<String, dynamic> _$PotatoDocumentToJson(_PotatoDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tile': instance.tile?.toJson(),
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'grade': _$GradeEnumMap[instance.grade]!,
      'level': instance.level,
      'abilities': instance.abilities,
      'style': _$CombatStyleEnumMap[instance.style],
      'grown_millis': instance.grownMillis,
      'lived_millis': instance.livedMillis,
      'production_millis': instance.productionMillis,
      'stored': instance.stored,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'weak': instance.weak,
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

_OverflowDocument _$OverflowDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OverflowDocument', json, ($checkedConvert) {
      final val = _OverflowDocument(
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        expiresTick: $checkedConvert('expires_tick', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'expiresTick': 'expires_tick'});

Map<String, dynamic> _$OverflowDocumentToJson(_OverflowDocument instance) =>
    <String, dynamic>{
      'seed': instance.seed.toJson(),
      'expires_tick': instance.expiresTick,
    };

_MailDocument _$MailDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MailDocument', json, ($checkedConvert) {
      final val = _MailDocument(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        kind: $checkedConvert('kind', (v) => $enumDecode(_$MailKindEnumMap, v)),
        tick: $checkedConvert('tick', (v) => (v as num).toInt()),
        building: $checkedConvert('building', (v) => v as String?),
        story: $checkedConvert('story', (v) => v as String?),
        seeds: $checkedConvert(
          'seeds',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => Seed.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const <Seed>[],
        ),
        food: $checkedConvert('food', (v) => (v as num?)?.toInt() ?? 0),
        read: $checkedConvert('read', (v) => v as bool? ?? false),
        claimed: $checkedConvert('claimed', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$MailDocumentToJson(_MailDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$MailKindEnumMap[instance.kind]!,
      'tick': instance.tick,
      'building': instance.building,
      'story': instance.story,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'food': instance.food,
      'read': instance.read,
      'claimed': instance.claimed,
    };

const _$MailKindEnumMap = {
  MailKind.start: 'start',
  MailKind.building: 'building',
  MailKind.story: 'story',
};
