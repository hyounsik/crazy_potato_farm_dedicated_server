// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PotatoPlanted _$PotatoPlantedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PotatoPlanted',
      json,
      ($checkedConvert) {
        final val = PotatoPlanted(
          fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
          tile: $checkedConvert(
            'tile',
            (v) => TilePos.fromJson(v as Map<String, dynamic>),
          ),
          potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
          seed: $checkedConvert(
            'seed',
            (v) => Seed.fromJson(v as Map<String, dynamic>),
          ),
          gradeUp: $checkedConvert('grade_up', (v) => v as bool? ?? false),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'fieldId': 'field_id',
        'potatoId': 'potato_id',
        'gradeUp': 'grade_up',
        r'$type': 'runtimeType',
      },
    );

Map<String, dynamic> _$PotatoPlantedToJson(PotatoPlanted instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile.toJson(),
      'potato_id': instance.potatoId,
      'seed': instance.seed.toJson(),
      'grade_up': instance.gradeUp,
      'runtimeType': instance.$type,
    };

PotatoGrown _$PotatoGrownFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PotatoGrown',
  json,
  ($checkedConvert) {
    final val = PotatoGrown(
      fieldId: $checkedConvert('field_id', (v) => (v as num?)?.toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => v == null ? null : TilePos.fromJson(v as Map<String, dynamic>),
      ),
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fieldId': 'field_id',
    'potatoId': 'potato_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$PotatoGrownToJson(PotatoGrown instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile?.toJson(),
      'potato_id': instance.potatoId,
      'runtimeType': instance.$type,
    };

PotatoDied _$PotatoDiedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PotatoDied',
  json,
  ($checkedConvert) {
    final val = PotatoDied(
      fieldId: $checkedConvert('field_id', (v) => (v as num?)?.toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => v == null ? null : TilePos.fromJson(v as Map<String, dynamic>),
      ),
      at: $checkedConvert(
        'at',
        (v) => v == null ? null : TilePos.fromJson(v as Map<String, dynamic>),
      ),
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      type: $checkedConvert('type', (v) => $enumDecode(_$PotatoTypeEnumMap, v)),
      buried: $checkedConvert('buried', (v) => v as bool),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fieldId': 'field_id',
    'potatoId': 'potato_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$PotatoDiedToJson(PotatoDied instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile?.toJson(),
      'at': instance.at?.toJson(),
      'potato_id': instance.potatoId,
      'type': _$PotatoTypeEnumMap[instance.type]!,
      'buried': instance.buried,
      'runtimeType': instance.$type,
    };

const _$PotatoTypeEnumMap = {
  PotatoType.food: 'food',
  PotatoType.combat: 'combat',
  PotatoType.breeding: 'breeding',
  PotatoType.buff: 'buff',
};

GraveLost _$GraveLostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GraveLost', json, ($checkedConvert) {
      final val = GraveLost(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$GraveLostToJson(GraveLost instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'runtimeType': instance.$type,
};

PotatoRevived _$PotatoRevivedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PotatoRevived', json, ($checkedConvert) {
      final val = PotatoRevived(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        from: $checkedConvert('from', (v) => $enumDecode(_$GradeEnumMap, v)),
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PotatoRevivedToJson(PotatoRevived instance) =>
    <String, dynamic>{
      'potato_id': instance.potatoId,
      'from': _$GradeEnumMap[instance.from]!,
      'seed': instance.seed.toJson(),
      'runtimeType': instance.$type,
    };

const _$GradeEnumMap = {
  Grade.normal: 'normal',
  Grade.rare: 'rare',
  Grade.legendary: 'legendary',
};

FieldMade _$FieldMadeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FieldMade', json, ($checkedConvert) {
      final val = FieldMade(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        rect: $checkedConvert(
          'rect',
          (v) => TileRect.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$FieldMadeToJson(FieldMade instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'rect': instance.rect.toJson(),
  'runtimeType': instance.$type,
};

BuildingBuilt _$BuildingBuiltFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BuildingBuilt',
      json,
      ($checkedConvert) {
        final val = BuildingBuilt(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          kind: $checkedConvert('kind', (v) => v as String),
          origin: $checkedConvert(
            'origin',
            (v) => TilePos.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$BuildingBuiltToJson(BuildingBuilt instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'kind': instance.kind,
      'origin': instance.origin.toJson(),
      'runtimeType': instance.$type,
    };

BuildingUpgraded _$BuildingUpgradedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BuildingUpgraded',
      json,
      ($checkedConvert) {
        final val = BuildingUpgraded(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          level: $checkedConvert('level', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$BuildingUpgradedToJson(BuildingUpgraded instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'level': instance.level,
      'runtimeType': instance.$type,
    };

BuildingDemolished _$BuildingDemolishedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BuildingDemolished',
      json,
      ($checkedConvert) {
        final val = BuildingDemolished(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          toFridge: $checkedConvert(
            'to_fridge',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => (e as num).toInt())
                    .toList() ??
                const <int>[],
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'buildingId': 'building_id',
        'toFridge': 'to_fridge',
        r'$type': 'runtimeType',
      },
    );

Map<String, dynamic> _$BuildingDemolishedToJson(BuildingDemolished instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'to_fridge': instance.toFridge,
      'runtimeType': instance.$type,
    };

SeedTrained _$SeedTrainedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'SeedTrained',
  json,
  ($checkedConvert) {
    final val = SeedTrained(
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      seed: $checkedConvert(
        'seed',
        (v) => Seed.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'buildingId': 'building_id',
    'potatoId': 'potato_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$SeedTrainedToJson(SeedTrained instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'potato_id': instance.potatoId,
      'seed': instance.seed.toJson(),
      'runtimeType': instance.$type,
    };

PestAppeared _$PestAppearedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PestAppeared', json, ($checkedConvert) {
      final val = PestAppeared(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        kind: $checkedConvert('kind', (v) => $enumDecode(_$PestKindEnumMap, v)),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PestAppearedToJson(PestAppeared instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'kind': _$PestKindEnumMap[instance.kind]!,
      'runtimeType': instance.$type,
    };

const _$PestKindEnumMap = {PestKind.bug: 'bug', PestKind.blight: 'blight'};

PestCleared _$PestClearedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PestCleared',
  json,
  ($checkedConvert) {
    final val = PestCleared(
      fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
      kind: $checkedConvert('kind', (v) => $enumDecode(_$PestKindEnumMap, v)),
      byTap: $checkedConvert('by_tap', (v) => v as bool),
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      seed: $checkedConvert(
        'seed',
        (v) => v == null ? null : Seed.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fieldId': 'field_id',
    'byTap': 'by_tap',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$PestClearedToJson(PestCleared instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'kind': _$PestKindEnumMap[instance.kind]!,
      'by_tap': instance.byTap,
      'food': instance.food,
      'seed': instance.seed?.toJson(),
      'runtimeType': instance.$type,
    };

PotatoesWeakened _$PotatoesWeakenedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PotatoesWeakened', json, ($checkedConvert) {
      final val = PotatoesWeakened(
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$PotatoesWeakenedToJson(PotatoesWeakened instance) =>
    <String, dynamic>{
      'potato_ids': instance.potatoIds,
      'runtimeType': instance.$type,
    };

PotatoesRecovered _$PotatoesRecoveredFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PotatoesRecovered', json, ($checkedConvert) {
      final val = PotatoesRecovered(
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$PotatoesRecoveredToJson(PotatoesRecovered instance) =>
    <String, dynamic>{
      'potato_ids': instance.potatoIds,
      'runtimeType': instance.$type,
    };

PotatoUprooted _$PotatoUprootedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PotatoUprooted', json, ($checkedConvert) {
      final val = PotatoUprooted(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PotatoUprootedToJson(PotatoUprooted instance) =>
    <String, dynamic>{
      'potato_id': instance.potatoId,
      'runtimeType': instance.$type,
    };

PotatoTakenOut _$PotatoTakenOutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PotatoTakenOut', json, ($checkedConvert) {
      final val = PotatoTakenOut(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PotatoTakenOutToJson(PotatoTakenOut instance) =>
    <String, dynamic>{
      'potato_id': instance.potatoId,
      'runtimeType': instance.$type,
    };

FoodHarvested _$FoodHarvestedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FoodHarvested', json, ($checkedConvert) {
      final val = FoodHarvested(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        seed: $checkedConvert(
          'seed',
          (v) => v == null ? null : Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$FoodHarvestedToJson(FoodHarvested instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'food': instance.food,
      'seed': instance.seed?.toJson(),
      'runtimeType': instance.$type,
    };

Departed _$DepartedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Departed', json, ($checkedConvert) {
      final val = Departed(
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$DepartedToJson(Departed instance) => <String, dynamic>{
  'food': instance.food,
  'potato_ids': instance.potatoIds,
  'runtimeType': instance.$type,
};

Returned _$ReturnedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Returned',
  json,
  ($checkedConvert) {
    final val = Returned(
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      seeds: $checkedConvert('seeds', (v) => (v as num).toInt()),
      potatoIds: $checkedConvert(
        'potato_ids',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      toFridge: $checkedConvert(
        'to_fridge',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            const <int>[],
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoIds': 'potato_ids',
    'toFridge': 'to_fridge',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$ReturnedToJson(Returned instance) => <String, dynamic>{
  'food': instance.food,
  'seeds': instance.seeds,
  'potato_ids': instance.potatoIds,
  'to_fridge': instance.toFridge,
  'runtimeType': instance.$type,
};
