import 'dart:math' as math;

import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/items/gear_stats.dart';
import 'package:potato_core/src/potatoes/ability_roller.dart';
import 'package:potato_core/src/potatoes/potato_effects.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/map/map_chunk.dart';
import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_generator.dart';
import 'package:potato_core/src/map/map_physics.dart';
import 'package:potato_core/src/map/map_recipe.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';
import 'package:potato_core/src/raid/raid_command.dart';
import 'package:potato_core/src/raid/raid_effects.dart';
import 'package:potato_core/src/raid/loot_levels.dart';
import 'package:potato_core/src/raid/raid_member.dart';

/// A farm potato taken along on a run.
final class CompanionStart {
  const CompanionStart({
    required this.potatoId,
    required this.type,
    required this.grade,
    this.level = 0,
    this.abilities = const [],
    this.style,
    this.mode = CompanionMode.defense,
    this.lifeLeft = 1,
    this.beltBoost = 0,
  });

  factory CompanionStart.fromJson(Map<String, dynamic> json) => CompanionStart(
    potatoId: json['potato_id'] as int,
    type: PotatoType.values.byName(json['type'] as String),
    grade: Grade.values.byName(json['grade'] as String),
    level: json['level'] as int? ?? 0,
    abilities: (json['abilities'] as List<Object?>? ?? const []).cast<String>(),
    style: switch (json['style']) {
      final String s => CombatStyle.values.byName(s),
      _ => null,
    },
    mode: switch (json['mode']) {
      final String m => CompanionMode.values.byName(m),
      _ => CompanionMode.defense,
    },
    lifeLeft: (json['life_left'] as num? ?? 1).toDouble(),
    beltBoost: (json['belt_boost'] as num? ?? 0).toDouble(),
  );

  final int potatoId;
  final PotatoType type;
  final Grade grade;
  final int level;
  final List<String> abilities;

  /// Combat potatoes only.
  final CombatStyle? style;
  final CompanionMode mode;

  /// The farm potato's life left, 0 to 1.
  final double lifeLeft;

  /// Its belt slot's boost (0.1 is +10% at its job).
  final double beltBoost;

  CompanionStart withBoost(double boost) => CompanionStart(
    potatoId: potatoId,
    type: type,
    grade: grade,
    level: level,
    abilities: abilities,
    style: style,
    mode: mode,
    lifeLeft: lifeLeft,
    beltBoost: boost,
  );

  CompanionTraits get traits => (
    type: type,
    grade: grade,
    level: level,
    abilities: abilities,
    hpRatio: 1,
    lifeLeft: lifeLeft,
    boost: beltBoost,
  );

  Map<String, dynamic> toJson() => {
    'potato_id': potatoId,
    'type': type.name,
    'grade': grade.name,
    'level': level,
    'abilities': abilities,
    if (style != null) 'style': style!.name,
    'mode': mode.name,
    'life_left': lifeLeft,
    if (beltBoost != 0) 'belt_boost': beltBoost,
  };
}

/// What a finished run brings home.
final class RaidResult {
  const RaidResult({
    required this.outcome,
    required this.items,
    required this.companions,
    required this.score,
    required this.lost,
    this.equipped = const Equipped(),
    this.zone,
    this.bossKilled = false,
  });

  factory RaidResult.fromJson(Map<String, dynamic> json) => RaidResult(
    outcome: RaidOutcome.values.byName(json['outcome'] as String),
    zone: json['zone'] as String?,
    equipped: switch (json['equipped']) {
      final Map<String, dynamic> e => Equipped.fromJson(e),
      _ => const Equipped(),
    },
    score: json['score'] as int,
    lost: json['lost'] as bool,
    bossKilled: json['boss_killed'] as bool? ?? false,
    items: [
      for (final i in json['items'] as List<Object?>)
        ItemStack.fromJson(i! as Map<String, dynamic>),
    ],
    companions: [
      for (final c in json['companions'] as List<Object?>)
        switch (c! as Map<String, dynamic>) {
          final m => (
            potatoId: m['potato_id'] as int,
            down: m['down'] as bool,
            gone: m['gone'] as bool,
          ),
        },
    ],
  );

  final RaidOutcome outcome;

  /// The zone id of the run.
  final String? zone;

  /// What is worn at the end; after a lost run, only what was not lost.
  final Equipped equipped;

  /// The zone's score; a successful run raises the farm's progress to it.
  final int score;

  /// A failed danger run: the bag and every companion are gone, and
  /// [items] and [companions] say what was lost.
  final bool lost;

  /// The zone's boss fell while this member was in the run, however the run
  /// ended for them (2026-11-02, 사용자).
  final bool bossKilled;

  /// Everything in the bag, food included.
  final List<ItemStack> items;

  /// Each companion's farm potato id, whether it was knocked down, and
  /// whether it is gone: lost with a lost danger run, by its roll
  /// (2026-11-05, 사용자; before, one fallen in a danger zone left its
  /// seed instead).
  final List<({int potatoId, bool down, bool gone})> companions;

  Map<String, dynamic> toJson() => {
    'outcome': outcome.name,
    'zone': ?zone,
    'equipped': equipped.toJson(),
    'score': score,
    'lost': lost,
    if (bossKilled) 'boss_killed': true,
    'items': [for (final i in items) i.toJson()],
    'companions': [
      for (final c in companions)
        {'potato_id': c.potatoId, 'down': c.down, 'gone': c.gone},
    ],
  };
}

/// One exploration run, advanced in fixed steps.
///
/// Screens set the stick direction with [setMove], send the rest through
/// [apply], read the state every frame and collect what happened with
/// [takeEvents]. Time only moves in [step]. The whole state saves to JSON,
/// so a run closed with the app picks up where it stopped.
final class RaidSimulation {
  RaidSimulation._({
    required this.catalog,
    required this.zone,
    required this.map,
    required this._random,
    required this.members,
    required this.enemies,
    required this.bullets,
    required this.piles,
    required this.floorItems,
    required this.exits,
    required this.clones,
    required this._nextId,
    required this._tick,
    this.seedLevels = const [],
    this.storedGearLevels = const [],
    List<RaidCloud>? clouds,
    this._revealed = false,
    this._clonesIn = 0,
    this._nextCloneAt = 0,
  }) : clouds = clouds ?? [] {
    map.fitPictures(zone.look, catalog.rules.raid.pictureBoxes);
  }

  /// Builds zone [zone]'s map from [seed] and fills it: enemies, gathering
  /// spots, the player at the entry with [food] in the bag, and
  /// [companions] beside them.
  factory RaidSimulation.start({
    required Catalog catalog,
    required String zone,
    required int seed,
    Map<String, MapChunk> chunks = const {},
    int food = 0,
    Equipped equipped = const Equipped(),
    int progress = 0,
    List<CompanionStart> companions = const [],
    List<ItemStack> bag = const [],
    Map<PotatoType, int> seedLevels = const {},
    Map<GearKind, int> storedGearLevels = const {},
    List<RaidMeal> meals = const [],
    int? score,
  }) => RaidSimulation.party(
    catalog: catalog,
    zone: zone,
    seed: seed,
    score: score,
    chunks: chunks,
    members: [
      RaidMemberStart(
        food: food,
        equipped: equipped,
        progress: progress,
        companions: companions,
        bag: bag,
        seedLevels: seedLevels,
        storedGearLevels: storedGearLevels,
        meals: meals,
      ),
    ],
  );

  /// A run for a party of [members] (one to four) going in together. The
  /// first is the one [player], [bag] and the other single-player members
  /// read; all share a team and their buff potatoes reach everyone.
  /// With [score] the zone is played at that difficulty instead of its own
  /// ([Catalog.zoneAt], 2026-11-08: picked for a danger zone).
  factory RaidSimulation.party({
    required Catalog catalog,
    required String zone,
    required int seed,
    required List<RaidMemberStart> members,
    Map<String, MapChunk> chunks = const {},
    int? score,
  }) {
    if (members.isEmpty) throw ArgumentError.value(members, 'members');
    final zoneData = catalog.zoneAt(zone, score: score);
    if (zoneData == null) throw ArgumentError.value(zone, 'zone', 'unknown');
    final rules = catalog.rules.raid;
    final map = switch (zoneData.drawnMap) {
      final id? => catalog.maps[id]!.map,
      null => generateMap(
        zoneData.map!,
        seed: seed,
        chunks: {...catalog.chunks, ...chunks},
      ),
    };
    final random = GameRandom((seed ^ 0x2545f491) & 0xffffffff);
    final entry = Vec2(map.entry.x + 0.5, map.entry.y + 0.5);
    var nextId = 1;

    final gear = GearStats(catalog);
    // Companions in belt slots get their own member's belt boost.
    final starts = [
      for (final m in members)
        () {
          final fit = gear.fitBelt(m.equipped.belt, [
            for (final c in m.companions) c.type,
          ]);
          final boost = fit == null ? 0.0 : gear.beltBoost(m.equipped.belt);
          return [for (final c in m.companions) c.withBoost(boost)];
        }(),
    ];
    final effects = RaidEffects(catalog);
    final party = effects.party([
      for (final team in starts)
        for (final c in team) c.traits,
    ]);
    final team = <RaidMember>[];
    for (final (index, m) in members.indexed) {
      final meals = catalog.rules.meals.sumsOf([
        for (final d in m.meals) d.dish,
      ]);
      final at = index == 0
          ? entry
          : map.move(entry, _memberOffset(index), rules.player.radius);
      final player = RaidPlayer(
        id: nextId++,
        name: m.name,
        position: at,
        radius: rules.player.radius,
        maxHp: meals.user.apply(
          RaidStat.hp,
          party.apply(
            RaidStat.hp,
            rules.player.maxHp * (1 + gear.hpBonus(m.equipped)),
          ),
        ),
        weapon: gear.weaponOf(m.equipped.weapon),
        equipped: m.equipped,
      );
      final bag = Bag(gear.bagSlots(m.equipped.bag), catalog.stackOf);
      if (m.food > 0) bag.addFrom(ItemStack(rules.food.item, m.food));
      for (final stack in m.bag) {
        bag.addFrom(stack.copyWithCount(stack.count));
      }
      team.add(
        RaidMember(
          player: player,
          bag: bag,
          progress: m.progress,
          meals: m.meals,
          companions: [
            for (final (slot, start) in starts[index].indexed)
              RaidCompanion(
                id: nextId++,
                position: map.move(
                  at,
                  _followOffset(slot, player.facing),
                  rules.companion.radius,
                ),
                radius: rules.companion.radius,
                maxHp:
                    meals.potatoes.apply(
                      RaidStat.hp,
                      _startHp(
                        catalog,
                        start,
                        effects.own(start.traits),
                        party,
                      ),
                    ) *
                    gear.factorOf(m.equipped, GearStat.companionHp),
                potatoId: start.potatoId,
                type: start.type,
                grade: start.grade,
                level: start.level,
                abilities: start.abilities,
                style: start.type == PotatoType.combat ? start.style : null,
                mode: start.mode,
                lifeLeft: start.lifeLeft,
                beltBoost: start.beltBoost,
                slot: slot,
              ),
          ],
        ),
      );
    }

    final enemies = _placeEnemies(
      catalog,
      zoneData,
      map,
      entry,
      random,
      () => nextId++,
      partySize: members.length,
    );
    final seedLevels = [for (final m in members) m.seedLevels];
    final storedGearLevels = [for (final m in members) m.storedGearLevels];
    final piles = _placeSpots(
      catalog,
      zoneData,
      map,
      entry,
      random,
      () => nextId++,
      party.apply(RaidStat.lootRareChance, 1),
      _levelsFor(catalog, zoneData, team, seedLevels, storedGearLevels),
      partySize: members.length,
    );
    final exits = _openExits(zoneData, map, random, () => nextId++);

    final run = RaidSimulation._(
      catalog: catalog,
      zone: zoneData,
      map: map,
      random: random,
      members: team,
      enemies: enemies,
      bullets: [],
      piles: piles,
      floorItems: [],
      exits: exits,
      clones: [],
      nextId: nextId,
      tick: 0,
      seedLevels: seedLevels,
      storedGearLevels: storedGearLevels,
    );
    run._nextCloneAt = zoneData.danger?.cloneEverySeconds ?? 0;
    return run;
  }

  /// Where party member [index] (from 1) starts, around the entry.
  static Vec2 _memberOffset(int index) =>
      const [Vec2(0.8, 0), Vec2(0, 0.8), Vec2(0.8, 0.8)][(index - 1) % 3];

  /// What one of the player's bullets does: the weapon's damage, raised
  /// by its grade, level, workbench levels and buff potatoes.
  double get playerShotDamage => shotDamageOf(_first);

  /// What one of [member]'s bullets does.
  double shotDamageOf(RaidMember member) => _userStats(member).apply(
    RaidStat.attack,
    catalog.weapons[member.player.weapon]!.damage *
        _gear.damageScale(member.player.equipped.weapon),
  );

  /// The party's effects on [member] plus their own dishes'.
  StatSums _userStats(RaidMember member) => <String, StatSum>{}
    ..addAll(_party)
    ..addAll(_mealsOf(member).user);

  /// What [member]'s dishes do, worked out once.
  ({StatSums user, StatSums potatoes}) _mealsOf(RaidMember member) =>
      _mealSums[member] ??= catalog.rules.meals.sumsOf([
        for (final d in member.meals) d.dish,
      ]);
  final Expando<({StatSums user, StatSums potatoes})> _mealSums = Expando();

  /// The dishes' effects on [companion], through the member it walks with;
  /// none for a clone's.
  StatSums _potatoMeals(RaidCompanion companion) {
    for (final m in members) {
      if (m.companions.contains(companion)) return _mealsOf(m).potatoes;
    }
    return const {};
  }

  late final GearStats _gear = GearStats(catalog);

  /// What enemies' hits do: the zone's multiplier, raised by its score.
  late final double _enemyDamage =
      zone.enemies.damageMultiplier *
      catalog.rules.zoneScaling.enemyDamage(zone.score);

  /// A companion's max health at the start: its style's (or the plain
  /// companion's), raised by level for every potato (2026-11-10, 사용자:
  /// food and buff potatoes stayed at the plain health and fell too often),
  /// by the belt for combat potatoes, then abilities.
  static double _startHp(
    Catalog catalog,
    CompanionStart start,
    StatSums own,
    StatSums party,
  ) {
    final rules = catalog.rules.raid.companion;
    final style = start.type == PotatoType.combat
        ? rules.styles[start.style]
        : null;
    var hp =
        (style?.maxHp ?? rules.maxHp) *
        levelGrowth(rules.levelHpPermille, start.level);
    if (style != null) hp *= 1 + start.beltBoost;
    final sums = <String, StatSum>{}
      ..addAll(own)
      ..addAll(party);
    return sums.apply(RaidStat.hp, hp);
  }

