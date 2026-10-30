import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/farm_building.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/farm/farm_totals.dart';
import 'package:potato_core/src/farm/mail.dart';
import 'package:potato_core/src/farm/pest.dart';
import 'package:potato_core/src/potatoes/guard.dart';
import 'package:potato_core/src/potatoes/potato.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
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
    required List<SeedCount> seeds,
    required List<FieldDocument> fields,
    @Default(<BuildingDocument>[]) List<BuildingDocument> buildings,
    @Default(<GuardDocument>[]) List<GuardDocument> guards,

    /// Seeds left over by an upgrade with nowhere to wait (format 7: those
    /// compost yards held); the farm takes them in when it loads.
    @Default(<Seed>[]) List<Seed> returnedSeeds,

    /// Potatoes in the fridge; their `tile` is null.
    @Default(<PotatoDocument>[]) List<PotatoDocument> fridge,
    @Default(<AwayDocument>[]) List<AwayDocument> away,

    /// Dead potatoes in the graveyards, oldest first; `tile` is null.
    @Default(<PotatoDocument>[]) List<PotatoDocument> graves,

    /// Open blocks, in block units. Null in documents from before blocks
    /// opened: those farms still have only the starting land.
    List<TilePos>? openBlocks,

    /// Pouch and box sizes; null in documents from before they were kept,
    /// which start at the catalog's sizes.
    int? pouchSlots,
    int? gearSlots,
    @Default(<OverflowDocument>[]) List<OverflowDocument> overflow,
    @Default(<String, int>{}) Map<String, int> materials,
    @Default(<MailDocument>[]) List<MailDocument> mail,

    /// The workbench level of the one weapon, in documents from before
    /// gear (then [equipped] is null and the farm gets the starting gear,
    /// this level on its weapon).
    @Default(0) int weaponLevel,
    @Default(<Gear>[]) List<Gear> gear,
    Equipped? equipped,
    @Default(0) int progress,
    @Default(<String, dynamic>{}) Map<String, dynamic> totals,

    /// Story events done, by id, with the step each was done on.
    @Default(<String, int>{}) Map<String, int> storyDone,

    /// Every feature open, no story events (see
    /// [FarmSimulation.storySkipped]).
    @Default(false) bool storySkipped,

    /// Starting building kinds a farm saved before they existed should get
    /// when it is read (set by migrations, never written).
    @Default(<String>[]) List<String> missingBuildings,

    /// The truck bed's slots, empty ones as null (2026-10-28).
    @Default(<ItemStack?>[]) List<ItemStack?> bed,

    /// The bag's slots: what came back from a run and is not sorted yet.
    @Default(<ItemStack?>[]) List<ItemStack?> bag,
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
        SeedCount(seed: seed, count: count),
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
          pest: switch (field.pest) {
            final pest? => PestDocument(
              kind: pest.kind,
              clearedMillis: pest.clearedMillis,
              biteMillis: pest.biteMillis,
            ),
            null => null,
          },
          leftover: field.leftover,
          quietUntilTick: field.quietUntilTick,
        ),
    ],
    buildings: [
      for (final building in farm.buildings)
        BuildingDocument(
          id: building.id,
          kind: building.kind,
          origin: building.origin,
          level: building.level,
          litUntilTick: building.litUntilTick,
          readyTick: building.readyTick,
        ),
    ],
    guards: [
      for (final guard in farm.guards)
        GuardDocument(
          potato: PotatoDocument.of(guard.potato),
          buildingId: guard.buildingId,
          at: guard.at,
          targetFieldId: guard.targetFieldId,
          harvesting: guard.harvesting,
          walkTo: guard.walkTo,
          walkMillis: guard.walkMillis,
          walkTotalMillis: guard.walkTotalMillis,
        ),
    ],
    fridge: [for (final potato in farm.fridge) PotatoDocument.of(potato)],
    away: [
      for (final away in farm.awayEntries)
        AwayDocument(
          potato: PotatoDocument.of(away.potato, away.tile),
          fieldId: away.fieldId,
          buildingId: away.buildingId,
        ),
    ],
    graves: [for (final potato in farm.graves) PotatoDocument.of(potato)],
    openBlocks: farm.openBlocks.toList()
      ..sort((a, b) => a.y != b.y ? a.y - b.y : a.x - b.x),
    pouchSlots: farm.pouchSlots,
    gearSlots: farm.gearSlots,
    overflow: [
      for (final waiting in farm.overflow)
        OverflowDocument(seed: waiting.seed, expiresTick: waiting.expiresTick),
    ],
    materials: Map.of(farm.materials),
    mail: [for (final mail in farm.mail) MailDocument.of(mail)],
    gear: farm.gear,
    equipped: farm.equipped,
    progress: farm.progress,
    totals: farm.totals.toJson(),
    storyDone: Map.of(farm.storyDone),
    storySkipped: farm.storySkipped,
    bed: _slots(farm.bed),
    bag: _slots(farm.bag),
  );

  /// [bag]'s slots as saved: copies, with trailing empty slots left out.
  static List<ItemStack?> _slots(Bag bag) {
    final slots = [for (final s in bag.slots) s?.copyWithCount(s.count)];
    while (slots.isNotEmpty && slots.last == null) {
      slots.removeLast();
    }
    return slots;
  }

  /// Builds the running farm, using [catalog] for its rules.
  ///
  /// Throws [FormatException] for a building kind the catalog lacks.
  /// A farm from before gear: the starting gear, with the old weapon
  /// level moved onto the starting weapon.
  Equipped _startGear(Catalog catalog) {
    final start = catalog.rules.gear.start;
    final weapon = start.weapon;
    return weapon == null
        ? start
        : start.copyWith(weapon: weapon.copyWith(enhance: weaponLevel));
  }

  FarmSimulation toSimulation(Catalog catalog) {
    final pouch = SeedPouch();
    for (final stack in seeds) {
      pouch.add(stack.seed, stack.count);
    }
    final farm = FarmSimulation.restore(
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
                potato.tile!: potato.toPotato(),
            },
            pest: switch (field.pest) {
              final pest? => Pest(
                kind: pest.kind,
                clearedMillis: pest.clearedMillis,
                biteMillis: pest.biteMillis,
              ),
              null => null,
            },
            leftover: field.leftover,
            quietUntilTick: field.quietUntilTick,
          ),
      ],
      buildings: [
        for (final building in buildings)
          FarmBuilding(
            id: building.id,
            data:
                catalog.buildings[building.kind] ??
                (throw FormatException('Unknown building "${building.kind}"')),
            origin: building.origin,
            level: building.level,
            litUntilTick: building.litUntilTick,
            readyTick: building.readyTick,
          ),
      ],
      guards: [
        for (final guard in guards)
          Guard(
            potato: guard.potato.toPotato(),
            buildingId: guard.buildingId,
            at: guard.at,
            targetFieldId: guard.targetFieldId,
            harvesting: guard.harvesting,
            walkTo: guard.walkTo,
            walkMillis: guard.walkMillis,
            walkTotalMillis: guard.walkTotalMillis,
          ),
      ],
      fridge: [for (final potato in fridge) potato.toPotato()],
      away: [
        for (final entry in away)
          AwayPotato(
            potato: entry.potato.toPotato(),
            fieldId: entry.fieldId,
            tile: entry.potato.tile,
            buildingId: entry.buildingId,
          ),
      ],
      graves: [for (final potato in graves) potato.toPotato()],
      openBlocks: openBlocks,
      pouchSlots: pouchSlots,
      gearSlots: gearSlots,
      overflow: [
        for (final waiting in overflow)
          OverflowSeed(seed: waiting.seed, expiresTick: waiting.expiresTick),
      ],
      materials: materials,
      mail: [for (final mail in this.mail) mail.toMail()],
      gear: gear,
      equipped: equipped ?? _startGear(catalog),
      progress: progress,
      totals: FarmTotals.fromJson(totals),
      storyDone: storyDone,
      storySkipped: storySkipped,
      returnedSeeds: returnedSeeds,
      bed: [for (final s in bed) s?.copyWithCount(s.count)],
      bag: [for (final s in bag) s?.copyWithCount(s.count)],
    );
    return farm..addMissingStartBuildings(also: missingBuildings);
  }
}

