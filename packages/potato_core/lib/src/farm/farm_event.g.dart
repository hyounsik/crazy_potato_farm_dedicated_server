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

Map<String, dynamic> _$PotatoPlantedToJson(PotatoPlanted instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile.toJson(),
      'potato_id': instance.potatoId,
      'seed': instance.seed.toJson(),
      'runtimeType': instance.$type,
    };

PotatoGrown _$PotatoGrownFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PotatoGrown',
  json,
  ($checkedConvert) {
    final val = PotatoGrown(
      fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
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
      'tile': instance.tile.toJson(),
      'potato_id': instance.potatoId,
      'runtimeType': instance.$type,
    };

PotatoDied _$PotatoDiedFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PotatoDied',
  json,
  ($checkedConvert) {
    final val = PotatoDied(
      fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
      tile: $checkedConvert(
        'tile',
        (v) => TilePos.fromJson(v as Map<String, dynamic>),
      ),
      potatoId: $checkedConvert('potato_id', (v) => (v as num).toInt()),
      seedLeft: $checkedConvert(
        'seed_left',
        (v) => Seed.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fieldId': 'field_id',
    'potatoId': 'potato_id',
    'seedLeft': 'seed_left',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$PotatoDiedToJson(PotatoDied instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'tile': instance.tile.toJson(),
      'potato_id': instance.potatoId,
      'seed_left': instance.seedLeft.toJson(),
      'runtimeType': instance.$type,
    };

FoodHarvested _$FoodHarvestedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FoodHarvested', json, ($checkedConvert) {
      final val = FoodHarvested(
        fieldId: $checkedConvert('field_id', (v) => (v as num).toInt()),
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fieldId': 'field_id', r'$type': 'runtimeType'});

Map<String, dynamic> _$FoodHarvestedToJson(FoodHarvested instance) =>
    <String, dynamic>{
      'field_id': instance.fieldId,
      'food': instance.food,
      'runtimeType': instance.$type,
    };