  /// Rebuilds a run saved with [toJson].
  factory RaidSimulation.fromJson(Map<String, dynamic> json, Catalog catalog) {
    if (json['format_version'] != formatVersion) {
      throw FormatException(
        'Run format ${json['format_version']} is not $formatVersion',
      );
    }
    final zone = catalog.zoneAt(
      json['zone'] as String,
      score: json['score'] as int?,
    );
    if (zone == null) throw FormatException('Unknown zone ${json['zone']}');
    List<T> list<T>(String key, T Function(Map<String, dynamic>) read) => [
      for (final e in json[key] as List<Object?>)
        read(e! as Map<String, dynamic>),
    ];
    return RaidSimulation._(
      catalog: catalog,
      zone: zone,
      map: MapData.fromJson(json['map'] as Map<String, dynamic>),
      random: GameRandom.fromState(
        (json['random_state'] as List<Object?>).cast<int>(),
      ),
      members: list('members', (j) => RaidMember.fromJson(j, catalog)),
      enemies: list('enemies', RaidEnemy.fromJson),
      bullets: list('bullets', RaidBullet.fromJson),
      piles: list('piles', RaidPile.fromJson),
      floorItems: list('floor_items', RaidFloorItem.fromJson),
      exits: list('exits', RaidExit.fromJson),
      clones: list('clones', (j) => RaidClone.fromJson(j, catalog.stackOf)),
      clouds: list('clouds', RaidCloud.fromJson),
      clonesIn: json['clones_in'] as int,
      nextCloneAt: (json['next_clone_at'] as num).toDouble(),
      revealed: json['revealed'] as bool,
      nextId: json['next_id'] as int,
      tick: json['tick'] as int,
      seedLevels: [
        for (final levels in json['seed_levels'] as List<Object?>)
          {
            for (final MapEntry(:key, :value)
                in (levels! as Map<String, dynamic>).entries)
              PotatoType.values.byName(key): value as int,
          },
      ],
      storedGearLevels: [
        for (final levels in json['stored_gear_levels'] as List<Object?>)
          {
            for (final MapEntry(:key, :value)
                in (levels! as Map<String, dynamic>).entries)
              GearKind.values.byName(key): value as int,
          },
      ],
    );
  }

  /// Bumped whenever the saved run's shape changes. Runs are short, so an old
  /// format is not migrated: the client ends that run instead.
  static const int formatVersion = 13;

  final Catalog catalog;
  final ZoneData zone;
  final MapData map;
  final GameRandom _random;

  /// Each member's best potato level per type, as they set out: seeds found
  /// grow from it.
  final List<Map<PotatoType, int>> seedLevels;

  /// Each member's best gear level per kind in their farm's storage, as
  /// they set out.
  final List<Map<GearKind, int>> storedGearLevels;

  /// Levels for what is found now: gear follows what the party wears and
  /// carries at the moment.
  LootLevels get _lootLevels =>
      _levelsFor(catalog, zone, members, seedLevels, storedGearLevels);

  static LootLevels _levelsFor(
    Catalog catalog,
    ZoneData zone,
    List<RaidMember> members,
    List<Map<PotatoType, int>> seedLevels,
    List<Map<GearKind, int>> storedGearLevels,
  ) {
    final stats = GearStats(catalog);
    return LootLevels(
      zone,
      mode: catalog.rules.gear.lootLevelMode,
      worn: [for (final m in members) m.player.equipped],
      owned: [
        for (final (i, m) in members.indexed)
          LootLevels.ownedLevels(
            stats,
            [...m.player.equipped.all, for (final s in m.bag.slots) ?s?.gear],
            m.progress,
            stored: i < storedGearLevels.length
                ? storedGearLevels[i]
                : const {},
          ),
      ],
      seedLevels: seedLevels,
    );
  }

  /// Everyone in the run, in the order they went in. Party members stay
  /// here after they are out, with how it ended.
  final List<RaidMember> members;

  /// Which member in [members] the single-player getters ([player], [bag],
  /// [companions], [apply], ...) speak for: 0 on the host and in solo runs,
  /// a client's own index on a guest.
  int focusIndex = 0;

  RaidMember get _first => members[focusIndex];

  /// The member whose player has [id], if any.
  RaidMember? memberOf(int id) {
    for (final m in members) {
      if (m.id == id) return m;
    }
    return null;
  }

  /// Members still in the run.
  Iterable<RaidMember> get _active => members.where((m) => !m.isOut);

  RaidPlayer get player => _first.player;

  /// The player's bag; changing bags replaces it.
  Bag get bag => _first.bag;

  /// The player's companions.
  List<RaidCompanion> get companions => _first.companions;

  /// The farm's progress: gear above it plus the margin cannot be worn.
  int get progress => _first.progress;

  /// The countdown after the player's signal, if one is running.
  RaidSignal? get signal => _first.signal;

  final List<RaidEnemy> enemies;
  final List<RaidBullet> bullets;

  /// Gas and spores bosses left (2026-10-23).
  final List<RaidCloud> clouds;
  final List<RaidPile> piles;
  final List<RaidFloorItem> floorItems;

  /// Exits open in this run; empty in a safe zone.
  final List<RaidExit> exits;

  /// Clones in the run now (danger zones). Each carries its companions.
  final List<RaidClone> clones;

  bool _revealed;

  /// How many clones have walked in, and the run time (seconds) the next
  /// one comes.
  int _clonesIn;
  double _nextCloneAt;
  int _nextId;
  int _tick;
  final List<RaidEvent> _events = [];

  RaidRulesData get rules => catalog.rules.raid;

  late final RaidEffects _effects = RaidEffects(catalog);

  /// Buff potatoes' effects on the player's party, worked out each step
  /// from those still standing; [_parties] holds each team's.
  StatSums get _party => _parties[playerTeam] ?? const {};
  Map<int, StatSums> _parties = {};

  static CompanionTraits _traitsOf(RaidCompanion c) => (
    type: c.type,
    grade: c.grade,
    level: c.level,
    abilities: c.abilities,
    hpRatio: c.hp / c.maxHp,
    lifeLeft: c.lifeLeft,
    boost: c.beltBoost,
  );

  /// [companion]'s own effects plus its party's.
  StatSums statsOf(RaidCompanion companion) => <String, StatSum>{}
    ..addAll(_effects.own(_traitsOf(companion)))
    ..addAll(_parties[companion.team] ?? const {})
    ..addAll(_potatoMeals(companion));

  /// How fast [companion] moves now.
  double companionSpeed(RaidCompanion companion) {
    final base =
        rules.companion.styles[companion.style]?.speedMultiplier ??
        rules.companion.speedMultiplier;
    return statsOf(companion)
        .apply(RaidStat.moveSpeed, rules.player.speed * base);
  }

  /// What one hit or shot of combat [companion] does now.
  double companionDamage(RaidCompanion companion) {
    final style = rules.companion.styles[companion.style];
    if (style == null) return 0;
    final base =
        style.damage *
        levelGrowth(rules.companion.levelAttackPermille, companion.level) *
        catalog.rules.potatoes.attackOf(companion.grade) *
        (1 + companion.beltBoost);
    return statsOf(companion).apply(RaidStat.attack, base);
  }

  void _updateParty() => _parties = {
    playerTeam: _effects.party([
      for (final m in _active)
        for (final c in m.companions)
          if (!c.isDown) _traitsOf(c),
    ]),
    for (final clone in clones)
      clone.id: _effects.party([
        for (final c in clone.companions)
          if (!c.isDown) _traitsOf(c),
      ]),
  };

  /// Seconds one step covers.
  double get stepSeconds => rules.stepMillis / 1000;

  int get tick => _tick;

  /// Sets [tick] and [exitsRevealed] from a host snapshot on a guest client.
  void applySnapshotMeta({required int tick, required bool revealed}) {
    _tick = tick;
    _revealed = revealed;
    _updateParty();
  }

  /// Game time since the run began.
  Duration get elapsed => Duration(milliseconds: rules.stepMillis * _tick);

  /// How the player's run ended, once it has. Solo, [step] does nothing
  /// after that; in a party the run goes on until everyone is out.
  RaidOutcome? get outcome => _first.outcome;

  /// Whether every member is out: [step] does nothing any more.
  bool get isOver => members.every((m) => m.isOut);

  WeaponData get weapon => weaponOf(_first);

  WeaponData weaponOf(RaidMember member) => _gear.tuned(
    catalog.weapons[member.player.weapon]!,
    member.player.equipped.weapon,
  );

  /// How far wild enemies see in this zone.
  double get enemySight => rules.player.sight * zone.enemies.sightMultiplier;
  double get enemySpeed => rules.player.speed * zone.enemies.speedMultiplier;

  /// How far into a signal countdown the run is, 0 to 1; 0 without one.
  /// The party has one signal at a time; the one nearest zero counts.
  double get _waitPassed {
    final danger = zone.danger;
    if (danger == null) return 0;
    var passed = 0.0;
    for (final m in _active) {
      final signal = m.signal;
      if (signal == null) continue;
      passed = math.max(passed, 1 - signal.left / danger.countdownSeconds);
    }
    return passed;
  }

  /// Sight times [multiplier] at a signal's zero, as a share of the usual:
  /// 1 with no signal up, [SignalSightRulesData.start] the moment one goes
  /// up, then wider from the start (2026-11-02, 사용자: before, the wait was
  /// nearly over by the time it mattered) and faster the wider it gets
  /// (2026-11-01, 사용자).
  double _signalSight(double multiplier) {
    if (!_active.any((m) => m.signal != null)) return 1;
    final rule = rules.signalSight;
    final start = rule.start;
    if (multiplier <= start) return multiplier;
    // Growth a·p + (1 - a)·p², its first slope earlyPace times what it was
    // from the usual sight, (multiplier - 1) / 2.
    final a = (rule.earlyPace * (multiplier - 1) / 2 / (multiplier - start))
        .clamp(0.0, 1.0);
    final passed = _waitPassed;
    final growth = a * passed + (1 - a) * passed * passed;
    return start + (multiplier - start) * growth;
  }

  /// How far aggressive enemies see now: wider during a signal's countdown,
  /// the more the closer it is to zero.
  double get aggressiveSight =>
      enemySight * _signalSight(zone.danger?.waitSightMultiplier ?? 1);

  /// How far clones see now; it grows like [aggressiveSight].
  double get cloneSight {
    final clone = rules.clones;
    final base = rules.player.sight * clone.sightMultiplier;
    return base * _signalSight(clone.waitSightMultiplier);
  }

  double get _cloneSpeed => rules.player.speed * rules.clones.speedMultiplier;

  bool get isDanger => zone.danger != null;

  /// The boss area: the map's clearing tiles. Empty without one.
  late final Set<TilePos> bossArea = {...?map.markers[bossAreaMarker]};

  bool inBossArea(Vec2 at) =>
      bossArea.contains(TilePos(at.x.floor(), at.y.floor()));

  /// How far outside its area a boss notices bodies: a tenth of the area's
  /// radius, from the area's own tiles so any design gets it (2026-11-02,
  /// 사용자).
  late final double _bossNoticeMargin =
      math.sqrt(bossArea.length / math.pi) * 0.1;

  /// Whether a boss standing at [from] takes on a body at [at]: in its area,
  /// or in sight just outside it. The boss itself stays in the area.
  bool _inBossReach(Vec2 from, Vec2 at) {
    if (inBossArea(at)) return true;
    for (final tile in bossArea) {
      // The tile's square, grown by the margin.
      final dx = (at.x - (tile.x + 0.5)).abs() - 0.5;
      final dy = (at.y - (tile.y + 0.5)).abs() - 0.5;
      if (dx <= _bossNoticeMargin && dy <= _bossNoticeMargin) {
        final outside = Vec2(math.max(dx, 0), math.max(dy, 0));
        if (outside.length <= _bossNoticeMargin) return map.canSee(from, at);
      }
    }
    return false;
  }

  /// The standing boss, if the zone has one.
  RaidEnemy? get boss {
    final kind = zone.boss?.enemy;
    if (kind == null) return null;
    for (final enemy in enemies) {
      if (enemy.kind == kind && !enemy.isDown) return enemy;
    }
    return null;
  }

  /// Whether every open exit has been revealed by time.
  bool get exitsRevealed => _revealed;

  /// The open exit the player stands in, if any.
  RaidExit? exitHere() => exitOf(_first);

  /// The open exit [member] stands in, if any.
  RaidExit? exitOf(RaidMember member) {
    final radius = zone.danger?.exitRadius ?? 0;
    for (final exit in exits) {
      if (exit.position.distanceTo(member.player.position) <= radius) {
        return exit;
      }
    }
    return null;
  }

  bool get isHungry => isHungryOf(_first);

  bool isHungryOf(RaidMember member) =>
      member.bag.countOf(rules.food.item) == 0;

  /// What the run brings home, once it is over.
  RaidResult? get result => resultOf(_first);

  /// What [member] brings home, once they are out.
  RaidResult? resultOf(RaidMember member) {
    final outcome = member.outcome;
    if (outcome == null) return null;
    return RaidResult(
      outcome: outcome,
      items: [for (final s in member.bag.slots) ?s],
      companions: [
        for (final c in member.companions)
          (
            potatoId: c.potatoId,
            down: c.isDown,
            gone: member.lostCompanions.contains(c.potatoId),
          ),
      ],
      score: zone.score,
      zone: zone.id,
      lost: isDanger && outcome != RaidOutcome.extracted,
      bossKilled: member.bossKilled,
      equipped: member.kept ?? member.player.equipped,
    );
  }

  /// The stick: a direction on the world plane, at most 1 long. A shorter
  /// push walks slower.
  void setMove(Vec2 direction) => setMoveOf(_first, direction);

  /// [member]'s stick.
  void setMoveOf(RaidMember member, Vec2 direction) =>
      member.move = direction.length > 1 ? direction.normalized() : direction;

  /// The pile the player stands next to, if any; the nearest one wins.
  RaidPile? pileNear() => pileNearOf(_first);

