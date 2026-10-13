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

Returned _$ReturnedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Returned', json, ($checkedConvert) {
      final val = Returned(
        food: $checkedConvert('food', (v) => (v as num).toInt()),
        seeds: $checkedConvert('seeds', (v) => (v as num).toInt()),
        potatoIds: $checkedConvert(
          'potato_ids',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        $type: $checkedConvert('runtimeType', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'potatoIds': 'potato_ids', r'$type': 'runtimeType'});

Map<String, dynamic> _$ReturnedToJson(Returned instance) => <String, dynamic>{
  'food': instance.food,
  'seeds': instance.seeds,
  'potato_ids': instance.potatoIds,
  'runtimeType': instance.$type,
};
