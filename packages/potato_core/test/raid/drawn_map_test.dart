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
  chunkTests();
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

    test('its scripts are checked against it and its zone', () {
      final map = _drawn()
        ..['scripts'] = [
          {'name': 'ok', 'text': 'actor r biter at a\nwait defeated r'},
          {'name': 'bad', 'text': 'actor r biter at a\nattack boss jump at r'},
        ];
      (map['map'] as Map<String, dynamic>)['markers']['at:a'] = [_at(2, 3)];
      final result = Catalog.load(_filesWith(map));
      expect(result.issues.map((i) => i.toString()), [
        'maps: story.scripts.bad: line 2: no body "boss" yet',
      ]);
      expect(result.catalog, isNull);
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

/// A 6x6 chunk: a hollow, high ground, mud, an exit, a spot, an enemy and an
/// object that blocks.
Map<String, dynamic> _chunkJson({String id = 'piece'}) => {
  'id': id,
  'map': {
    'size': 6,
    'rows': ['#.....', '......', '..~...', '......', '....o.', '......'],
    'entry': _at(0, 0),
    'exits': [_at(5, 0)],
    'markers': {
      spotMarker: [_at(1, 3)],
      '${enemyMarkerPrefix}biter': [_at(3, 1)],
    },
    'obstacles': <Object?>[],
    'objects': [
      {'id': 'desert:3', 'origin': _at(4, 4)},
    ],
    'floors': ['......', '.m....', '......', '......', '......', '......'],
  },
};

Map<String, Object?> _filesWithPicks({int count = 3}) {
  final files = sampleCatalogFiles();
  ((files['chunks']! as Map<String, dynamic>)['chunks'] as List).add(
    _chunkJson(),
  );
  final zones = (files['zones']! as Map<String, dynamic>)['zones'] as List;
  final zone = Map<String, dynamic>.of(zones[0] as Map<String, dynamic>);
  final map = Map<String, dynamic>.of(zone['map'] as Map<String, dynamic>)
    ..['size'] = 40
    ..['chunk_picks'] = [
      {
        'from': ['piece'],
        'count': count,
      },
    ];
  zone
    ..['id'] = 'picks'
    ..['map'] = map
    ..remove('boss');
  zones.add(zone);
  return files;
}

void chunkTests() {
  group('chunks picked by the seed', () {
    late Catalog catalog;

    setUp(() => catalog = Catalog.load(_filesWithPicks()).catalog!);

    MapData generate(int seed) => generateMap(
      catalog.zones['picks']!.map!,
      seed: seed,
      chunks: catalog.chunks,
    );

    test('land whole, with what was drawn on them', () {
      for (var seed = 1; seed <= 10; seed++) {
        final map = generate(seed);
        expect(map.objects, isNotEmpty, reason: 'seed $seed');
        final count = map.objects.length;
        expect(map.markers[spotMarker], hasLength(count));
        expect(map.markers['${enemyMarkerPrefix}biter'], hasLength(count));
        expect(map.floors(MapFloor.mud), hasLength(count));
        for (final object in map.objects) {
          expect(object.id, 'desert:3');
          expect(map.isBlocked(object.origin.x, object.origin.y), isTrue);
        }
        final reached = map.reachableFrom(map.entry);
        expect(map.exits.every(reached.contains), isTrue, reason: 'seed $seed');
      }
    });

    test('differ with the seed and repeat for the same seed', () {
      expect(generate(1).toJson(), generate(1).toJson());
      final spots = {
        for (var seed = 1; seed <= 6; seed++)
          generate(seed).markers[spotMarker].toString(),
      };
      expect(spots.length, greaterThan(1));
    });

    test('add their enemies and spots to the scattered ones', () {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'picks',
        seed: 1,
      );
      for (final tile in run.map.markers['${enemyMarkerPrefix}biter']!) {
        final at = Vec2(tile.x + 0.5, tile.y + 0.5);
        expect(run.enemies.any((e) => e.position == at), isTrue);
      }
      for (final tile in run.map.markers[spotMarker]!) {
        final at = Vec2(tile.x + 0.5, tile.y + 0.5);
        expect(run.piles.any((p) => p.position == at), isTrue);
      }
    });

    test('a map without picks comes out as before', () {
      final plain = sampleCatalogFiles();
      final catalog = Catalog.load(plain).catalog!;
      final zone = catalog.zones.values.first;
      final map = generateMap(zone.map!, seed: 5);
      expect(map.objects, isEmpty);
    });

    test('naming a missing chunk, or one its own edge cannot reach, is an '
        'issue', () {
      final files = _filesWithPicks();
      final zones = (files['zones']! as Map<String, dynamic>)['zones'] as List;
      final map = (zones.last as Map<String, dynamic>)['map'] as Map;
      (((map['chunk_picks'] as List)[0] as Map)['from'] as List)[0] = 'ghost';
      expect(
        _issues(files),
        contains('zones: picks.map.chunk_picks[0]: no chunk "ghost"'),
      );

      final sealed = _filesWithPicks();
      final chunks =
          (sealed['chunks']! as Map<String, dynamic>)['chunks'] as List;
      final drawn = (chunks.first as Map<String, dynamic>)['map'] as Map;
      drawn['rows'] = [
        '#####.',
        '#.#...',
        '###...',
        '......',
        '......',
        '......',
      ];
      drawn['markers'] = {
        spotMarker: [_at(1, 1)],
      };
      drawn['objects'] = <Object?>[];
      drawn.remove('floors');
      expect(
        _issues(sealed),
        contains('chunks: chunks[0].map.markers.spot[0]: cannot be walked to'),
      );
    });
  });
}

extension on MapData {
  List<TilePos> floors(MapFloor floor) => [
    for (var y = 0; y < size; y++)
      for (var x = 0; x < size; x++)
        if (floorAt(x, y) == floor) TilePos(x, y),
  ];
}