  /// The pile [member] stands next to, if any; the nearest one wins.
  RaidPile? pileNearOf(RaidMember member) {
    final index = members.indexOf(member);
    RaidPile? best;
    var bestDistance = rules.pickupRadius;
    for (final pile in piles) {
      if (pile.loot.isEmpty || !pile.isFor(index)) continue;
      final d = pile.position.distanceTo(member.player.position);
      if (d <= bestDistance) {
        best = pile;
        bestDistance = d;
      }
    }
    return best;
  }

  RaidRejection? apply(RaidCommand command) => applyOf(_first, command);

  /// Carries out [command] for [member].
  RaidRejection? applyOf(RaidMember member, RaidCommand command) {
    if (member.isOut) return RaidRejection.over;
    if (member.isDowned) return RaidRejection.downed;
    final player = member.player;
    final bag = member.bag;
    switch (command) {
      case Dash():
        if (player.isDashing || player.dashCooldown > 0) {
          return RaidRejection.dashNotReady;
        }
        final move = member.move;
        player
          ..dashDirection = move.isZero ? player.facing : move.normalized()
          ..dashLeft = rules.player.dashSeconds
          ..dashCooldown = rules.player.dashCooldownSeconds;
        return null;
      case GoHome():
        if (isDanger) return RaidRejection.wrongZone;
        _end(member, RaidOutcome.wentHome);
        return null;
      case EquipFromBag(:final slot):
        return _equipFromBag(member, slot);
      case Unequip(:final kind):
        return _unequip(member, kind);
      case DropItem(:final slot):
        if (slot < 0 || slot >= bag.capacity) return RaidRejection.noSuchSlot;
        final stack = bag.replace(slot, null);
        if (stack == null) return RaidRejection.emptySlot;
        _drop(member, [stack]);
        return null;
      case PutInPile(:final pile, :final slot):
        final found = _reachablePile(member, pile);
        if (found case final RaidRejection rejection) return rejection;
        if (slot < 0 || slot >= bag.capacity) return RaidRejection.noSuchSlot;
        final stack = bag.replace(slot, null);
        if (stack == null) return RaidRejection.emptySlot;
        (found as RaidPile).loot.put(stack, catalog.stackOf);
        return null;
      case UseSkill(:final companion):
        for (final c in member.companions) {
          if (c.id == companion) return _useSkill(c);
        }
        return RaidRejection.noSuchCompanion;
      case SetCompanionMode(:final companion, :final mode):
        for (final c in member.companions) {
          if (c.id != companion) continue;
          if (c.type != PotatoType.combat || c.isDown) break;
          c
            ..mode = mode
            ..target = null;
          return null;
        }
        return RaidRejection.noSuchCompanion;
      case Signal():
        if (!isDanger) return RaidRejection.wrongZone;
        // One signal at a time for the whole party, from one exit
        // (2026-11-01, 사용자).
        if (_active.any((m) => m.signal != null)) {
          return RaidRejection.signalling;
        }
        final exit = exitOf(member);
        if (exit == null) return RaidRejection.notAtExit;
        exit.found = true;
        member.signal = RaidSignal(
          exit: exit.id,
          left: zone.danger!.countdownSeconds,
        );
        _events.add(SignalSent(exit.id, player: member.id));
        return null;
      case TakeLoot(:final pile, :final index):
        final found = _reachablePile(member, pile);
        if (found case final RaidRejection rejection) return rejection;
        final target = found as RaidPile;
        if (index < 0 || index >= target.loot.items.length) {
          return RaidRejection.noSuchItem;
        }
        final took = target.loot.takeInto(bag, index);
        _dropEmptyBundle(target);
        return took ? null : RaidRejection.bagFull;
      case TakeAllLoot(:final pile):
        final found = _reachablePile(member, pile);
        if (found case final RaidRejection rejection) return rejection;
        final target = found as RaidPile;
        target.loot.takeAllInto(bag);
        _dropEmptyBundle(target);
        return null;
      case SwapLoot(:final pile, :final index, :final slot):
        final found = _reachablePile(member, pile);
        if (found case final RaidRejection rejection) return rejection;
        final target = found as RaidPile;
        if (index < 0 || index >= target.loot.items.length) {
          return RaidRejection.noSuchItem;
        }
        if (slot < 0 || slot >= bag.capacity) return RaidRejection.noSuchSlot;
        target.loot.swapWith(bag, index, slot);
        return null;
    }
  }

  /// Wears the gear in bag slot [slot]; what was worn there takes the slot.
  RaidRejection? _equipFromBag(RaidMember member, int slot) {
    final bag = member.bag;
    if (slot < 0 || slot >= bag.capacity) return RaidRejection.noSuchSlot;
    final piece = bag.slots[slot]?.gear;
    if (piece == null) return RaidRejection.noGear;
    if (!_gear.canWear(piece, member.progress)) return RaidRejection.cannotWear;
    if (piece.kind == GearKind.belt) return RaidRejection.beltLocked;
    final old = member.player.equipped.of(piece.kind);
    bag.replace(slot, old == null ? null : _stackOf(old));
    _wear(member, piece.kind, piece);
    return null;
  }

  /// Takes off the worn piece of [kind] into the bag.
  RaidRejection? _unequip(RaidMember member, GearKind kind) {
    final piece = member.player.equipped.of(kind);
    if (piece == null) return RaidRejection.noGear;
    if (kind == GearKind.belt) return RaidRejection.beltLocked;
    final stack = _stackOf(piece);
    final bag = member.bag;
    if (kind == GearKind.bag) {
      // The bag itself goes in first; whatever no longer fits drops.
      final items = [stack, for (final s in bag.slots) ?s];
      _wear(member, kind, null);
      _refill(member, items);
      return null;
    }
    final free = bag.slots.indexOf(null);
    if (free < 0) return RaidRejection.bagFull;
    bag.replace(free, stack);
    _wear(member, kind, null);
    return null;
  }

  ItemStack _stackOf(Gear piece) =>
      ItemStack.ofGear(catalog.gearItemOf(piece) ?? '', piece);

  /// Puts on [piece] (null for bare hands). A new bag keeps what fits and
  /// drops the rest.
  void _wear(RaidMember member, GearKind kind, Gear? piece) {
    final player = member.player;
    player.equipped = player.equipped.wearing(kind, piece);
    switch (kind) {
      case GearKind.weapon:
        player
          ..weapon = _gear.weaponOf(piece)
          ..aimProgress = 0;
      case GearKind.bag:
        if (member.bag.capacity != _gear.bagSlots(piece)) {
          _refill(member, [for (final s in member.bag.slots) ?s]);
        }
      case GearKind.belt:
        break;
    }
  }

  /// A bag for what is worn now, filled with [items] in order; the rest
  /// drops at the member's feet.
  void _refill(RaidMember member, List<ItemStack> items) {
    final bag = member.bag = Bag(
      _gear.bagSlots(member.player.equipped.bag),
      catalog.stackOf,
    );
    final left = <ItemStack>[];
    for (final stack in items) {
      bag.addFrom(stack);
      if (stack.count > 0) left.add(stack);
    }
    if (left.isNotEmpty) _drop(member, left);
  }

  /// Leaves [stacks] in a bundle within reach of [member], or a new one at
  /// their feet.
  void _drop(RaidMember member, List<ItemStack> stacks) {
    final at = member.player.position;
    RaidPile? pile;
    for (final p in piles) {
      // Never into someone's own share: what is dropped is for everyone.
      if (p.kind == PileKind.bundle &&
          p.owner == null &&
          p.position.distanceTo(at) <= rules.pickupRadius) {
        pile = p;
      }
    }
    pile ??= () {
      final made = RaidPile(
        id: _newId(),
        position: at,
        kind: PileKind.bundle,
        loot: LootPile(),
        seen: true,
      );
      piles.add(made);
      return made;
    }();
    for (final stack in stacks) {
      pile.loot.put(stack, catalog.stackOf);
    }
  }

  /// The pile, or why [member] cannot use it.
  Object _reachablePile(RaidMember member, int id) {
    for (final pile in piles) {
      if (pile.id != id) continue;
      // Someone else's share is not there for this member.
      if (!pile.isFor(members.indexOf(member))) break;
      final reach = rules.pickupRadius;
      return pile.position.distanceTo(member.player.position) <= reach
          ? pile
          : RaidRejection.tooFar;
    }
    return RaidRejection.noSuchPile;
  }

  /// Leaves loot at [at]: one pile alone, or in a party one per member
  /// still out here, each with its own [roll] (2026-10-23, 사용자: everyone
  /// gets their own, so friends never race for it).
  void _leaveLoot(Vec2 at, PileKind kind, LootPile Function() roll) {
    if (members.length <= 1) {
      piles.add(RaidPile(id: _newId(), position: at, kind: kind, loot: roll()));
      return;
    }
    for (final (index, member) in members.indexed) {
      if (member.isOut) continue;
      piles.add(
        RaidPile(
          id: _newId(),
          position: at,
          kind: kind,
          loot: roll(),
          owner: index,
        ),
      );
    }
  }

  void _dropEmptyBundle(RaidPile pile) {
    if (pile.kind == PileKind.bundle && pile.loot.isEmpty) piles.remove(pile);
  }

  /// Advances the run by one fixed step (`rules.raid.step_millis`).
  void step() {
    if (isOver) return;
    _tick++;
    final dt = stepSeconds;
    _tickSkillTimers(dt);
    _updateParty();
    for (final m in List.of(_active)) {
      _updatePlayer(m, dt);
    }
    if (isOver) return;
    // Players settle on their floor as they move, so a guest's prediction
    // does the same; everyone else walking settles after moving.
    final walkers = {for (final body in _floorWalkers) body: body.position};
    for (final m in _active) {
      for (final companion in m.companions) {
        if (!companion.isDown) _updateCompanion(companion, m.player, dt, m);
      }
    }
    for (final clone in List.of(clones)) {
      _updateClone(clone, dt);
    }
    _runPeriodic();
    for (final enemy in enemies) {
      if (!enemy.isDown) _updateEnemy(enemy, dt);
    }
    _updateStrikes(dt);
    walkers.forEach((body, from) => _settle(body, from, dt));
    _updateBullets(dt);
    _updateClouds(dt);
    _pickUpFloorItems();
    _clearDefeated();
    _clearClones();
    _markSeen();
    _updateDowned(dt);
    if (isOver) return;
    if (isDanger) {
      _updateExits(dt);
      _bringClones();
    }
  }

  /// Piles a member has in sight now stay on the minimap.
  void _markSeen() {
    for (final m in _active) {
      final at = m.player.position;
      for (final pile in piles) {
        if (!pile.seen &&
            pile.position.distanceTo(at) <= rules.player.sight &&
            map.seesLevel(at, pile.position)) {
          pile.seen = true;
        }
      }
    }
  }

  // Exits --------------------------------------------------------------------

  /// Finds exits a member sees, reveals all once time is up, and runs each
  /// member's signal countdown: at zero they leave when standing in that
  /// exit, otherwise the signal goes out.
  void _updateExits(double dt) {
    final danger = zone.danger!;
    for (final m in _active) {
      final at = m.player.position;
      for (final exit in exits) {
        if (exit.found) continue;
        if (exit.position.distanceTo(at) <= rules.player.sight &&
            map.seesLevel(at, exit.position)) {
          exit.found = true;
          _events.add(ExitFound(exit.id));
        }
      }
    }
    if (!_revealed && elapsed.inMilliseconds >= danger.revealSeconds * 1000) {
      _revealed = true;
      for (final exit in exits) {
        exit.found = true;
      }
      _events.add(const ExitsRevealed());
    }
    for (final m in List.of(_active)) {
      final signal = m.signal;
      if (signal == null) continue;
      signal.left -= dt;
      if (signal.left > 0) continue;
      m.signal = null;
      // Whoever sent it, every standing member in that exit leaves together;
      // a downed one must be revived first (2026-10-21, 사용자).
      final leaving = [
        for (final other in _active)
          if (!other.isDowned && exitOf(other)?.id == signal.exit) other,
      ];
      for (final other in leaving) {
        _end(other, RaidOutcome.extracted);
      }
      if (!leaving.contains(m)) {
        _events.add(SignalLost(signal.exit, player: m.id));
      }
    }
  }

  // Downed party members ------------------------------------------------------

  /// A member knocked down waits for a teammate while someone else in the
  /// party still stands; otherwise they faint at once, as alone. Enemies
  /// ignore them (they are at 0 health). A teammate close by builds up the
  /// revive; it drains slowly while nobody is. At [PartyRulesData.downSeconds]
  /// they fail (`multiplayer.md`, 2026-10-21).
  void _updateDowned(double dt) {
    final party = rules.party;
    for (final m in List.of(_active)) {
      if (!m.player.isDown || m.isDowned) continue;
      final standing = _active.any((o) => o != m && !o.player.isDown);
      if (!standing) {
        _end(m, RaidOutcome.fainted);
        continue;
      }
      m
        ..downLeft = party.downSeconds
        ..revive = 0
        ..move = Vec2.zero
        ..player.dashLeft = 0;
      _events.add(MemberDowned(player: m.id));
    }
    for (final m in List.of(_active)) {
      if (!m.isDowned) continue;
      final at = m.player.position;
      final helped = _active.any(
        (o) =>
            o != m &&
            !o.player.isDown &&
            o.player.position.distanceTo(at) <= party.reviveRadius,
      );
      if (helped) {
        m.revive += dt;
        if (m.revive >= party.reviveSeconds) {
          m
            ..downLeft = null
            ..revive = 0
            ..player.hp = m.player.maxHp * party.revivedHp
            ..player.sinceHit = 0;
          _events.add(MemberRevived(player: m.id));
          continue;
        }
      } else {
        m.revive = math.max(0, m.revive - dt * party.reviveDecay);
      }
      m.downLeft = m.downLeft! - dt;
      if (m.downLeft! <= 0) _end(m, RaidOutcome.fainted);
    }
    // Nobody left standing to revive anyone: the downed fail together.
    if (_active.isNotEmpty && _active.every((m) => m.player.isDown)) {
      for (final m in List.of(_active)) {
        _end(m, RaidOutcome.fainted);
      }
    }
  }

  /// Returns the events since the last call and forgets them.
  List<RaidEvent> takeEvents() {
    final events = List<RaidEvent>.of(_events);
    _events.clear();
    return events;
  }

