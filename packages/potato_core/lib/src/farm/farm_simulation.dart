import 'dart:collection';

import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_event.dart';
import 'package:potato_core/src/potatoes/potato.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// One farm's state and rules, advanced in fixed steps.
///
/// Screens read the state every frame, send player input through [apply],
/// and collect what happened with [takeEvents]. Time only moves in [step], so
/// running while the app is open and catching up after it was closed use the
/// same code and give the same result.
final class FarmSimulation {
  /// Rebuilds a farm from saved state. Use `FarmDocument` to save and load;
  /// call [FarmSimulation.newFarm] to start one.
  FarmSimulation.restore({
    required this.catalog,
    required this._random,
    required this._tick,
    required this._nextId,
    required this.food,
    required this._seeds,
    required Iterable<FarmField> fields,
  }) : _fields = SplayTreeMap.fromIterable(fields, key: (f) => f.id);

  /// A new farm laid out by the catalog's `new_farm` rules.
  ///
  /// [seed] starts this farm's random sequence.
  factory FarmSimulation.newFarm(Catalog catalog, {required int seed}) {
    final start = catalog.rules.newFarm;
    final seeds = SeedPouch();
    for (final stack in start.seeds) {
      seeds.add(Seed(type: stack.type, grade: stack.grade), stack.count);
    }
    var nextId = 1;
    final fields = [
      for (final rect in start.fields) FarmField(id: nextId++, rect: rect),
    ];
    return FarmSimulation.restore(
      catalog: catalog,
      random: GameRandom(seed),
      tick: 0,
      nextId: nextId,
      food: start.food,
      seeds: seeds,
      fields: fields,
    );
  }

  final Catalog catalog;
  final GameRandom _random;
  int _tick;
  int _nextId;
  final SeedPouch _seeds;
  final SplayTreeMap<int, FarmField> _fields;
  final List<FarmEvent> _events = [];

  /// Baby potatoes the farm owns.
  int food;

  /// Steps run since the farm was made.
  int get tick => _tick;

  /// Game time since the farm was made.
  Duration get elapsed => catalog.rules.farm.step * _tick;

  /// The next id to hand out to a field or potato.
  int get nextId => _nextId;

  /// The random generator's state, to store in the save.
  List<int> get randomState => _random.state;

  SeedPouch get seeds => _seeds;

  /// Fields in id order.
  Iterable<FarmField> get fields => _fields.values;

  FarmField? field(int id) => _fields[id];

  /// Runs a player command. Returns null when it worked, or why not.
  FarmRejection? apply(FarmCommand command) => switch (command) {
    PlantSeed(:final fieldId, :final tile, :final seed) => _plant(
      fieldId,
      tile,
      seed,
    ),
    HarvestPotato(:final fieldId, :final tile) => _harvest(fieldId, tile),
    HarvestField(:final fieldId) => _harvestField(fieldId),
    Depart(:final food, :final potatoIds) => _depart(food, potatoIds),
    ReturnHome(:final food, :final seeds, :final potatoIds) => _returnHome(
      food,
      seeds,
      potatoIds,
    ),
  };

  /// The potato with [id], wherever it is planted.
  ({FarmField field, TilePos tile, Potato potato})? potatoById(int id) {
    for (final field in _fields.values) {
      for (final MapEntry(key: tile, value: potato)
          in field._potatoes.entries) {
        if (potato.id == id) return (field: field, tile: tile, potato: potato);
      }
    }
    return null;
  }

  /// Potatoes out exploring.
  Iterable<Potato> get awayPotatoes => [
    for (final field in _fields.values)
      for (final potato in field._potatoes.values)
        if (potato.away) potato,
  ];

  /// Advances the farm by one fixed step (`rules.farm.step_millis`).
  void step() {
    _tick++;
    final millis = catalog.rules.farm.stepMillis;
    for (final field in _fields.values) {
      List<TilePos>? dead;
      for (final MapEntry(key: tile, value: potato)
          in field._potatoes.entries) {
        if (potato.away) continue;
        final change = potato.live(millis, catalog.potatoType(potato.type));
        if (change.grew) {
          _events.add(
            FarmEvent.grown(fieldId: field.id, tile: tile, potatoId: potato.id),
          );
        }
        if (change.died) (dead ??= []).add(tile);
      }
      for (final tile in dead ?? const <TilePos>[]) {
        final potato = field._potatoes.remove(tile)!;
        final seedLeft = _seedLeftBy(potato);
        _seeds.add(seedLeft);
        _events.add(
          FarmEvent.died(
            fieldId: field.id,
            tile: tile,
            potatoId: potato.id,
            seedLeft: seedLeft,
          ),
        );
      }
    }
  }

