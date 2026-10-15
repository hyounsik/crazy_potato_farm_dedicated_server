import 'dart:math' as math;

import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
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
  });

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

  CompanionTraits get traits => (
    type: type,
    level: level,
    abilities: abilities,
    hpRatio: 1,
    lifeLeft: lifeLeft,
  );
}

/// What a finished run brings home.
final class RaidResult {
  const RaidResult({
    required this.outcome,
    required this.items,
    required this.companions,
    required this.score,
    required this.lost,
  });

  final RaidOutcome outcome;

  /// The zone's score; a successful run raises the farm's progress to it.
  final int score;

  /// A failed danger run: the bag and every companion are gone, and
  /// [items] and [companions] say what was lost.
  final bool lost;

  /// Everything in the bag, food included.
  final List<ItemStack> items;

  /// Each companion's farm potato id, whether it was knocked down, and
  /// whether it is gone: fallen in a danger zone, it left its seed instead.
  final List<({int potatoId, bool down, bool gone})> companions;
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
    required this.player,
    required this.bag,
    required this.enemies,
    required this.companions,
    required this.bullets,
    required this.piles,
    required this.floorItems,
    required this.exits,
    required this.clones,
    required this._nextId,
    required this._tick,
    this.signal,
    this._revealed = false,
    this._clonesIn = 0,
    this._nextCloneAt = 0,
    this._outcome,
  });

  /// Builds zone [zone]'s map from [seed] and fills it: enemies, gathering
  /// spots, the player at the entry with [food] in the bag, and
  /// [companions] beside them.
  factory RaidSimulation.start({
    required Catalog catalog,
    required String zone,
    required int seed,
    Map<String, MapChunk> chunks = const {},
    int food = 0,
    int weaponLevel = 0,
    List<CompanionStart> companions = const [],
  }) {
    final zoneData = catalog.zones[zone];
    if (zoneData == null) throw ArgumentError.value(zone, 'zone', 'unknown');
    final rules = catalog.rules.raid;
    final map = generateMap(zoneData.map, seed: seed, chunks: chunks);
    final random = GameRandom((seed ^ 0x2545f491) & 0xffffffff);
    final entry = Vec2(map.entry.x + 0.5, map.entry.y + 0.5);
    var nextId = 1;

    final effects = RaidEffects(catalog);
    final party = effects.party([for (final c in companions) c.traits]);
    final player = RaidPlayer(
      id: nextId++,
      position: entry,
      radius: rules.player.radius,
      maxHp: party.apply(RaidStat.hp, rules.player.maxHp),
      weapon: rules.startWeapon,
      weaponLevel: weaponLevel,
    );
    final bag = Bag(rules.bagSlots, catalog.stackOf);
    if (food > 0) bag.addFrom(ItemStack(rules.food.item, food));

    final team = [
      for (final (slot, start) in companions.indexed)
        RaidCompanion(
          id: nextId++,
          position: map.move(
            entry,
            _followOffset(slot),
            rules.companion.radius,
          ),
          radius: rules.companion.radius,
          maxHp: _startHp(catalog, start, effects.own(start.traits), party),
          potatoId: start.potatoId,
          type: start.type,
          grade: start.grade,
          level: start.level,
          abilities: start.abilities,
          style: start.type == PotatoType.combat ? start.style : null,
          mode: start.mode,
          lifeLeft: start.lifeLeft,
          slot: slot,
        ),
    ];

    final enemies = _placeEnemies(
      catalog,
      zoneData,
      map,
      entry,
      random,
      () => nextId++,
    );
    final piles = _placeSpots(
      catalog,
      zoneData,
      map,
      entry,
      random,
      () => nextId++,
      party.apply(RaidStat.lootRareChance, 1),
    );
    final exits = _openExits(zoneData, map, random, () => nextId++);

    final run = RaidSimulation._(
      catalog: catalog,
      zone: zoneData,
      map: map,
      random: random,
      player: player,
      bag: bag,
      enemies: enemies,
      companions: team,
      bullets: [],
      piles: piles,
      floorItems: [],
      exits: exits,
      clones: [],
      nextId: nextId,
      tick: 0,
    );
    run._nextCloneAt = zoneData.danger?.cloneEverySeconds ?? 0;
    return run;
  }

  /// What one of the player's bullets does: the weapon's damage, raised
  /// by its workbench level and buff potatoes.
  double get playerShotDamage => _party.apply(
    RaidStat.attack,
    catalog.weapons[player.weapon]!.damage *
        (1 + player.weaponLevel * catalog.rules.workbench.damagePercent / 100),
  );

  /// A companion's max health at the start: its style's (or the plain
  /// companion's), raised by level for combat potatoes, then abilities.
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
    var hp = style?.maxHp ?? rules.maxHp;
    if (style != null) hp *= 1 + start.level * rules.levelHpPermille / 1000;
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
    final zone = catalog.zones[json['zone'] as String];
    if (zone == null) throw FormatException('Unknown zone ${json['zone']}');
    List<T> list<T>(String key, T Function(Map<String, dynamic>) read) => [
      for (final e in json[key] as List<Object?>)
        read(e! as Map<String, dynamic>),
    ];
    final outcome = json['outcome'] as String?;
    return RaidSimulation._(
      catalog: catalog,
      zone: zone,
      map: MapData.fromJson(json['map'] as Map<String, dynamic>),
      random: GameRandom.fromState(
        (json['random_state'] as List<Object?>).cast<int>(),
      ),
      player: RaidPlayer.fromJson(json['player'] as Map<String, dynamic>),
      bag: Bag.restore([
        for (final s in json['bag'] as List<Object?>)
          s == null ? null : ItemStack.fromJson(s as Map<String, dynamic>),
      ], catalog.stackOf),
      enemies: list('enemies', RaidEnemy.fromJson),
      companions: list('companions', RaidCompanion.fromJson),
      bullets: list('bullets', RaidBullet.fromJson),
      piles: list('piles', RaidPile.fromJson),
      floorItems: list('floor_items', RaidFloorItem.fromJson),
      exits: list('exits', RaidExit.fromJson),
      clones: list('clones', (j) => RaidClone.fromJson(j, catalog.stackOf)),
      clonesIn: json['clones_in'] as int,
      nextCloneAt: (json['next_clone_at'] as num).toDouble(),
      signal: switch (json['signal']) {
        final Map<String, dynamic> signal => RaidSignal.fromJson(signal),
        _ => null,
      },
      revealed: json['revealed'] as bool,
      nextId: json['next_id'] as int,
      tick: json['tick'] as int,
      outcome: outcome == null ? null : RaidOutcome.values.byName(outcome),
    );
  }

  /// Bumped whenever the saved run's shape changes. Runs are short, so an old
  /// format is not migrated: the client ends that run instead.
  static const int formatVersion = 5;

  final Catalog catalog;
  final ZoneData zone;
  final MapData map;
  final GameRandom _random;
  final RaidPlayer player;
  final Bag bag;
  final List<RaidEnemy> enemies;
  final List<RaidCompanion> companions;
  final List<RaidBullet> bullets;
  final List<RaidPile> piles;
  final List<RaidFloorItem> floorItems;

  /// Exits open in this run; empty in a safe zone.
  final List<RaidExit> exits;

  /// Clones in the run now (danger zones). Each carries its companions.
  final List<RaidClone> clones;

  /// The countdown after a signal, if one is running.
  RaidSignal? signal;
  bool _revealed;

  /// How many clones have walked in, and the run time (seconds) the next
  /// one comes.
  int _clonesIn;
  double _nextCloneAt;
  int _nextId;
  int _tick;
  RaidOutcome? _outcome;
  Vec2 _move = Vec2.zero;
  final List<RaidEvent> _events = [];

  RaidRulesData get rules => catalog.rules.raid;

  late final RaidEffects _effects = RaidEffects(catalog);

  /// Buff potatoes' effects on the player's party, worked out each step
  /// from those still standing; [_parties] holds each team's.
  StatSums get _party => _parties[playerTeam] ?? const {};
  Map<int, StatSums> _parties = {};

  static CompanionTraits _traitsOf(RaidCompanion c) => (
    type: c.type,
    level: c.level,
    abilities: c.abilities,
    hpRatio: c.hp / c.maxHp,
    lifeLeft: c.lifeLeft,
  );

  /// [companion]'s own effects plus its party's.
  StatSums statsOf(RaidCompanion companion) => <String, StatSum>{}
    ..addAll(_effects.own(_traitsOf(companion)))
    ..addAll(_parties[companion.team] ?? const {});

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
        (1 + companion.level * rules.companion.levelAttackPermille / 1000);
    return statsOf(companion).apply(RaidStat.attack, base);
  }

  void _updateParty() => _parties = {
    playerTeam: _effects.party([
      for (final c in companions)
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

  /// Game time since the run began.
  Duration get elapsed => Duration(milliseconds: rules.stepMillis * _tick);

  /// Set once the run is over; [step] does nothing after that.
  RaidOutcome? get outcome => _outcome;

  WeaponData get weapon => catalog.weapons[player.weapon]!;

  /// How far wild enemies see in this zone.
  double get enemySight => rules.player.sight * zone.enemies.sightMultiplier;
  double get enemySpeed => rules.player.speed * zone.enemies.speedMultiplier;

  /// How far into the player's signal countdown the run is, 0 to 1; 0
  /// without one.
  double get _waitPassed {
    final danger = zone.danger;
    final signal = this.signal;
    if (danger == null || signal == null) return 0;
    return 1 - signal.left / danger.countdownSeconds;
  }

  /// How far aggressive enemies see now: wider during a signal's countdown,
  /// the more the closer it is to zero.
  double get aggressiveSight {
    final grow = (zone.danger?.waitSightMultiplier ?? 1) - 1;
    return enemySight * (1 + grow * _waitPassed);
  }

  /// How far clones see now; it grows like [aggressiveSight].
  double get cloneSight {
    final clone = rules.clones;
    final base = rules.player.sight * clone.sightMultiplier;
    return base * (1 + (clone.waitSightMultiplier - 1) * _waitPassed);
  }

  double get _cloneSpeed => rules.player.speed * rules.clones.speedMultiplier;

  bool get isDanger => zone.danger != null;

  /// Whether every open exit has been revealed by time.
  bool get exitsRevealed => _revealed;

  /// The open exit the player stands in, if any.
  RaidExit? exitHere() {
    final radius = zone.danger?.exitRadius ?? 0;
    for (final exit in exits) {
      if (exit.position.distanceTo(player.position) <= radius) return exit;
    }
    return null;
  }

  bool get isHungry => bag.countOf(rules.food.item) == 0;

  /// What the run brings home, once it is over.
  RaidResult? get result {
    final outcome = _outcome;
    if (outcome == null) return null;
    return RaidResult(
      outcome: outcome,
      items: [for (final s in bag.slots) ?s],
      companions: [
        for (final c in companions)
          (potatoId: c.potatoId, down: c.isDown, gone: isDanger && c.isDown),
      ],
      score: zone.score,
      lost: isDanger && outcome != RaidOutcome.extracted,
    );
  }

  /// The stick: a direction on the world plane, at most 1 long. A shorter
  /// push walks slower.
  void setMove(Vec2 direction) =>
      _move = direction.length > 1 ? direction.normalized() : direction;

  /// The pile the player stands next to, if any; the nearest one wins.
  RaidPile? pileNear() {
    RaidPile? best;
    var bestDistance = rules.pickupRadius;
    for (final pile in piles) {
      if (pile.loot.isEmpty) continue;
      final d = pile.position.distanceTo(player.position);
      if (d <= bestDistance) {
        best = pile;
        bestDistance = d;
      }
    }
    return best;
  }

  RaidRejection? apply(RaidCommand command) {
    if (_outcome != null) return RaidRejection.over;
    switch (command) {
      case Dash():
        if (player.isDashing || player.dashCooldown > 0) {
          return RaidRejection.dashNotReady;
        }
        player
          ..dashDirection = _move.isZero ? player.facing : _move.normalized()
          ..dashLeft = rules.player.dashSeconds
          ..dashCooldown = rules.player.dashCooldownSeconds;
        return null;
      case GoHome():
        if (isDanger) return RaidRejection.wrongZone;
        _end(RaidOutcome.wentHome);
        return null;
      case SetCompanionMode(:final companion, :final mode):
        for (final c in companions) {
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
        if (signal != null) return RaidRejection.signalling;
        final exit = exitHere();
        if (exit == null) return RaidRejection.notAtExit;
        exit.found = true;
        signal = RaidSignal(exit: exit.id, left: zone.danger!.countdownSeconds);
        _events.add(SignalSent(exit.id));
        return null;
      case TakeLoot(:final pile, :final index):
        final found = _reachablePile(pile);
        if (found case final RaidRejection rejection) return rejection;
        final target = found as RaidPile;
        if (index < 0 || index >= target.loot.items.length) {
          return RaidRejection.noSuchItem;
        }
        final took = target.loot.takeInto(bag, index);
        _dropEmptyBundle(target);
        return took ? null : RaidRejection.bagFull;
      case TakeAllLoot(:final pile):
        final found = _reachablePile(pile);
        if (found case final RaidRejection rejection) return rejection;
        final target = found as RaidPile;
        target.loot.takeAllInto(bag);
        _dropEmptyBundle(target);
        return null;
      case SwapLoot(:final pile, :final index, :final slot):
        final found = _reachablePile(pile);
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

  /// The pile, or why it cannot be used.
  Object _reachablePile(int id) {
    for (final pile in piles) {
      if (pile.id != id) continue;
      final reach = rules.pickupRadius;
      return pile.position.distanceTo(player.position) <= reach
          ? pile
          : RaidRejection.tooFar;
    }
    return RaidRejection.noSuchPile;
  }

  void _dropEmptyBundle(RaidPile pile) {
    if (pile.kind == PileKind.bundle && pile.loot.isEmpty) piles.remove(pile);
  }

  /// Advances the run by one fixed step (`rules.raid.step_millis`).
  void step() {
    if (_outcome != null) return;
    _tick++;
    final dt = stepSeconds;
    _updateParty();
    _updatePlayer(dt);
    if (_outcome != null) return;
    for (final companion in companions) {
      if (!companion.isDown) _updateCompanion(companion, player, dt);
    }
    for (final clone in List.of(clones)) {
      _updateClone(clone, dt);
    }
    _runPeriodic();
    for (final enemy in enemies) {
      if (!enemy.isDown) _updateEnemy(enemy, dt);
    }
    _updateBullets(dt);
    _pickUpFloorItems();
    _clearDefeated();
    _clearClones();
    _markSeen();
    if (player.isDown) {
      _end(RaidOutcome.fainted);
      return;
    }
    if (isDanger) {
      _updateExits(dt);
      _bringClones();
    }
  }

  /// Piles the player has in sight now stay on the minimap.
  void _markSeen() {
    for (final pile in piles) {
      if (!pile.seen &&
          pile.position.distanceTo(player.position) <= rules.player.sight) {
        pile.seen = true;
      }
    }
  }

  // Exits --------------------------------------------------------------------

  /// Finds exits the player sees, reveals all once time is up, and runs the
  /// signal's countdown: at zero the player leaves when standing in that
  /// exit, otherwise the signal goes out.
  void _updateExits(double dt) {
    final danger = zone.danger!;
    for (final exit in exits) {
      if (exit.found) continue;
      if (exit.position.distanceTo(player.position) <= rules.player.sight) {
        exit.found = true;
        _events.add(ExitFound(exit.id));
      }
    }
    if (!_revealed && elapsed.inMilliseconds >= danger.revealSeconds * 1000) {
      _revealed = true;
      for (final exit in exits) {
        exit.found = true;
      }
      _events.add(const ExitsRevealed());
    }
    final signal = this.signal;
    if (signal == null) return;
    signal.left -= dt;
    if (signal.left > 0) return;
    this.signal = null;
    if (exitHere()?.id == signal.exit) {
      _end(RaidOutcome.extracted);
    } else {
      _events.add(SignalLost(signal.exit));
    }
  }

  /// Returns the events since the last call and forgets them.
  List<RaidEvent> takeEvents() {
    final events = List<RaidEvent>.of(_events);
    _events.clear();
    return events;
  }

  void _end(RaidOutcome outcome) {
    _outcome = outcome;
    _events.add(RaidEnded(outcome));
  }

  int _newId() => _nextId++;

  // Player -------------------------------------------------------------------

  void _updatePlayer(double dt) {
    final spec = rules.player;
    player
      ..dashCooldown = math.max(0, player.dashCooldown - dt)
      ..sinceHit += dt;
    if (player.isDashing) {
      player.dashLeft -= dt;
      final speed = spec.dashDistance / spec.dashSeconds;
      player.position = map.move(
        player.position,
        player.dashDirection * (speed * dt),
        player.radius,
      );
    } else if (!_move.isZero) {
      player.facing = _move.normalized();
      final speed =
          _party.apply(RaidStat.moveSpeed, spec.speed) *
          (isHungry ? rules.food.hungrySpeedMultiplier : 1);
      player.position = map.move(
        player.position,
        _move * (speed * dt),
        player.radius,
      );
    }
    _eat(dt);
    if (_outcome != null) return;
    _autoFire(dt);
  }

  /// Food is eaten all the time, more while healing. With none left the
  /// player is hungry: slower, not healing, and sent home after a while.
  void _eat(double dt) {
    final food = rules.food;
    if (isHungry) {
      player
        ..foodOwed = 0
        ..hungrySeconds += dt;
      if (zone.danger case final danger?) {
        // No walking home from a danger zone: hunger wears health down.
        player.hp = math.max(0, player.hp - danger.hungryDamagePerSecond * dt);
      } else if (player.hungrySeconds >= food.hungryReturnSeconds) {
        _end(RaidOutcome.starved);
      }
      return;
    }
    player.hungrySeconds = 0;
    final spec = rules.player;
    var rate = food.perSecond;
    if (player.sinceHit >= spec.regenDelaySeconds && player.hp < player.maxHp) {
      final regen = _party.apply(RaidStat.regenSpeed, spec.regenPerSecond);
      player.hp = math.min(player.maxHp, player.hp + regen * dt);
      rate += food.regenExtraPerSecond;
    }
    rate = _party.apply(RaidStat.foodConsumption, rate);
    player.foodOwed += rate * dt;
    final whole = player.foodOwed.floor();
    if (whole > 0) {
      player.foodOwed -= whole;
      bag.remove(food.item, whole);
    }
  }

  /// The player fires at what auto-aim picks.
  void _autoFire(double dt) =>
      _fire(player, autoAimTarget(), playerShotDamage, dt);

  /// [shooter] fires at [target] (null holds fire). Charging weapons must
  /// stay on one target for a while first.
  void _fire(RaidShooter shooter, RaidBody? target, double damage, double dt) {
    final gun = catalog.weapons[shooter.weapon]!;
    shooter.fireCooldown -= dt;
    if (gun.aimSeconds > 0) {
      if (target?.id != shooter.aimTarget) shooter.aimProgress = 0;
      shooter.aimTarget = target?.id;
      if (target == null) return;
      shooter.aimProgress = math.min(gun.aimSeconds, shooter.aimProgress + dt);
      final charged = shooter.aimProgress >= gun.aimSeconds;
      if (shooter.fireCooldown > 0 || !charged) return;
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
  RaidBody? autoAimTarget() => _nearestInRange(player, weapon.range);

  /// The standing opponent of [from] nearest to it within [range] that no
  /// obstacle hides.
  RaidBody? _nearestInRange(RaidBody from, double range) {
    RaidBody? best;
    var bestDistance = range;
    for (final body in _opponentsOf(from.team)) {
      final d = body.position.distanceTo(from.position);
      if (d > bestDistance) continue;
      if (!map.hasLineOfSight(from.position, body.position)) continue;
      best = body;
      bestDistance = d;
    }
    return best;
  }

  /// Every body in the run, standing or not.
  Iterable<RaidBody> get _bodies sync* {
    yield player;
    yield* companions;
    yield* enemies;
    for (final clone in clones) {
      yield clone;
      yield* clone.companions;
    }
  }

  /// Standing bodies of every team but [team].
  Iterable<RaidBody> _opponentsOf(int team) =>
      _bodies.where((b) => !b.isDown && b.team != team);

  // Companions ---------------------------------------------------------------

  static Vec2 _followOffset(int slot) =>
      const [Vec2(-0.7, 0.15), Vec2(0.15, -0.7), Vec2(-0.55, -0.55)][slot % 3];

  /// [owner] is who it follows: the player, or its clone. Only the player's
  /// potatoes make food and heal (from the player's bag).
  void _updateCompanion(RaidCompanion companion, RaidShooter owner, double dt) {
    final spec = rules.companion;
    final stats = statsOf(companion);
    final mine = companion.team == playerTeam;
    companion
      ..sinceHit += dt
      ..attackCooldown -= dt;
    if (mine && companion.type == PotatoType.food) {
      final level = catalog.rules.potatoes.level.foodYieldPermille;
      final rate = stats.apply(
        FarmStat.foodYield,
        spec.producePerSecond * (1 + companion.level * level / 1000),
      );
      companion.produced += rate * dt;
      final whole = companion.produced.floor();
      if (whole > 0) {
        companion.produced -= whole;
        bag.addFrom(ItemStack(rules.food.item, whole));
      }
    }
    // Heals like the player, eating from the bag; not while hungry.
    if (mine &&
        !isHungry &&
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
        bag.remove(rules.food.item, whole);
      }
    }
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
    final goal = owner.position + _followOffset(companion.slot);
    final away = goal - companion.position;
    final distance = away.length;
    if (distance < 0.1) return;
    final far =
        companion.position.distanceTo(owner.position) > spec.catchUpDistance;
    final speed = companionSpeed(companion) * (far ? 1.5 : 1);
    companion.position = map.move(
      companion.position,
      away.scaledTo(math.min(speed * dt, distance)),
      companion.radius,
    );
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
      if (companion.mode == CompanionMode.defense &&
          !_goesFor(other, companion.team)) {
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
        final seen = map.hasLineOfSight(companion.position, target.position);
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
      ...companions,
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
    final spec = catalog.enemies[enemy.kind]!;
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
          (target.position.distanceTo(enemy.position) >
                  (spec.temper == EnemyTemper.aggressive
                      ? aggressiveSight
                      : enemySight) &&
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

  RaidBody? _nearestInSight(RaidEnemy enemy, double sight) {
    RaidBody? best;
    var bestDistance = double.infinity;
    for (final body in _wildTargets) {
      final d = body.position.distanceTo(enemy.position);
      if (d > _noticeRange(body, sight) || d > bestDistance) continue;
      best = body;
      bestDistance = d;
    }
    return best;
  }

  /// How far enemies seeing [sight] notice [body]: some abilities make a
  /// potato easier to notice.
  double _noticeRange(RaidBody body, double sight) => switch (body) {
    final RaidCompanion c =>
      _effects.own(_traitsOf(c)).apply(RaidStat.detectRange, sight),
    _ => sight,
  };

  void _engage(RaidEnemy enemy, EnemyData spec, RaidBody target, double dt) {
    final d = target.position.distanceTo(enemy.position);
    switch (spec.attack) {
      case EnemyAttack.melee:
        if (d <= enemy.radius + target.radius + spec.reach) {
          if (enemy.attackCooldown <= 0) {
            _hurt(target, spec.damage * zone.enemies.damageMultiplier, enemy);
            enemy.attackCooldown = spec.attackInterval;
          }
        } else {
          _moveToward(enemy, target.position, enemySpeed, dt);
        }
      case EnemyAttack.ranged:
        if (d <= spec.range &&
            map.hasLineOfSight(enemy.position, target.position)) {
          if (enemy.attackCooldown <= 0) {
            final direction = (target.position - enemy.position).normalized();
            bullets.add(
              RaidBullet(
                id: _newId(),
                position: enemy.position + direction * enemy.radius,
                velocity: direction * spec.bulletSpeed,
                damage: spec.damage * zone.enemies.damageMultiplier,
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
        if (target.isDown && target.team == playerTeam) {
          _events.add(CompanionDown(target.id));
          if (isDanger) _leaveSeed(target);
        }
      case RaidEnemy():
        target.sinceHit = 0;
        if (foe != null) target.target = foe.id;
    }
  }

  /// A companion fallen in a danger zone leaves its seed in a bundle where
  /// it fell, as the graveyard would: sometimes a grade lower, or higher
  /// with an ability for it.
  void _leaveSeed(RaidCompanion companion) {
    if (companion.abilities.isEmpty) return;
    var grade = companion.grade;
    final upChance = _effects
        .own(_traitsOf(companion))
        .apply(FarmStat.deathSeedGradeUpChance, 0);
    if (_random.chance(catalog.rules.potatoes.gradeDropChance)) {
      grade = grade.lower ?? grade;
    } else if (upChance > 0 && _random.chance(upChance)) {
      grade = grade.higher ?? grade;
    }
    final seed = companion.seed.copyWith(grade: grade);
    final item = catalog.seedItemOf(seed.type, seed.grade);
    if (item == null) return;
    piles.add(
      RaidPile(
        id: _newId(),
        position: companion.position,
        kind: PileKind.bundle,
        loot: LootPile([ItemStack(item, 1, seed: seed)]),
      ),
    );
  }

  void _updateBullets(double dt) {
    bullets.removeWhere((bullet) {
      final move = bullet.velocity * dt;
      bullet
        ..position = bullet.position + move
        ..remaining -= move.length;
      if (bullet.remaining <= 0 ||
          map.isBlocked(bullet.position.x.floor(), bullet.position.y.floor())) {
        return true;
      }
      for (final target in _opponentsOf(bullet.team)) {
        if (target.position.distanceTo(bullet.position) <=
            target.radius + 0.05) {
          _hurt(target, bullet.damage, _body(bullet.owner));
          return true;
        }
      }
      return false;
    });
  }

  void _pickUpFloorItems() {
    floorItems.removeWhere((item) {
      if (item.position.distanceTo(player.position) > rules.pickupRadius) {
        return false;
      }
      final moved = bag.addFrom(item.stack);
      if (moved > 0) {
        _events.add(
          ItemPicked(ItemStack(item.stack.item, moved, seed: item.stack.seed)),
        );
      }
      return item.stack.count == 0;
    });
  }

  /// Takes defeated enemies off the map; each may leave loot.
  void _clearDefeated() {
    final drops = zone.drops;
    enemies.removeWhere((enemy) {
      if (!enemy.isDown) return false;
      _events.add(EnemyDefeated(enemy.id, enemy.kind));
      final roll = _random.nextDouble();
      if (roll < drops.bundleChance) {
        piles.add(
          RaidPile(
            id: _newId(),
            position: enemy.position,
            kind: PileKind.bundle,
            loot: LootPile.roll(
              catalog.lootTables[drops.bundle]!,
              catalog.stackOf,
              _random,
              makeSeed: _seedMaker(catalog, zone, _random),
              weigh: _luck(catalog, _party.apply(RaidStat.lootRareChance, 1)),
            ),
          ),
        );
      } else if (roll < drops.bundleChance + drops.itemChance) {
        final loot = LootPile.roll(
          catalog.lootTables[drops.item]!,
          catalog.stackOf,
          _random,
          makeSeed: _seedMaker(catalog, zone, _random),
          weigh: _luck(catalog, _party.apply(RaidStat.lootRareChance, 1)),
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
  /// the zone's number have come in.
  void _bringClones() {
    final danger = zone.danger!;
    while (_clonesIn < danger.clonesAtStart) {
      final before = _clonesIn;
      _spawnClone();
      if (_clonesIn == before) break;
    }
    if (_clonesIn >= danger.clonesMax || danger.cloneEverySeconds <= 0) return;
    if (_tick * stepSeconds < _nextCloneAt) return;
    _nextCloneAt += danger.cloneEverySeconds;
    _spawnClone();
  }

  /// A default clone fitting the zone's score walks in at an entry site out
  /// of the player's sight (any site if none is), with its potatoes.
  void _spawnClone() {
    final danger = zone.danger;
    if (danger == null || _clonesIn >= danger.clonesMax) return;
    final data = _pickDefaultClone();
    if (data == null) return;
    _clonesIn++;

    final sites = map.markers[cloneEntryMarker] ?? [map.entry];
    final hidden = [
      for (final site in sites)
        if (Vec2(site.x + 0.5, site.y + 0.5).distanceTo(player.position) >
            rules.player.sight)
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
      name: data.name,
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
          position: map.move(at, _followOffset(slot), rules.companion.radius),
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
      final seen = map.hasLineOfSight(clone.position, target.position);
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
          (current.position.distanceTo(clone.position) > sight &&
              clone.sinceHit > rules.enemyAlertSeconds);
      if (!lost) return current;
      clone.target = null;
    }
    RaidBody? best;
    var bestDistance = sight;
    for (final other in _opponentsOf(clone.team)) {
      final d = other.position.distanceTo(clone.position);
      if (d > bestDistance) continue;
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
    var step = speed * dt;
    while (step > 0 && clone.path.isNotEmpty) {
      final delta = clone.path.first - clone.position;
      final distance = delta.length;
      if (distance <= step) {
        clone.position = map.move(clone.position, delta, clone.radius);
        step -= distance;
        clone.path.removeAt(0);
      } else {
        clone.position = map.move(
          clone.position,
          delta.scaledTo(step),
          clone.radius,
        );
        step = 0;
      }
    }
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
        piles.add(
          RaidPile(
            id: _newId(),
            position: clone.position,
            kind: PileKind.cloneBundle,
            loot: LootPile(items),
          ),
        );
      }
      _events.add(CloneDown(clone.id));
      return true;
    });
  }

  // Setup --------------------------------------------------------------------

  static Vec2 _randomTile(MapData map, GameRandom random) =>
      Vec2(random.nextInt(map.size) + 0.5, random.nextInt(map.size) + 0.5);

  /// Lone enemies picked by weight, plus packs standing close together, all
  /// away from the entry and off obstacles.
  static List<RaidEnemy> _placeEnemies(
    Catalog catalog,
    ZoneData zone,
    MapData map,
    Vec2 entry,
    GameRandom random,
    int Function() newId,
  ) {
    final spec = zone.enemies;
    final placed = <RaidEnemy>[];
    bool free(Vec2 at, double spacing) =>
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
          maxHp: data.maxHp * spec.hpMultiplier,
          kind: kind,
          home: at,
        ),
      );
    }

    var packs = 0;
    for (var tries = 0; packs < spec.packs && tries < 2000; tries++) {
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
    for (var tries = 0; loners < spec.count && tries < 2000; tries++) {
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
  /// Seeds found in [zone] get its score as their level, and an ability
  /// (and style) of their own.
  static SeedMaker _seedMaker(
    Catalog catalog,
    ZoneData zone,
    GameRandom random,
  ) {
    final roller = AbilityRoller(catalog);
    return (item) => switch (catalog.items[item]?.seed) {
      final kind? => roller.seed(
        type: kind.type,
        grade: kind.grade,
        level: zone.score,
        random: random,
      ),
      null => null,
    };
  }

  /// Luck: rare and legendary seeds weigh [factor] times as much.
  static int Function(String, int)? _luck(Catalog catalog, double factor) {
    if (factor == 1) return null;
    return (item, weight) {
      final seed = catalog.items[item]?.seed;
      if (seed == null || seed.grade == Grade.normal) return weight;
      return math.max(1, (weight * factor).round());
    };
  }

  static List<RaidPile> _placeSpots(
    Catalog catalog,
    ZoneData zone,
    MapData map,
    Vec2 entry,
    GameRandom random,
    int Function() newId,
    double luck,
  ) {
    final spec = zone.gathering;
    final table = catalog.lootTables[spec.loot]!;
    final spots = <RaidPile>[];
    for (var tries = 0; spots.length < spec.count && tries < 3000; tries++) {
      final at = _randomTile(map, random);
      if (at.distanceTo(entry) < 1.5 || map.overlapsCircle(at, 0.3)) continue;
      if (spots.any((s) => s.position.distanceTo(at) < spec.spacing)) continue;
      spots.add(
        RaidPile(
          id: newId(),
          position: at,
          kind: PileKind.spot,
          loot: LootPile.roll(
            table,
            catalog.stackOf,
            random,
            makeSeed: _seedMaker(catalog, zone, random),
            weigh: _luck(catalog, luck),
          ),
        ),
      );
    }
    return spots;
  }

  Map<String, dynamic> toJson() => {
    'format_version': formatVersion,
    'zone': zone.id,
    'tick': _tick,
    'next_id': _nextId,
    'random_state': _random.state,
    'map': map.toJson(),
    'player': player.toJson(),
    'bag': bag.toJson(),
    'enemies': [for (final e in enemies) e.toJson()],
    'companions': [for (final c in companions) c.toJson()],
    'bullets': [for (final b in bullets) b.toJson()],
    'piles': [for (final p in piles) p.toJson()],
    'floor_items': [for (final f in floorItems) f.toJson()],
    'exits': [for (final e in exits) e.toJson()],
    'clones': [for (final c in clones) c.toJson()],
    'clones_in': _clonesIn,
    'next_clone_at': _nextCloneAt,
    'signal': signal?.toJson(),
    'revealed': _revealed,
    'outcome': _outcome?.name,
  };
}