  void _end(RaidMember member, RaidOutcome outcome) {
    if (isDanger && outcome != RaidOutcome.extracted) {
      // Each worn piece is lost by its own roll.
      var kept = member.player.equipped;
      for (final kind in GearKind.values) {
        if (kept.of(kind) == null) continue;
        if (_random.chance(_gear.rules.lossChance)) {
          kept = kept.wearing(kind, null);
        }
      }
      member.kept = kept;
      // Each companion too, by the same chance as a worn piece; one that
      // fainted, twice that (2026-11-05, 사용자).
      for (final c in member.companions) {
        final chance = _gear.rules.lossChance * (c.isDown ? 2 : 1);
        if (_random.chance(math.min(1, chance))) {
          member.lostCompanions.add(c.potatoId);
        }
      }
      // In a party, what a fallen member carried stays on the ground for
      // teammates to pick up; their own bag keeps the record of what was lost.
      if (members.length > 1) {
        final dropped = [
          for (final s in member.bag.slots)
            if (s != null)
              ItemStack(s.item, s.count, seed: s.seed, gear: s.gear),
        ];
        if (dropped.isNotEmpty) _drop(member, dropped);
      }
    }
    // What was worn wears for the time spent (2026-10-30, 사용자).
    final seconds = _tick * stepSeconds;
    member.player.equipped = _gear.afterRun(member.player.equipped, seconds);
    if (member.kept case final kept?) {
      member.kept = _gear.afterRun(kept, seconds);
    }
    member
      ..outcome = outcome
      ..signal = null;
    _events.add(RaidEnded(outcome, player: member.id));
  }

  int _newId() => _nextId++;

  // Player -------------------------------------------------------------------

  /// Moves [member] for [dt] seconds using the same rules as [step]. Guests
  /// call [predictMove] between host snapshots so the stick feels instant.
  void predictMove([double? dt]) {
    _updateParty();
    _stepMemberMove(_first, dt ?? stepSeconds);
  }

  void _stepMemberMove(RaidMember member, double dt) {
    final spec = rules.player;
    final player = member.player;
    if (player.isDown || member.isOut) return;
    final move = member.move;
    final from = player.position;
    player.dashCooldown = math.max(0, player.dashCooldown - dt);
    // Stunned by lightning, it stands still (2026-11-10, user).
    if (player.isStunned && !player.isDashing) return;
    if (player.isDashing) {
      player.dashLeft -= dt;
      final speed = spec.dashDistance / spec.dashSeconds;
      player.position = map.move(
        player.position,
        player.dashDirection * (speed * dt),
        player.radius,
      );
    } else if (!move.isZero) {
      player.facing = move.normalized();
      final speed =
          _userStats(member).apply(RaidStat.moveSpeed, spec.speed) *
          (isHungryOf(member) ? rules.food.hungrySpeedMultiplier : 1);
      player.position = map.move(
        player.position,
        move * (speed * dt),
        player.radius,
      );
    }
    // A dash goes out the same on any floor, and carries its speed on.
    if (player.isDashing) {
      player.glide = (player.position - from) / dt;
    } else {
      _settle(player, from, dt);
    }
  }

  /// Bodies other than players that walk on the floor now: companions,
  /// clones and the wild, less flyers and bosses mid-move of their own.
  Iterable<RaidBody> get _floorWalkers sync* {
    if (!map.hasFloors) return;
    for (final m in _active) {
      yield* m.companions.where((c) => !c.isDown);
    }
    for (final clone in clones) {
      if (!clone.isDown) yield clone;
      yield* clone.companions.where((c) => !c.isDown);
    }
    for (final enemy in enemies) {
      if (enemy.isDown || catalog.enemies[enemy.kind]!.flies) continue;
      if (enemy.isCharging || enemy.isHidden) continue;
      yield enemy;
    }
  }

  /// Lets the floor under [body] change the step it just took from [from]
  /// (2026-11-03, 사용자): mud shortens it; on ice it only eases toward the
  /// step meant from the speed carried, so stopping or turning slides a
  /// little.
  void _settle(RaidBody body, Vec2 from, double dt) {
    final meant = body.position - from;
    // Longer than any walk: put somewhere, with nothing to carry.
    if (meant.length > 1) {
      body.glide = Vec2.zero;
      return;
    }
    final floors = rules.floors;
    switch (map.floorAt(from.x.floor(), from.y.floor())) {
      case MapFloor.plain:
        break;
      case MapFloor.mud:
        body.position = map.move(from, meant * floors.mudSpeed, body.radius);
      case MapFloor.ice:
        final grip = 1 - math.exp(-floors.iceGrip * dt);
        final glide = body.glide + (meant / dt - body.glide) * grip;
        body.position = map.move(from, glide * dt, body.radius);
    }
    body.glide = (body.position - from) / dt;
  }

  void _updatePlayer(RaidMember member, double dt) {
    final player = member.player;
    if (player.isDown) return;
    player.sinceHit += dt;
    _stepMemberMove(member, dt);
    _eat(member, dt);
    if (member.isOut || player.isDown || player.isStunned) return;
    _fire(player, aimOf(member), shotDamageOf(member), dt, weaponOf(member));
  }

  /// Food is eaten all the time, more while healing. With none left the
  /// member is hungry: slower, not healing, and sent home after a while.
  void _eat(RaidMember member, double dt) {
    final food = rules.food;
    final player = member.player;
    if (isHungryOf(member)) {
      player
        ..foodOwed = 0
        ..hungrySeconds += dt;
      if (zone.danger case final danger?) {
        // No walking home from a danger zone: hunger wears health down.
        player.hp = math.max(0, player.hp - danger.hungryDamagePerSecond * dt);
      } else if (player.hungrySeconds >= food.hungryReturnSeconds) {
        _end(member, RaidOutcome.starved);
      }
      return;
    }
    player.hungrySeconds = 0;
    final spec = rules.player;
    var rate = food.perSecond;
    if (player.sinceHit >= spec.regenDelaySeconds && player.hp < player.maxHp) {
      final regen = _userStats(member)
          .apply(RaidStat.regenSpeed, spec.regenPerSecond);
      player.hp = math.min(player.maxHp, player.hp + regen * dt);
      rate += food.regenExtraPerSecond;
    }
    rate =
        _userStats(member).apply(RaidStat.foodConsumption, rate) *
        _gear.factorOf(player.equipped, GearStat.foodUse);
    player.foodOwed += rate * dt;
    final whole = player.foodOwed.floor();
    if (whole > 0) {
      player.foodOwed -= whole;
      member.bag.remove(food.item, whole);
    }
  }

  /// [shooter] fires at [target] (null holds fire). Charging weapons must
  /// stay on one target for a while first, and start only once the gun is
  /// ready again, so a shot takes the interval and the aim one after the
  /// other (2026-10-28, user: the sniper has the lowest DPS).
  void _fire(
    RaidShooter shooter,
    RaidBody? target,
    double damage,
    double dt, [
    WeaponData? tuned,
  ]) {
    final gun = tuned ?? catalog.weapons[shooter.weapon]!;
    shooter.fireCooldown -= dt;
    if (gun.aimSeconds > 0) {
      if (target?.id != shooter.aimTarget) shooter.aimProgress = 0;
      shooter.aimTarget = target?.id;
      if (target == null || shooter.fireCooldown > 0) return;
      shooter.aimProgress = math.min(gun.aimSeconds, shooter.aimProgress + dt);
      if (shooter.aimProgress < gun.aimSeconds) return;
      shooter.aimProgress = 0;
    } else {
      shooter.aimTarget = null;
      if (shooter.fireCooldown > 0 || target == null) return;
    }
    final aim = (target.position - shooter.position).normalized();
    final spread = gun.spreadDegrees * math.pi / 180;
    for (var i = 0; i < gun.pellets; i++) {
      final angle = gun.pellets == 1
          ? (_random.nextDouble() - 0.5) * spread
          : -spread / 2 + spread * i / (gun.pellets - 1);
      final direction = aim.rotated(angle);
      bullets.add(
        RaidBullet(
          id: _newId(),
          position: shooter.position + direction * shooter.radius,
          velocity: direction * gun.bulletSpeed,
          damage: damage,
          owner: shooter.id,
          side: shooter.side,
          team: shooter.team,
          remaining: gun.range * 1.15,
        ),
      );
    }
    shooter.fireCooldown = gun.interval;
  }

  /// The body auto-aim would shoot now, for drawing an aim line too.
  RaidBody? autoAimTarget() => aimOf(_first);

  /// The body [member]'s auto-aim would shoot now.
  RaidBody? aimOf(RaidMember member) =>
      _nearestInRange(member.player, weaponOf(member).range);

  /// The standing opponent of [from] nearest to it within [range] that no
  /// obstacle hides.
  RaidBody? _nearestInRange(RaidBody from, double range) {
    RaidBody? best;
    var bestDistance = range;
    for (final body in _opponentsOf(from.team)) {
      final d = body.position.distanceTo(from.position);
      if (d > bestDistance) continue;
      if (!map.canSee(from.position, body.position)) continue;
      best = body;
      bestDistance = d;
    }
    return best;
  }

  /// Every body in the run, standing or not. Members already out of the run
  /// are left out so nothing targets or hits them.
  Iterable<RaidBody> get _bodies sync* {
    for (final m in _active) {
      yield m.player;
      yield* m.companions;
    }
    // A boss in the air or underground is out of reach (2026-10-23).
    yield* enemies.where((e) => !e.isHidden);
    for (final clone in clones) {
      yield clone;
      yield* clone.companions;
    }
  }

  /// Standing bodies of every team but [team].
  Iterable<RaidBody> _opponentsOf(int team) =>
      _bodies.where((b) => !b.isDown && b.team != team);

  // Active skills ------------------------------------------------------------

  /// Lightning from clones on its way: it falls when its warning runs out.
  final List<_PendingStrike> _strikes = [];

  /// [companion]'s active skill, if it has one (2026-11-10, user).
  AbilityEffectData? skillOf(RaidCompanion companion) =>
      _effects.active(_traitsOf(companion));

  /// Whether [companion] could set its skill off now: it has one, stands,
  /// is ready, and has something to use it on.
  bool canUseSkill(RaidCompanion companion) => _skillProblem(companion) == null;

  RaidRejection? _skillProblem(RaidCompanion companion) {
    final skill = skillOf(companion);
    if (skill == null || companion.isDown) {
      return RaidRejection.noSuchCompanion;
    }
    if (companion.skillLeft > 0 || companion.isStunned) {
      return RaidRejection.skillNotReady;
    }
    final found = switch (skill.action) {
      RaidSkill.lightning => _inLightning(
        companion.position,
        companion.team,
      ).isNotEmpty,
      RaidSkill.revive => _downedBeside(companion).isNotEmpty,
      _ => true,
    };
    return found ? null : RaidRejection.noSkillTarget;
  }

  RaidRejection? _useSkill(RaidCompanion companion) {
    final problem = _skillProblem(companion);
    if (problem != null) return problem;
    final skill = skillOf(companion)!;
    final value = skill.valueInUse ?? 0;
    final spec = rules.companion.skills;
    var targets = const <int>[];
    var warning = 0.0;
    switch (skill.action) {
      case RaidSkill.lightning:
        // A clone's lightning is shown first so it can be dodged; the
        // player's falls at once (2026-11-10, user).
        final strike = _PendingStrike(
          at: companion.position,
          from: companion.id,
          team: companion.team,
          damage: companionDamage(companion) * value,
          left: companion.team == playerTeam ? 0 : spec.warningSeconds,
        );
        warning = strike.left;
        if (warning > 0) {
          _strikes.add(strike);
        } else {
          targets = _lightning(strike);
        }
      case RaidSkill.revive:
        targets = [
          for (final c in _downedBeside(companion))
            (c
                  ..hp = c.maxHp * value
                  ..sinceHit = 0
                  ..target = null
                  ..guardLeft = spec.reviveGuardSeconds)
                .id,
        ];
      case RaidSkill.burst:
        final count =
            value.floor() +
            companion.level ~/ math.max(1, spec.burstLevelsPerExtra);
        for (var i = 0; i < count; i++) {
          final angle = _random.nextDouble() * 2 * math.pi;
          final reach = spec.burstRadius * (0.4 + 0.6 * _random.nextDouble());
          final offset = Vec2(math.cos(angle), math.sin(angle)) * reach;
          floorItems.add(
            RaidFloorItem(
              id: _newId(),
              position: map.move(companion.position, offset, 0.1),
              stack: ItemStack(rules.food.item, 1),
            ),
          );
        }
    }
    companion.skillLeft = (skill.intervalInUse ?? 0).toDouble();
    _events.add(
      CompanionSkill(
        companion.id,
        skill.action!,
        companion.position,
        targets: targets,
        warning: warning,
      ),
    );
    return null;
  }

  /// Opponents of [team] that lightning at [at] reaches.
  Iterable<RaidBody> _inLightning(Vec2 at, int team) {
    final reach = rules.companion.skills.lightningRadius;
    return _opponentsOf(team)
        .where((b) => b.position.distanceTo(at) <= reach + b.radius);
  }

  /// [companion]'s own side's downed potatoes: its member's or its
  /// clone's, never the rest of the party's (2026-11-10, user).
  List<RaidCompanion> _downedBeside(RaidCompanion companion) {
    final side = [
      for (final m in _active)
        if (m.companions.contains(companion)) ...m.companions,
      for (final clone in clones)
        if (clone.companions.contains(companion)) ...clone.companions,
    ];
    return [
      for (final c in side)
        if (c.isDown) c,
    ];
  }

  /// Lets [strike] fall: hurts and stuns everything in reach, players too
  /// (2026-11-10, user), but not one dashing through. Returns who it hit.
  List<int> _lightning(_PendingStrike strike) {
    final spec = rules.companion.skills;
    final hit = <int>[];
    for (final body in _inLightning(strike.at, strike.team).toList()) {
      if (body is RaidPlayer && body.isDashing) continue;
      final versus = switch (body) {
        RaidPlayer() => strike.team != playerTeam,
        RaidClone() => strike.team == playerTeam,
        _ => false,
      };
      _hurt(
        body,
        strike.damage * (versus ? rules.clones.versusPlayerDamage : 1),
        _body(strike.from),
      );
      final boss =
          body is RaidEnemy && catalog.enemies[body.kind]?.boss != null;
      body.stunLeft = math.max(
        body.stunLeft,
        boss ? spec.bossStunSeconds : spec.stunSeconds,
      );
      hit.add(body.id);
    }
    return hit;
  }

  void _updateStrikes(double dt) {
    _strikes.removeWhere((strike) {
      strike.left -= dt;
      if (strike.left > 0) return false;
      _events.add(
        CompanionSkill(
          strike.from,
          RaidSkill.lightning,
          strike.at,
          targets: _lightning(strike),
        ),
      );
      return true;
    });
  }

