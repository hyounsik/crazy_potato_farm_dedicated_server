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
}