  /// Runs [count] steps, e.g. to catch up on time the app was closed.
  void runSteps(int count) {
    for (var i = 0; i < count; i++) {
      step();
    }
  }

  /// Returns the events since the last call and forgets them.
  List<FarmEvent> takeEvents() {
    final events = List<FarmEvent>.of(_events);
    _events.clear();
    return events;
  }

  FarmRejection? _plant(int fieldId, TilePos tile, Seed seed) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    if (!field.rect.contains(tile)) return FarmRejection.outsideField;
    if (field._potatoes.containsKey(tile)) return FarmRejection.tileTaken;
    // No buildings exist yet, so only types without one can be planted.
    if (catalog.potatoType(seed.type).unlockBuilding != null) {
      return FarmRejection.typeLocked;
    }
    if (!_seeds.take(seed)) return FarmRejection.noSeed;

    final potato = Potato(id: _nextId++, type: seed.type, grade: seed.grade);
    field._potatoes[tile] = potato;
    _events.add(
      FarmEvent.planted(
        fieldId: fieldId,
        tile: tile,
        potatoId: potato.id,
        seed: seed,
      ),
    );
    return null;
  }

  FarmRejection? _harvest(int fieldId, TilePos tile) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    final potato = field._potatoes[tile];
    if (potato == null || potato.away) return FarmRejection.noPotato;
    return _collect(field, [potato]);
  }

  FarmRejection? _harvestField(int fieldId) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    return _collect(field, field._potatoes.values);
  }

  FarmRejection? _collect(FarmField field, Iterable<Potato> potatoes) {
    var taken = 0;
    for (final potato in potatoes) {
      if (!potato.away) taken += potato.takeStored();
    }
    if (taken == 0) return FarmRejection.nothingToHarvest;
    food += taken;
    _events.add(FarmEvent.harvested(fieldId: field.id, food: taken));
    return null;
  }

  FarmRejection? _depart(int food, List<int> potatoIds) {
    if (food < 0 || food > this.food) return FarmRejection.notEnoughFood;
    final going = <Potato>[];
    for (final id in potatoIds.toSet()) {
      final potato = potatoById(id)?.potato;
      if (potato == null ||
          potato.away ||
          potato.type == PotatoType.breeding ||
          !potato.isGrown(catalog.potatoType(potato.type))) {
        return FarmRejection.cannotGo;
      }
      going.add(potato);
    }
    this.food -= food;
    for (final potato in going) {
      potato.away = true;
    }
    _events.add(
      FarmEvent.departed(food: food, potatoIds: [for (final p in going) p.id]),
    );
    return null;
  }

  FarmRejection? _returnHome(
    int food,
    List<SeedStackData> seeds,
    List<int> potatoIds,
  ) {
    this.food += food;
    var seedCount = 0;
    for (final stack in seeds) {
      _seeds.add(Seed(type: stack.type, grade: stack.grade), stack.count);
      seedCount += stack.count;
    }
    final back = <int>[];
    for (final id in potatoIds) {
      final potato = potatoById(id)?.potato;
      if (potato == null || !potato.away) continue;
      potato.away = false;
      back.add(id);
    }
    _events.add(
      FarmEvent.returned(food: food, seeds: seedCount, potatoIds: back),
    );
    return null;
  }

  /// The seed a dead potato leaves: its own kind, sometimes a grade lower.
  Seed _seedLeftBy(Potato potato) {
    final drops = _random.chance(catalog.rules.potatoes.gradeDropChance);
    final grade = drops ? potato.grade.lower ?? potato.grade : potato.grade;
    return Seed(type: potato.type, grade: grade);
  }
}

/// A field on the farm and the potatoes planted in it, one per tile.
final class FarmField {
  /// [potatoes] must be in planting (id) order, which keeps every step's
  /// order, and so its random draws, the same after a reload.
  FarmField({
    required this.id,
    required this.rect,
    Map<TilePos, Potato> potatoes = const {},
  }) {
    final ordered = potatoes.entries.toList()
      ..sort((a, b) => a.value.id.compareTo(b.value.id));
    _potatoes.addEntries(ordered);
  }

  final int id;
  final TileRect rect;
  final Map<TilePos, Potato> _potatoes = {};

  /// Potatoes by tile, in planting order.
  Map<TilePos, Potato> get potatoes => UnmodifiableMapView(_potatoes);

  Potato? potatoAt(TilePos tile) => _potatoes[tile];
}