  /// Runs down stuns, skill cooldowns and revived potatoes' guard.
  void _tickSkillTimers(double dt) {
    for (final body in _bodies) {
      if (body.stunLeft > 0) body.stunLeft = math.max(0, body.stunLeft - dt);
    }
    for (final companion in [
      for (final m in _active) ...m.companions,
      for (final clone in clones) ...clone.companions,
    ]) {
      if (companion.skillLeft > 0) {
        companion.skillLeft = math.max(0, companion.skillLeft - dt);
      }
      if (companion.guardLeft > 0) {
        companion.guardLeft = math.max(0, companion.guardLeft - dt);
      }
    }
  }

  // Companions ---------------------------------------------------------------

  /// Where companion [slot] keeps from its owner walking toward [facing]
  /// (2026-10-28, user: behind them as they go, not always on their left):
  /// the first straight behind, the next two further back to either side.
  static Vec2 _followOffset(int slot, Vec2 facing) {
    final (back, side) = const [
      (0.7, 0.0),
      (0.95, 0.5),
      (0.95, -0.5),
    ][slot % 3];
    final across = Vec2(-facing.y, facing.x);
    return facing * -back + across * side;
  }

  /// [owner] is who it follows: a party member (`[member] != null`) or a
  /// clone. Only party potatoes make food and heal, into and from their own
  /// member's bag.
  void _updateCompanion(
    RaidCompanion companion,
    RaidShooter owner,
    double dt, [
    RaidMember? member,
  ]) {
    final spec = rules.companion;
    final stats = statsOf(companion);
    companion
      ..sinceHit += dt
      ..attackCooldown -= dt;
    if (member != null && companion.type == PotatoType.food) {
      final level = catalog.rules.potatoes.level.foodYieldPermille;
      final rate = stats.apply(
        FarmStat.foodYield,
        spec.producePerSecond *
            (1 + companion.level * level / 1000) *
            (1 + companion.beltBoost),
      );
      companion.produced += rate * dt;
      final whole = companion.produced.floor();
      if (whole > 0) {
        companion.produced -= whole;
        member.bag.addFrom(ItemStack(rules.food.item, whole));
      }
    }
    // Heals like the player, eating from the member's bag; not while hungry.
    if (member != null &&
        !isHungryOf(member) &&
        companion.sinceHit >= spec.regenDelaySeconds &&
        companion.hp < companion.maxHp) {
      final share = stats.apply(
        RaidStat.regenSpeed,
        spec.regenPercentPerSecond,
      );
      companion.hp = math.min(
        companion.maxHp,
        companion.hp + companion.maxHp * share * dt,
      );
      companion.foodOwed += spec.regenFoodPerSecond * dt;
      final whole = companion.foodOwed.floor();
      if (whole > 0) {
        companion.foodOwed -= whole;
        member.bag.remove(rules.food.item, whole);
      }
    }
    if (companion.isStunned) return;
    final target = companion.type == PotatoType.combat
        ? _pickTarget(companion, owner)
        : null;
    if (target != null) {
      _fight(companion, owner, target, dt);
    } else {
      _follow(companion, owner, dt);
    }
  }

  void _follow(RaidCompanion companion, RaidShooter owner, double dt) {
    final spec = rules.companion;
    final offset = _followOffset(companion.slot, owner.facing);
    final goal = owner.position + offset;
    final away = goal - companion.position;
    final distance = away.length;
    companion.repath -= dt;
    if (distance < 0.1) return;
    final fromOwner = companion.position.distanceTo(owner.position);
    if (fromOwner > spec.teleportDistance) {
      companion
        ..position = map.move(owner.position, offset, companion.radius)
        ..path.clear();
      return;
    }
    final far = fromOwner > spec.catchUpDistance;
    final speed = companionSpeed(companion) * (far ? 1.5 : 1);
    // Far behind, a rock may stand in the straight line: walk a path round.
    if (far && _catchUp(companion, owner.position, speed, dt)) return;
    companion
      ..path.clear()
      ..position = map.move(
        companion.position,
        away.scaledTo(math.min(speed * dt, distance)),
        companion.radius,
      );
  }

  /// Steps [companion] along a tile path to [goal], planning again every
  /// second. False when there is no way.
  bool _catchUp(RaidCompanion companion, Vec2 goal, double speed, double dt) {
    if (companion.repath <= 0 || companion.path.isEmpty) {
      companion
        ..path = map.findPath(companion.position, goal)
        ..repath = 1;
    }
    if (companion.path.isEmpty) return false;
    _stepAlong(companion, companion.path, speed * dt);
    return true;
  }

  /// Moves [body] [step] tiles along [path], dropping the waypoints it
  /// reaches.
  void _stepAlong(RaidBody body, List<Vec2> path, double step) {
    while (step > 0 && path.isNotEmpty) {
      final delta = path.first - body.position;
      final distance = delta.length;
      if (distance <= step) {
        body.position = map.move(body.position, delta, body.radius);
        step -= distance;
        path.removeAt(0);
      } else {
        body.position = map.move(
          body.position,
          delta.scaledTo(step),
          body.radius,
        );
        step = 0;
      }
    }
  }

  /// Attack mode: the opponent nearest its owner within the attack range.
  /// Defense mode: only opponents going for its team, within the narrow
  /// range. Too far from its owner, it stops fighting and comes back.
  RaidBody? _pickTarget(RaidCompanion companion, RaidShooter owner) {
    final spec = rules.companion;
    if (companion.position.distanceTo(owner.position) > spec.catchUpDistance) {
      companion.target = null;
      return null;
    }
    final range = companion.mode == CompanionMode.attack
        ? spec.attackRange
        : spec.defenseRange;
    if (_body(companion.target ?? -1) case final current?
        when !current.isDown &&
            current.team != companion.team &&
            current.position.distanceTo(owner.position) <= range + 0.5) {
      return current;
    }
    RaidBody? best;
    var bestDistance = range;
    for (final other in _opponentsOf(companion.team)) {
      final d = other.position.distanceTo(owner.position);
      if (d > bestDistance) continue;
      if (!map.seesLevel(companion.position, other.position)) continue;
      if (companion.mode == CompanionMode.defense &&
          !_goesFor(other, companion.team)) {
        continue;
      }
      // Attack mode stays out of the boss area unless its owner is in it.
      if (other is RaidEnemy &&
          inBossArea(other.position) &&
          !inBossArea(owner.position)) {
        continue;
      }
      best = other;
      bestDistance = d;
    }
    companion.target = best?.id;
    return best;
  }

  /// Whether [other] is going for a body of [team].
  bool _goesFor(RaidBody other, int team) {
    final aim = switch (other) {
      RaidEnemy(:final target) => target,
      RaidClone(:final target) => target,
      RaidCompanion(:final target) => target,
      RaidPlayer() => null,
    };
    return aim != null && _body(aim)?.team == team;
  }

  /// Melee closes in and hits; ranged keeps back and shoots when it sees
  /// the target; escort stands between its owner and the target and hits
  /// what comes close.
  void _fight(
    RaidCompanion companion,
    RaidShooter owner,
    RaidBody target,
    double dt,
  ) {
    final style = rules.companion.styles[companion.style];
    if (style == null) return _follow(companion, owner, dt);
    final speed = companionSpeed(companion);
    final d = companion.position.distanceTo(target.position);
    final touch = companion.radius + target.radius + style.reach;
    switch (companion.style!) {
      case CombatStyle.melee:
        if (d > touch) {
          _walk(companion, target.position, speed, dt);
        } else {
          _strike(companion, target);
        }
      case CombatStyle.ranged:
        final seen = map.canSee(companion.position, target.position);
        if (d > style.range || !seen) {
          _walk(companion, target.position, speed, dt);
        } else {
          if (d < style.preferredDistance - 0.3) {
            final back = companion.position - target.position;
            _walk(companion, companion.position + back, speed, dt);
          }
          _shoot(companion, target, style);
        }
      case CombatStyle.escort:
        final toward = target.position - owner.position;
        final out = math.min(style.preferredDistance, toward.length / 2);
        final spot = toward.isZero
            ? owner.position
            : owner.position + toward.scaledTo(out);
        _walk(companion, spot, speed, dt);
        if (d <= touch) _strike(companion, target);
    }
  }

  void _walk(RaidCompanion companion, Vec2 goal, double speed, double dt) {
    final delta = goal - companion.position;
    final distance = delta.length;
    if (distance < 0.05) return;
    companion.position = map.move(
      companion.position,
      delta.scaledTo(math.min(speed * dt, distance)),
      companion.radius,
    );
  }

  void _strike(RaidCompanion companion, RaidBody target) {
    if (companion.attackCooldown > 0) return;
    _hurt(target, companionDamage(companion), companion);
    companion.attackCooldown =
        rules.companion.styles[companion.style]!.interval;
  }

  void _shoot(
    RaidCompanion companion,
    RaidBody target,
    CompanionStyleData style,
  ) {
    if (companion.attackCooldown > 0) return;
    final direction = (target.position - companion.position).normalized();
    bullets.add(
      RaidBullet(
        id: _newId(),
        position: companion.position + direction * companion.radius,
        velocity: direction * style.bulletSpeed,
        damage: companionDamage(companion),
        owner: companion.id,
        side: companion.side,
        team: companion.team,
        remaining: style.range * 1.2,
      ),
    );
    companion.attackCooldown = style.interval;
  }

  /// Fires the companions' periodic abilities when their interval comes
  /// round in run time: speech, healing the party, calling enemies.
  void _runPeriodic() {
    final before = (_tick - 1) * rules.stepMillis;
    final now = _tick * rules.stepMillis;
    for (final companion in [
      for (final m in _active) ...m.companions,
      for (final clone in clones) ...clone.companions,
    ]) {
      if (companion.isDown) continue;
      for (final (:effect, :power) in _effects.periodic(_traitsOf(companion))) {
        final every = effect.intervalInUse;
        if (every == null || every <= 0) continue;
        if (now ~/ (every * 1000) == before ~/ (every * 1000)) continue;
        switch (effect.action) {
          case FarmAction.say:
            _events.add(CompanionSaid(companion.id, effect.text ?? ''));
          case RaidAction.healPercent:
            final percent = (effect.valueInUse ?? 0) * power;
            final party = _bodies.where(
              (b) => !b.isDown && b.team == companion.team,
            );
            for (final body in party) {
              body.hp = math.min(
                body.maxHp,
                body.hp + body.maxHp * percent / 100,
              );
            }
          case RaidAction.aggroPulse:
            final range = rules.companion.aggroPulseRange;
            for (final enemy in enemies) {
              if (enemy.isDown || enemy.target != null) continue;
              if (enemy.position.distanceTo(companion.position) <= range) {
                enemy.target = companion.id;
              }
            }
        }
      }
    }
  }

  // Enemies ------------------------------------------------------------------

  /// The bodies wild enemies may go for: every standing body not wild.
  Iterable<RaidBody> get _wildTargets => _opponentsOf(wildTeam);

  RaidBody? _body(int id) {
    for (final body in _bodies) {
      if (body.id == id) return body;
    }
    return null;
  }

  void _updateEnemy(RaidEnemy enemy, double dt) {
    if (enemy.isStunned) return;
    final spec = catalog.enemies[enemy.kind]!;
    if (spec.boss case final boss?) return _updateBoss(enemy, spec, boss, dt);
    enemy
      ..attackCooldown -= dt
      ..sinceHit += dt;
    if (enemy.target == null && spec.temper == EnemyTemper.aggressive) {
      enemy.target = _nearestInSight(enemy, aggressiveSight)?.id;
    }
    final target = enemy.target == null ? null : _body(enemy.target!);
    if (enemy.target != null) {
      final lost =
          target == null ||
          target.isDown ||
          ((target.position.distanceTo(enemy.position) >
                      (spec.temper == EnemyTemper.aggressive
                          ? aggressiveSight
                          : enemySight) ||
                  !map.seesLevel(enemy.position, target.position)) &&
              enemy.sinceHit > rules.enemyAlertSeconds);
      if (lost) {
        enemy.target = null;
      } else {
        _engage(enemy, spec, target, dt);
        return;
      }
    }
    _wander(enemy, dt);
  }

