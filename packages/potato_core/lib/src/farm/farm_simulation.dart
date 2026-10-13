import 'dart:collection';
import 'dart:math' as math;

import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/farm_building.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_event.dart';
import 'package:potato_core/src/farm/farm_totals.dart';
import 'package:potato_core/src/farm/pest.dart';
import 'package:potato_core/src/potatoes/ability_roller.dart';
import 'package:potato_core/src/potatoes/guard.dart';
import 'package:potato_core/src/potatoes/potato.dart';
import 'package:potato_core/src/potatoes/potato_effects.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// One farm's state and rules, advanced in fixed steps.
///
/// Screens read the state every frame, send player input through [apply],
/// and collect what happened with [takeEvents]. Time only moves in [step], so
/// running while the app is open and catching up after it was closed use the
/// same code and give the same result.
///
/// Every collection is walked in id order, so the random draws come in the
/// same order after a reload.
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
    Iterable<FarmBuilding> buildings = const [],
    Iterable<Guard> guards = const [],
    Iterable<Potato> fridge = const [],
    Iterable<AwayPotato> away = const [],
    Iterable<Potato> graves = const [],
    FarmTotals? totals,
  }) : _graves = List.of(graves),
       _fields = SplayTreeMap.fromIterable(fields, key: (f) => f.id),
       _buildings = SplayTreeMap.fromIterable(buildings, key: (b) => b.id),
       _guards = SplayTreeMap.fromIterable(guards, key: (g) => g.potato.id),
       _fridge = SplayTreeMap.fromIterable(fridge, key: (p) => p.id),
       _away = SplayTreeMap.fromIterable(away, key: (a) => a.potato.id),
       totals = totals ?? FarmTotals(),
       _roller = AbilityRoller(catalog),
       _effects = PotatoEffects(catalog) {
    for (final field in _fields.values) {
      field._potatoes.values.forEach(_adopt);
    }
    for (final guard in _guards.values) {
      _adopt(guard.potato);
    }
    _fridge.values.forEach(_adopt);
    for (final away in _away.values) {
      _adopt(away.potato);
    }
    _graves.forEach(_adopt);
  }

  /// A new farm laid out by the catalog's `new_farm` rules.
  ///
  /// [seed] starts this farm's random sequence.
  factory FarmSimulation.newFarm(Catalog catalog, {required int seed}) {
    final start = catalog.rules.newFarm;
    final random = GameRandom(seed);
    final roller = AbilityRoller(catalog);
    final seeds = SeedPouch();
    for (final stack in start.seeds) {
      for (var i = 0; i < stack.count; i++) {
        seeds.add(
          roller.seed(
            type: stack.type,
            grade: stack.grade,
            level: stack.level,
            random: random,
          ),
        );
      }
    }
    var nextId = 1;
    final fields = [
      for (final rect in start.fields) FarmField(id: nextId++, rect: rect),
    ];
    return FarmSimulation.restore(
      catalog: catalog,
      random: random,
      tick: 0,
      nextId: nextId,
      food: start.food,
      seeds: seeds,
      fields: fields,
    );
  }

  final Catalog catalog;
  final GameRandom _random;
  final AbilityRoller _roller;
  final PotatoEffects _effects;

  /// Each potato's effects and rates, kept until its field changes.
  final Map<int, _Worked> _worked = {};
  int _tick;
  int _nextId;
  final SeedPouch _seeds;
  final SplayTreeMap<int, FarmField> _fields;
  final SplayTreeMap<int, FarmBuilding> _buildings;
  final SplayTreeMap<int, Guard> _guards;
  final SplayTreeMap<int, Potato> _fridge;
  final SplayTreeMap<int, AwayPotato> _away;

  /// Dead potatoes in the graveyards, oldest first.
  final List<Potato> _graves;
  final List<FarmEvent> _events = [];

  /// Baby potatoes the farm owns.
  int food;

  /// Running counts, saved with the farm.
  final FarmTotals totals;

  RulesData get _rules => catalog.rules;

  /// Steps run since the farm was made.
  int get tick => _tick;

  /// Game time since the farm was made.
  Duration get elapsed => _rules.farm.step * _tick;

  /// The next id to hand out to a field, building, or potato.
  int get nextId => _nextId;

  /// The random generator's state, to store in the save.
  List<int> get randomState => _random.state;

  SeedPouch get seeds => _seeds;

  /// Fields in id order.
  Iterable<FarmField> get fields => _fields.values;

  FarmField? field(int id) => _fields[id];

  /// Buildings in id order.
  Iterable<FarmBuilding> get buildings => _buildings.values;

  FarmBuilding? building(int id) => _buildings[id];

  /// Combat potatoes on the farm, growing or guarding, in id order.
  Iterable<Guard> get guards => _guards.values;

  /// Potatoes in the fridge, in id order.
  Iterable<Potato> get fridge => _fridge.values;

  /// Dead potatoes waiting in the graveyards, oldest first.
  Iterable<Potato> get graves => _graves;

  /// How many dead potatoes the graveyards keep.
  int get graveCapacity => _buildings.values.fold(0, (n, b) => n + b.graves);

  /// Potatoes out exploring.
  Iterable<Potato> get awayPotatoes => [for (final a in _away.values) a.potato];

  /// Potatoes out exploring, with where each came from.
  Iterable<AwayPotato> get awayEntries => _away.values;

  /// The potato with [id], wherever it is: in a field, guarding, in the
  /// fridge, or away.
  Potato? potatoById(int id) =>
      fieldSpotOf(id)?.potato ??
      _guards[id]?.potato ??
      _fridge[id] ??
      _away[id]?.potato;

  /// Where the potato with [id] is planted, if it is in a field.
  ({FarmField field, TilePos tile, Potato potato})? fieldSpotOf(int id) {
    for (final field in _fields.values) {
      for (final MapEntry(key: tile, value: potato)
          in field._potatoes.entries) {
        if (potato.id == id) return (field: field, tile: tile, potato: potato);
      }
    }
    return null;
  }

  /// What reaches [potato] from its own abilities and its field's: the
  /// values the rules use for it now.
  StatSums effectsOn(Potato potato) =>
      _work(potato, fieldSpotOf(potato.id)?.field).sums;

  /// Baby potatoes [potato] eats per upkeep payment now.
  int upkeepOf(Potato potato) => _effects.upkeepOf(potato, effectsOn(potato));

  /// How many potatoes of [type] the farm's buildings look after, or null
  /// for a type with no limit.
  int? capacityOf(PotatoType type) {
    if (catalog.potatoType(type).unlockBuilding == null) return null;
    var capacity = 0;
    for (final building in _buildings.values) {
      if (building.data.houses == type) capacity += building.capacity;
    }
    return capacity;
  }

  /// Potatoes of [type] counted against [capacityOf]: planted ones for
  /// field types, growing and guarding ones for combat. Potatoes in the
  /// fridge or away do not count.
  int countOf(PotatoType type) {
    if (type == PotatoType.combat) return _guards.length;
    var count = 0;
    for (final field in _fields.values) {
      for (final potato in field._potatoes.values) {
        if (potato.type == type) count++;
      }
    }
    return count;
  }

  /// Whether a building could stand on [rect]: on open land, with one free
  /// tile (corners included) between it and every field and building.
  /// [ignoring] is a building to leave out, e.g. one being moved.
  bool canPlace(TileRect rect, {int? ignoring}) {
    final open = _rules.farm.openArea;
    if (rect.left < open.left ||
        rect.top < open.top ||
        rect.right > open.right ||
        rect.bottom > open.bottom) {
      return false;
    }
    final others = [
      for (final field in _fields.values) field.rect,
      for (final building in _buildings.values)
        if (building.id != ignoring) building.rect,
    ];
    for (final other in others) {
      final margin = TileRect(
        origin: other.origin - const TilePos(1, 1),
        width: other.width + 2,
        height: other.height + 2,
      );
      if (rect.overlaps(margin)) return false;
    }
    return true;
  }

  /// Runs a player command. Returns null when it worked, or why not.
  FarmRejection? apply(FarmCommand command) => switch (command) {
    PlantSeed(:final fieldId, :final tile, :final seed) => _plant(
      fieldId,
      tile,
      seed,
    ),
    HarvestPotato(:final fieldId, :final tile) => _harvest(fieldId, tile),
    HarvestField(:final fieldId) => _harvestField(fieldId),
    BuildBuilding(:final kind, :final origin) => _build(kind, origin),
    UpgradeBuilding(:final buildingId) => _upgrade(buildingId),
    DemolishBuilding(:final buildingId) => _demolish(buildingId),
    TrainSeed(:final buildingId, :final seed) => _train(buildingId, seed),
    ClearPest(:final fieldId) => _tapPest(fieldId),
    Uproot(:final potatoId) => _uproot(potatoId),
    Replant(:final potatoId, :final fieldId, :final tile) => _replant(
      potatoId,
      fieldId,
      tile,
    ),
    Retrain(:final potatoId, :final buildingId) => _retrain(
      potatoId,
      buildingId,
    ),
    Revive(:final potatoId) => _revive(potatoId),
    Depart(:final food, :final potatoIds) => _depart(food, potatoIds),
    ReturnHome(:final food, :final seeds, :final potatoIds) => _returnHome(
      food,
      seeds,
      potatoIds,
    ),
  };

  /// Advances the farm by one fixed step (`rules.farm.step_millis`).
  void step() {
    _tick++;
    final millis = _rules.farm.stepMillis;
    for (final field in _fields.values) {
      _stepField(field, millis);
    }
    _stepGuards(millis);
    _stepFridge(millis);
    if (_isDue(_rules.pests.checkEverySeconds)) _rollPests();
    if (_isDue(_rules.potatoes.upkeepEverySeconds)) _payUpkeep();
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

  // Time.

  /// True on the steps that end an interval of [seconds] (the catalog
  /// checks it is a whole number of steps).
  bool _isDue(int seconds) =>
      _tick % (seconds * 1000 ~/ _rules.farm.stepMillis) == 0;

  void _stepField(FarmField field, int millis) {
    final pest = field.pest;
    if (pest != null) _harm(field, pest, millis);
    List<TilePos>? dead;
    for (final MapEntry(key: tile, value: potato) in field._potatoes.entries) {
      final change = potato.live(
        millis,
        catalog.potatoType(potato.type),
        _work(potato, field).rates,
      );
      if (change.grew) {
        _events.add(
          FarmEvent.grown(fieldId: field.id, tile: tile, potatoId: potato.id),
        );
      }
      if (change.died) (dead ??= []).add(tile);
    }
    for (final tile in dead ?? const <TilePos>[]) {
      final potato = field._take(tile)!;
      _events.add(
        FarmEvent.died(
          fieldId: field.id,
          tile: tile,
          potatoId: potato.id,
          type: potato.type,
          buried: _bury(potato),
        ),
      );
    }
  }

  void _harm(FarmField field, Pest pest, int millis) {
    switch (pest.kind) {
      case PestKind.blight:
        final extra = millis * _rules.pests.blight.extraAgingPercent ~/ 100;
        for (final potato in field._potatoes.values) {
          potato.livedMillis += extra;
          totals.lifeLostToBlightMillis += extra;
        }
      case PestKind.bug:
        final bug = _rules.pests.bug;
        final everyMillis = bug.eatEverySeconds * 1000;
        pest.biteMillis += millis;
        while (pest.biteMillis >= everyMillis) {
          pest.biteMillis -= everyMillis;
          var left = bug.eatAmount;
          for (final potato in field._potatoes.values) {
            if (left == 0) break;
            final eaten = math.min(left, potato.stored);
            potato.stored -= eaten;
            left -= eaten;
            totals.foodEatenByBugs += eaten;
          }
        }
    }
  }

  void _stepGuards(int millis) {
    final data = catalog.potatoType(PotatoType.combat);
    List<Guard>? dead;
    for (final guard in _guards.values) {
      final change = guard.potato.live(millis, data, _work(guard.potato).rates);
      if (change.grew) _events.add(FarmEvent.grown(potatoId: guard.potato.id));
      if (change.died) {
        (dead ??= []).add(guard);
      } else if (guard.potato.isGrown(data)) {
        _patrol(guard, millis);
        _harvestFor(guard);
      }
    }
    for (final guard in dead ?? const <Guard>[]) {
      _guards.remove(guard.potato.id);
      _events.add(
        FarmEvent.died(
          at: guard.at,
          potatoId: guard.potato.id,
          type: guard.potato.type,
          buried: _bury(guard.potato),
        ),
      );
    }
    _sendIdleGuards();
    for (final field in _fields.values) {
      final pest = field.pest;
      if (pest != null && pest.clearedMillis >= _clearMillis(pest.kind)) {
        _clear(field, byTap: false);
      }
    }
  }

  /// Walks a guard toward its target, or works on the pest once there.
  void _patrol(Guard guard, int millis) {
    final fieldId = guard.targetFieldId;
    if (fieldId == null) return;
    final field = _fields[fieldId];
    final pest = field?.pest;
    if (field == null || pest == null) {
      guard
        ..targetFieldId = null
        ..walkMillis = 0;
    } else if (guard.walkMillis > 0) {
      guard.walkMillis = math.max(0, guard.walkMillis - millis);
      if (guard.walkMillis == 0) guard.at = _besideField(field, guard.at);
    } else {
      final speed = switch (pest.kind) {
        PestKind.bug => FarmStat.bugClearSpeed,
        PestKind.blight => FarmStat.blightClearSpeed,
      };
      final effort = _effort(guard.potato, millis);
      pest.clearedMillis += _work(guard.potato).sums
          .apply(speed, effort.toDouble())
          .floor();
    }
  }

  /// Sends each grown guard without a target to the pest with the fewest
  /// guards on it, the nearest first among those.
  void _sendIdleGuards() {
    final pests = [
      for (final field in _fields.values)
        if (field.pest != null) field,
    ];
    if (pests.isEmpty) return;
    final data = catalog.potatoType(PotatoType.combat);
    final assigned = <int, int>{};
    for (final guard in _guards.values) {
      final target = guard.targetFieldId;
      if (target != null) assigned[target] = (assigned[target] ?? 0) + 1;
    }
    for (final guard in _guards.values) {
      if (guard.targetFieldId != null || !guard.potato.isGrown(data)) continue;
      FarmField? best;
      var bestLoad = 0;
      var bestDistance = 0;
      for (final field in pests) {
        final load = assigned[field.id] ?? 0;
        final distance = guard.at.manhattanDistanceTo(
          _besideField(field, guard.at),
        );
        if (best == null ||
            load < bestLoad ||
            (load == bestLoad && distance < bestDistance)) {
          best = field;
          bestLoad = load;
          bestDistance = distance;
        }
      }
      assigned[best!.id] = bestLoad + 1;
      guard
        ..targetFieldId = best.id
        ..walkMillis = walkMillisFor(guard.potato, bestDistance);
      if (guard.walkMillis == 0) guard.at = _besideField(best, guard.at);
    }
  }

  void _stepFridge(int millis) {
    final aging = millis * _rules.potatoes.fridge.agingPercent ~/ 100;
    List<Potato>? dead;
    for (final potato in _fridge.values) {
      final data = catalog.potatoType(potato.type);
      // Growth stops in the fridge, and life only starts once grown.
      if (!potato.isGrown(data)) continue;
      potato.livedMillis += aging;
      if (potato.isDead) (dead ??= []).add(potato);
    }
    for (final potato in dead ?? const <Potato>[]) {
      _fridge.remove(potato.id);
      _events.add(
        FarmEvent.died(
          potatoId: potato.id,
          type: potato.type,
          buried: _bury(potato),
        ),
      );
    }
  }

  /// Rolls for a new pest on each field that has potatoes and no pest.
  /// Bugs only come where baby potatoes are stored, more likely the more
  /// there are; blight can come to any planted field.
  void _rollPests() {
    final rules = _rules.pests;
    for (final field in _fields.values) {
      if (field.pest != null || field._potatoes.isEmpty) continue;
      var stored = 0;
      for (final potato in field._potatoes.values) {
        stored += potato.stored;
      }
      final sums = field._sums(_effects);
      PestKind? kind;
      if (stored > 0 &&
          _random.chance(
            sums.apply(
              FarmStat.blightChance,
              math.min(rules.bug.chanceMax, stored * rules.bug.chancePerStored),
            ),
          )) {
        kind = PestKind.bug;
      } else if (_random.chance(
        sums.apply(FarmStat.blightChance, rules.blight.chance),
      )) {
        kind = PestKind.blight;
      }
      if (kind == null) continue;
      field.pest = Pest(kind: kind);
      totals.pestsAppeared++;
      _events.add(FarmEvent.pestAppeared(fieldId: field.id, kind: kind));
    }
  }

  /// Takes upkeep from the farm's baby potatoes, oldest potato first. One
  /// that cannot be paid for in full turns weak; a weak one that is paid
  /// for recovers.
  void _payUpkeep() {
    final payers = [
      for (final field in _fields.values)
        for (final potato in field._potatoes.values) (potato, field),
      for (final guard in _guards.values) (guard.potato, null),
    ]..sort((a, b) => a.$1.id.compareTo(b.$1.id));
    final weakened = <int>[];
    final recovered = <int>[];
    for (final (potato, field) in payers) {
      final cost = _effects.upkeepOf(potato, _work(potato, field).sums);
      if (cost == 0) continue;
      if (food >= cost) {
        food -= cost;
        totals.upkeepPaid += cost;
        if (potato.weak) {
          potato.weak = false;
          recovered.add(potato.id);
        }
      } else if (!potato.weak) {
        potato.weak = true;
        weakened.add(potato.id);
      }
    }
    if (weakened.isNotEmpty) {
      _events.add(FarmEvent.weakened(potatoIds: weakened));
    }
    if (recovered.isNotEmpty) {
      _events.add(FarmEvent.recovered(potatoIds: recovered));
    }
  }

  // Commands.

  FarmRejection? _plant(int fieldId, TilePos tile, Seed seed) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    if (!field.rect.contains(tile)) return FarmRejection.outsideField;
    if (field._potatoes.containsKey(tile)) return FarmRejection.tileTaken;
    if (seed.type == PotatoType.combat) return FarmRejection.wrongPlace;
    final full = _roomFor(seed.type);
    if (full != null) return full;
    if (!_seeds.take(seed)) return FarmRejection.noSeed;

    final gradeUp = _breedingRaises(field, seed.grade);
    final potato = _sprout(seed, gradeUp ? seed.grade.higher! : seed.grade);
    field._put(tile, potato);
    _events.add(
      FarmEvent.planted(
        fieldId: fieldId,
        tile: tile,
        potatoId: potato.id,
        seed: seed,
        gradeUp: gradeUp,
      ),
    );
    return null;
  }

  FarmRejection? _harvest(int fieldId, TilePos tile) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    final potato = field._potatoes[tile];
    if (potato == null) return FarmRejection.noPotato;
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
      taken += potato.takeStored();
    }
    if (taken == 0) return FarmRejection.nothingToHarvest;
    food += taken;
    final chance = field
        ._sums(_effects)
        .apply(FarmStat.harvestRareChance, _rules.potatoes.harvestRareChance);
    final seed = _random.chance(chance) ? _fieldSeed(field) : null;
    if (seed != null) _seeds.add(seed);
    _events.add(
      FarmEvent.harvested(fieldId: field.id, food: taken, seed: seed),
    );
    return null;
  }

  FarmRejection? _build(String kind, TilePos origin) {
    final data = catalog.buildings[kind];
    if (data == null) return FarmRejection.noSuchBuilding;
    final building = FarmBuilding(id: _nextId, data: data, origin: origin);
    if (!canPlace(building.rect)) return FarmRejection.blocked;
    final cost = data.levels.first.cost;
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    _nextId++;
    _buildings[building.id] = building;
    _events.add(
      FarmEvent.built(buildingId: building.id, kind: kind, origin: origin),
    );
    return null;
  }

  FarmRejection? _upgrade(int buildingId) {
    final building = _buildings[buildingId];
    if (building == null) return FarmRejection.noSuchBuilding;
    final cost = building.upgradeCost;
    if (cost == null) return FarmRejection.maxLevel;
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    building.level++;
    _events.add(
      FarmEvent.upgraded(buildingId: buildingId, level: building.level),
    );
    return null;
  }

  FarmRejection? _demolish(int buildingId) {
    final building = _buildings.remove(buildingId);
    if (building == null) return FarmRejection.noSuchBuilding;
    final toFridge = <int>[];
    if (building.data.houses == PotatoType.combat) {
      final other = _trainingGround();
      final data = catalog.potatoType(PotatoType.combat);
      for (final guard in _guards.values.toList()) {
        if (guard.buildingId != buildingId) continue;
        if (other != null) {
          guard.buildingId = other.id;
          if (!guard.potato.isGrown(data)) guard.at = _doorOf(other);
        } else if (!guard.potato.isGrown(data)) {
          _guards.remove(guard.potato.id);
          _toFridge(guard.potato);
          toFridge.add(guard.potato.id);
        }
      }
    }
    _events.add(
      FarmEvent.demolished(buildingId: buildingId, toFridge: toFridge),
    );
    _trimGraves();
    return null;
  }

  FarmRejection? _train(int buildingId, Seed seed) {
    final building = _buildings[buildingId];
    if (building == null) return FarmRejection.noSuchBuilding;
    if (seed.type != PotatoType.combat ||
        building.data.houses != PotatoType.combat) {
      return FarmRejection.wrongPlace;
    }
    final full = _roomFor(PotatoType.combat);
    if (full != null) return full;
    if (!_seeds.take(seed)) return FarmRejection.noSeed;
    final potato = _sprout(seed, seed.grade);
    _guards[potato.id] = Guard(
      potato: potato,
      buildingId: buildingId,
      at: _doorOf(building),
    );
    _events.add(
      FarmEvent.trained(
        buildingId: buildingId,
        potatoId: potato.id,
        seed: seed,
      ),
    );
    return null;
  }

  FarmRejection? _tapPest(int fieldId) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    if (field.pest == null) return FarmRejection.noPest;
    _clear(field, byTap: true);
    return null;
  }

  FarmRejection? _uproot(int potatoId) {
    final spot = fieldSpotOf(potatoId);
    final guard = _guards[potatoId];
    if (spot == null && guard == null) return FarmRejection.noPotato;
    final potato = spot?.potato ?? guard!.potato;
    if (!potato.isGrown(catalog.potatoType(potato.type))) {
      return FarmRejection.stillGrowing;
    }
    if (_fridge.length >= _rules.potatoes.fridge.size) {
      return FarmRejection.fridgeFull;
    }
    if (spot != null) {
      spot.field._take(spot.tile);
      _toFridge(spot.potato);
    } else {
      _guards.remove(potatoId);
      _toFridge(guard!.potato);
    }
    _events.add(FarmEvent.uprooted(potatoId: potatoId));
    return null;
  }

  FarmRejection? _replant(int potatoId, int fieldId, TilePos tile) {
    final potato = _fridge[potatoId];
    if (potato == null) return FarmRejection.notInFridge;
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    if (!field.rect.contains(tile)) return FarmRejection.outsideField;
    if (field._potatoes.containsKey(tile)) return FarmRejection.tileTaken;
    if (potato.type == PotatoType.combat) return FarmRejection.wrongPlace;
    final full = _roomFor(potato.type);
    if (full != null) return full;
    _fridge.remove(potatoId);
    field._put(tile, potato);
    _events.add(FarmEvent.takenOut(potatoId: potatoId));
    return null;
  }

  FarmRejection? _retrain(int potatoId, int buildingId) {
    final potato = _fridge[potatoId];
    if (potato == null) return FarmRejection.notInFridge;
    final building = _buildings[buildingId];
    if (building == null) return FarmRejection.noSuchBuilding;
    if (potato.type != PotatoType.combat ||
        building.data.houses != PotatoType.combat) {
      return FarmRejection.wrongPlace;
    }
    final full = _roomFor(PotatoType.combat);
    if (full != null) return full;
    _fridge.remove(potatoId);
    _guards[potatoId] = Guard(
      potato: potato,
      buildingId: buildingId,
      at: _doorOf(building),
    );
    _events.add(FarmEvent.takenOut(potatoId: potatoId));
    return null;
  }

  FarmRejection? _depart(int food, List<int> potatoIds) {
    if (food < 0 || food > this.food) return FarmRejection.notEnoughFood;
    final going = <AwayPotato>[];
    for (final id in potatoIds.toSet()) {
      final spot = fieldSpotOf(id);
      final guard = _guards[id];
      final potato = spot?.potato ?? guard?.potato;
      if (potato == null ||
          potato.type == PotatoType.breeding ||
          !potato.isGrown(catalog.potatoType(potato.type))) {
        return FarmRejection.cannotGo;
      }
      going.add(
        AwayPotato(
          potato: potato,
          fieldId: spot?.field.id,
          tile: spot?.tile,
          buildingId: guard?.buildingId,
        ),
      );
    }
    this.food -= food;
    for (final away in going) {
      final id = away.potato.id;
      if (away.fieldId case final fieldId?) {
        _fields[fieldId]!._take(away.tile!);
      } else {
        _guards.remove(id);
      }
      _away[id] = away;
    }
    _events.add(
      FarmEvent.departed(
        food: food,
        potatoIds: [for (final a in going) a.potato.id],
      ),
    );
    return null;
  }

  FarmRejection? _returnHome(
    int food,
    List<SeedCount> seeds,
    List<int> potatoIds,
  ) {
    this.food += food;
    var seedCount = 0;
    for (final stack in seeds) {
      _seeds.add(stack.seed, stack.count);
      seedCount += stack.count;
    }
    final back = <int>[];
    final toFridge = <int>[];
    for (final id in potatoIds) {
      final away = _away.remove(id);
      if (away == null) continue;
      back.add(id);
      if (!_placeBack(away)) {
        _toFridge(away.potato);
        toFridge.add(id);
      }
    }
    _events.add(
      FarmEvent.returned(
        food: food,
        seeds: seedCount,
        potatoIds: back,
        toFridge: toFridge,
      ),
    );
    return null;
  }

  /// Puts a returning companion back where it came from, if that place is
  /// still there, free, and within its type's limit.
  bool _placeBack(AwayPotato away) {
    final potato = away.potato;
    if (_roomFor(potato.type) != null) return false;
    if (away.fieldId case final fieldId?) {
      final field = _fields[fieldId];
      final tile = away.tile!;
      if (field == null || field._potatoes.containsKey(tile)) return false;
      field._put(tile, potato);
      return true;
    }
    final home = _buildings[away.buildingId];
    final building = home != null && home.data.houses == PotatoType.combat
        ? home
        : _trainingGround();
    if (building == null) return false;
    _guards[potato.id] = Guard(
      potato: potato,
      buildingId: building.id,
      at: _doorOf(building),
    );
    return true;
  }

  // Helpers.

  /// Why there is no room for one more potato of [type], or null if there
  /// is.
  FarmRejection? _roomFor(PotatoType type) {
    final capacity = capacityOf(type);
    if (capacity == null) return null;
    if (!_buildings.values.any((b) => b.data.houses == type)) {
      return FarmRejection.typeLocked;
    }
    return countOf(type) < capacity ? null : FarmRejection.atCapacity;
  }

  void _toFridge(Potato potato) {
    potato.weak = false;
    _fridge[potato.id] = potato;
  }

  FarmBuilding? _trainingGround() {
    for (final building in _buildings.values) {
      if (building.data.houses == PotatoType.combat) return building;
    }
    return null;
  }

  /// The tile in front of a building where its guards come out.
  TilePos _doorOf(FarmBuilding building) {
    final rect = building.rect;
    return TilePos(rect.left, math.min(rect.bottom, _rules.farm.size - 1));
  }

  /// The tile next to [field] nearest to [from], where a guard stands.
  TilePos _besideField(FarmField field, TilePos from) {
    final rect = field.rect;
    return TilePos(
      from.x.clamp(rect.left - 1, rect.right),
      from.y.clamp(rect.top - 1, rect.bottom),
    );
  }

  /// How hard a potato works now, in percent.
  int _strengthPercent(Potato potato) =>
      potato.weak ? _rules.potatoes.weakPercent : 100;

  int _effort(Potato potato, int millis) =>
      millis * _strengthPercent(potato) ~/ 100;

  int _clearMillis(PestKind kind) =>
      switch (kind) {
        PestKind.bug => _rules.pests.bug.clearSeconds,
        PestKind.blight => _rules.pests.blight.clearSeconds,
      } *
      1000;

  /// Removes a field's pest and pays the reward: a few baby potatoes and
  /// sometimes a normal seed of the type most planted there.
  void _clear(FarmField field, {required bool byTap}) {
    final pest = field.pest!;
    field.pest = null;
    final reward = _rules.pests.reward;
    final gained =
        reward.foodMin + _random.nextInt(reward.foodMax - reward.foodMin + 1);
    final seed = _random.chance(reward.seedChance) ? _fieldSeed(field) : null;
    food += gained;
    if (seed != null) _seeds.add(seed);
    if (byTap) {
      totals.pestsClearedByTap++;
    } else {
      totals.pestsClearedByGuards++;
    }
    for (final guard in _guards.values) {
      if (guard.targetFieldId == field.id) {
        guard
          ..targetFieldId = null
          ..walkMillis = 0;
      }
    }
    _events.add(
      FarmEvent.pestCleared(
        fieldId: field.id,
        kind: pest.kind,
        byTap: byTap,
        food: gained,
        seed: seed,
      ),
    );
  }

  /// Rolls whether a seed of [grade] planted in [field] comes up one grade
  /// higher thanks to a grown breeding potato there. Weak breeders do it
  /// less often, unless one of them is fed.
  bool _breedingRaises(FarmField field, Grade grade) {
    if (grade.higher == null) return false;
    final data = catalog.potatoType(PotatoType.breeding);
    final breeders = [
      for (final potato in field._potatoes.values)
        if (potato.type == PotatoType.breeding && potato.isGrown(data)) potato,
    ];
    if (breeders.isEmpty) return false;
    var best = 0.0;
    for (final breeder in breeders) {
      final chance =
          _effects.gradeUpChanceOf(breeder, _work(breeder, field).sums) *
          _strengthPercent(breeder) /
          100;
      if (chance > best) best = chance;
    }
    return _random.chance(best);
  }

  /// Puts dead [potato] in a graveyard; false when the farm has none. A
  /// full graveyard loses its oldest grave.
  bool _bury(Potato potato) {
    _worked.remove(potato.id);
    potato
      ..weak = false
      ..stored = 0;
    if (graveCapacity == 0) return false;
    _graves.add(potato);
    _trimGraves();
    return true;
  }

  /// Drops the oldest graves past the graveyards' capacity.
  void _trimGraves() {
    while (_graves.length > graveCapacity) {
      final lost = _graves.removeAt(0);
      _events.add(FarmEvent.graveLost(potatoId: lost.id));
    }
  }

  FarmRejection? _revive(int potatoId) {
    final index = _graves.indexWhere((p) => p.id == potatoId);
    if (index < 0) return FarmRejection.noGrave;
    final potato = _graves.removeAt(index);
    _events.add(
      FarmEvent.revived(
        potatoId: potatoId,
        from: potato.grade,
        seed: _leaveSeed(potato),
      ),
    );
    return null;
  }

  /// The seed a dead potato leaves: its own kind, sometimes a grade lower.
  ///
  /// An ability can give a chance of a grade higher instead.
  Seed _leaveSeed(Potato potato) {
    var grade = potato.grade;
    final drops = _random.chance(_rules.potatoes.gradeDropChance);
    // Only its own abilities: it has left its field.
    final sums = _effects.own(potato);
    final upChance = sums.apply(FarmStat.deathSeedGradeUpChance, 0);
    if (drops) {
      grade = grade.lower ?? grade;
    } else if (upChance > 0 && _random.chance(upChance)) {
      grade = grade.higher ?? grade;
    }
    final seed = potato.seed.copyWith(grade: grade);
    _seeds.add(seed);
    return seed;
  }

  /// A new potato from [seed], at [grade] (a breeding potato may have raised
  /// it): the seed's ability first, then the rest of its slots rolled.
  Potato _sprout(Seed seed, Grade grade) {
    final potato = Potato(
      id: _nextId++,
      type: seed.type,
      grade: grade,
      level: seed.level,
      abilities: _roller.slots(
        type: seed.type,
        grade: grade,
        first: seed.ability,
        random: _random,
      ),
      style: seed.style,
    );
    _adopt(potato);
    return potato;
  }

  /// Works out what never changes for [potato] once it is on the farm.
  void _adopt(Potato potato) {
    potato.lifespanMillis = _effects.lifespanMillisOf(potato);
  }

  /// A normal seed of the type planted most in [field], at the highest
  /// level among those potatoes; null for an empty field.
  Seed? _fieldSeed(FarmField field) {
    final type = field.mostPlanted;
    if (type == null) return null;
    var level = 0;
    for (final potato in field._potatoes.values) {
      if (potato.type == type && potato.level > level) level = potato.level;
    }
    return _roller.seed(
      type: type,
      grade: Grade.normal,
      level: level,
      random: _random,
    );
  }

  /// Walking time for [potato] over [tiles], at its style's pace, slower
  /// when weak.
  int walkMillisFor(Potato potato, int tiles) {
    final style = potato.style;
    final pace = style == null
        ? 100
        : _rules.potatoes.combatStyles[style]?.walkPercent ?? 100;
    return tiles *
        _rules.potatoes.guards.walkMillisPerTile *
        100 ~/
        _strengthPercent(potato) *
        100 ~/
        pace;
  }

  /// A guard with a harvesting ability takes baby potatoes from the field
  /// with the most stored, every so often.
  void _harvestFor(Guard guard) {
    final effect = _effects.periodic(guard.potato, FarmAction.harvestFood);
    final interval = effect?.intervalInUse;
    final amount = effect?.valueInUse?.floor() ?? 0;
    if (interval == null || amount <= 0 || !_isDue(interval)) return;
    FarmField? richest;
    var most = 0;
    for (final field in _fields.values) {
      var stored = 0;
      for (final potato in field._potatoes.values) {
        stored += potato.stored;
      }
      if (stored > most) {
        most = stored;
        richest = field;
      }
    }
    if (richest == null) return;
    var left = amount;
    for (final potato in richest._potatoes.values) {
      if (left == 0) break;
      final taken = math.min(left, potato.stored);
      potato.stored -= taken;
      left -= taken;
    }
    final taken = amount - left;
    food += taken;
    totals.foodHarvestedByGuards += taken;
  }

  /// [potato]'s effects and rates, from the cache while its field (if any)
  /// has not changed.
  _Worked _work(Potato potato, [FarmField? field]) {
    final version = field?._version ?? -1;
    final cached = _worked[potato.id];
    if (cached != null &&
        cached.fieldId == field?.id &&
        cached.version == version) {
      return cached;
    }
    final sums = <String, StatSum>{}..addAll(_effects.own(potato));
    if (field != null) sums.addAll(field._sums(_effects));
    final worked = _Worked(
      fieldId: field?.id,
      version: version,
      sums: sums,
      rates: _effects.ratesOf(potato, sums),
    );
    _worked[potato.id] = worked;
    return worked;
  }
}

