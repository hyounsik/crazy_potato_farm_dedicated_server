import 'dart:convert';
import 'dart:math' as math;

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import 'map_test_kit.dart';

void main() {
  MapData generate(int seed, {MapRecipe? recipe}) =>
      generateMap(recipe ?? sampleRecipe(), seed: seed, chunks: chunksFor());

  test('the same seed gives the same map; another seed another', () {
    expect(generate(7).toJson(), generate(7).toJson());
    expect(generate(7).toJson(), isNot(generate(8).toJson()));
  });

  // Fixed output for one seed. A change here means maps differ between
  // platforms (this test also runs on JavaScript) or the generator changed,
  // which would move every shared run's map.
  test('seed 1 builds the known map', () {
    final rows = (generate(1).toJson()['rows'] as List).join('\n');
    expect(_checksum(rows), _seed1Checksum);
  });

  test('a hollow grows over open low ground and leaves the way open '
      '(2026-10-25)', () {
    final base = sampleRecipe();
    final recipe = base.copyWith(
      terrain: [
        ...base.terrain,
        const TerrainPiece.hollow(center: TilePos(8, 4), area: 12),
      ],
    );
    for (var seed = 0; seed < 20; seed++) {
      final map = generate(seed, recipe: recipe);
      var hollow = 0;
      for (var y = 0; y < map.size; y++) {
        for (var x = 0; x < map.size; x++) {
          if (map.tileAt(x, y) != MapTile.hollow) continue;
          hollow++;
          expect(map.heightAt(x, y), MapHeight.low);
        }
      }
      expect(hollow, greaterThan(0), reason: 'seed $seed');
      final reached = map.reachableFrom(map.entry);
      expect(map.exits.every(reached.contains), isTrue);
    }
  });

  test('every exit and marker can be walked to from the entry', () {
    for (var seed = 0; seed < 40; seed++) {
      final map = generate(seed);
      final reached = map.reachableFrom(map.entry);
      expect(map.isBlocked(map.entry.x, map.entry.y), isFalse);
      for (final exit in map.exits) {
        expect(reached, contains(exit), reason: 'seed $seed exit $exit');
      }
      for (final MapEntry(:key, :value) in map.markers.entries) {
        for (final tile in value) {
          expect(reached, contains(tile), reason: 'seed $seed $key $tile');
        }
      }
    }
  });

  test('picked exit sites are open, spaced and reachable', () {
    final recipe = sampleRecipe().copyWith(exitSites: 4, exitSpacing: 8);
    for (var seed = 0; seed < 20; seed++) {
      final map = generate(seed, recipe: recipe);
      final sites = [map.entry, ...map.exits];
      expect(map.exits, hasLength(recipe.exits.length + 4));
      final reached = map.reachableFrom(map.entry);
      for (final (i, a) in sites.indexed) {
        expect(reached, contains(a), reason: 'seed $seed $a');
        for (final b in sites.skip(i + 1)) {
          final apart = math.max((a.x - b.x).abs(), (a.y - b.y).abs());
          expect(apart, greaterThanOrEqualTo(8), reason: 'seed $seed $a $b');
        }
      }
    }
    expect(
      generate(3, recipe: recipe).toJson(),
      generate(3, recipe: recipe).toJson(),
    );
  });

  test('clone entry sites are picked, spaced and kept as a marker', () {
    final recipe = sampleRecipe().copyWith(
      exitSites: 2,
      exitSpacing: 6,
      cloneEntrySites: 3,
    );
    for (var seed = 0; seed < 10; seed++) {
      final map = generate(seed, recipe: recipe);
      final entries = map.markers[cloneEntryMarker]!;
      expect(entries, hasLength(3), reason: 'seed $seed');
      final reached = map.reachableFrom(map.entry);
      expect(entries.every(reached.contains), isTrue);
      for (final site in entries) {
        expect(map.exits, isNot(contains(site)));
      }
    }
  });

  test('a big rock blocks only its bottom row', () {
    for (var seed = 0; seed < 20; seed++) {
      final map = generate(seed);
      for (final o in map.obstacles) {
        if (o.kind != ObstacleKind.rock || o.size < 2) continue;
        expect(o.blockedRows, 1);
        for (var x = o.origin.x; x < o.origin.x + o.size; x++) {
          expect(map.tileAt(x, o.origin.y), MapTile.obstacle);
          expect(map.tileAt(x, o.origin.y - 1), MapTile.open);
        }
      }
      expect(
        map.obstacles.where((o) => o.kind == ObstacleKind.tree),
        everyElement(predicate<MapObstacle>((o) => o.blockedRows == o.size)),
        reason: 'trees stay square',
      );
    }
  });

  test('scattered obstacles keep a free tile around them', () {
    for (var seed = 0; seed < 20; seed++) {
      final map = generate(seed);
      expect(map.obstacles, isNotEmpty);
      for (final o in map.obstacles) {
        // A big rock's open row behind it counts as its free ring.
        final top = o.origin.y - 1 - (o.size - o.blockedRows);
        for (var y = top; y <= o.origin.y + o.blockedRows; y++) {
          for (var x = o.origin.x - 1; x <= o.origin.x + o.size; x++) {
            final own =
                x >= o.origin.x &&
                x < o.origin.x + o.size &&
                y >= o.origin.y &&
                y < o.origin.y + o.blockedRows;
            expect(
              map.tileAt(x, y),
              own ? MapTile.obstacle : MapTile.open,
              reason: 'seed $seed obstacle $o at ($x, $y)',
            );
          }
        }
      }
    }
  });

  test('nothing is scattered next to the entry', () {
    final map = generate(3, recipe: sampleRecipe(rotate: false));
    for (var y = map.entry.y - 2; y <= map.entry.y + 2; y++) {
      for (var x = map.entry.x - 2; x <= map.entry.x + 2; x++) {
        if (map.isInside(x, y)) {
          expect(map.tileAt(x, y), isNot(MapTile.obstacle));
        }
      }
    }
  });

  test('terrain pieces take their shapes', () {
    final map = generate(5, recipe: sampleRecipe(rotate: false, scatter: 0));
    // The wall runs along y = 10..11 from x = 4 to 12 with a 3-tile gap.
    expect(map.tileAt(4, 10), MapTile.terrain);
    expect(map.tileAt(12, 11), MapTile.terrain);
    expect(map.tileAt(8, 10), MapTile.open);
    expect(map.tileAt(8, 11), MapTile.open);
    // The ring's entrance faces left; its far side is closed.
    expect(map.tileAt(21, 22), MapTile.open);
    expect(map.tileAt(29, 22), MapTile.terrain);
    expect(map.markers['clearing'], contains(const TilePos(25, 22)));
    // The chunk lands at (4, 20) with its markers.
    expect(map.tileAt(4, 20), MapTile.terrain);
    expect(map.markers['target'], [const TilePos(6, 21)]);
    // The blob has its area.
    final blob = [
      for (var y = 10; y < 23; y++)
        for (var x = 10; x < 23; x++)
          if (map.tileAt(x, y) == MapTile.terrain && x > 13) TilePos(x, y),
    ];
    expect(blob.length, greaterThanOrEqualTo(20));
  });

  test('maps turn by the seed; a fixed recipe does not', () {
    final entries = {for (var s = 0; s < 30; s++) generate(s).entry};
    expect(entries, hasLength(4));
    final fixed = {
      for (var s = 0; s < 10; s++)
        generate(s, recipe: sampleRecipe(rotate: false)).entry,
    };
    expect(fixed, {const TilePos(16, 29)});
  });

  test('a map survives JSON', () {
    final map = generate(11);
    final copy = MapData.fromJson(
      jsonDecode(jsonEncode(map.toJson())) as Map<String, dynamic>,
    );
    expect(copy.toJson(), map.toJson());
  });

  test('a recipe naming a missing chunk is refused', () {
    expect(() => generateMap(sampleRecipe(), seed: 1), throwsArgumentError);
  });

  test('a recipe that walls off an exit never passes', () {
    final sealed = MapRecipe(
      size: 16,
      entry: const TilePos(8, 14),
      exits: const [TilePos(8, 2)],
      clearRadius: 1,
      scatter: const ScatterRule(count: 0),
      terrain: const [
        TerrainPiece.wall(
          from: TilePos(0, 7),
          to: TilePos(15, 7),
          thickness: 1,
          gap: 0,
        ),
      ],
    );
    expect(() => generateMap(sealed, seed: 1), throwsStateError);
  });

  test('a recipe survives JSON', () {
    final recipe = sampleRecipe();
    final copy = MapRecipe.fromJson(
      jsonDecode(jsonEncode(recipe.toJson())) as Map<String, dynamic>,
    );
    expect(copy, recipe);
  });
}

/// FNV-1a over the text, kept within 32 bits so it matches on the web.
int _checksum(String text) {
  var hash = 0x811c9dc5;
  for (final unit in text.codeUnits) {
    hash ^= unit;
    hash =
        ((hash & 0xffff) * 0x01000193 +
            (((hash >>> 16) * 0x01000193 & 0xffff) << 16)) &
        0xffffffff;
  }
  return hash;
}

// Changed 2026-10-18: big rocks block only their bottom row.
const _seed1Checksum = 1091467342;