  /// A boss keeps to its area and takes on only bodies inside it. It
  /// charges and sprays on its own timers and bites what it reaches in
  /// between; with no one inside it goes back to its spot.
  void _updateBoss(RaidEnemy enemy, EnemyData spec, BossData boss, double dt) {
    enemy
      ..attackCooldown -= dt
      ..sinceHit += dt
      ..chargeCooldown -= dt
      ..sprayCooldown -= dt
      ..poseLeft = math.max(0, enemy.poseLeft - dt);
    for (final key in enemy.cooldowns.keys) {
      enemy.cooldowns[key] = enemy.cooldowns[key]! - dt;
    }
    final damage = _enemyDamage;

    enemy.swingLeft = math.max(0, enemy.swingLeft - dt);
    if (enemy.isWindingUp) {
      enemy.windupLeft -= dt;
      if (!enemy.isWindingUp) {
        if (enemy.windupCloud == burrowWindup) {
          _goUnderground(enemy, boss.burrow!);
        } else {
          final cloud = boss.clouds[enemy.windupCloud];
          _puff(enemy, cloud, enemy.windupAt);
          enemy.holdLeft = cloud.seconds;
        }
      }
      return;
    }
    if (enemy.holdLeft > 0) {
      enemy.holdLeft -= dt;
      if (enemy.holdLeft <= 0) {
        enemy
          ..holdLeft = 0
          ..cooldowns['gap'] = _patternGap;
      }
      return;
    }
    if (enemy.isJumping) return _jumping(enemy, boss.jump!, damage, dt);
    if (enemy.isBurrowed) return _burrowing(enemy, boss.burrow!, damage, dt);

    if (enemy.isCharging) {
      final want = math.min(boss.chargeSpeed * dt, enemy.chargeLeft);
      final next = map.move(
        enemy.position,
        enemy.chargeDirection * want,
        enemy.radius,
      );
      final moved = next.distanceTo(enemy.position);
      if (!inBossArea(next) || moved < want * 0.5) {
        enemy.chargeLeft = 0;
      } else {
        enemy
          ..position = next
          ..chargeLeft -= want;
      }
      for (final body in _wildTargets) {
        if (enemy.chargeHits.contains(body.id)) continue;
        if (body.position.distanceTo(enemy.position) >
            body.radius + enemy.radius) {
          continue;
        }
        enemy.chargeHits.add(body.id);
        _hurt(body, boss.chargeDamage * damage, enemy);
      }
      enemy.heading = enemy.chargeDirection;
      if (!enemy.isCharging && enemy.chargeChainLeft > 0) {
        enemy.chargeChainLeft--;
        final next = enemy.target == null ? null : _body(enemy.target!);
        _warnCharge(enemy, boss, next);
        if (enemy.chargeChainLeft == 0) {
          enemy.cooldowns['gap'] = _patternGap;
        }
      }
      return;
    }
    if (enemy.isTelegraphing) {
      enemy.telegraphLeft -= dt;
      if (!enemy.isTelegraphing) {
        enemy
          ..chargeLeft = boss.chargeDistance
          ..chargeHits.clear();
      }
      return;
    }

    var target = enemy.target == null ? null : _body(enemy.target!);
    if (target == null ||
        target.isDown ||
        !_inBossReach(enemy.position, target.position)) {
      target = null;
      var best = double.infinity;
      for (final body in _wildTargets) {
        if (!_inBossReach(enemy.position, body.position)) continue;
        final d = body.position.distanceTo(enemy.position);
        if (d < best) {
          target = body;
          best = d;
        }
      }
      enemy.target = target?.id;
    }
    if (target == null) {
      _moveToward(enemy, enemy.home, enemySpeed, dt);
      return;
    }
    if (_startPattern(enemy, boss, target, damage)) return;
    if (enemy.chargeCooldown <= 0 && boss.chargeEverySeconds > 0) {
      _warnCharge(enemy, boss, target);
      enemy.chargeCooldown = boss.chargeEverySeconds;
      return;
    }
    if (enemy.sprayCooldown <= 0 && boss.sprayBullets > 0) {
      for (var i = 0; i < boss.sprayBullets; i++) {
        final direction = const Vec2(
          1,
          0,
        ).rotated(2 * math.pi * i / boss.sprayBullets);
        bullets.add(
          RaidBullet(
            id: _newId(),
            position: enemy.position + direction * enemy.radius,
            velocity: direction * boss.spraySpeed,
            damage: boss.sprayDamage * damage,
            owner: enemy.id,
            side: RaidSide.wild,
            team: wildTeam,
            remaining: boss.sprayRange,
          ),
        );
      }
      enemy
        ..sprayCooldown = boss.sprayEverySeconds
        ..poseLeft = _poseSeconds;
    }
    final d = target.position.distanceTo(enemy.position);
    if (d <= enemy.radius + target.radius + spec.reach) {
      if (enemy.attackCooldown <= 0) {
        _hurt(target, spec.damage * damage, enemy);
        enemy
          ..attackCooldown = spec.attackInterval
          ..swingLeft = _swingSeconds
          ..swingAt = target.position;
      }
      return;
    }
    final before = enemy.position;
    _moveToward(enemy, target.position, enemySpeed, dt);
    if (!inBossArea(enemy.position)) enemy.position = before;
    if (enemy.position != before) {
      enemy.heading = (enemy.position - before).normalized();
    }
  }

  /// Shows where [enemy] is about to charge, at [target] (straight on as it
  /// was without one).
  void _warnCharge(RaidEnemy enemy, BossData boss, RaidBody? target) {
    final toward = target == null
        ? enemy.chargeDirection
        : target.position - enemy.position;
    enemy
      ..chargeDirection = toward.isZero ? const Vec2(1, 0) : toward.normalized()
      ..telegraphLeft = boss.chargeTelegraphSeconds;
  }

  /// How long the attack face stays after a quick pattern (a spray, a
  /// cloud, shots), and the rest between patterns. *(제안 수치)*
  static const double _poseSeconds = 0.8;
  static const double _patternGap = 2.5;

  /// The wind-up before gas, and how long a swing shows (2026-10-23,
  /// 사용자: a second before it spews; every boss swings).
  static const double _windupSeconds = 1.0;
  static const double _swingSeconds = 0.3;

  /// How fast a landing shadow or a claw's mark follows its target before it
  /// locks: 80% of the player's base speed, so walking away outruns it but
  /// only just (2026-10-23, 사용자).
  double get _markSpeed => rules.player.speed * 0.8;

  /// The zone-boss patterns [boss] has, by their cooldown key.
  static List<(String, double)> _patternsOf(BossData boss) => [
    if (boss.jump case final jump?) ('jump', jump.everySeconds),
    if (boss.burrow case final burrow?) ('burrow', burrow.everySeconds),
    if (boss.chargeChain case final chain?) ('chain', chain.everySeconds),
    for (final (i, c) in boss.clouds.indexed) ('cloud$i', c.everySeconds),
    for (final (i, s) in boss.shots.indexed) ('shot$i', s.everySeconds),
  ];

  /// Starts the zone-boss pattern overdue the longest, unless one just ended;
  /// a tie goes to the one listed first. Picking the first ready one let the
  /// jump and the cloud, always ready again by then, starve the fan of shots
  /// (2026-11-02, 사용자). Returns whether one started.
  bool _startPattern(
    RaidEnemy enemy,
    BossData boss,
    RaidBody target,
    double damage,
  ) {
    final patterns = _patternsOf(boss);
    // Every pattern's wait counts from the first fight on.
    for (final (key, _) in patterns) {
      enemy.cooldowns.putIfAbsent(key, () => 0);
    }
    if ((enemy.cooldowns['gap'] ?? 0) > 0) return false;
    (String, double)? next;
    for (final pattern in patterns) {
      final left = enemy.cooldowns[pattern.$1]!;
      if (left > 0) continue;
      if (pattern.$1.startsWith('cloud') &&
          boss.clouds[int.parse(pattern.$1.substring(5))].behind &&
          !_isBehind(enemy, target)) {
        continue;
      }
      if (next == null || left < enemy.cooldowns[next.$1]!) next = pattern;
    }
    if (next case (final key, final every)) {
      enemy.cooldowns[key] = every;
      enemy.cooldowns['gap'] = _patternGap;
      final toward = target.position - enemy.position;
      final facing = toward.isZero ? const Vec2(0, 1) : toward.normalized();
      switch (key) {
        case 'jump':
          final jump = boss.jump!;
          enemy
            ..jumpLeft = jump.airSeconds
            ..jumpAt = target.position;
        case 'burrow':
          // It shudders a second first, then goes under (2026-10-23, 사용자).
          enemy
            ..windupLeft = _windupSeconds
            ..windupCloud = burrowWindup
            ..windupAt = facing;
        case 'chain':
          enemy.chargeChainLeft = boss.chargeChain!.count - 1;
          _warnCharge(enemy, boss, target);
        default:
          final i = int.parse(key.replaceAll(RegExp(r'\D'), ''));
          if (key.startsWith('cloud')) {
            // It stops and winds up first, then spews and stays put.
            enemy
              ..windupLeft = _windupSeconds
              ..windupCloud = i
              ..windupAt = boss.clouds[i].behind ? enemy.heading * -1 : facing;
          } else {
            _fan(enemy, boss.shots[i], facing, damage);
            enemy.poseLeft = _poseSeconds;
          }
      }
      return true;
    }
    return false;
  }

  /// In the air: the shadow follows the target until it locks, then the
  /// boss lands on it and hurts everything under it.
  void _jumping(RaidEnemy enemy, BossJumpData jump, double damage, double dt) {
    if (enemy.jumpLeft > jump.lockSeconds) {
      _trackMark(enemy, enemy.jumpAt, _markSpeed * dt, (at) {
        enemy.jumpAt = at;
      });
    }
    enemy.jumpLeft -= dt;
    if (enemy.isJumping) return;
    enemy
      ..jumpLeft = 0
      ..position = _landing(enemy.jumpAt, enemy.radius, enemy.position);
    _slam(enemy, enemy.jumpAt, jump.radius, jump.damage * damage);
    enemy.cooldowns['gap'] = _patternGap;
  }

  /// Underground: the mark follows the target's feet until it locks, a claw
  /// comes up there, then quicker strikes where the target has moved to;
  /// it comes up at the last.
  void _burrowing(
    RaidEnemy enemy,
    BossBurrowData burrow,
    double damage,
    double dt,
  ) {
    final first = enemy.burrowStrikes == 1 + burrow.followUps;
    if (first && enemy.burrowLeft > burrow.lockSeconds) {
      _trackMark(enemy, enemy.burrowAt, _markSpeed * dt, (at) {
        enemy.burrowAt = at;
      });
    }
    enemy.burrowLeft -= dt;
    if (enemy.isBurrowed) return;
    _slam(enemy, enemy.burrowAt, burrow.radius, burrow.damage * damage);
    enemy.burrowStrikes--;
    if (enemy.burrowStrikes > 0) {
      final target = enemy.target == null ? null : _body(enemy.target!);
      if (target != null &&
          !target.isDown &&
          _inBossReach(enemy.position, target.position)) {
        enemy.burrowAt = target.position;
      }
      enemy.burrowLeft = burrow.followUpLockSeconds;
      // A follow-up with no blink still waits a step to be seen.
      if (!enemy.isBurrowed) enemy.burrowLeft = stepSeconds;
      return;
    }
    enemy
      ..burrowLeft = 0
      ..burrowStrikes = 0
      ..position = _landing(enemy.burrowAt, enemy.radius, enemy.position);
    enemy.cooldowns['gap'] = _patternGap;
  }

  /// [RaidEnemy.windupCloud] while it winds up to go underground.
  static const int burrowWindup = -1;

  /// Under the ground: the mark starts at the target's feet.
  void _goUnderground(RaidEnemy enemy, BossBurrowData burrow) {
    final target = enemy.target == null ? null : _body(enemy.target!);
    enemy
      ..burrowLeft = burrow.followSeconds + burrow.lockSeconds
      ..burrowAt = target?.position ?? enemy.position
      ..burrowStrikes = 1 + burrow.followUps;
  }

  /// Moves a mark ([from]) up to [step] toward the boss's target, inside the
  /// boss area.
  void _trackMark(
    RaidEnemy enemy,
    Vec2 from,
    double step,
    void Function(Vec2 at) set,
  ) {
    final target = enemy.target == null ? null : _body(enemy.target!);
    if (target == null || target.isDown) return;
    final toward = target.position - from;
    final distance = toward.length;
    if (distance == 0) return;
    final next = from + toward.scaledTo(math.min(step, distance));
    if (inBossArea(next)) set(next);
  }

  /// Where a boss coming down at [at] stands: there when its body fits and
  /// it is in the area, otherwise where it was.
  Vec2 _landing(Vec2 at, double radius, Vec2 was) {
    if (!inBossArea(at)) return was;
    final x = at.x.floor();
    final y = at.y.floor();
    return map.isBlocked(x, y) ? was : at;
  }

  /// Hurts every body within [radius] of [at] (a landing, a claw).
  void _slam(RaidEnemy enemy, Vec2 at, double radius, double amount) {
    for (final body in _wildTargets.toList()) {
      if (body.position.distanceTo(at) <= radius + body.radius) {
        _hurt(body, amount, enemy);
      }
    }
  }

  /// Gas or spores spewed where the boss stands: all around, or a fan
  /// toward [facing].
  void _puff(RaidEnemy enemy, BossCloudData cloud, Vec2 facing) {
    clouds.add(
      RaidCloud(
        id: _newId(),
        position: enemy.position,
        radius: cloud.radius,
        spreadSeconds: cloud.spreadSeconds,
        seconds: cloud.seconds,
        damagePerSecond: cloud.damagePerSecond * _enemyDamage,
        owner: enemy.id,
        kind: enemy.kind,
        direction: facing,
        fan: cloud.fanDegrees * math.pi / 180,
      ),
    );
    enemy.poseLeft = cloud.seconds;
  }

  /// Whether [target] is behind the way [enemy] last moved.
  bool _isBehind(RaidEnemy enemy, RaidBody target) {
    final away = target.position - enemy.position;
    return away.x * enemy.heading.x + away.y * enemy.heading.y < 0;
  }

  /// A fan of shots toward [facing].
  void _fan(RaidEnemy enemy, BossShotData shot, Vec2 facing, double damage) {
    final spread = shot.spreadDegrees * math.pi / 180;
    for (var i = 0; i < shot.bullets; i++) {
      final angle = shot.bullets == 1
          ? 0.0
          : -spread / 2 + spread * i / (shot.bullets - 1);
      final direction = facing.rotated(angle);
      bullets.add(
        RaidBullet(
          id: _newId(),
          position: enemy.position + direction * enemy.radius,
          velocity: direction * shot.speed,
          damage: shot.damage * damage,
          owner: enemy.id,
          side: RaidSide.wild,
          team: wildTeam,
          remaining: shot.range,
        ),
      );
    }
  }

  /// Clouds grow, hurt whoever is inside now and then, and fade.
  void _updateClouds(double dt) {
    clouds.removeWhere((cloud) {
      cloud
        ..age += dt
        ..sinceTick += dt;
      if (cloud.sinceTick >= RaidCloud.tickSeconds) {
        cloud.sinceTick -= RaidCloud.tickSeconds;
        final from = enemies.where((e) => e.id == cloud.owner).firstOrNull;
        for (final body in _wildTargets.toList()) {
          if (cloud.covers(body.position, body.radius)) {
            _hurt(body, cloud.damagePerSecond * RaidCloud.tickSeconds, from);
          }
        }
      }
      return cloud.isGone;
    });
  }

  RaidBody? _nearestInSight(RaidEnemy enemy, double sight) {
    RaidBody? best;
    var bestDistance = double.infinity;
    for (final body in _wildTargets) {
      final d = body.position.distanceTo(enemy.position);
      if (d > _noticeRange(body, sight) || d > bestDistance) continue;
      if (!map.seesLevel(enemy.position, body.position)) continue;
      best = body;
      bestDistance = d;
    }
    return best;
  }

  /// How far enemies seeing [sight] notice [body]: some abilities make a
  /// potato easier to notice.
  double _noticeRange(RaidBody body, double sight) => switch (body) {
    final RaidCompanion c =>
      (<String, StatSum>{}
            ..addAll(_effects.own(_traitsOf(c)))
            ..addAll(_potatoMeals(c)))
          .apply(RaidStat.detectRange, sight),
    _ => sight,
  };

