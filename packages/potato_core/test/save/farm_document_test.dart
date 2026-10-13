import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

void main() {
  late Catalog catalog;

  setUp(() => catalog = sampleCatalog());

  /// A farm with potatoes at different ages, some about to die.
  FarmSimulation busyFarm() {
    final farm = FarmSimulation.newFarm(catalog, seed: 11);
    final tiles = farm.field(1)!.rect.tiles.toList();
    final seeds = [
      plainSeed(PotatoType.food, Grade.normal),
      plainSeed(PotatoType.food, Grade.rare),
      plainSeed(PotatoType.food, Grade.legendary),
      plainSeed(PotatoType.food, Grade.rare),
    ];
    for (final (i, tile) in tiles.indexed) {
      farm.seeds.add(seeds[i]);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seeds[i]));
      farm.runSteps(400);
    }
    return farm;
  }

  /// Save → JSON text → load, as the app does between runs.
  FarmSimulation reload(FarmSimulation farm) {
    final text = jsonEncode(FarmDocument.of(farm).toJson());
    final json = jsonDecode(text) as Map<String, dynamic>;
    return FarmDocument.decode(json).toSimulation(catalog);
  }

  test('round-trips through JSON without changes', () {
    final farm = busyFarm();
    expect(FarmDocument.of(reload(farm)), FarmDocument.of(farm));
  });

  test('uses snake_case keys and the current format version', () {
    final json = FarmDocument.of(busyFarm()).toJson();
    expect(json['format_version'], farmFormatVersion);
    expect(json.keys, containsAll(['next_id', 'random_state']));
    final potato = (json['fields'] as List).first['potatoes'].first as Map;
    expect(potato.keys, containsAll(['grown_millis', 'production_millis']));
  });

  test('closing and catching up equals running the whole time', () {
    // The M1 loop: plant, grow, close the app, reopen and catch up, harvest.
    final stayedOpen = busyFarm();
    final closed = reload(busyFarm());

    stayedOpen.runSteps(3000);
    final clock = FixedStepClock(catalog.rules.farm.step);
    closed.runSteps(
      clock.advance(
        const Duration(seconds: 3000),
        maxElapsed: catalog.rules.farm.offlineCap,
      ),
    );

    expect(FarmDocument.of(closed), FarmDocument.of(stayedOpen));
    expect(
      closed.apply(FarmCommand.harvestField(fieldId: 1)),
      stayedOpen.apply(FarmCommand.harvestField(fieldId: 1)),
    );
    expect(closed.food, stayedOpen.food);
    expect(closed.seeds.counts, stayedOpen.seeds.counts);
  });

  group('decode', () {
    test('treats documents from before abilities as too old', () {
      for (final version in [1, 2, 3]) {
        final json = FarmDocument.of(busyFarm()).toJson()
          ..['format_version'] = version;
        expect(
          () => FarmDocument.decode(json),
          throwsA(isA<FarmTooOldException>()),
        );
      }
    });

    test('rejects a document from a newer app', () {
      final json = FarmDocument.of(busyFarm()).toJson()
        ..['format_version'] = farmFormatVersion + 1;
      expect(() => FarmDocument.decode(json), throwsFormatException);
    });

    test('rejects a document without a version or with a broken field', () {
      final json = FarmDocument.of(busyFarm()).toJson();
      expect(
        () => FarmDocument.decode(Map.of(json)..remove('format_version')),
        throwsFormatException,
      );
      expect(
        () => FarmDocument.decode(Map.of(json)..['food'] = 'lots'),
        throwsFormatException,
      );
    });
  });
}
