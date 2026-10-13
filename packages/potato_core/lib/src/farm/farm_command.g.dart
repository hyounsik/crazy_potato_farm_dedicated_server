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