  void _engage(RaidEnemy enemy, EnemyData spec, RaidBody target, double dt) {
    final d = target.position.distanceTo(enemy.position);
    switch (spec.attack) {
      case EnemyAttack.melee:
        if (d <= enemy.radius + target.radius + spec.reach) {
          if (enemy.attackCooldown <= 0) {
            _hurt(target, spec.damage * _enemyDamage, enemy);
            enemy.attackCooldown = spec.attackInterval;
          }
        } else {
          _moveToward(enemy, target.position, enemySpeed, dt);
        }
      case EnemyAttack.ranged:
        if (d <= spec.range && map.canSee(enemy.position, target.position)) {
          if (enemy.attackCooldown <= 0) {
            final direction = (target.position - enemy.position).normalized();
            bullets.add(
              RaidBullet(
                id: _newId(),
                position: enemy.position + direction * enemy.radius,
                velocity: direction * spec.bulletSpeed,
                damage: spec.damage * _enemyDamage,
                owner: enemy.id,
                side: RaidSide.wild,
                team: wildTeam,
                remaining: spec.range * 1.3,
              ),
            );
            enemy.attackCooldown = spec.attackInterval;
          }
        } else {
          _moveToward(enemy, target.position, enemySpeed, dt);
        }
    }
  }

  void _wander(RaidEnemy enemy, double dt) {
    enemy.wanderTimer -= dt;
    if (enemy.wanderTimer <= 0) {
      enemy
        ..wanderGoal = Vec2(
          enemy.home.x + (_random.nextDouble() * 2 - 1) * 1.5,
          enemy.home.y + (_random.nextDouble() * 2 - 1) * 1.5,
        )
        ..wanderTimer = 2 + _random.nextDouble() * 3;
    }
    _moveToward(enemy, enemy.wanderGoal, enemySpeed * 0.35, dt);
  }

  void _moveToward(RaidEnemy enemy, Vec2 goal, double speed, double dt) {
    final delta = goal - enemy.position;
    final distance = delta.length;
    if (distance < 0.05) return;
    enemy.position = map.move(
      enemy.position,
      delta.scaledTo(math.min(speed * dt, distance)),
      enemy.radius,
    );
  }

  // Shots and damage ---------------------------------------------------------

  void _hurt(RaidBody target, double amount, RaidBody? from) {
    if (target.isDown) return;
    if (target is RaidCompanion && target.guardLeft > 0) return;
    if (target is RaidPlayer && target.isDashing) return;
    target.hp = math.max(0, target.hp - amount);
    _events.add(BodyHit(target.id, amount));
    final foe = from != null && from.team != target.team ? from : null;
    switch (target) {
      case RaidPlayer():
        target.sinceHit = 0;
      case RaidClone():
        target.sinceHit = 0;
        if (foe != null) target.target = foe.id;
      case RaidCompanion():
        target.sinceHit = 0;
        // Being hit counts as "going for us" in either mode.
        if (target.type == PotatoType.combat &&
            target.target == null &&
            foe != null) {
          target.target = foe.id;
        }
        // Down in either zone, it faints and comes home to recover
        // (2026-11-05, 사용자: no more leaving its seed in a danger zone).
        if (target.isDown && target.team == playerTeam) {
          _events.add(CompanionDown(target.id));
        }
      case RaidEnemy():
        target.sinceHit = 0;
        if (foe != null) target.target = foe.id;
    }
  }

  void _updateBullets(double dt) {
    bullets.removeWhere((bullet) {
      final move = bullet.velocity * dt;
      final from = bullet.position;
      bullet
        ..position = bullet.position + move
        ..remaining -= move.length;
      if (bullet.remaining <= 0 ||
          map.blocksShots(
            bullet.position.x.floor(),
            bullet.position.y.floor(),
          )) {
        return true;
      }
      // Shots from below stop at the cliff.
      if (!map.seesLevel(from, bullet.position)) return true;
      for (final target in _opponentsOf(bullet.team)) {
        if (target.position.distanceTo(bullet.position) <=
            target.radius + 0.05) {
          _hurt(
            target,
            bullet.damage * _versusScale(bullet, target),
            _body(bullet.owner),
          );
          return true;
        }
      }
      return false;
    });
  }

  /// Clones and players hurt each other less (2026-11-02, 사용자): guns grow
  /// with the zone and gear while a player's health barely does, so a clone
  /// killed in one shot. Told by the bullet, as its shooter may be gone.
  double _versusScale(RaidBullet bullet, RaidBody target) {
    final versus = switch (target) {
      RaidPlayer() => bullet.side == RaidSide.clone,
      RaidClone() => memberOf(bullet.owner) != null,
      _ => false,
    };
    return versus ? rules.clones.versusPlayerDamage : 1;
  }

  void _pickUpFloorItems() {
    floorItems.removeWhere((item) {
      for (final m in _active) {
        if (item.position.distanceTo(m.player.position) > rules.pickupRadius) {
          continue;
        }
        final moved = m.bag.addFrom(item.stack);
        if (moved > 0) {
          _events.add(
            ItemPicked(
              ItemStack(item.stack.item, moved, seed: item.stack.seed),
              player: m.id,
            ),
          );
        }
        if (item.stack.count == 0) return true;
      }
      return false;
    });
  }

  /// Takes defeated enemies off the map; each may leave loot.
  void _clearDefeated() {
    final drops = zone.drops;
    enemies.removeWhere((enemy) {
      if (!enemy.isDown) return false;
      _events.add(EnemyDefeated(enemy.id, enemy.kind));
      if (zone.boss case final boss? when boss.enemy == enemy.kind) {
        for (final m in _active) {
          m.bossKilled = true;
        }
        _leaveLoot(
          enemy.position,
          PileKind.bossBundle,
          () => LootPile.roll(
            catalog.lootTables[boss.loot]!,
            catalog.stackOf,
            _random,
            makeSeed: _seedMaker(catalog, _lootLevels, _random),
            makeGear: _gearMaker(catalog, _lootLevels, _random),
            weigh: _luck(
              catalog,
              zone,
              _party.apply(RaidStat.lootRareChance, 1),
            ),
            amount: catalog.rules.zoneScaling.lootAmount(zone.score),
          ),
        );
        return true;
      }
      final roll = _random.nextDouble();
      if (roll < drops.bundleChance) {
        _leaveLoot(
          enemy.position,
          PileKind.bundle,
          () => LootPile.roll(
            catalog.lootTables[drops.bundle]!,
            catalog.stackOf,
            _random,
            makeSeed: _seedMaker(catalog, _lootLevels, _random),
            makeGear: _gearMaker(catalog, _lootLevels, _random),
            weigh: _luck(
              catalog,
              zone,
              _party.apply(RaidStat.lootRareChance, 1),
            ),
            amount: catalog.rules.zoneScaling.lootAmount(zone.score),
          ),
        );
      } else if (roll < drops.bundleChance + drops.itemChance) {
        final loot = LootPile.roll(
          catalog.lootTables[drops.item]!,
          catalog.stackOf,
          _random,
          makeSeed: _seedMaker(catalog, _lootLevels, _random),
          makeGear: _gearMaker(catalog, _lootLevels, _random),
          weigh: _luck(catalog, zone, _party.apply(RaidStat.lootRareChance, 1)),
          amount: catalog.rules.zoneScaling.lootAmount(zone.score),
        );
        for (final stack in loot.items) {
          floorItems.add(
            RaidFloorItem(id: _newId(), position: enemy.position, stack: stack),
          );
        }
      }
      return true;
    });
  }

  // Clones -------------------------------------------------------------------

  /// Brings in the first clones on the first step (with the player, and
  /// announced like the rest), then one more whenever its time comes, until
  /// the zone's number have come in. A party meets more of them, one by one
  /// as alone (2026-10-23, 사용자).
  void _bringClones() {
    final danger = zone.danger!;
    while (_clonesIn < _clonesAtStart) {
      final before = _clonesIn;
      _spawnClone();
      if (_clonesIn == before) break;
    }
    if (_clonesIn >= _clonesMax || danger.cloneEverySeconds <= 0) return;
    if (_tick * stepSeconds < _nextCloneAt) return;
    _nextCloneAt += danger.cloneEverySeconds;
    _spawnClone();
  }

  int get _clonesAtStart =>
      (zone.danger!.clonesAtStart * _partyScale(members.length)).round();

  int get _clonesMax =>
      (zone.danger!.clonesMax * _partyScale(members.length)).round();

  /// A default clone fitting the zone's score walks in at an entry site out
  /// of the player's sight (any site if none is), with its potatoes.
  void _spawnClone() {
    if (zone.danger == null || _clonesIn >= _clonesMax) return;
    final data = _pickDefaultClone();
    if (data == null) return;
    _clonesIn++;

    final sites = map.markers[cloneEntryMarker] ?? [map.entry];
    final hidden = [
      for (final site in sites)
        if (_active.every(
          (m) =>
              Vec2(site.x + 0.5, site.y + 0.5).distanceTo(m.player.position) >
              rules.player.sight,
        ))
          site,
    ];
    final pool = hidden.isEmpty ? sites : hidden;
    final site = pool[_random.nextInt(pool.length)];
    final at = Vec2(site.x + 0.5, site.y + 0.5);

    final starts = [
      for (final c in data.companions)
        CompanionStart(
          potatoId: 0,
          type: c.type,
          grade: c.grade,
          level: c.level,
          abilities: c.abilities,
          style: c.style,
        ),
    ];
    final party = _effects.party([for (final c in starts) c.traits]);
    final clone = RaidClone(
      id: _newId(),
      position: at,
      radius: rules.clones.radius,
      maxHp: party.apply(RaidStat.hp, rules.clones.maxHp),
      weapon: data.weapon,
      weaponLevel: data.weaponLevel,
      cloneId: data.id,
      name: data.name.text,
      bag: Bag(data.bagSlots, catalog.stackOf),
      stayLeft:
          rules.clones.staySecondsMin +
          _random.nextDouble() *
              (rules.clones.staySecondsMax - rules.clones.staySecondsMin),
    );
    for (final (slot, start) in starts.indexed) {
      clone.companions.add(
        RaidCompanion(
          id: _newId(),
          position: map.move(
            at,
            _followOffset(slot, clone.facing),
            rules.companion.radius,
          ),
          radius: rules.companion.radius,
          maxHp: _startHp(catalog, start, _effects.own(start.traits), party),
          potatoId: 0,
          type: start.type,
          grade: start.grade,
          level: start.level,
          abilities: start.abilities,
          style: start.style,
          lifeLeft: 1,
          slot: slot,
          team: clone.id,
        ),
      );
    }
    clones.add(clone);
    _events.add(CloneEntered(clone.id));
  }

  /// A default clone for this zone's score, preferring ones not in the run;
  /// the nearest by score when none fits.
  DefaultCloneData? _pickDefaultClone() {
    final all = catalog.defaultClones.values.toList();
    if (all.isEmpty) return null;
    final score = zone.score;
    int gap(DefaultCloneData c) => score < c.scoreMin
        ? c.scoreMin - score
        : score > c.scoreMax
        ? score - c.scoreMax
        : 0;
    final best = all.map(gap).reduce(math.min);
    final fitting = [
      for (final c in all)
        if (gap(c) == best) c,
    ];
    final inRun = {for (final c in clones) c.cloneId};
    final fresh = [
      for (final c in fitting)
        if (!inRun.contains(c.id)) c,
    ];
    final pool = fresh.isEmpty ? fitting : fresh;
    return pool[_random.nextInt(pool.length)];
  }

  /// What one of [clone]'s bullets does.
  double cloneShotDamage(
    RaidClone clone,
  ) => (_parties[clone.id] ?? const {}).apply(
    RaidStat.attack,
    catalog.weapons[clone.weapon]!.damage *
        levelGrowth(catalog.rules.gear.levelDamagePermille, zone.score) *
        (1 + clone.weaponLevel * catalog.rules.workbench.damagePercent / 100),
  );

  /// Gathers, fights what comes into its sight keeping its weapon's
  /// distance, and leaves through the nearest open exit when its bag is
  /// full, its stay runs out or its health is low (checked between
  /// fights). It never runs from a fight, uses no dash or cover, and does
  /// not heal.
  void _updateClone(RaidClone clone, double dt) {
    for (final companion in clone.companions) {
      if (!companion.isDown) _updateCompanion(companion, clone, dt);
    }
    if (clone.isDown) return;
    // Its potatoes' skills go off as soon as they can (2026-11-10, user).
    for (final companion in clone.companions) {
      if (canUseSkill(companion)) _useSkill(companion);
    }
    if (clone.isStunned) return;
    clone
      ..sinceHit += dt
      ..stayLeft -= dt
      ..repath -= dt;
    final speed = (_parties[clone.id] ?? const {}).apply(
      RaidStat.moveSpeed,
      _cloneSpeed,
    );
    final gun = catalog.weapons[clone.weapon]!;

    if (clone.mode == CloneMode.waiting) {
      _fire(
        clone,
        _nearestInRange(clone, gun.range),
        cloneShotDamage(clone),
        dt,
      );
      clone.waitLeft -= dt;
      if (clone.waitLeft <= 0) {
        clones.remove(clone);
        _events.add(CloneEscaped(clone.id));
      }
      return;
    }

    final target = _cloneTarget(clone);
    if (target != null) {
      final d = clone.position.distanceTo(target.position);
      final keep = gun.preferredDistance;
      final seen = map.canSee(clone.position, target.position);
      if (d > keep + 0.25 || !seen) {
        _walkPath(clone, target.position, speed, dt, every: 0.6);
      } else if (d < keep - 0.25) {
        final back = (clone.position - target.position).scaledTo(speed * dt);
        clone.position = map.move(clone.position, back, clone.radius);
      }
    } else {
      if (clone.mode == CloneMode.gather && _wantsToLeave(clone)) {
        clone.mode = CloneMode.extract;
      }
      if (clone.mode == CloneMode.gather) {
        _cloneGather(clone, speed, dt);
      } else {
        _cloneExtract(clone, speed, dt);
      }
    }
    _fire(clone, _nearestInRange(clone, gun.range), cloneShotDamage(clone), dt);
  }

  bool _wantsToLeave(RaidClone clone) =>
      clone.bag.slots.every((s) => s != null) ||
      clone.stayLeft <= 0 ||
      clone.hp / clone.maxHp < rules.clones.lowHpRatio;

  /// Keeps fighting what it fights until that falls or leaves its sight
  /// (past the alert time); otherwise takes on the nearest opponent in
  /// sight.
  RaidBody? _cloneTarget(RaidClone clone) {
    final sight = cloneSight;
    if (clone.target case final id?) {
      final current = _body(id);
      final lost =
          current == null ||
          current.isDown ||
          ((current.position.distanceTo(clone.position) > sight ||
                  !map.seesLevel(clone.position, current.position)) &&
              clone.sinceHit > rules.enemyAlertSeconds);
      if (!lost) return current;
      clone.target = null;
    }
    RaidBody? best;
    var bestDistance = sight;
    for (final other in _opponentsOf(clone.team)) {
      final d = other.position.distanceTo(clone.position);
      if (d > bestDistance) continue;
      if (!map.seesLevel(clone.position, other.position)) continue;
      best = other;
      bestDistance = d;
    }
    clone.target = best?.id;
    return best;
  }