@freezed
abstract class FieldDocument with _$FieldDocument {
  const factory FieldDocument({
    required int id,
    required TileRect rect,
    required List<PotatoDocument> potatoes,
    PestDocument? pest,

    /// Baby potatoes left by potatoes that died here, until harvested
    /// (2026-10-26).
    @Default(0) int leftover,

    /// The step before which bugs cannot come back after being cleared.
    @Default(0) int quietUntilTick,
  }) = _FieldDocument;

  factory FieldDocument.fromJson(Map<String, dynamic> json) =>
      _$FieldDocumentFromJson(json);
}

@freezed
abstract class PestDocument with _$PestDocument {
  const factory PestDocument({
    required PestKind kind,
    required int clearedMillis,
    required int biteMillis,
  }) = _PestDocument;

  factory PestDocument.fromJson(Map<String, dynamic> json) =>
      _$PestDocumentFromJson(json);
}

@freezed
abstract class BuildingDocument with _$BuildingDocument {
  const factory BuildingDocument({
    required int id,
    required String kind,
    required TilePos origin,
    required int level,

    /// For totems: when its light goes out and when it can be lit again.
    @Default(0) int litUntilTick,
    @Default(0) int readyTick,
  }) = _BuildingDocument;

  factory BuildingDocument.fromJson(Map<String, dynamic> json) =>
      _$BuildingDocumentFromJson(json);
}