/// A field on the farm and the potatoes planted in it, one per tile.
final class FarmField {
  /// [potatoes] may come in any order; they are kept in id order, which
  /// keeps every step's order, and so its random draws, the same after a
  /// reload.
  FarmField({
    required this.id,
    required this.rect,
    Map<TilePos, Potato> potatoes = const {},
    this.pest,
  }) {
    _potatoes.addEntries(_byId(potatoes.entries));
  }

  final int id;
  final TileRect rect;
  final Map<TilePos, Potato> _potatoes = {};

  /// The bug or blight on this field, if any.
  Pest? pest;

  /// Bumped whenever the potatoes here change, so cached effects redo.
  int _version = 0;
  int _sumsVersion = -1;
  StatSums _cachedSums = const {};

  /// Effects that reach every potato here (and the field itself).
  StatSums _sums(PotatoEffects effects) {
    if (_sumsVersion != _version) {
      _cachedSums = effects.field(_potatoes.values);
      _sumsVersion = _version;
    }
    return _cachedSums;
  }

  Potato? _take(TilePos tile) {
    _version++;
    return _potatoes.remove(tile);
  }

  /// Potatoes by tile, in id order.
  Map<TilePos, Potato> get potatoes => UnmodifiableMapView(_potatoes);

  Potato? potatoAt(TilePos tile) => _potatoes[tile];

