// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapObstacle _$MapObstacleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapObstacle', json, ($checkedConvert) {
      final val = _MapObstacle(
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$ObstacleKindEnumMap, v),
        ),
        rows: $checkedConvert('rows', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$MapObstacleToJson(_MapObstacle instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'size': instance.size,
      'kind': _$ObstacleKindEnumMap[instance.kind]!,
      'rows': instance.rows,
    };

const _$ObstacleKindEnumMap = {
  ObstacleKind.rock: 'rock',
  ObstacleKind.tree: 'tree',
};

_MapObject _$MapObjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapObject', json, ($checkedConvert) {
      final val = _MapObject(
        id: $checkedConvert('id', (v) => v as String),
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        width: $checkedConvert('width', (v) => (v as num?)?.toInt() ?? 1),
        rows: $checkedConvert('rows', (v) => (v as num?)?.toInt() ?? 1),
      );
      return val;
    });

Map<String, dynamic> _$MapObjectToJson(_MapObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin.toJson(),
      'width': instance.width,
      'rows': instance.rows,
    };
