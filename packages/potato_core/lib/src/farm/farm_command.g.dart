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
