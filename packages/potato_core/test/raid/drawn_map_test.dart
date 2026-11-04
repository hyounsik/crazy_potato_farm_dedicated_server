import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

Map<String, int> _at(int x, int y) => {'x': x, 'y': y};

/// An 8x8 map, walled off down its middle but for a gap unless [closed], with
/// enemies and spots marked on it.
Map<String, dynamic> _drawn({bool closed = false, String enemy = 'biter'}) => {
  'id': 'story',
  'map': {
    'size': 8,
    'rows': [
      for (var y = 0; y < 8; y++)
        [for (var x = 0; x < 8; x++) x == 4 && (closed || y != 7) ? '#' : '.']
            .join(),
    ],
    'entry': _at(1, 1),
    'exits': [_at(6, 6)],
    'markers': {
      spotMarker: [_at(2, 2), _at(6, 2)],
      '$enemyMarkerPrefix$enemy': [_at(3, 3), _at(6, 1)],
    },
    'obstacles': <Object?>[],
  },
};

Map<String, Object?> _filesWith(Map<String, dynamic> map) {
  final files = sampleCatalogFiles();
  ((files['maps']! as Map<String, dynamic>)['maps'] as List).add(map);
  final zones = (files['zones']! as Map<String, dynamic>)['zones'] as List;
  zones.add(
    Map<String, dynamic>.of(zones[0] as Map<String, dynamic>)
      ..remove('map')
      ..remove('boss')
      ..['id'] = 'story_zone'
      ..['drawn_map'] = map['id'],
  );
  return files;
}

Iterable<String> _issues(Map<String, Object?> files) =>
    Catalog.load(files).issues.map((issue) => issue.toString());

void main() {
  group('Catalog with a drawn map', () {
    test('loads, and a zone can name it', () {
      final result = Catalog.load(_filesWith(_drawn()));
      expect(result.issues, isEmpty);
      expect(result.catalog!.zones['story_zone']!.map, isNull);
      expect(result.catalog!.maps['story']!.map.size, 8);
    });

    test('a marker or exit that cannot be walked to is an issue', () {
      final issues = _issues(_filesWith(_drawn(closed: true)));
      expect(
        issues,
        contains('maps: maps[0].map.exits[0]: cannot be walked to'),
      );
      expect(
        issues,
        contains('maps: maps[0].map.markers.spot[1]: cannot be walked to'),
      );
    });

    test('a zone naming no such map, or both kinds of map, is an issue', () {
      final files = _filesWith(_drawn());
      final zones = (files['zones']! as Map<String, dynamic>)['zones'] as List;
      (zones.last as Map<String, dynamic>)['drawn_map'] = 'ghost';
      expect(
        _issues(files),
        contains('zones: story_zone.drawn_map: no map "ghost"'),
      );

      final both = _filesWith(_drawn());
      final list = (both['zones']! as Map<String, dynamic>)['zones'] as List;
      (list.last as Map<String, dynamic>)['map'] =
          (list.first as Map<String, dynamic>)['map'];
      expect(
        _issues(both).where((issue) => issue.contains('must have one of')),
        hasLength(1),
      );
    });

    test('an enemy marker naming no such enemy is an issue', () {
      expect(
        _issues(_filesWith(_drawn(enemy: 'yeti'))),
        contains('maps: story.map.markers.enemy:yeti: no enemy "yeti"'),
      );
    });
  });

  group('a run on a drawn map', () {
    late Catalog catalog;

    setUp(() => catalog = Catalog.load(_filesWith(_drawn())).catalog!);

    RaidSimulation start(int seed) =>
        RaidSimulation.start(catalog: catalog, zone: 'story_zone', seed: seed);

    test('is the same map whatever the seed', () {
      expect(start(1).map.toJson(), catalog.maps['story']!.map.toJson());
      expect(start(2).map.toJson(), start(1).map.toJson());
    });

    test('has its enemies and spots where the markers say, and no others', () {
      final run = start(1);
      expect(run.enemies.map((e) => (e.position.x, e.position.y, e.kind)), [
        (3.5, 3.5, 'biter'),
        (6.5, 1.5, 'biter'),
      ]);
      final spots = run.piles.where((p) => p.kind == PileKind.spot);
      expect(spots.map((p) => (p.position.x, p.position.y)), [
        (2.5, 2.5),
        (6.5, 2.5),
      ]);
    });

    test('survives a save', () {
      final run = start(1);
      final back = RaidSimulation.fromJson(run.toJson(), catalog);
      expect(back.map.toJson(), run.map.toJson());
      expect(back.enemies.length, run.enemies.length);
    });
  });
}
