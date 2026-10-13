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
      );
      return val;
    });

Map<String, dynamic> _$MapObstacleToJson(_MapObstacle instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'size': instance.size,
      'kind': _$ObstacleKindEnumMap[instance.kind]!,
    };

const _$ObstacleKindEnumMap = {
  ObstacleKind.rock: 'rock',
  ObstacleKind.tree: 'tree',
};
