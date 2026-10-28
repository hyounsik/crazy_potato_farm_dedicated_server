import 'dart:collection';
import 'dart:math' as math;

import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/catalog/story_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/farm/farm_building.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_event.dart';
import 'package:potato_core/src/farm/farm_totals.dart';
import 'package:potato_core/src/farm/mail.dart';
import 'package:potato_core/src/farm/pest.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/items/gear_stats.dart';
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
    Iterable<TilePos>? openBlocks,
    int? pouchSlots,
    int? gearSlots,
    Iterable<OverflowSeed> overflow = const [],
    Map<String, int> materials = const {},
    Iterable<Mail> mail = const [],
    Iterable<Gear> gear = const [],
    this.equipped = const Equipped(),
    this.progress = 0,
    int? totemLimit,
    FarmTotals? totals,
    Map<String, int> storyDone = const {},
    this.storySkipped = false,
    Iterable<Seed> returnedSeeds = const [],
    List<ItemStack?> bed = const [],
    List<ItemStack?> bag = const [],
  }) : _gear = List.of(gear),
       bed = Bag.restore([
         ...bed,
         for (var i = bed.length; i < catalog.rules.storage.bedSlots; i++) null,
       ], catalog.stackOf),
       _storyDone = Map.of(storyDone),
       _graves = List.of(graves),
       totemLimit = totemLimit ?? catalog.rules.totems.startLimit,
       pouchSlots = pouchSlots ?? catalog.rules.storage.pouchSlots,
       gearSlots = gearSlots ?? catalog.rules.storage.gearSlots,
       _overflow = List.of(overflow),
       _materials = SplayTreeMap.of(materials),
       _mail = List.of(mail),
       _openBlocks = {...(openBlocks ?? catalog.rules.farm.startBlocks)},
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
    _bag = Bag.restore([
      ...bag,
      for (var i = bag.length; i < _gearStats.bagSlots(equipped.bag); i++) null,
    ], catalog.stackOf);
    _settleBuildings();
    _unlockDone();
    // Seeds from old saves with nowhere left to wait (compost yards).
    returnedSeeds.forEach(_gainSeed);
  }

  /// Moves each building that no longer fits where it stands (a save from
  /// before its kind grew: house, training ground and graveyard on
  /// 2026-10-25) to the nearest place it fits. One that fits nowhere stays.
  void _settleBuildings() {
    final size = _rules.farm.size;
    for (final building in _buildings.values) {
      final totem = building.data.totem != null;
      if (canPlace(building.rect, ignoring: building.id, totem: totem)) {
        continue;
      }
      final from = building.origin;
      TilePos? best;
      var bestDistance = 0;
      for (var y = 0; y < size; y++) {
        for (var x = 0; x < size; x++) {
          final distance = (x - from.x).abs() + (y - from.y).abs();
          if (best != null && distance >= bestDistance) continue;
          final rect = TileRect(
            origin: TilePos(x, y),
            width: building.data.width,
            height: building.data.height,
          );
          if (!canPlace(rect, ignoring: building.id, totem: totem)) continue;
          best = TilePos(x, y);
          bestDistance = distance;
        }
      }
      if (best != null) building.origin = best;
    }
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
      _rollStack(roller, stack, random).forEach(seeds.add);
    }
    var nextId = 1;
    final fields = [
      for (final rect in start.fields) FarmField(id: nextId++, rect: rect),
    ];
    final buildings = [
      for (final building in start.buildings)
        FarmBuilding(
          id: nextId++,
          data: catalog.buildings[building.kind]!,
          origin: building.origin,
        ),
    ];
    final letters = [Mail(id: nextId++, kind: MailKind.start, tick: 0)];
    return FarmSimulation.restore(
      catalog: catalog,
      random: random,
      tick: 0,
      nextId: nextId,
      food: start.food,
      seeds: seeds,
      fields: fields,
      buildings: buildings,
      mail: letters,
      equipped: catalog.rules.gear.start,
    );
  }

  /// The seeds of [stack], each with its own rolled ability (and style)
  /// unless the stack fixes them.
  static List<Seed> _rollStack(
    AbilityRoller roller,
    SeedStackData stack,
    GameRandom random,
  ) => [
    for (var i = 0; i < stack.count; i++)
      if (roller.seed(
            type: stack.type,
            grade: stack.grade,
            level: stack.level,
            random: random,
          )
          case final rolled)
        rolled.copyWith(
          ability: stack.ability ?? rolled.ability,
          style: stack.style ?? rolled.style,
        ),
  ];

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

  /// Open blocks, in block units. Everything else is locked.
  final Set<TilePos> _openBlocks;

  /// Seeds the pouch holds, one per slot.
  int pouchSlots;

  /// Pieces of equipment the box holds.
  int gearSlots;

  /// Seeds that came with the pouch full, oldest first.
  final List<OverflowSeed> _overflow;

  /// Materials kept in the house, by item id.
  final SplayTreeMap<String, int> _materials;

  /// Letters, oldest first.
  final List<Mail> _mail;

  /// Equipment in the house box, beyond what is worn. May go past
  /// [gearSlots] when a run brings more home; nothing more fits then.
  final List<Gear> _gear;
  List<Gear> get gear => List.unmodifiable(_gear);

  /// The truck bed: the player's own, carried to friends' farms and shared
  /// there while open (`multiplayer.md`, 2026-10-28).
  final Bag bed;

  /// What came back from a run, to sort at home or carry on to the next run
  /// at a friend's farm (2026-10-28, 사용자). Empty when nothing is left to
  /// sort.
  Bag get bag => _bag;
  late Bag _bag;

  /// Copies of the stacks in [bag], to take along on a run.
  List<ItemStack> get bagItems => [
    for (final s in _bag.slots)
      if (s != null) s.copyWithCount(s.count),
  ];

  /// What the player wears (and takes on runs).
  Equipped equipped;

  late final GearStats _gearStats = GearStats(catalog);

  /// The highest zone score of a successful run: equipment and seeds up to
  /// this plus a margin may be used. Never goes down.
  int progress;

  /// Totems that may stand on the farm.
  int totemLimit;

  /// Bumped whenever a totem lights or goes out, so cached effects redo.
  int _totemVersion = 0;
  int _totemSumsVersion = -1;
  StatSums _cachedTotemSums = const {};
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

  /// Story events done, by id, with the step each was done on, in the
  /// order they were done.
  final Map<String, int> _storyDone;

  /// Unlock keys opened by the events done.
  final Set<String> _unlocked = {};

  /// Every feature is open and story events no longer happen: farms saved
  /// before the story existed, and the developer "unlock all".
  bool storySkipped;

  /// The story events done, by id, with the step each was done on.
  Map<String, int> get storyDone => UnmodifiableMapView(_storyDone);

  /// Whether the feature [key] (see [StoryUnlock]) is open on this farm.
  bool isUnlocked(String key) =>
      storySkipped ||
      _unlocked.contains(key) ||
      !catalog.story.locked.contains(key);

  /// Whether the build menu offers buildings of [kind].
  bool canBuildKind(String kind) => isUnlocked(StoryUnlock.building(kind));

  /// Whether the story opened any totem; the totem limit waits for one.
  bool get totemsOpen => catalog.buildings.values.any(
    (b) => b.totem != null && canBuildKind(b.id),
  );

  /// Whether runs may go to zone [zone].
  bool zoneOpen(String zone) => isUnlocked(StoryUnlock.zone(zone));

  /// The story events that may happen now, in story order: not done, and
  /// every event before them done.
  Iterable<StoryEventData> get storyEventsOpen sync* {
    if (storySkipped) return;
    for (final event in _storyEvents()) {
      if (!_storyDone.containsKey(event.data.id) &&
          event.after.every(_storyDone.containsKey)) {
        yield event.data;
      }
    }
  }

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

  /// How many potatoes the fridge (the potato cellar) holds. Companions
  /// coming home may go past it.
  int get fridgeSize => _buildings.values.fold(0, (n, b) => n + b.stores);

  /// Tiles the fields cover together.
  int get fieldTiles => _fields.values.fold(0, (n, f) => n + f.rect.area);

  /// Field tiles the farm looks after (2026-10-28): 36 to begin with and
  /// each field office's. Fields cannot be made or grown past it.
  int get fieldRoom => _buildings.values.fold(
    _rules.farm.fieldTiles,
    (n, b) => n + b.fieldTiles,
  );

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

  /// Baby potatoes the grown food potatoes in the fields make in an hour at
  /// their rates now (2026-10-27, for the top bar).
  double get foodPerHour {
    var total = 0.0;
    for (final field in _fields.values) {
      for (final potato in field._potatoes.values) {
        final data = catalog.potatoType(potato.type);
        final production = data.production;
        if (production == null || !potato.isGrown(data)) continue;
        final amount = production.amount[potato.grade] ?? 0;
        total +=
            amount *
            _work(potato, field).rates.foodYield *
            3600 /
            production.everySeconds;
      }
    }
    return total;
  }

  /// Baby potatoes upkeep takes in an hour now: the planted potatoes and
  /// the guards, as [_payUpkeep] charges them.
  double get upkeepPerHour {
    var total = 0;
    for (final field in _fields.values) {
      for (final potato in field._potatoes.values) {
        total += _effects.upkeepOf(potato, _work(potato, field).sums);
      }
    }
    for (final guard in _guards.values) {
      total += _effects.upkeepOf(guard.potato, _work(guard.potato).sums);
    }
    return total * 3600 / _rules.potatoes.upkeepEverySeconds;
  }

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

  /// Open blocks, in block units.
  Iterable<TilePos> get openBlocks => _openBlocks;

  /// Seeds waiting for room in the pouch, oldest first.
  List<OverflowSeed> get overflow => List.unmodifiable(_overflow);

  /// Materials kept in the house, by item id.
  Map<String, int> get materials => UnmodifiableMapView(_materials);

  /// Letters, oldest first.
  List<Mail> get mail => List.unmodifiable(_mail);

  /// Letters not read yet: the mailbox flag is up while any are.
  int get unreadMail => _mail.where((m) => !m.read).length;

  /// Free slots in the seed pouch.
  int get pouchRoom => math.max(0, pouchSlots - _seeds.total);

  /// Whether [tile] is on the farm and in an open block.
  bool isOpen(TilePos tile) {
    final size = _rules.farm.size;
    if (tile.x < 0 || tile.y < 0 || tile.x >= size || tile.y >= size) {
      return false;
    }
    return _openBlocks.contains(_rules.farm.blockOf(tile));
  }

  /// Whether locked [block] can be opened now: on the farm and sharing a
  /// side with an open block.
  bool canOpen(TilePos block) {
    final count = _rules.farm.size ~/ _rules.farm.blockSize;
    if (block.x < 0 || block.y < 0 || block.x >= count || block.y >= count) {
      return false;
    }
    if (_openBlocks.contains(block)) return false;
    return [
      const TilePos(1, 0),
      const TilePos(-1, 0),
      const TilePos(0, 1),
      const TilePos(0, -1),
    ].any((step) => _openBlocks.contains(block + step));
  }

  /// Baby potatoes the next block costs: more for each one opened so far,
  /// by the step of the group each opened block was in.
  int get blockCost {
    final rules = _rules.farm;
    final opened = math.max(0, _openBlocks.length - rules.startBlocks.length);
    final steps = rules.blockSteps;
    if (steps.isEmpty) return rules.blockFood + opened * rules.blockStepFood;
    var cost = rules.blockFood;
    for (var n = 1; n <= opened; n++) {
      cost += steps[math.min(n ~/ rules.blockStepEvery, steps.length - 1)];
    }
    return cost;
  }

  /// The farm's way in: the middle of the open land's bottom row, where the
  /// fence opens onto the truck yard below. Nothing is built on it, so a
  /// field can never shut the gate. It moves down as land opens.
  TilePos get entrance {
    final farm = _rules.farm;
    if (_openBlocks.isEmpty) return TilePos(farm.size ~/ 2, farm.size - 1);
    final bottom = _openBlocks.map((b) => b.y).reduce(math.max);
    final row = [
      for (final block in _openBlocks)
        if (block.y == bottom) farm.blockRect(block),
    ];
    final left = row.map((r) => r.left).reduce(math.min);
    final right = row.map((r) => r.right).reduce(math.max);
    return TilePos((left + right) ~/ 2, row.first.bottom - 1);
  }

  /// Whether a building could stand on [rect]: on open land, off the
  /// [entrance], with one free tile (corners included) between it and every
  /// field and building. A [totem] may stand right next to other totems
  /// (2026-10-27, 사용자), though not on them.
  /// [ignoring] is a building or field to leave out, e.g. one being moved
  /// (ids are shared, so one id names either).
  bool canPlace(TileRect rect, {int? ignoring, bool totem = false}) {
    if (!rect.tiles.every(isOpen)) return false;
    if (rect.contains(entrance)) return false;
    final others = [
      for (final field in _fields.values)
        if (field.id != ignoring) (rect: field.rect, totem: false),
      for (final building in _buildings.values)
        if (building.id != ignoring)
          (rect: building.rect, totem: building.data.totem != null),
    ];
    for (final (rect: other, totem: otherTotem) in others) {
      if (totem && otherTotem) {
        if (rect.overlaps(other)) return false;
        continue;
      }
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
  FarmRejection? apply(FarmCommand command) {
    final rejection = _dispatch(command);
    if (rejection == null) _advanceStory();
    return rejection;
  }

  FarmRejection? _dispatch(FarmCommand command) => switch (command) {
    PlantSeed(:final fieldId, :final tile, :final seed) => _plant(
      fieldId,
      tile,
      seed,
    ),
    HarvestPotato(:final fieldId, :final tile) => _harvest(fieldId, tile),
    HarvestField(:final fieldId) => _harvestField(fieldId),
    EnhanceGear(:final worn, :final index) => _enhanceGear(worn, index),
    EquipGear(:final index) => _equipGear(index),
    UnequipGear(:final kind) => _unequipGear(kind),
    DisassembleGear(:final index) => _disassembleGear(index),
    LightTotem(:final buildingId) => _lightTotem(buildingId),
    RaiseTotemLimit() => _raiseTotemLimit(),
    WidenPouch() => _widen(pouch: true),
    WidenGearBox() => _widen(pouch: false),
    SellSeed(:final seed) => _sellSeed(seed),
    TakeOverflow(:final seed) => _takeOverflow(seed),
    SellOverflow() => _sellOverflow(),
    ReadMail(:final mailId) => _readMail(mailId),
    ClaimMail(:final mailId) => _claimMail(mailId),
    OpenBlock(:final block) => _openBlock(block),
    ResizeField(:final fieldId, :final rect) => _resizeField(fieldId, rect),
    MoveField(:final fieldId, :final origin) => _moveField(fieldId, origin),
    RemoveField(:final fieldId) => _removeField(fieldId),
    MoveBuilding(:final buildingId, :final origin) => _moveBuilding(
      buildingId,
      origin,
    ),
    MakeField(:final rect) => _makeField(rect),
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
    Depart(:final food, :final potatoIds, :final zone) => _depart(
      food,
      potatoIds,
      zone,
    ),
    UnlockAll() => _unlockAll(),
    ReturnHome(
      :final food,
      :final seeds,
      :final materials,
      :final potatoIds,
      :final lostPotatoIds,
      :final score,
      :final gear,
      :final equipped,
      :final zone,
      :final bag,
    ) =>
      _returnHome(
        food,
        seeds,
        materials,
        potatoIds,
        lostPotatoIds,
        score,
        gear,
        equipped,
        zone,
        bag,
      ),
    LoadBed(:final item, :final count, :final seed, :final gearIndex) =>
      _loadBed(item, count, seed, gearIndex),
    UnloadBed(:final slot) => _unload(bed, slot),
    UnloadBag(:final slot) => _unload(_bag, slot),
    UnpackBag() => _unpackBag(),
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
    _expireOverflow();
    _putOutTotems();
    if (_isDue(_rules.pests.checkEverySeconds)) _rollPests();
    if (_isDue(_rules.potatoes.upkeepEverySeconds)) _payUpkeep();
    _advanceStory();
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
    _settleBugs(field);
    List<TilePos>? dead;
    final seedEvery = _rules.breeding.seedEverySeconds * 1000;
    for (final MapEntry(key: tile, value: potato) in field._potatoes.entries) {
      final breeds = potato.type == PotatoType.breeding;
      final change = potato.live(
        millis,
        catalog.potatoType(potato.type),
        _work(potato, field).rates,
        seedEveryMillis: breeds ? seedEvery : null,
      );
      if (change.grew) {
        _events.add(
          FarmEvent.grown(fieldId: field.id, tile: tile, potatoId: potato.id),
        );
      }
      for (var i = 0; i < change.seedsDue; i++) {
        final max = _rules.breeding.storeMax;
        if (max != null && potato.seeds.length >= max) break;
        final seed = _bredSeed(potato, field);
        potato.seeds.add(seed);
        _events.add(
          FarmEvent.seedMade(
            fieldId: field.id,
            potatoId: potato.id,
            seed: seed,
          ),
        );
      }
      if (change.died) (dead ??= []).add(tile);
    }
    for (final tile in dead ?? const <TilePos>[]) {
      final potato = field._take(tile)!;
      // Seeds it made are kept; baby potatoes on it stay in the field
      // (2026-10-26, user).
      potato.takeSeeds().forEach(_gainSeed);
      field.leftover += potato.takeStored();
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
        // Each bug bites on its own: the more stored, the faster it goes.
        final bug = _rules.pests.bug;
        final everyMillis = bug.eatEverySeconds * 1000;
        pest.biteMillis += millis * bugsOn(field);
        while (pest.biteMillis >= everyMillis) {
          pest.biteMillis -= everyMillis;
          var left = bug.eatAmount;
          final fromPile = math.min(left, field.leftover);
          field.leftover -= fromPile;
          left -= fromPile;
          totals.foodEatenByBugs += fromPile;
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
        _sendToHarvest(guard);
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

  /// Walks a guard toward where it is going, then works there: clears the
  /// pest, brings in the field's baby potatoes, or, with nothing to do,
  /// walks on to another patrol stop.
  void _patrol(Guard guard, int millis) {
    if (guard.walkMillis > 0) {
      guard.walkMillis = math.max(0, guard.walkMillis - millis);
      // Work starts the step after arriving; on patrol, a pause at a stop.
      if (guard.walkMillis == 0) {
        guard
          ..at = guard.walkTo ?? guard.at
          ..walkTo = null;
      }
      return;
    }
    final fieldId = guard.targetFieldId;
    if (fieldId == null) return _walkOn(guard);
    final field = _fields[fieldId];
    if (guard.harvesting) {
      if (field != null) _bringIn(field, guard);
      return guard.stop();
    }
    final pest = field?.pest;
    if (field == null || pest == null) {
      guard.stop();
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
      // Leave its patrol from where it has got to.
      if (guard.walkTo != null) guard.stop();
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
        ..walk(
          _besideField(best, guard.at),
          walkMillisFor(guard.potato, bestDistance),
        );
    }
  }

  /// How far a patrolling guard looks for its next stop, in tiles.
  static const int _patrolReach = 4;

  /// Sends a guard with nothing to do to a nearby tile of open ground.
  ///
  /// The stop is picked from the guard's id and the time, not the farm's
  /// random numbers, so patrols never change what the rest of the farm
  /// rolls.
  void _walkOn(Guard guard) {
    final stops = [
      for (final tile in guard.at.around(_patrolReach))
        if (isOpen(tile) &&
            tile != guard.at &&
            tile.manhattanDistanceTo(guard.at) <= _patrolReach &&
            _isOpenGround(tile))
          tile,
    ];
    if (stops.isEmpty) return;
    final pick = ((guard.potato.id * 7919 + _tick) * 2654435761) & 0x7fffffff;
    final stop = stops[pick % stops.length];
    guard.walk(
      stop,
      walkMillisFor(guard.potato, stop.manhattanDistanceTo(guard.at)),
    );
  }

  /// Open land that no field or building covers: where guards walk.
  bool _isOpenGround(TilePos tile) =>
      !_fields.values.any((f) => f.rect.contains(tile)) &&
      !_buildings.values.any((b) => b.rect.contains(tile));

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

  /// Rolls for blight on each planted field with no pest. Bugs do not
  /// roll: they follow what is stored ([_settleBugs]).
  void _rollPests() {
    if (!isUnlocked(StoryUnlock.pests)) return;
    final rules = _rules.pests;
    for (final field in _fields.values) {
      if (field.pest != null || field._potatoes.isEmpty) continue;
      final sums = <String, StatSum>{}
        ..addAll(field._sums(_effects))
        ..addAll(_totemSums());
      if (!_random.chance(
        sums.apply(FarmStat.blightChance, rules.blight.chance),
      )) {
        continue;
      }
      _appear(field, PestKind.blight);
    }
  }

  void _appear(FarmField field, PestKind kind) {
    field.pest = Pest(kind: kind);
    totals.pestsAppeared++;
    _events.add(FarmEvent.pestAppeared(fieldId: field.id, kind: kind));
  }

  /// Bugs on [field] (2026-10-26, user): one for each `stored_per_bug`
  /// baby potatoes stored there, at least one while they are there; none
  /// for another pest or none.
  int bugsOn(FarmField field) {
    if (field.pest?.kind != PestKind.bug) return 0;
    return math.max(1, field.stored ~/ _rules.pests.bug.storedPerBug);
  }

  /// Brings bugs to [field] once enough is stored there (not while it is
  /// quiet after a clearing, nor over blight), and sends them off when the
  /// store falls short again: their number is worked out from the store,
  /// so they need no life of their own.
  void _settleBugs(FarmField field) {
    if (!isUnlocked(StoryUnlock.pests)) return;
    final enough = field.stored >= _rules.pests.bug.storedPerBug;
    final pest = field.pest;
    if (pest == null && enough && _tick >= field.quietUntilTick) {
      _appear(field, PestKind.bug);
    } else if (pest?.kind == PestKind.bug && !enough) {
      field.pest = null;
      for (final guard in _guards.values) {
        if (guard.targetFieldId == field.id && !guard.harvesting) guard.stop();
      }
      _events.add(FarmEvent.fieldChanged(fieldId: field.id));
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

    final potato = _sprout(seed, seed.grade);
    field._put(tile, potato);
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
    if (potato == null) return FarmRejection.noPotato;
    return _collect(field, [potato]);
  }

  FarmRejection? _harvestField(int fieldId) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    return _collect(field, field._potatoes.values);
  }

  /// Takes the baby potatoes and the seeds stored on [potatoes] (2026-10-26,
  /// user: food and bred seeds come in together). A rare seed may turn up
  /// with the food.
  FarmRejection? _collect(FarmField field, Iterable<Potato> potatoes) {
    // What dead potatoes left comes in with any harvest of the field.
    var taken = field.leftover;
    field.leftover = 0;
    final seeds = <Seed>[];
    for (final potato in potatoes) {
      taken += potato.takeStored();
      seeds.addAll(potato.takeSeeds());
    }
    if (taken == 0 && seeds.isEmpty) return FarmRejection.nothingToHarvest;
    Seed? seed;
    if (taken > 0) {
      taken = _withHarvestBonus(taken);
      food += taken;
      final chance = field
          ._sums(_effects)
          .apply(FarmStat.harvestRareChance, _rules.potatoes.harvestRareChance);
      seed = _random.chance(chance) ? _fieldSeed(field) : null;
      if (seed != null) _gainSeed(seed);
    }
    seeds.forEach(_gainSeed);
    _events.add(
      FarmEvent.harvested(
        fieldId: field.id,
        food: taken,
        seed: seed,
        seeds: seeds,
      ),
    );
    return null;
  }

  FarmRejection? _openBlock(TilePos block) {
    if (!isUnlocked(StoryUnlock.farmExpansion)) return FarmRejection.locked;
    if (!canOpen(block)) return FarmRejection.cannotOpen;
    final cost = blockCost;
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    _openBlocks.add(block);
    _events.add(FarmEvent.blockOpened(block: block, food: cost));
    return null;
  }

  /// Baby potatoes a new field covering [rect] costs.
  int fieldCost(TileRect rect) =>
      _rules.farm.fieldFood + (rect.area - 1) * _rules.farm.fieldTileFood;

  FarmRejection? _makeField(TileRect rect) {
    final max = _rules.farm.fieldMaxSize;
    if (rect.width < 1 ||
        rect.height < 1 ||
        rect.width > max ||
        rect.height > max) {
      return FarmRejection.badSize;
    }
    if (!canPlace(rect)) return FarmRejection.blocked;
    if (fieldTiles + rect.area > fieldRoom) return FarmRejection.noFieldRoom;
    final cost = fieldCost(rect);
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    final field = FarmField(id: _nextId++, rect: rect);
    _fields[field.id] = field;
    _events.add(FarmEvent.fieldMade(fieldId: field.id, rect: rect));
    return null;
  }

  FarmRejection? _resizeField(int fieldId, TileRect rect) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    final max = _rules.farm.fieldMaxSize;
    if (rect.width < 1 ||
        rect.height < 1 ||
        rect.width > max ||
        rect.height > max) {
      return FarmRejection.badSize;
    }
    if (!field._potatoes.keys.every(rect.contains)) {
      return FarmRejection.fieldNotEmpty;
    }
    if (!canPlace(rect, ignoring: fieldId)) return FarmRejection.blocked;
    if (rect.area > field.rect.area &&
        fieldTiles - field.rect.area + rect.area > fieldRoom) {
      return FarmRejection.noFieldRoom;
    }
    final cost = resizeCost(field, rect);
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    field.rect = rect;
    _stopGuardsAt(fieldId);
    _events.add(FarmEvent.fieldChanged(fieldId: fieldId, rect: rect));
    return null;
  }

  /// Baby potatoes resizing [field] to [rect] costs: the tile price for
  /// each tile added, nothing for shrinking.
  int resizeCost(FarmField field, TileRect rect) =>
      math.max(0, rect.area - field.rect.area) * _rules.farm.fieldTileFood;

  FarmRejection? _moveField(int fieldId, TilePos origin) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    final rect = TileRect(
      origin: origin,
      width: field.rect.width,
      height: field.rect.height,
    );
    if (!canPlace(rect, ignoring: fieldId)) return FarmRejection.blocked;
    field._moveTo(origin);
    _stopGuardsAt(fieldId);
    _events.add(FarmEvent.fieldChanged(fieldId: fieldId, rect: rect));
    return null;
  }

  FarmRejection? _removeField(int fieldId) {
    final field = _fields[fieldId];
    if (field == null) return FarmRejection.noSuchField;
    if (field._potatoes.isNotEmpty) return FarmRejection.fieldNotEmpty;
    food += field.leftover;
    _fields.remove(fieldId);
    _stopGuardsAt(fieldId);
    _events.add(FarmEvent.fieldChanged(fieldId: fieldId));
    return null;
  }

  FarmRejection? _moveBuilding(int buildingId, TilePos origin) {
    final building = _buildings[buildingId];
    if (building == null) return FarmRejection.noSuchBuilding;
    final rect = TileRect(
      origin: origin,
      width: building.data.width,
      height: building.data.height,
    );
    final totem = building.data.totem != null;
    if (!canPlace(rect, ignoring: buildingId, totem: totem)) {
      return FarmRejection.blocked;
    }
    building.origin = origin;
    _events.add(
      FarmEvent.buildingMoved(buildingId: buildingId, origin: origin),
    );
    return null;
  }

  /// Guards heading for or working at a field that moved or went stop
  /// where they are and look for work again.
  void _stopGuardsAt(int fieldId) {
    for (final guard in _guards.values) {
      if (guard.targetFieldId == fieldId) guard.stop();
    }
  }

  FarmRejection? _build(String kind, TilePos origin) {
    final data = catalog.buildings[kind];
    if (data == null || !data.buildable) return FarmRejection.noSuchBuilding;
    if (!canBuildKind(kind)) return FarmRejection.locked;
    if (data.single && _buildings.values.any((b) => b.kind == kind)) {
      return FarmRejection.onlyOne;
    }
    if (data.totem != null && totemCount >= totemLimit) {
      return FarmRejection.totemLimit;
    }
    final building = FarmBuilding(id: _nextId, data: data, origin: origin);
    if (!canPlace(building.rect, totem: data.totem != null)) {
      return FarmRejection.blocked;
    }
    final cost = data.levels.first.cost;
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    _nextId++;
    _buildings[building.id] = building;
    _events.add(
      FarmEvent.built(buildingId: building.id, kind: kind, origin: origin),
    );
    _send(
      MailKind.building,
      building: kind,
      seeds: [
        _roller.seed(
          type: data.houses ?? PotatoType.food,
          grade: Grade.normal,
          level: _rules.mail.buildingSeedLevel,
          random: _random,
        ),
      ],
    );
    return null;
  }

  /// Puts a letter in the mailbox, letting the oldest go past the limit. A
  /// story letter whose gift is not taken yet never goes (2026-10-18): the
  /// mailbox may then hold more than the limit.
  void _send(
    MailKind kind, {
    String? building,
    String? story,
    List<Seed> seeds = const [],
    int food = 0,
  }) {
    final mail = Mail(
      id: _nextId++,
      kind: kind,
      tick: _tick,
      building: building,
      story: story,
      seeds: seeds,
      food: food,
    );
    _mail.add(mail);
    while (_mail.length > _rules.mail.keep) {
      final oldest = _mail.indexWhere(
        (m) => m.kind != MailKind.story || !m.hasGift,
      );
      if (oldest < 0) break;
      _mail.removeAt(oldest);
    }
    _events.add(FarmEvent.mailArrived(mailId: mail.id));
  }

  /// A seed the farm gains: into the pouch if there is room, or else to
  /// wait in the overflow until it runs out of time.
  void _gainSeed(Seed seed) {
    if (pouchRoom > 0) {
      _seeds.add(seed);
      return;
    }
    final steps =
        _rules.storage.overflowSeconds * 1000 ~/ _rules.farm.stepMillis;
    _overflow.add(OverflowSeed(seed: seed, expiresTick: _tick + steps));
    _events.add(FarmEvent.seedOverflowed(seed: seed));
  }

  /// Waiting seeds whose time is up turn into baby potatoes.
  void _expireOverflow() {
    while (_overflow.isNotEmpty && _overflow.first.expiresTick <= _tick) {
      _turnOverflow(_overflow.removeAt(0).seed);
    }
  }

  void _turnOverflow(Seed seed) {
    final value = _rules.storage.seedFood[seed.grade]!;
    food += value;
    _events.add(FarmEvent.overflowExpired(seed: seed, food: value));
  }

  FarmRejection? _sellOverflow() {
    if (_overflow.isEmpty) return FarmRejection.notWaiting;
    for (final waiting in _overflow) {
      _turnOverflow(waiting.seed);
    }
    _overflow.clear();
    return null;
  }

  FarmRejection? _widen({required bool pouch}) {
    final storage = _rules.storage;
    final slots = pouch ? pouchSlots : gearSlots;
    final max = pouch ? storage.pouchMax : storage.gearMax;
    if (slots >= max) return FarmRejection.atMost;
    final cost = pouch ? storage.pouchStepFood : storage.gearStepFood;
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
    final step = pouch ? storage.pouchStep : storage.gearStep;
    if (pouch) {
      pouchSlots = math.min(max, slots + step);
    } else {
      gearSlots = math.min(max, slots + step);
    }
    return null;
  }

  FarmRejection? _sellSeed(Seed seed) {
    if (!_seeds.take(seed)) return FarmRejection.noSeed;
    food += _rules.storage.seedFood[seed.grade]!;
    return null;
  }

  FarmRejection? _takeOverflow(Seed seed) {
    final index = _overflow.indexWhere((o) => o.seed == seed);
    if (index < 0) return FarmRejection.notWaiting;
    if (pouchRoom == 0) return FarmRejection.pouchFull;
    _seeds.add(_overflow.removeAt(index).seed);
    return null;
  }

  FarmRejection? _readMail(int mailId) {
    final mail = _mail.where((m) => m.id == mailId).firstOrNull;
    if (mail == null) return FarmRejection.noMail;
    mail.read = true;
    return null;
  }

  /// The worn piece of [worn], or box piece [index].
  Gear? _gearAt(GearKind? worn, int? index) {
    if (worn != null) return equipped.of(worn);
    if (index != null && index >= 0 && index < _gear.length) {
      return _gear[index];
    }
    return null;
  }

  FarmRejection? _enhanceGear(GearKind? worn, int? index) {
    final piece = _gearAt(worn, index);
    if (piece == null) return FarmRejection.noSuchGear;
    final bench = _rules.workbench;
    if (piece.enhance >= bench.maxLevel) return FarmRejection.atMost;
    final next = bench.nextFrom(piece.enhance);
    if (food < next.food) return FarmRejection.notEnoughFood;
    final have = _materials[bench.material] ?? 0;
    if (have < next.materials) return FarmRejection.notEnoughMaterials;
    food -= next.food;
    if (have == next.materials) {
      _materials.remove(bench.material);
    } else {
      _materials[bench.material] = have - next.materials;
    }
    final worked = _random.chance(next.chance);
    if (worked) {
      final better = piece.copyWith(enhance: piece.enhance + 1);
      if (worn != null) {
        equipped = equipped.wearing(worn, better);
      } else {
        _gear[index!] = better;
      }
    }
    _events.add(
      FarmEvent.gearEnhanced(
        kind: piece.kind,
        level: piece.enhance + 1,
        worked: worked,
      ),
    );
    return null;
  }

  /// Wears box piece [index]; what was worn there goes to its place.
  FarmRejection? _equipGear(int index) {
    if (index < 0 || index >= _gear.length) return FarmRejection.noSuchGear;
    final piece = _gear[index];
    if (!_gearStats.canWear(piece, progress)) return FarmRejection.cannotWear;
    final old = equipped.of(piece.kind);
    equipped = equipped.wearing(piece.kind, piece);
    if (old == null) {
      _gear.removeAt(index);
    } else {
      _gear[index] = old;
    }
    return null;
  }

  /// Takes off the worn piece of [kind] into the box (bare hands then).
  FarmRejection? _unequipGear(GearKind kind) {
    final piece = equipped.of(kind);
    if (piece == null) return FarmRejection.noSuchGear;
    if (_gear.length >= gearSlots) return FarmRejection.boxFull;
    _gear.add(piece);
    equipped = equipped.wearing(kind, null);
    return null;
  }

  /// Breaks box piece [index] into materials.
  FarmRejection? _disassembleGear(int index) {
    if (index < 0 || index >= _gear.length) return FarmRejection.noSuchGear;
    final piece = _gear.removeAt(index);
    final materials = _gearStats.disassembly(piece);
    final item = _rules.workbench.material;
    if (materials > 0) _materials[item] = (_materials[item] ?? 0) + materials;
    _events.add(FarmEvent.gearDisassembled(materials: materials));
    return null;
  }

  /// Totems standing on the farm.
  int get totemCount =>
      _buildings.values.where((b) => b.data.totem != null).length;

  /// Whether totem [building] is lit now.
  bool isLit(FarmBuilding building) => _tick < building.litUntilTick;

  FarmRejection? _lightTotem(int buildingId) {
    final building = _buildings[buildingId];
    final totem = building?.data.totem;
    if (building == null || totem == null) return FarmRejection.cannotLight;
    if (isLit(building) || _tick < building.readyTick) {
      return FarmRejection.cannotLight;
    }
    if (food < totem.food) return FarmRejection.notEnoughFood;
    food -= totem.food;
    final steps = 1000 ~/ _rules.farm.stepMillis;
    building
      ..litUntilTick = _tick + totem.seconds * steps
      ..readyTick = _tick + (totem.seconds + totem.cooldownSeconds) * steps;
    _totemVersion++;
    _events.add(FarmEvent.totemLit(buildingId: buildingId));
    return null;
  }

  FarmRejection? _raiseTotemLimit() {
    final rules = _rules.totems;
    if (!totemsOpen) return FarmRejection.locked;
    if (totemLimit >= rules.maxLimit) return FarmRejection.atMost;
    if (food < rules.limitStepFood) return FarmRejection.notEnoughFood;
    food -= rules.limitStepFood;
    totemLimit++;
    return null;
  }

  /// Totems whose time is up go out.
  void _putOutTotems() {
    for (final building in _buildings.values) {
      if (building.data.totem != null && building.litUntilTick == _tick) {
        _totemVersion++;
        _events.add(FarmEvent.totemOut(buildingId: building.id));
      }
    }
  }

  /// What lit totems do across the whole farm. The same kind lit twice
  /// counts in full once, then half, and so on, like buff potatoes.
  StatSums _totemSums() {
    if (_totemSumsVersion == _totemVersion) return _cachedTotemSums;
    final sums = <String, StatSum>{};
    final copies = <String, int>{};
    for (final building in _buildings.values) {
      final totem = building.data.totem;
      if (totem == null || !isLit(building)) continue;
      final copy = copies[building.kind] = (copies[building.kind] ?? 0) + 1;
      for (final stat in totem.stats) {
        sums.putIfAbsent(stat, StatSum.new).percent +=
            totem.percent / (1 << (copy - 1));
      }
    }
    _totemSumsVersion = _totemVersion;
    return _cachedTotemSums = sums;
  }

  /// [taken] baby potatoes with the harvest totem's bonus on top.
  int _withHarvestBonus(int taken) =>
      _totemSums().apply(FarmStat.harvestBonus, taken.toDouble()).floor();

  FarmRejection? _claimMail(int mailId) {
    final mail = _mail.where((m) => m.id == mailId).firstOrNull;
    if (mail == null) return FarmRejection.noMail;
    if (!mail.hasGift) return FarmRejection.nothingToClaim;
    mail
      ..read = true
      ..claimed = true;
    food += mail.food;
    mail.seeds.forEach(_gainSeed);
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

  /// Puts back starting buildings that cannot be removed (the house), and
  /// the starting buildings of kinds in [also], when a farm saved before
  /// they existed lacks them: at their starting spot, or the first open spot
  /// that fits.
  void addMissingStartBuildings({Iterable<String> also = const []}) {
    for (final start in _rules.newFarm.buildings) {
      final data = catalog.buildings[start.kind]!;
      if (data.removable && !also.contains(start.kind)) continue;
      if (_buildings.values.any((b) => b.kind == start.kind)) continue;
      TilePos? spot;
      bool fits(TilePos origin) => canPlace(
        TileRect(origin: origin, width: data.width, height: data.height),
        totem: data.totem != null,
      );
      if (fits(start.origin)) {
        spot = start.origin;
      } else {
        final size = _rules.farm.size;
        for (var y = 0; y < size && spot == null; y++) {
          for (var x = 0; x < size && spot == null; x++) {
            if (fits(TilePos(x, y))) spot = TilePos(x, y);
          }
        }
      }
      if (spot == null) continue;
      final building = FarmBuilding(id: _nextId++, data: data, origin: spot);
      _buildings[building.id] = building;
    }
  }

  FarmRejection? _demolish(int buildingId) {
    if (_buildings[buildingId]?.data.removable == false) {
      return FarmRejection.cannotRemove;
    }
    final stores = _buildings[buildingId]?.stores ?? 0;
    if (stores > 0 && _fridge.length > fridgeSize - stores) {
      return FarmRejection.cellarNotEmpty;
    }
    final tiles = _buildings[buildingId]?.fieldTiles ?? 0;
    if (tiles > 0 && fieldTiles > fieldRoom - tiles) {
      return FarmRejection.fieldsNeedIt;
    }
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

  /// Whether [type] grows inside its building rather than in a field: only
  /// combat potatoes (breeding ones grow in fields again, 2026-10-26, user).
  static bool growsInside(PotatoType type) => type == PotatoType.combat;

  FarmRejection? _train(int buildingId, Seed seed) {
    final building = _buildings[buildingId];
    if (building == null) return FarmRejection.noSuchBuilding;
    if (!growsInside(seed.type) || building.data.houses != seed.type) {
      return FarmRejection.wrongPlace;
    }
    final full = _roomFor(seed.type);
    if (full != null) return full;
    if (!_seeds.take(seed)) return FarmRejection.noSeed;
    final potato = _sprout(seed, seed.grade);
    _house(potato, building);
    if (seed.type == PotatoType.combat) totals.potatoesTrained++;
    _events.add(
      FarmEvent.trained(
        buildingId: buildingId,
        potatoId: potato.id,
        seed: seed,
      ),
    );
    return null;
  }

  /// Puts [potato] in training ground [building] as a guard.
  void _house(Potato potato, FarmBuilding building) {
    _guards[potato.id] = Guard(
      potato: potato,
      buildingId: building.id,
      at: _doorOf(building),
    );
  }

  /// A seed [breeder] in [field] makes: a type rolled by the catalog's
  /// weights, the breeder's grade (sometimes one higher; weak breeders less
  /// often) and level.
  Seed _bredSeed(Potato breeder, FarmField field) {
    final weights = _rules.breeding.typeWeights;
    final total = weights.values.fold(0, (a, b) => a + b);
    var roll = _random.nextInt(total);
    var type = PotatoType.food;
    for (final candidate in PotatoType.values) {
      final weight = weights[candidate] ?? 0;
      if (roll < weight) {
        type = candidate;
        break;
      }
      roll -= weight;
    }
    var grade = breeder.grade;
    final upChance =
        _effects.gradeUpChanceOf(breeder, _work(breeder, field).sums) *
        _strengthPercent(breeder) /
        100;
    if (_random.chance(upChance)) grade = grade.higher ?? grade;
    return _roller.seed(
      type: type,
      grade: grade,
      level: breeder.level,
      random: _random,
    );
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
    if (_fridge.length >= fridgeSize) {
      return FarmRejection.fridgeFull;
    }
    if (spot != null) {
      spot.field._take(spot.tile);
    } else {
      _guards.remove(potatoId);
    }
    // Seeds it made go to the pouch rather than into the fridge with it.
    potato.takeSeeds().forEach(_gainSeed);
    _toFridge(potato);
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
    if (!growsInside(potato.type) || building.data.houses != potato.type) {
      return FarmRejection.wrongPlace;
    }
    final full = _roomFor(potato.type);
    if (full != null) return full;
    _fridge.remove(potatoId);
    _house(potato, building);
    _events.add(FarmEvent.takenOut(potatoId: potatoId));
    return null;
  }

  /// Sets out as a guest in a friend's co-op party (`multiplayer.md`: if the
  /// host's farm unlocked [zone], guests can join even if their own farm has
  /// not unlocked it yet).
  FarmRejection? departGuest({
    required int food,
    List<int> potatoIds = const [],
    required String zone,
  }) => _depart(food, potatoIds, zone, checkZoneUnlock: false);

  FarmRejection? _depart(
    int food,
    List<int> potatoIds,
    String zone, {
    bool checkZoneUnlock = true,
  }) {
    if (!catalog.zones.containsKey(zone)) return FarmRejection.unknownZone;
    if (checkZoneUnlock && !zoneOpen(zone)) return FarmRejection.locked;
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
    final fit = _gearStats.fitBelt(equipped.belt, [
      for (final a in going) a.potato.type,
    ]);
    if (fit == null) return FarmRejection.beltTooSmall;
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
    Map<String, int> materials,
    List<int> potatoIds,
    List<int> lostPotatoIds,
    int? score,
    List<Gear> gear,
    Equipped? equipped,
    String? zone,
    List<ItemStack>? bag,
  ) {
    this.food += food;
    if (score != null && zone != null) {
      totals.escapes.update(zone, (n) => n + 1, ifAbsent: () => 1);
    }
    _gear.addAll(gear);
    if (equipped != null) this.equipped = equipped;
    if (bag != null) {
      final slots = _gearStats.bagSlots(this.equipped.bag);
      _bag = Bag(math.max(slots, bag.length), catalog.stackOf);
      for (final stack in bag) {
        _bag.addFrom(stack.copyWithCount(stack.count));
      }
    }
    if (score != null && score > progress) progress = score;
    final lost = [
      for (final id in lostPotatoIds)
        if (_away.remove(id) != null) id,
    ];
    totals.potatoesDied += lost.length;
    var seedCount = 0;
    for (final stack in seeds) {
      for (var i = 0; i < stack.count; i++) {
        _gainSeed(stack.seed);
      }
      seedCount += stack.count;
    }
    for (final MapEntry(key: item, value: count) in materials.entries) {
      if (count > 0) _materials[item] = (_materials[item] ?? 0) + count;
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
        lost: lost,
      ),
    );
    return null;
  }

  /// Takes [count] of [item] out of storage as one stack: baby potatoes,
  /// [seed] from the pouch, a material, or box piece [gearIndex]. Null, and
  /// nothing taken, when storage does not have it all.
  ItemStack? takeStored(
    String item, {
    int count = 1,
    Seed? seed,
    int? gearIndex,
  }) {
    if (count <= 0) return null;
    switch (catalog.items[item]?.kind) {
      case ItemKind.food:
        if (count > food) return null;
        food -= count;
        return ItemStack(item, count);
      case ItemKind.seed:
        if (seed == null || _seeds.count(seed) < count) return null;
        if (catalog.seedItemOf(seed.type, seed.grade) != item) return null;
        for (var i = 0; i < count; i++) {
          _seeds.take(seed);
        }
        return ItemStack(item, count, seed: seed);
      case ItemKind.material:
        final have = _materials[item] ?? 0;
        if (count > have) return null;
        if (have == count) {
          _materials.remove(item);
        } else {
          _materials[item] = have - count;
        }
        return ItemStack(item, count);
      case ItemKind.gear:
        if (gearIndex == null || gearIndex < 0 || gearIndex >= _gear.length) {
          return null;
        }
        final piece = _gear[gearIndex];
        if (count != 1 || catalog.gearItemOf(piece) != item) return null;
        _gear.removeAt(gearIndex);
        return ItemStack.ofGear(item, piece);
      case null:
        return null;
    }
  }

  /// Puts [stack] into storage. Seeds that do not fit the pouch wait like
  /// any others; items storage has no place for are dropped.
  void store(ItemStack stack) {
    if (stack.count <= 0) return;
    switch (catalog.items[stack.item]?.kind) {
      case ItemKind.food:
        food += stack.count;
      case ItemKind.seed:
        if (stack.seed case final seed?) {
          for (var i = 0; i < stack.count; i++) {
            _gainSeed(seed);
          }
        }
      case ItemKind.material:
        _materials[stack.item] = (_materials[stack.item] ?? 0) + stack.count;
      case ItemKind.gear:
        if (stack.gear case final piece?) _gear.add(piece);
      case null:
        break;
    }
  }

  FarmRejection? _loadBed(String item, int count, Seed? seed, int? gearIndex) {
    final stack = takeStored(
      item,
      count: count,
      seed: seed,
      gearIndex: gearIndex,
    );
    if (stack == null) return FarmRejection.notStored;
    final moved = bed.addFrom(stack);
    store(stack);
    return moved == 0 ? FarmRejection.bedFull : null;
  }

  FarmRejection? _unload(Bag from, int slot) {
    if (slot < 0 || slot >= from.capacity) return FarmRejection.emptySlot;
    final stack = from.replace(slot, null);
    if (stack == null) return FarmRejection.emptySlot;
    store(stack);
    return null;
  }

  FarmRejection? _unpackBag() {
    for (var i = 0; i < _bag.capacity; i++) {
      if (_bag.replace(i, null) case final stack?) store(stack);
    }
    final slots = _gearStats.bagSlots(equipped.bag);
    if (_bag.capacity != slots) _bag = Bag(slots, catalog.stackOf);
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

  /// The tile in front of a building where its guards come out: its
  /// [FarmBuilding.door], kept on the farm.
  TilePos _doorOf(FarmBuilding building) {
    final door = building.door;
    return TilePos(door.x, math.min(door.y, _rules.farm.size - 1));
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
    if (pest.kind == PestKind.bug) {
      // All its bugs go at once and stay away a while (2026-10-26, user).
      field.quietUntilTick =
          _tick +
          _rules.pests.bug.quietSeconds * 1000 ~/ _rules.farm.stepMillis;
    }
    final reward = _rules.pests.reward;
    final gained =
        reward.foodMin + _random.nextInt(reward.foodMax - reward.foodMin + 1);
    final seed = _random.chance(reward.seedChance) ? _fieldSeed(field) : null;
    food += gained;
    if (seed != null) _gainSeed(seed);
    if (byTap) {
      totals.pestsClearedByTap++;
    } else {
      totals.pestsClearedByGuards++;
    }
    for (final guard in _guards.values) {
      if (guard.targetFieldId == field.id && !guard.harvesting) guard.stop();
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

  // Story.

  /// The story's events with their [StoryEventData.after] filled in.
  List<({StoryEventData data, List<String> after})> _storyEvents() {
    final events = catalog.story.events;
    return [
      for (final (index, event) in events.indexed)
        (
          data: event,
          after: event.after ?? [if (index > 0) events[index - 1].id],
        ),
    ];
  }

  void _unlockDone() {
    for (final event in catalog.story.events) {
      if (_storyDone.containsKey(event.id)) _unlocked.addAll(event.unlocks);
    }
  }

  /// Finishes every open event whose goals hold, until none is left: one
  /// event done may open the next with goals that already hold.
  void _advanceStory() {
    if (storySkipped) return;
    var changed = true;
    while (changed) {
      changed = false;
      for (final event in _storyEvents()) {
        final id = event.data.id;
        if (_storyDone.containsKey(id)) continue;
        if (!event.after.every(_storyDone.containsKey)) continue;
        final since = event.after.fold(
          0,
          (latest, before) => math.max(latest, _storyDone[before]!),
        );
        if (!event.data.goals.every((g) => _goalHolds(g, since))) continue;
        _finishStory(event.data);
        changed = true;
      }
    }
  }

  /// How far [goal] has come; it holds at [StoryGoalData.count]. [since] is
  /// the step the event could start on.
  int storyGoalCount(StoryGoalData goal, {int since = 0}) =>
      switch (goal.kind) {
        StoryGoalKind.fields => _fields.length,
        StoryGoalKind.buildings =>
          _buildings.values
              .where((b) => goal.building == null || b.kind == goal.building)
              .length,
        StoryGoalKind.potatoes => [
          for (final field in _fields.values) ...field._potatoes.values,
          for (final guard in _guards.values) guard.potato,
          ..._fridge.values,
          ...awayPotatoes,
        ].where((p) => goal.type == null || p.type == goal.type).length,
        StoryGoalKind.food => food,
        StoryGoalKind.escapes =>
          totals.escapes.entries
              .where(
                (e) =>
                    (goal.zone == null || e.key == goal.zone) &&
                    (goal.danger == null ||
                        (catalog.zones[e.key]?.danger != null) == goal.danger),
              )
              .fold(0, (n, e) => n + e.value),
        StoryGoalKind.progress => progress,
        StoryGoalKind.power => _gearStats.combatPower(equipped, const []),
        StoryGoalKind.pestsAppeared => totals.pestsAppeared,
        StoryGoalKind.pestsCleared =>
          totals.pestsClearedByTap + totals.pestsClearedByGuards,
        StoryGoalKind.potatoesDied => totals.potatoesDied,
        StoryGoalKind.potatoesTrained => totals.potatoesTrained,
        StoryGoalKind.wait => (_tick - since) * _rules.farm.stepMillis ~/ 1000,
      };

  bool _goalHolds(StoryGoalData goal, int since) =>
      storyGoalCount(goal, since: since) >= goal.count;

  void _finishStory(StoryEventData event) {
    _storyDone[event.id] = _tick;
    _unlocked.addAll(event.unlocks);
    _events.add(FarmEvent.storyDone(event: event.id, unlocks: event.unlocks));
    final seeds = [
      for (final stack in event.seeds) ..._rollStack(_roller, stack, _random),
    ];
    _send(MailKind.story, story: event.id, seeds: seeds, food: event.food);
  }

  /// Opens every feature and stops story events (a developer tool).
  FarmRejection? _unlockAll() {
    if (storySkipped) return FarmRejection.nothingToClaim;
    storySkipped = true;
    return null;
  }

  /// Puts dead [potato] in a graveyard; false when the farm has none. A
  /// full graveyard loses its oldest grave.
  bool _bury(Potato potato) {
    totals.potatoesDied++;
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

  /// Baby potatoes it costs to revive [potato] from a graveyard.
  int reviveCost(Potato potato) => _rules.potatoes.reviveFood[potato.grade]!;

  FarmRejection? _revive(int potatoId) {
    final index = _graves.indexWhere((p) => p.id == potatoId);
    if (index < 0) return FarmRejection.noGrave;
    final cost = reviveCost(_graves[index]);
    if (food < cost) return FarmRejection.notEnoughFood;
    food -= cost;
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
    _gainSeed(seed);
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

  /// A guard with a harvesting ability, when its time comes, walks to the
  /// field with the most baby potatoes stored to bring them in. Busy with a
  /// pest, it lets that time pass.
  void _sendToHarvest(Guard guard) {
    if (guard.targetFieldId != null) return;
    final effect = _effects.periodic(guard.potato, FarmAction.harvestFood);
    final interval = effect?.intervalInUse;
    final amount = effect?.valueInUse?.floor() ?? 0;
    if (interval == null || amount <= 0 || !_isDue(interval)) return;
    FarmField? richest;
    var most = 0;
    for (final field in _fields.values) {
      final stored = field.stored;
      if (stored > most) {
        most = stored;
        richest = field;
      }
    }
    if (richest == null) return;
    if (guard.walkTo != null) guard.stop();
    final beside = _besideField(richest, guard.at);
    guard
      ..targetFieldId = richest.id
      ..harvesting = true
      ..walk(
        beside,
        walkMillisFor(guard.potato, beside.manhattanDistanceTo(guard.at)),
      );
  }

  /// A harvesting guard beside [field] brings in its share: one baby potato
  /// at a time from whichever potato has the most stored, so the field is
  /// taken from evenly.
  void _bringIn(FarmField field, Guard guard) {
    final effect = _effects.periodic(guard.potato, FarmAction.harvestFood);
    final amount = effect?.valueInUse?.floor() ?? 0;
    final potatoes = field._potatoes.values.toList();
    var taken = math.min(amount, field.leftover);
    field.leftover -= taken;
    while (taken < amount) {
      Potato? richest;
      for (final potato in potatoes) {
        if (potato.stored > (richest?.stored ?? 0)) richest = potato;
      }
      if (richest == null) break;
      richest.stored--;
      taken++;
    }
    taken = _withHarvestBonus(taken);
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
        cached.version == version &&
        cached.totems == _totemVersion) {
      return cached;
    }
    final sums = <String, StatSum>{}..addAll(_effects.own(potato));
    if (field != null) sums.addAll(field._sums(_effects));
    sums.addAll(_totemSums());
    final worked = _Worked(
      fieldId: field?.id,
      version: version,
      totems: _totemVersion,
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
    this.leftover = 0,
    this.quietUntilTick = 0,
  }) {
    _potatoes.addEntries(_byId(potatoes.entries));
  }

  final int id;

  /// Where it lies. Changes when the field is resized or moved.
  TileRect rect;

  /// The tile in front of its gate ([doorBelow]), where its path starts
  /// (2026-10-26, 사용자).
  TilePos get door => doorBelow(rect);
  final Map<TilePos, Potato> _potatoes = {};

  /// The bug or blight on this field, if any.
  Pest? pest;

  /// Baby potatoes left by potatoes that died here (2026-10-26, user: not
  /// lost with them). They come in with the field's next harvest, and bugs
  /// eat them first.
  int leftover;

  /// The step before which bugs cannot come back after being cleared.
  int quietUntilTick;

  /// Baby potatoes waiting here: on its potatoes and left over.
  int get stored =>
      _potatoes.values.fold(leftover, (sum, potato) => sum + potato.stored);

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

  /// Moves the field and its potatoes so its top-left tile is [origin].
  void _moveTo(TilePos origin) {
    final shift = origin - rect.origin;
    final moved = [
      for (final MapEntry(key: tile, value: potato) in _potatoes.entries)
        MapEntry(tile + shift, potato),
    ];
    _potatoes
      ..clear()
      ..addEntries(moved);
    rect = TileRect(origin: origin, width: rect.width, height: rect.height);
    _version++;
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
    required this.totems,
    required this.sums,
    required this.rates,
  });

  final int? fieldId;
  final int version;

  /// The totem version the sums were worked out at.
  final int totems;
  final StatSums sums;
  final PotatoRates rates;
}
