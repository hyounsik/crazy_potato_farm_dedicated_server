import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/potatoes/potato.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/save/migration.dart';

part 'farm_document.freezed.dart';
part 'farm_document.g.dart';

/// A whole farm as one JSON document: what a save stores.
///
/// The running farm is a mutable [FarmSimulation]; this is its snapshot.
/// When to save and the wall-clock time of the save belong to the caller.
@freezed
abstract class FarmDocument with _$FarmDocument {
  const factory FarmDocument({
    /// Bumped whenever the format changes; see [farmFormatVersion].
    required int formatVersion,
    required int tick,
    required int nextId,
    required List<int> randomState,
    required int food,
    required List<SeedStackData> seeds,
    required List<FieldDocument> fields,
  }) = _FarmDocument;

  const FarmDocument._();

  factory FarmDocument.fromJson(Map<String, dynamic> json) =>
      _$FarmDocumentFromJson(json);

  /// Reads a saved document of any known format version, upgrading old ones.
  ///
  /// Throws [FormatException] for a document this code cannot read, such as
  /// one written by a newer app.
  factory FarmDocument.decode(Map<String, dynamic> json) {
    final upgraded = migrateFarmJson(json);
    try {
      return FarmDocument.fromJson(upgraded);
    } on CheckedFromJsonException catch (e) {
      throw FormatException('Bad farm document at ${e.key}: ${e.message}');
    }
  }

  factory FarmDocument.of(FarmSimulation farm) => FarmDocument(
    formatVersion: farmFormatVersion,
    tick: farm.tick,
    nextId: farm.nextId,
    randomState: farm.randomState,
    food: farm.food,
    seeds: [
      for (final MapEntry(key: seed, value: count) in farm.seeds.counts.entries)
        SeedStackData(type: seed.type, grade: seed.grade, count: count),
    ],
    fields: [
      for (final field in farm.fields)
        FieldDocument(
          id: field.id,
          rect: field.rect,
          potatoes: [
            for (final MapEntry(key: tile, value: potato)
                in field.potatoes.entries)
              PotatoDocument.of(potato, tile),
          ],
        ),
    ],
  );

  /// Builds the running farm, using [catalog] for its rules.
  FarmSimulation toSimulation(Catalog catalog) {
    final pouch = SeedPouch();
    for (final stack in seeds) {
      pouch.add(Seed(type: stack.type, grade: stack.grade), stack.count);
    }
    return FarmSimulation.restore(
      catalog: catalog,
      random: GameRandom.fromState(randomState),
      tick: tick,
      nextId: nextId,
      food: food,
      seeds: pouch,
      fields: [
        for (final field in fields)
          FarmField(
            id: field.id,
            rect: field.rect,
            potatoes: {
              for (final potato in field.potatoes)
                potato.tile: potato.toPotato(),
            },
          ),
      ],
    );
  }
}

@freezed
abstract class FieldDocument with _$FieldDocument {
  const factory FieldDocument({
    required int id,
    required TileRect rect,
    required List<PotatoDocument> potatoes,
  }) = _FieldDocument;

  factory FieldDocument.fromJson(Map<String, dynamic> json) =>
      _$FieldDocumentFromJson(json);
}

@freezed
abstract class PotatoDocument with _$PotatoDocument {
  const factory PotatoDocument({
    required int id,
    required TilePos tile,
    required PotatoType type,
    required Grade grade,
    required int grownMillis,
    required int livedMillis,
    required int productionMillis,
    required int stored,
    required bool away,
  }) = _PotatoDocument;

  const PotatoDocument._();

  factory PotatoDocument.fromJson(Map<String, dynamic> json) =>
      _$PotatoDocumentFromJson(json);

  factory PotatoDocument.of(Potato potato, TilePos tile) => PotatoDocument(
    id: potato.id,
    tile: tile,
    type: potato.type,
    grade: potato.grade,
    grownMillis: potato.grownMillis,
    livedMillis: potato.livedMillis,
    productionMillis: potato.productionMillis,
    stored: potato.stored,
    away: potato.away,
  );

  Potato toPotato() => Potato(
    id: id,
    type: type,
    grade: grade,
    grownMillis: grownMillis,
    livedMillis: livedMillis,
    productionMillis: productionMillis,
    stored: stored,
    away: away,
  );
}
