import 'package:potato_core/src/map/map_data.dart';

/// A hand-drawn map a zone can name, from `maps.json`.
final class DrawnMapData {
  DrawnMapData({required this.id, required this.map});

  factory DrawnMapData.fromJson(Map<String, dynamic> json) => DrawnMapData(
    id: json['id'] as String,
    map: MapData.fromJson(json['map'] as Map<String, dynamic>),
  );

  final String id;
  final MapData map;
}
