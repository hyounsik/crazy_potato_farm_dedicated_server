import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_script.dart';

/// A hand-drawn map a zone can name, from `maps.json`.
final class DrawnMapData {
  DrawnMapData({
    required this.id,
    required this.map,
    Map<String, String> scripts = const {},
  }) : scripts = Map.unmodifiable(scripts);

  factory DrawnMapData.fromJson(Map<String, dynamic> json) => DrawnMapData(
    id: json['id'] as String,
    map: MapData.fromJson(json['map'] as Map<String, dynamic>),
    scripts: {
      for (final s in json['scripts'] as List<Object?>? ?? const [])
        (s! as Map<String, dynamic>)['name'] as String: s['text'] as String,
    },
  );

  final String id;
  final MapData map;

  /// Its story scripts' text by name, as written in the map editor
  /// (2026-11-12, 사용자: M6). Read with [MapScript.parse].
  final Map<String, String> scripts;

  /// [scripts], read.
  List<MapScript> get parsedScripts => [
    for (final MapEntry(:key, :value) in scripts.entries)
      MapScript.parse(key, value),
  ];
}
