import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_script.dart';

/// A hand-drawn map a zone can name, from `maps.json`.
final class DrawnMapData {
  DrawnMapData({
    required this.id,
    required this.map,
    Map<String, String> scripts = const {},
    this.hunger = true,
    this.damage = true,
  }) : scripts = Map.unmodifiable(scripts);

  factory DrawnMapData.fromJson(Map<String, dynamic> json) => DrawnMapData(
    id: json['id'] as String,
    map: MapData.fromJson(json['map'] as Map<String, dynamic>),
    scripts: {
      for (final s in json['scripts'] as List<Object?>? ?? const [])
        (s! as Map<String, dynamic>)['name'] as String: s['text'] as String,
    },
    hunger: json['hunger'] as bool? ?? true,
    damage: json['damage'] as bool? ?? true,
  );

  final String id;
  final MapData map;

  /// Its story scripts' text by name, as written in the map editor
  /// (2026-11-12, 사용자: M6). Read with [MapScript.parse].
  final Map<String, String> scripts;

  /// Whether runs here get hungry: off, no food is eaten and nobody goes
  /// hungry (2026-11-14, 사용자: map info).
  final bool hunger;

  /// Whether the players' side gets hurt here: off, the farmer and the
  /// companions lose no health (2026-11-14, 사용자: map info). Enemies
  /// still do.
  final bool damage;

  /// [scripts], read.
  List<MapScript> get parsedScripts => [
    for (final MapEntry(:key, :value) in scripts.entries)
      MapScript.parse(key, value),
  ];
}
