@TestOn('vm')
library;

import 'dart:io';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import 'map_test_kit.dart';

void main() {
  test('a Tiled chunk reads solid tiles and markers', () {
    final tmx = File('test/fixtures/map/sample_chunk.tmx').readAsStringSync();
    final chunk = MapChunk.fromTmx(tmx);
    final expected = sampleChunk();

    expect(chunk.width, expected.width);
    expect(chunk.height, expected.height);
    expect(chunk.solid, expected.solid);
    expect(chunk.markers, expected.markers);
  });

  test('turning a chunk keeps it inside its turned box', () {
    final chunk = sampleChunk();
    const origin = TilePos(10, 10);
    // A quarter turn clockwise: the 5x4 pocket becomes 4x5 and its opening
    // (bottom middle) faces left.
    expect(chunk.place(const TilePos(2, 3), origin, 1), const TilePos(10, 12));
    expect(chunk.place(const TilePos(0, 0), origin, 1), const TilePos(13, 10));
    expect(chunk.place(const TilePos(2, 3), origin, 4), const TilePos(12, 13));
  });

  group('ramp ways', () {
    MapData drawn({TilePos at = const TilePos(1, 0)}) => MapData(
      size: 3,
      tiles: List.filled(9, MapTile.open),
      heights: [
        for (var i = 0; i < 9; i++)
          i == at.y * 3 + at.x ? MapHeight.ramp : MapHeight.low,
      ],
      entry: const TilePos(0, 0),
      rampWays: {at: RampWay.up},
      markers: {
        'middle': [const TilePos(1, 1)],
      },
    );

    test('survive JSON, and a map without any writes no key', () {
      final back = MapData.fromJson(drawn().toJson());
      expect(back.rampWays, {const TilePos(1, 0): RampWay.up});

      final plain = MapData(
        size: 1,
        tiles: const [MapTile.open],
        entry: const TilePos(0, 0),
      );
      expect(plain.toJson().containsKey('ramp_ways'), isFalse);
      expect(MapData.fromJson(plain.toJson()).rampWays, isEmpty);
    });

    test('turn clockwise', () {
      expect(RampWay.up.turned(1), RampWay.right);
      expect(RampWay.left.turned(1), RampWay.up);
      expect(RampWay.down.turned(3), RampWay.right);
      expect(RampWay.right.turned(4), RampWay.right);
    });

    test('turn with the chunk and the map, on every seed', () {
      final chunks = {'c': MapChunk.fromMap(drawn())};
      for (var seed = 0; seed < 32; seed++) {
        final map = generateMap(
          const MapRecipe(
            size: 12,
            entry: TilePos(0, 0),
            clearRadius: 0,
            terrain: [
              TerrainPiece.chunkFrom(from: ['c'], origin: TilePos(5, 5)),
            ],
            scatter: ScatterRule(count: 0),
          ),
          seed: seed,
          chunks: chunks,
        );
        expect(map.rampWays, hasLength(1), reason: 'seed $seed');
        final MapEntry(key: tile, value: way) = map.rampWays.entries.single;
        expect(map.heightAt(tile.x, tile.y), MapHeight.ramp);
        // Drawn on the chunk's top edge climbing outward: it still climbs
        // away from the chunk's middle, however the two have turned.
        final middle = map.markers['middle']!.single;
        expect(
          (tile.x - middle.x, tile.y - middle.y),
          (way.dx, way.dy),
          reason: 'seed $seed',
        );
      }
    });

    test('a ramp taken away by later terrain loses its way', () {
      final chunks = {'c': MapChunk.fromMap(drawn())};
      final map = generateMap(
        const MapRecipe(
          size: 12,
          entry: TilePos(0, 0),
          clearRadius: 0,
          rotate: false,
          terrain: [
            TerrainPiece.chunk(chunk: 'c', origin: TilePos(5, 5)),
            TerrainPiece.chunk(chunk: 'flat', origin: TilePos(5, 5)),
          ],
          scatter: ScatterRule(count: 0),
        ),
        seed: 1,
        chunks: {
          ...chunks,
          'flat': MapChunk(
            width: 3,
            height: 3,
            solid: const {},
            heights: {const TilePos(1, 0): MapHeight.high},
          ),
        },
      );
      expect(map.rampWays, isEmpty);
    });
  });
}
