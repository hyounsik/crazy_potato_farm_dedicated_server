import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

void main() {
  late Catalog catalog;

  setUp(() => catalog = sampleCatalog());

  /// A farm with potatoes at different ages, some about to die.
  FarmSimulation busyFarm() {
    final farm = FarmSimulation.newFarm(catalog, seed: 11);
    final tiles = farm.field(1)!.rect.tiles.toList();
    const seeds = [
      Seed(type: PotatoType.food, grade: Grade.normal),
      Seed(type: PotatoType.food, grade: Grade.rare),
      Seed(type: PotatoType.food, grade: Grade.legendary),
      Seed(type: PotatoType.food, grade: Grade.rare),
    ];
    for (final (i, tile) in tiles.indexed) {
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
      closed.apply(const FarmCommand.harvestField(fieldId: 1)),
      stayedOpen.apply(const FarmCommand.harvestField(fieldId: 1)),
    );
    expect(closed.food, stayedOpen.food);
    expect(closed.seeds.counts, stayedOpen.seeds.counts);
  });

  group('decode', () {
    /// The busy farm as an older version wrote it: no buildings, guards,
    /// fridge, pests, or upkeep yet.
    Map<String, dynamic> oldDocument(int version, {bool away = false}) {
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(busyFarm()).toJson()),
      ) as Map<String, dynamic>;
      for (final key in ['buildings', 'guards', 'fridge', 'away', 'totals']) {
        json.remove(key);
      }
      for (final field in json['fields'] as List) {
        (field as Map).remove('pest');
        for (final potato in field['potatoes'] as List) {
          (potato as Map).remove('weak');
          if (version == 2) potato['away'] = away;
        }
      }
      return json..['format_version'] = version;
    }

    test('upgrades a version 1 document: nobody is away', () {
      final planted = FarmDocument.of(busyFarm()).fields.single.potatoes;
      final upgraded = FarmDocument.decode(oldDocument(1));
      expect(upgraded.formatVersion, farmFormatVersion);
      expect(upgraded.fields.single.potatoes, hasLength(planted.length));
      expect(upgraded.away, isEmpty);
      expect(upgraded.buildings, isEmpty);
    });

    test('upgrades a version 2 document: away potatoes leave their tile', () {
      final planted = FarmDocument.of(busyFarm()).fields.single.potatoes;
      final upgraded = FarmDocument.decode(oldDocument(2, away: true));
      expect(upgraded.fields.single.potatoes, isEmpty);
      expect(upgraded.away, hasLength(planted.length));
      expect(upgraded.away.first.fieldId, 1);
      expect(upgraded.away.first.potato.tile, isNotNull);

      final farm = upgraded.toSimulation(catalog);
      final id = farm.awayPotatoes.first.id;
      farm.apply(FarmCommand.returnHome(food: 0, potatoIds: [id]));
      expect(farm.fieldSpotOf(id), isNotNull);
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
