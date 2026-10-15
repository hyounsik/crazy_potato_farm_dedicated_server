import 'dart:math' as math;

import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/potatoes/ability_roller.dart';
import 'package:potato_core/src/map/map_chunk.dart';
import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_generator.dart';
import 'package:potato_core/src/map/map_physics.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';
import 'package:potato_core/src/raid/raid_command.dart';

/// A farm potato taken along on a run.
final class CompanionStart {
  const CompanionStart({
    required this.potatoId,
    required this.type,
    required this.grade,
  });

  final int potatoId;
  final PotatoType type;
  final Grade grade;
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

  /// Each companion's farm potato id and whether it was knocked down.
  final List<({int potatoId, bool down})> companions;
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
    required this._nextId,
    required this._tick,
    this.signal,
    this._revealed = false,
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

    final player = RaidPlayer(
      id: nextId++,
      position: entry,
      radius: rules.player.radius,
      maxHp: rules.player.maxHp,
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
          maxHp: rules.companion.maxHp,
          potatoId: start.potatoId,
          type: start.type,
          grade: start.grade,
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
    );
    final exits = _openExits(zoneData, map, random, () => nextId++);

    return RaidSimulation._(
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
      nextId: nextId,
      tick: 0,
    );
  }

  /// What one of the player's bullets does: the weapon's damage, raised
  /// by its workbench level.
  double get playerShotDamage =>
      catalog.weapons[player.weapon]!.damage *
      (1 + player.weaponLevel * catalog.rules.workbench.damagePercent / 100);

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
  static const int formatVersion = 3;

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

  /// The countdown after a signal, if one is running.
  RaidSignal? signal;
  bool _revealed;
  int _nextId;
  int _tick;
  RaidOutcome? _outcome;
  Vec2 _move = Vec2.zero;
  final List<RaidEvent> _events = [];

  RaidRulesData get rules => catalog.rules.raid;

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

  /// How far aggressive enemies see now: wider during a signal's countdown,
  /// the more the closer it is to zero.
  double get aggressiveSight {
    final danger = zone.danger;
    final signal = this.signal;
    if (danger == null || signal == null) return enemySight;
    final passed = 1 - signal.left / danger.countdownSeconds;
    return enemySight * (1 + (danger.waitSightMultiplier - 1) * passed);
  }

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
        for (final c in companions) (potatoId: c.potatoId, down: c.isDown),
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
    _updatePlayer(dt);
    if (_outcome != null) return;
    for (final companion in companions) {
      if (!companion.isDown) _updateCompanion(companion, dt);
    }
    for (final enemy in enemies) {
      if (!enemy.isDown) _updateEnemy(enemy, dt);
    }
    _updateBullets(dt);
    _pickUpFloorItems();
    _clearDefeated();
    if (player.isDown) {
      _end(RaidOutcome.fainted);
      return;
    }
    if (isDanger) _updateExits(dt);
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
          spec.speed * (isHungry ? rules.food.hungrySpeedMultiplier : 1);
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
      player.hp = math.min(player.maxHp, player.hp + spec.regenPerSecond * dt);
      rate += food.regenExtraPerSecond;
    }
    player.foodOwed += rate * dt;
    final whole = player.foodOwed.floor();
    if (whole > 0) {
      player.foodOwed -= whole;
      bag.remove(food.item, whole);
    }
  }

  /// Fires at the nearest enemy in range that no obstacle hides. Charging
  /// weapons must stay on one target for a while first.
  void _autoFire(double dt) {
    final gun = weapon;
    player.fireCooldown -= dt;
    final target = autoAimTarget();
    if (gun.aimSeconds > 0) {
      if (target?.id != player.aimTarget) player.aimProgress = 0;
      player.aimTarget = target?.id;
      if (target == null) return;
      player.aimProgress = math.min(gun.aimSeconds, player.aimProgress + dt);
      final charged = player.aimProgress >= gun.aimSeconds;
      if (player.fireCooldown > 0 || !charged) return;
      player.aimProgress = 0;
    } else {
      player.aimTarget = null;
      if (player.fireCooldown > 0 || target == null) return;
    }
    final aim = (target.position - player.position).normalized();
    final spread = gun.spreadDegrees * math.pi / 180;
    for (var i = 0; i < gun.pellets; i++) {
      final angle = gun.pellets == 1
          ? (_random.nextDouble() - 0.5) * spread
          : -spread / 2 + spread * i / (gun.pellets - 1);
      final direction = aim.rotated(angle);
      bullets.add(
        RaidBullet(
          id: _newId(),
          position: player.position + direction * player.radius,
          velocity: direction * gun.bulletSpeed,
          damage: playerShotDamage,
          owner: player.id,
          side: RaidSide.player,
          remaining: gun.range * 1.15,
        ),
      );
    }
    player.fireCooldown = gun.interval;
  }

  /// The enemy auto-aim would shoot now, for drawing an aim line too.
  RaidEnemy? autoAimTarget() {
    RaidEnemy? best;
    var bestDistance = weapon.range;
    for (final enemy in enemies) {
      if (enemy.isDown) continue;
      final d = enemy.position.distanceTo(player.position);
      if (d > bestDistance) continue;
      if (!map.hasLineOfSight(player.position, enemy.position)) continue;
      best = enemy;
      bestDistance = d;
    }
    return best;
  }

  // Companions ---------------------------------------------------------------

  static Vec2 _followOffset(int slot) =>
      const [Vec2(-0.7, 0.15), Vec2(0.15, -0.7), Vec2(-0.55, -0.55)][slot % 3];

  void _updateCompanion(RaidCompanion companion, double dt) {
    final spec = rules.companion;
    companion.sinceHit += dt;
    if (companion.type == PotatoType.food) {
      companion.produced += spec.producePerSecond * dt;
      final whole = companion.produced.floor();
      if (whole > 0) {
        companion.produced -= whole;
        bag.addFrom(ItemStack(rules.food.item, whole));
      }
    }
    // Heals like the player, eating from the bag; not while hungry.
    if (!isHungry &&
        companion.sinceHit >= spec.regenDelaySeconds &&
        companion.hp < companion.maxHp) {
      companion.hp = math.min(
        companion.maxHp,
        companion.hp + companion.maxHp * spec.regenPercentPerSecond * dt,
      );
      companion.foodOwed += spec.regenFoodPerSecond * dt;
      final whole = companion.foodOwed.floor();
      if (whole > 0) {
        companion.foodOwed -= whole;
        bag.remove(rules.food.item, whole);
      }
    }
    final goal = player.position + _followOffset(companion.slot);
    final away = goal - companion.position;
    final distance = away.length;
    if (distance < 0.1) return;
    final far =
        companion.position.distanceTo(player.position) > spec.catchUpDistance;
    final speed = rules.player.speed * spec.speedMultiplier * (far ? 1.5 : 1);
    companion.position = map.move(
      companion.position,
      away.scaledTo(math.min(speed * dt, distance)),
      companion.radius,
    );
  }

  // Enemies ------------------------------------------------------------------

  /// The bodies wild enemies may go for: the player and standing companions.
  Iterable<RaidBody> get _wildTargets sync* {
    if (!player.isDown) yield player;
    for (final c in companions) {
      if (!c.isDown) yield c;
    }
  }

  RaidBody? _body(int id) {
    if (player.id == id) return player;
    for (final c in companions) {
      if (c.id == id) return c;
    }
    for (final e in enemies) {
      if (e.id == id) return e;
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
    var bestDistance = sight;
    for (final body in _wildTargets) {
      final d = body.position.distanceTo(enemy.position);
      if (d > bestDistance) continue;
      best = body;
      bestDistance = d;
    }
    return best;
  }

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
    switch (target) {
      case RaidPlayer():
        target.sinceHit = 0;
      case RaidCompanion():
        target.sinceHit = 0;
        if (target.isDown) _events.add(CompanionDown(target.id));
      case RaidEnemy():
        target.sinceHit = 0;
        if (from != null && from.side != target.side) target.target = from.id;
    }
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
      final targets = bullet.side == RaidSide.player
          ? enemies.where((e) => !e.isDown)
          : _wildTargets;
      for (final target in targets) {
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
            ),
          ),
        );
      } else if (roll < drops.bundleChance + drops.itemChance) {
        final loot = LootPile.roll(
          catalog.lootTables[drops.item]!,
          catalog.stackOf,
          _random,
          makeSeed: _seedMaker(catalog, zone, _random),
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

  static List<RaidPile> _placeSpots(
    Catalog catalog,
    ZoneData zone,
    MapData map,
    Vec2 entry,
    GameRandom random,
    int Function() newId,
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
    'signal': signal?.toJson(),
    'revealed': _revealed,
    'outcome': _outcome?.name,
  };
}