  /// The potato type planted most here (the first type on a tie), or null
  /// for an empty field.
  PotatoType? get mostPlanted {
    final counts = <PotatoType, int>{};
    for (final potato in _potatoes.values) {
      counts[potato.type] = (counts[potato.type] ?? 0) + 1;
    }
    PotatoType? most;
    for (final type in PotatoType.values) {
      if ((counts[type] ?? 0) > (counts[most] ?? 0)) most = type;
    }
    return most;
  }

  /// Plants [potato] on [tile], keeping id order even for a potato older
  /// than the rest (back from the fridge or from exploring).
  void _put(TilePos tile, Potato potato) {
    _version++;
    final isNewest = _potatoes.values.every((p) => p.id < potato.id);
    _potatoes[tile] = potato;
    if (isNewest) return;
    final ordered = _byId(_potatoes.entries);
    _potatoes
      ..clear()
      ..addEntries(ordered);
  }

  static List<MapEntry<TilePos, Potato>> _byId(
    Iterable<MapEntry<TilePos, Potato>> entries,
  ) => entries.toList()..sort((a, b) => a.value.id.compareTo(b.value.id));
}

/// A potato's effects and rates, as worked out for one state of its field.
final class _Worked {
  _Worked({
    required this.fieldId,
    required this.version,
    required this.sums,
    required this.rates,
  });

  final int? fieldId;
  final int version;
  final StatSums sums;
  final PotatoRates rates;
}
