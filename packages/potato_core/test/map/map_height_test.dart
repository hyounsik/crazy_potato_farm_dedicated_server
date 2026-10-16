import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import 'map_test_kit.dart';

void main() {
  // A 10x10 open map: high ground where x >= 5, one ramp at (5, 2).
  MapHeight heightOf(int x, int y) {
    if (x == 5 && y == 2) return MapHeight.ramp;
    return x >= 5 ? MapHeight.high : MapHeight.low;
  }

  final map = MapData(
    size: 10,
    tiles: List.filled(100, MapTile.open),
    heights: [
      for (var y = 0; y < 10; y++)
        for (var x = 0; x < 10; x++) heightOf(x, y),
    ],
    entry: const TilePos(1, 7),
  );

  test('a cliff stops walking; a ramp lets one up and down', () {
    final blocked = map.move(const Vec2(4.5, 7.5), const Vec2(1, 0), 0.2);
    expect(blocked.x, lessThan(5 - 0.19), reason: 'low into high: cliff');

    var at = const Vec2(4.5, 2.5);
    for (var i = 0; i < 20; i++) {
      at = map.move(at, const Vec2(0.1, 0), 0.2);
    }
    expect(at.x, greaterThan(6), reason: 'over the ramp onto high ground');
    final down = map.move(const Vec2(6.5, 7.5), const Vec2(-1, 0), 0.2);
    expect(down.x, greaterThan(5 + 0.19), reason: 'high off a cliff: no');
  });

  test('paths and reach go over the ramp', () {
    final path = map.findPath(const Vec2(2.5, 7.5), const Vec2(8.5, 7.5));
    expect(path, isNotEmpty);
    // Every leg steps between levels only over the ramp.
    var from = const Vec2(2.5, 7.5);
    for (final point in path) {
      expect(map.hasLineOfSight(from, point), isTrue);
      from = point;
    }
    expect(path.any((p) => p.y < 4), isTrue, reason: 'via the ramp at y = 2');
    expect(map.reachableFrom(const TilePos(1, 7)), hasLength(100));
  });

  test('low ground does not see high ground; high sees low', () {
    const low = Vec2(3.5, 7.5);
    const high = Vec2(7.5, 7.5);
    expect(map.canSee(low, high), isFalse);
    expect(map.canSee(high, low), isTrue);
    expect(map.canSee(const Vec2(5.5, 2.5), high), isFalse, reason: 'ramp');
  });

  test('heights survive JSON; maps without them stay low', () {
    final copy = MapData.fromJson(
      jsonDecode(jsonEncode(map.toJson())) as Map<String, dynamic>,
    );
    expect(copy.heightAt(5, 2), MapHeight.ramp);
    expect(copy.heightAt(7, 7), MapHeight.high);
    final flat = MapData(
      size: 2,
      tiles: List.filled(4, MapTile.open),
      entry: const TilePos(0, 0),
    );
    expect(flat.toJson().containsKey('heights'), isFalse);
    expect(flat.hasHeights, isFalse);
  });

  test('plateaus are high ground reached by their ramps', () {
    final recipe = sampleRecipe().copyWith(
      terrain: [
        ...sampleRecipe().terrain,
        const TerrainPiece.plateau(center: TilePos(16, 24), area: 40),
      ],
    );
    for (var seed = 0; seed < 10; seed++) {
      final made = generateMap(recipe, seed: seed, chunks: chunksFor());
      final tiles = [
        for (var y = 0; y < made.size; y++)
          for (var x = 0; x < made.size; x++) TilePos(x, y),
      ];
      final high = tiles.where(
        (t) => made.heightAt(t.x, t.y) == MapHeight.high,
      );
      final ramps = tiles.where(
        (t) => made.heightAt(t.x, t.y) == MapHeight.ramp,
      );
      expect(high, isNotEmpty, reason: 'seed $seed');
      expect(ramps, isNotEmpty, reason: 'seed $seed');
      final reached = made.reachableFrom(made.entry);
      expect(
        high.where((t) => !made.isBlocked(t.x, t.y)).any(reached.contains),
        isTrue,
        reason: 'seed $seed: the plateau can be walked onto',
      );
    }
  });
}
