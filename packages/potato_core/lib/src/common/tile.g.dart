// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TilePos _$TilePosFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TilePos', json, ($checkedConvert) {
      final val = _TilePos(
        $checkedConvert('x', (v) => (v as num).toInt()),
        $checkedConvert('y', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$TilePosToJson(_TilePos instance) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
};

_TileRect _$TileRectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TileRect', json, ($checkedConvert) {
      final val = _TileRect(
        origin: $checkedConvert(
          'origin',
          (v) => TilePos.fromJson(v as Map<String, dynamic>),
        ),
        width: $checkedConvert('width', (v) => (v as num).toInt()),
        height: $checkedConvert('height', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$TileRectToJson(_TileRect instance) => <String, dynamic>{
  'origin': instance.origin.toJson(),
  'width': instance.width,
  'height': instance.height,
};
