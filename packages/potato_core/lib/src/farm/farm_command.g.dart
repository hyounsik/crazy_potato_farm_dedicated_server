// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSeed _$PlantSeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PlantSeed', json, ($checkedConvert) {
      final val = PlantSeed(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        tile: $checkedConvert(
          'tile',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        seed: $checkedConvert(
          'seed',
          (v) => Seed.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$PlantSeedToJson(PlantSeed instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'tile': instance.tile.toJson(),
  'seed': instance.seed.toJson(),
  'runtimeType': instance.$type,
};

HarvestPotato _$HarvestPotatoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HarvestPotato', json, ($checkedConvert) {
      final val = HarvestPotato(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        tile: $checkedConvert(
          'tile',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$HarvestPotatoToJson(HarvestPotato instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile.toJson(),
      'runtimeType': instance.$type,
    };

HarvestField _$HarvestFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HarvestField', json, ($checkedConvert) {
      final val = HarvestField(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$HarvestFieldToJson(HarvestField instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'runtimeType': instance.$type,
    };

BuildBuilding _$BuildBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BuildBuilding', json, ($checkedConvert) {
      final val = BuildBuilding(
        kind: $checkedConvert('kind', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {r'$type': 'runtimeType'});

Map<String, dynamic> _$BuildBuildingToJson(BuildBuilding instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'origin': instance.origin.toJson(),
      'runtimeType': instance.$type,
    };

UpgradeBuilding _$UpgradeBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpgradeBuilding',
      json,
      ($checkedConvert) {
        final val = UpgradeBuilding(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$UpgradeBuildingToJson(UpgradeBuilding instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

DemolishBuilding _$DemolishBuildingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DemolishBuilding',
      json,
      ($checkedConvert) {
        final val = DemolishBuilding(
          buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$DemolishBuildingToJson(DemolishBuilding instance) =>
    <String, dynamic>{
      'building_id': instance.buildingId,
      'runtimeType': instance.$type,
    };

TrainSeed _$TrainSeedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TrainSeed',
  json,
  ($checkedConvert) {
    final val = TrainSeed(
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      seed: $checkedConvert(
        'seed',
        (v) => Seed.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'buildingId': 'building_id', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$TrainSeedToJson(TrainSeed instance) => <String, dynamic>{
  'building_id': instance.buildingId,
  'seed': instance.seed.toJson(),
  'runtimeType': instance.$type,
};

ClearPest _$ClearPestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClearPest', json, ($checkedConvert) {
      final val = ClearPest(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$ClearPestToJson(ClearPest instance) => <String, dynamic>{
  'field_id': instance.fieldId,
  'runtimeType': instance.$type,
};

Uproot _$UprootFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Uproot', json, ($checkedConvert) {
      final val = Uproot(
        potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoId': 'potato_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$UprootToJson(Uproot instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'runtimeType': instance.$type,
};

Replant _$ReplantFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Replant',
  json,
  ($checkedConvert) {
    final val = Replant(
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoId': 'potato_id',
    'fieldId': 'field_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$ReplantToJson(Replant instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'field_id': instance.fieldId,
  'tile': instance.tile.toJson(),
  'runtimeType': instance.$type,
};

Retrain _$RetrainFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Retrain',
  json,
  ($checkedConvert) {
    final val = Retrain(
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      buildingId: $checkedConvert('building_id', (v) => (v as num).toInt()),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'potatoId': 'potato_id',
    'buildingId': 'building_id',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$RetrainToJson(Retrain instance) => <String, dynamic>{
  'potato_id': instance.potatoId,
  'building_id': instance.buildingId,
  'runtimeType': instance.$type,
};

Depart _$DepartFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Depart', json, ($checkedConvert) {
      final val = Depart(
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              const <int>[],
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$DepartToJson(Depart instance) => <String, dynamic>{
  'food': instance.food,
  'potato_ids': instance.potatoIds,
  'runtimeType': instance.$type,
};

ReturnHome _$ReturnHomeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ReturnHome',
  json,
  ($checkedConvert) {
    final val = ReturnHome(
      food: $checkedConvert('food', (v) => (v as num).toInt()),
      seeds: $checkedConvert(
        'seeds',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => SeedStackData.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <SeedStackData>[],
      ),
      potatoIds: $checkedConvert(
        'potato_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            const <int>[],
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'},
);

Map<String, dynamic> _$ReturnHomeToJson(ReturnHome instance) =>
    <String, dynamic>{
      'food': instance.food,
      'seeds': instance.seeds.map((e) => e.toJson()).toList(),
      'potato_ids': instance.potatoIds,
      'runtimeType': instance.$type,
    };