  /// Walks to the nearest gathering spot with something left and takes all
  /// it can. A spot it cannot reach or empty in time is skipped; one it
  /// cannot empty means the bag is full.
  void _cloneGather(RaidClone clone, double speed, double dt) {
    RaidPile? spot;
    for (final pile in piles) {
      if (pile.id == clone.spot) spot = pile;
    }
    if (spot == null || spot.loot.isEmpty || clone.goalTimer <= 0) {
      if (spot != null && !spot.loot.isEmpty) clone.skipped.add(spot.id);
      final next = _nearestSpot(clone);
      clone
        ..spot = next?.id
        ..goalTimer = 25;
      if (next == null) clone.mode = CloneMode.extract;
      return;
    }
    clone.goalTimer -= dt;
    if (spot.position.distanceTo(clone.position) <= rules.pickupRadius) {
      spot.loot.takeAllInto(clone.bag);
      if (!spot.loot.isEmpty) clone.mode = CloneMode.extract;
      clone.spot = null;
      return;
    }
    if (!_walkPath(clone, spot.position, speed, dt)) {
      clone
        ..skipped.add(spot.id)
        ..spot = null;
    }
  }

  RaidPile? _nearestSpot(RaidClone clone) {
    RaidPile? best;
    var bestDistance = double.infinity;
    for (final pile in piles) {
      if (pile.kind != PileKind.spot || pile.loot.isEmpty) continue;
      if (clone.skipped.contains(pile.id)) continue;
      final d = pile.position.distanceTo(clone.position);
      if (d >= bestDistance) continue;
      best = pile;
      bestDistance = d;
    }
    return best;
  }

  /// Clones know every open exit: walks to the nearest and signals there.
  void _cloneExtract(RaidClone clone, double speed, double dt) {
    if (exits.isEmpty) return;
    RaidExit? goal;
    for (final exit in exits) {
      if (exit.id == clone.exit) goal = exit;
    }
    goal ??= exits.reduce(
      (a, b) =>
          a.position.distanceTo(clone.position) <=
              b.position.distanceTo(clone.position)
          ? a
          : b,
    );
    clone.exit = goal.id;
    final radius = zone.danger?.exitRadius ?? 0;
    if (goal.position.distanceTo(clone.position) <= radius) {
      clone
        ..mode = CloneMode.waiting
        ..waitLeft = zone.danger!.countdownSeconds;
      _events.add(CloneSignalled(clone.id, goal.id));
      return;
    }
    _walkPath(clone, goal.position, speed, dt);
  }

  /// Steps [clone] along a tile path to [goal], planning again every
  /// [every] seconds or when the goal moves. False when there is no way.
  bool _walkPath(
    RaidClone clone,
    Vec2 goal,
    double speed,
    double dt, {
    double every = 2,
  }) {
    final planned = clone.pathGoal;
    if (clone.repath <= 0 ||
        planned == null ||
        planned.distanceTo(goal) > 0.5) {
      clone
        ..path = map.findPath(clone.position, goal)
        ..pathGoal = goal
        ..repath = every;
      if (clone.path.isEmpty) return false;
    }
    if (clone.path.isEmpty) return false;
    _stepAlong(clone, clone.path, speed * dt);
    if (clone.path.isNotEmpty) {
      final ahead = clone.path.first - clone.position;
      if (!ahead.isZero) clone.facing = ahead.normalized();
    }
    return true;
  }

  /// Fallen clones leave what they gathered in a bundle; their potatoes go
  /// with them.
  void _clearClones() {
    clones.removeWhere((clone) {
      if (!clone.isDown) return false;
      final items = [for (final s in clone.bag.slots) ?s];
      if (items.isNotEmpty) {
        // Each member's share is a copy of what it gathered.
        _leaveLoot(
          clone.position,
          PileKind.cloneBundle,
          () => LootPile([for (final s in items) s.copyWithCount(s.count)]),
        );
      }
      _events.add(CloneDown(clone.id));
      return true;
    });
  }

  // Setup --------------------------------------------------------------------

  static Vec2 _randomTile(MapData map, GameRandom random) =>
      Vec2(random.nextInt(map.size) + 0.5, random.nextInt(map.size) + 0.5);

  /// How enemy counts, boss health, gathering spots and clones scale with
  /// [partySize]. Kept at 1 until the balance phase sets the numbers.
  static double _partyScale(int partySize) => partySize <= 1 ? 1 : 1;

  /// Lone enemies picked by weight, plus packs standing close together, all
  /// away from the entry and off obstacles.
  static List<RaidEnemy> _placeEnemies(
    Catalog catalog,
    ZoneData zone,
    MapData map,
    Vec2 entry,
    GameRandom random,
    int Function() newId, {
    int partySize = 1,
  }) {
    final scale = _partyScale(partySize);
    final spec = zone.enemies;
    final hp =
        spec.hpMultiplier * catalog.rules.zoneScaling.enemyHp(zone.score);
    final placed = <RaidEnemy>[];
    final area = {...?map.markers[bossAreaMarker]};
    bool free(Vec2 at, double spacing) =>
        !area.contains(TilePos(at.x.floor(), at.y.floor())) &&
        at.distanceTo(entry) >= spec.keepAway &&
        !map.overlapsCircle(at, 0.35) &&
        !placed.any((e) => e.position.distanceTo(at) < spacing);
    void add(String kind, Vec2 at) {
      final data = catalog.enemies[kind]!;
      placed.add(
        RaidEnemy(
          id: newId(),
          position: at,
          radius: data.radius,
          maxHp: data.maxHp * hp,
          kind: kind,
          home: at,
        ),
      );
    }

    // Enemies drawn on the map or its chunks stand where they are; a drawn
    // map has no others.
    final drawn = zone.drawnMap != null;
    for (final MapEntry(key: name, value: tiles) in map.markers.entries) {
      if (!name.startsWith(enemyMarkerPrefix)) continue;
      for (final tile in tiles) {
        add(
          name.substring(enemyMarkerPrefix.length),
          Vec2(tile.x + 0.5, tile.y + 0.5),
        );
      }
    }

    var packs = 0;
    final packGoal = drawn ? 0 : (spec.packs * scale).round();
    for (var tries = 0; packs < packGoal && tries < 2000; tries++) {
      final center = _randomTile(map, random);
      if (!free(center, 3)) continue;
      final kind = spec.packKinds[random.nextInt(spec.packKinds.length)];
      final size =
          spec.packSizeMin +
          random.nextInt(spec.packSizeMax - spec.packSizeMin + 1);
      for (var i = 0, t = 0; i < size && t < 60; t++) {
        final at =
            center +
            Vec2(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1);
        if (!free(at, 0.5)) continue;
        add(kind, at);
        i++;
      }
      packs++;
    }

    final total = spec.kinds.fold(0, (sum, k) => sum + k.weight);
    var loners = 0;
    final lonerGoal = drawn ? 0 : (spec.count * scale).round();
    for (var tries = 0; loners < lonerGoal && tries < 2000; tries++) {
      final at = _randomTile(map, random);
      if (!free(at, 1.5)) continue;
      var roll = random.nextInt(total);
      final kind = spec.kinds.firstWhere((k) {
        roll -= k.weight;
        return roll < 0;
      });
      add(kind.enemy, at);
      loners++;
    }
    // The boss stands at the tile of its area nearest the area's middle.
    final boss = zone.boss;
    if (boss != null && area.isNotEmpty) {
      final mx = area.fold(0, (sum, t) => sum + t.x) / area.length;
      final my = area.fold(0, (sum, t) => sum + t.y) / area.length;
      final middle = area.reduce(
        (a, b) =>
            (a.x - mx) * (a.x - mx) + (a.y - my) * (a.y - my) <=
                (b.x - mx) * (b.x - mx) + (b.y - my) * (b.y - my)
            ? a
            : b,
      );
      final data = catalog.enemies[boss.enemy]!;
      final at = Vec2(middle.x + 0.5, middle.y + 0.5);
      placed.add(
        RaidEnemy(
          id: newId(),
          position: at,
          radius: data.radius,
          maxHp: data.maxHp * hp * scale,
          kind: boss.enemy,
          home: at,
          chargeCooldown: data.boss!.chargeEverySeconds / 2,
          sprayCooldown: data.boss!.sprayEverySeconds / 2,
          cooldowns: {
            for (final (key, every) in _patternsOf(data.boss!)) key: every / 2,
          },
        ),
      );
    }
    return placed;
  }

  /// Danger zones open some of the map's exits at random; safe zones none.
  static List<RaidExit> _openExits(
    ZoneData zone,
    MapData map,
    GameRandom random,
    int Function() newId,
  ) {
    final danger = zone.danger;
    if (danger == null) return [];
    final sites = List.of(map.exits);
    final open = <RaidExit>[];
    while (open.length < danger.openExits && sites.isNotEmpty) {
      final site = sites.removeAt(random.nextInt(sites.length));
      open.add(
        RaidExit(id: newId(), position: Vec2(site.x + 0.5, site.y + 0.5)),
      );
    }
    return open;
  }

  /// Gathering spots on free tiles, spaced apart, each with loot rolled now.
  /// Seeds found get a level from [levels], and an ability (and style) of
  /// their own.
  static SeedMaker _seedMaker(
    Catalog catalog,
    LootLevels levels,
    GameRandom random,
  ) {
    final roller = AbilityRoller(catalog);
    return (item) => switch (catalog.items[item]?.seed) {
      final kind? => roller.seed(
        type: kind.type,
        grade: kind.grade,
        level: levels.seed(kind.type, random),
        random: random,
      ),
      null => null,
    };
  }

  /// Gear found gets a level from [levels]; belts roll the type of each
  /// slot (as many as the grade gives).
  static GearMaker _gearMaker(
    Catalog catalog,
    LootLevels levels,
    GameRandom random,
  ) {
    const types = [PotatoType.food, PotatoType.combat, PotatoType.buff];
    return (item) {
      final kind = catalog.items[item]?.gear;
      if (kind == null) return null;
      final slots = kind.kind == GearKind.belt
          ? [
              for (
                var i = 0;
                i < (catalog.rules.gear.beltSlots[kind.grade] ?? 1);
                i++
              )
                types[random.nextInt(types.length)],
            ]
          : const <PotatoType>[];
      return Gear(
        kind: kind.kind,
        family: kind.family,
        grade: kind.grade,
        level: levels.gear(kind.kind, random),
        slots: slots,
        abilities: GearStats(catalog)
            .rollAbilities(kind.kind, kind.family, kind.grade, random),
      );
    };
  }

  /// Luck: rare and legendary seeds weigh [factor] times as much, and
  /// rare and legendary seeds and gear weigh more the higher [zone]'s score.
  static int Function(String, int)? _luck(
    Catalog catalog,
    ZoneData zone,
    double factor,
  ) {
    final scaling = catalog.rules.zoneScaling;
    if (factor == 1 &&
        scaling.gradeWeight(Grade.rare, zone.score) == 1 &&
        scaling.gradeWeight(Grade.legendary, zone.score) == 1) {
      return null;
    }
    return (item, weight) =>
        catalog.lootWeight(item, weight, zone.score, luck: factor);
  }

  static List<RaidPile> _placeSpots(
    Catalog catalog,
    ZoneData zone,
    MapData map,
    Vec2 entry,
    GameRandom random,
    int Function() newId,
    double luck,
    LootLevels levels, {
    int partySize = 1,
  }) {
    final spec = zone.gathering;
    final goal = (spec.count * _partyScale(partySize)).round();
    final table = catalog.lootTables[spec.loot]!;
    final spots = <RaidPile>[];
    void add(Vec2 at) => spots.add(
      RaidPile(
        id: newId(),
        position: at,
        kind: PileKind.spot,
        loot: LootPile.roll(
          table,
          catalog.stackOf,
          random,
          makeSeed: _seedMaker(catalog, levels, random),
          makeGear: _gearMaker(catalog, levels, random),
          weigh: _luck(catalog, zone, luck),
          amount: catalog.rules.zoneScaling.lootAmount(zone.score),
        ),
      ),
    );
    // Spots drawn on the map or its chunks stay; a drawn map has no others.
    for (final tile in map.markers[spotMarker] ?? const <TilePos>[]) {
      add(Vec2(tile.x + 0.5, tile.y + 0.5));
    }
    if (zone.drawnMap != null) return spots;
    for (var tries = 0; spots.length < goal && tries < 3000; tries++) {
      final at = _randomTile(map, random);
      if (at.distanceTo(entry) < 1.5 || map.overlapsCircle(at, 0.3)) continue;
      if (spots.any((s) => s.position.distanceTo(at) < spec.spacing)) continue;
      add(at);
    }
    return spots;
  }

  Map<String, dynamic> toJson() => {
    'format_version': formatVersion,
    'zone': zone.id,
    'score': zone.score,
    'tick': _tick,
    'next_id': _nextId,
    'random_state': _random.state,
    'map': map.toJson(),
    'members': [for (final m in members) m.toJson()],
    'enemies': [for (final e in enemies) e.toJson()],
    'bullets': [for (final b in bullets) b.toJson()],
    'piles': [for (final p in piles) p.toJson()],
    'floor_items': [for (final f in floorItems) f.toJson()],
    'exits': [for (final e in exits) e.toJson()],
    'clones': [for (final c in clones) c.toJson()],
    'clouds': [for (final c in clouds) c.toJson()],
    'clones_in': _clonesIn,
    'next_clone_at': _nextCloneAt,
    'revealed': _revealed,
    'seed_levels': [
      for (final levels in seedLevels)
        {for (final MapEntry(:key, :value) in levels.entries) key.name: value},
    ],
    'stored_gear_levels': [
      for (final levels in storedGearLevels)
        {for (final MapEntry(:key, :value) in levels.entries) key.name: value},
    ],
  };
}

/// A clone's lightning shown on the ground, falling when [left] runs out.
final class _PendingStrike {
  _PendingStrike({
    required this.at,
    required this.from,
    required this.team,
    required this.damage,
    required this.left,
  });

  final Vec2 at;
  final int from;
  final int team;
  final double damage;
  double left;
}