@freezed
abstract class GuardDocument with _$GuardDocument {
  const factory GuardDocument({
    required PotatoDocument potato,
    required int buildingId,
    required TilePos at,
    int? targetFieldId,
    @Default(false) bool harvesting,
    TilePos? walkTo,
    required int walkMillis,
    @Default(0) int walkTotalMillis,
  }) = _GuardDocument;

  factory GuardDocument.fromJson(Map<String, dynamic> json) =>
      _$GuardDocumentFromJson(json);
}

/// A potato out exploring. The potato's `tile` is the field tile it left,
/// if it left a field.
@freezed
abstract class AwayDocument with _$AwayDocument {
  const factory AwayDocument({
    required PotatoDocument potato,
    int? fieldId,
    int? buildingId,
  }) = _AwayDocument;

  factory AwayDocument.fromJson(Map<String, dynamic> json) =>
      _$AwayDocumentFromJson(json);
}

@freezed
abstract class PotatoDocument with _$PotatoDocument {
  const factory PotatoDocument({
    required int id,

    /// Its field tile; null outside fields.
    TilePos? tile,
    required PotatoType type,
    required Grade grade,
    required int level,
    required List<String> abilities,
    CombatStyle? style,
    required int grownMillis,
    required int livedMillis,
    required int productionMillis,
    required int stored,

    /// Seeds a breeding potato made, waiting to be harvested.
    @Default(<Seed>[]) List<Seed> seeds,
    @Default(false) bool weak,
  }) = _PotatoDocument;

  const PotatoDocument._();

  factory PotatoDocument.fromJson(Map<String, dynamic> json) =>
      _$PotatoDocumentFromJson(json);

  factory PotatoDocument.of(Potato potato, [TilePos? tile]) => PotatoDocument(
    id: potato.id,
    tile: tile,
    type: potato.type,
    grade: potato.grade,
    level: potato.level,
    abilities: potato.abilities,
    style: potato.style,
    grownMillis: potato.grownMillis,
    livedMillis: potato.livedMillis,
    productionMillis: potato.productionMillis,
    stored: potato.stored,
    seeds: List.of(potato.seeds),
    weak: potato.weak,
  );

  Potato toPotato() => Potato(
    id: id,
    type: type,
    grade: grade,
    level: level,
    abilities: abilities,
    style: style,
    grownMillis: grownMillis,
    livedMillis: livedMillis,
    productionMillis: productionMillis,
    stored: stored,
    seeds: seeds,
    weak: weak,
  );
}

/// A seed waiting for room in the pouch.
@freezed
abstract class OverflowDocument with _$OverflowDocument {
  const factory OverflowDocument({
    required Seed seed,
    required int expiresTick,
  }) = _OverflowDocument;

  factory OverflowDocument.fromJson(Map<String, dynamic> json) =>
      _$OverflowDocumentFromJson(json);
}

/// A letter in the mailbox.
@freezed
abstract class MailDocument with _$MailDocument {
  const factory MailDocument({
    required int id,
    required MailKind kind,
    required int tick,
    String? building,
    String? story,
    @Default(<Seed>[]) List<Seed> seeds,
    @Default(0) int food,
    @Default(false) bool read,
    @Default(false) bool claimed,
  }) = _MailDocument;

  const MailDocument._();

  factory MailDocument.of(Mail mail) => MailDocument(
    id: mail.id,
    kind: mail.kind,
    tick: mail.tick,
    building: mail.building,
    story: mail.story,
    seeds: mail.seeds,
    food: mail.food,
    read: mail.read,
    claimed: mail.claimed,
  );

  factory MailDocument.fromJson(Map<String, dynamic> json) =>
      _$MailDocumentFromJson(json);

  Mail toMail() => Mail(
    id: id,
    kind: kind,
    tick: tick,
    building: building,
    story: story,
    seeds: seeds,
    food: food,
    read: read,
    claimed: claimed,
  );
}
