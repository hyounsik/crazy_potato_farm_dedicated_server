import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// Which side a body or shot is on, for drawing. Who hurts whom goes by
/// [RaidBody.team].
enum RaidSide { player, wild, clone }

/// The team of the player and their companions.
const int playerTeam = 0;

/// The team of every wild enemy.
const int wildTeam = -1;

/// Anything in a run that has a position, a round body and health.
///
/// Mutable on purpose: a run changes hundreds of these many times a second.
/// Saving turns them into JSON.
sealed class RaidBody {
  RaidBody({
    required this.id,
    required this.position,
    required this.radius,
    required this.maxHp,
    double? hp,
  }) : hp = hp ?? maxHp;

  /// Unique within the run, never reused.
  final int id;
  Vec2 position;
  final double radius;
  final double maxHp;
  double hp;

  RaidSide get side;

  /// Bodies of one team never hurt each other: [playerTeam], [wildTeam],
  /// or a clone's own id for the clone and its companions.
  int get team;
  bool get isDown => hp <= 0;
}

/// A body with an auto-aiming gun: the player or a clone.
sealed class RaidShooter extends RaidBody {
  RaidShooter({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required this.weapon,
    this.weaponLevel = 0,
    super.hp,
    this.facing = const Vec2(1, 0),
    this.fireCooldown = 0,
    this.aimTarget,
    this.aimProgress = 0,
  });

  /// The weapon's catalog id.
  String weapon;

  /// How far the weapon was strengthened at the workbench.
  int weaponLevel;
  Vec2 facing;
  double fireCooldown;

  /// Charging weapons: the body being aimed at and for how long.
  int? aimTarget;
  double aimProgress;
}

final class RaidPlayer extends RaidShooter {
  RaidPlayer({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required super.weapon,
    super.weaponLevel,
    super.hp,
    super.facing,
    this.dashLeft = 0,
    this.dashCooldown = 0,
    this.dashDirection = Vec2.zero,
    this.sinceHit = double.infinity,
    this.foodOwed = 0,
    this.hungrySeconds = 0,
    super.fireCooldown,
    super.aimTarget,
    super.aimProgress,
  });

  factory RaidPlayer.fromJson(Map<String, dynamic> json) => RaidPlayer(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    radius: (json['radius'] as num).toDouble(),
    maxHp: (json['max_hp'] as num).toDouble(),
    hp: (json['hp'] as num).toDouble(),
    weapon: json['weapon'] as String,
    weaponLevel: json['weapon_level'] as int? ?? 0,
    facing: Vec2.fromJson(json['facing'] as List<Object?>),
    dashLeft: (json['dash_left'] as num).toDouble(),
    dashCooldown: (json['dash_cooldown'] as num).toDouble(),
    dashDirection: Vec2.fromJson(json['dash_direction'] as List<Object?>),
    sinceHit: _seconds(json['since_hit']),
    foodOwed: (json['food_owed'] as num).toDouble(),
    hungrySeconds: (json['hungry_seconds'] as num).toDouble(),
    fireCooldown: (json['fire_cooldown'] as num).toDouble(),
    aimTarget: json['aim_target'] as int?,
    aimProgress: (json['aim_progress'] as num).toDouble(),
  );

  double dashLeft;
  double dashCooldown;
  Vec2 dashDirection;
  double sinceHit;

  /// Food eaten but not yet taken from the bag (only whole ones are).
  double foodOwed;

  /// How long the bag has been out of food.
  double hungrySeconds;

  bool get isDashing => dashLeft > 0;

  @override
  RaidSide get side => RaidSide.player;

  @override
  int get team => playerTeam;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'radius': radius,
    'max_hp': maxHp,
    'hp': hp,
    'weapon': weapon,
    'weapon_level': weaponLevel,
    'facing': facing.toJson(),
    'dash_left': dashLeft,
    'dash_cooldown': dashCooldown,
    'dash_direction': dashDirection.toJson(),
    'since_hit': _secondsJson(sinceHit),
    'food_owed': foodOwed,
    'hungry_seconds': hungrySeconds,
    'fire_cooldown': fireCooldown,
    'aim_target': aimTarget,
    'aim_progress': aimProgress,
  };
}

final class RaidEnemy extends RaidBody {
  RaidEnemy({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required this.kind,
    required this.home,
    super.hp,
    this.target,
    this.attackCooldown = 0,
    this.sinceHit = double.infinity,
    Vec2? wanderGoal,
    this.wanderTimer = 0,
  }) : wanderGoal = wanderGoal ?? home;

  factory RaidEnemy.fromJson(Map<String, dynamic> json) => RaidEnemy(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    radius: (json['radius'] as num).toDouble(),
    maxHp: (json['max_hp'] as num).toDouble(),
    hp: (json['hp'] as num).toDouble(),
    kind: json['kind'] as String,
    home: Vec2.fromJson(json['home'] as List<Object?>),
    target: json['target'] as int?,
    attackCooldown: (json['attack_cooldown'] as num).toDouble(),
    sinceHit: _seconds(json['since_hit']),
    wanderGoal: Vec2.fromJson(json['wander_goal'] as List<Object?>),
    wanderTimer: (json['wander_timer'] as num).toDouble(),
  );

  /// The enemy's catalog id.
  final String kind;

  /// Where it started; it idles around here.
  final Vec2 home;

  /// The body it is going for.
  int? target;
  double attackCooldown;
  double sinceHit;
  Vec2 wanderGoal;
  double wanderTimer;

  @override
  RaidSide get side => RaidSide.wild;

  @override
  int get team => wildTeam;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'radius': radius,
    'max_hp': maxHp,
    'hp': hp,
    'kind': kind,
    'home': home.toJson(),
    'target': target,
    'attack_cooldown': attackCooldown,
    'since_hit': _secondsJson(sinceHit),
    'wander_goal': wanderGoal.toJson(),
    'wander_timer': wanderTimer,
  };
}

/// What a combat potato fights: in [attack] mode any enemy near the player,
/// in [defense] mode only enemies going for the party.
enum CompanionMode { attack, defense }

/// A potato brought from the farm. It follows the player; combat potatoes
/// fight by their mode and style, food potatoes put food in the bag, and
/// buff potatoes' abilities reach the party. Knocked down, it stays down
/// until the run ends (in a danger zone it is gone, leaving its seed).
final class RaidCompanion extends RaidBody {
  RaidCompanion({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required this.potatoId,
    required this.type,
    required this.grade,
    required this.level,
    required this.abilities,
    required this.slot,
    required this.lifeLeft,
    this.style,
    this.mode = CompanionMode.defense,
    super.hp,
    this.produced = 0,
    this.foodOwed = 0,
    this.sinceHit = double.infinity,
    this.target,
    this.attackCooldown = 0,
    this.team = playerTeam,
  });

  factory RaidCompanion.fromJson(Map<String, dynamic> json) => RaidCompanion(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    radius: (json['radius'] as num).toDouble(),
    maxHp: (json['max_hp'] as num).toDouble(),
    hp: (json['hp'] as num).toDouble(),
    potatoId: json['potato_id'] as int,
    type: PotatoType.values.byName(json['type'] as String),
    grade: Grade.values.byName(json['grade'] as String),
    level: json['level'] as int,
    abilities: (json['abilities'] as List<Object?>).cast<String>(),
    slot: json['slot'] as int,
    lifeLeft: (json['life_left'] as num).toDouble(),
    style: switch (json['style']) {
      final String style => CombatStyle.values.byName(style),
      _ => null,
    },
    mode: CompanionMode.values.byName(json['mode'] as String),
    produced: (json['produced'] as num).toDouble(),
    foodOwed: (json['food_owed'] as num).toDouble(),
    sinceHit: _seconds(json['since_hit']),
    target: json['target'] as int?,
    attackCooldown: (json['attack_cooldown'] as num).toDouble(),
    team: json['team'] as int,
  );

  /// The farm potato's id, to send it back home (0 for a clone's).
  final int potatoId;
  final PotatoType type;
  final Grade grade;
  final int level;

  /// Ability ids, the first from its seed.
  final List<String> abilities;

  /// Which spot behind the player it keeps.
  final int slot;

  /// Its farm potato's life left, 0 to 1, when the run began.
  final double lifeLeft;

  /// Combat potatoes only.
  final CombatStyle? style;
  CompanionMode mode;

  /// Food made but not yet put in the bag.
  double produced;
  double foodOwed;
  double sinceHit;

  /// The body it is fighting (combat potatoes).
  int? target;
  double attackCooldown;

  /// The seed it leaves when it falls in a danger zone, before any grade
  /// change.
  Seed get seed => Seed(
    type: type,
    grade: grade,
    level: level,
    ability: abilities.first,
    style: style,
  );

  /// [playerTeam], or the id of the clone it follows.
  @override
  final int team;

  @override
  RaidSide get side => team == playerTeam ? RaidSide.player : RaidSide.clone;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'radius': radius,
    'max_hp': maxHp,
    'hp': hp,
    'team': team,
    'potato_id': potatoId,
    'type': type.name,
    'grade': grade.name,
    'level': level,
    'abilities': abilities,
    'slot': slot,
    'life_left': lifeLeft,
    'style': style?.name,
    'mode': mode.name,
    'produced': produced,
    'food_owed': foodOwed,
    'since_hit': _secondsJson(sinceHit),
    'target': target,
    'attack_cooldown': attackCooldown,
  };
}

enum CloneMode {
  /// Walking to gathering spots and emptying them.
  gather,

  /// Heading for the nearest open exit.
  extract,

  /// Signalled from an exit; gone when the count ends.
  waiting,
}

/// A competitor: another player's gear and potatoes, played by the run.
/// It gathers, fights whatever comes into its sight, and leaves through an
/// exit; knocked down, it drops what it gathered in a bundle.
final class RaidClone extends RaidShooter {
  RaidClone({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required super.weapon,
    required this.cloneId,
    required this.name,
    required this.bag,
    required this.stayLeft,
    super.weaponLevel,
    super.hp,
    super.facing,
    super.fireCooldown,
    super.aimTarget,
    super.aimProgress,
    List<RaidCompanion>? companions,
    this.mode = CloneMode.gather,
    this.target,
    this.sinceHit = double.infinity,
    this.spot,
    Set<int>? skipped,
    this.goalTimer = 0,
    this.exit,
    this.waitLeft = 0,
    List<Vec2>? path,
    this.pathGoal,
    this.repath = 0,
  }) : companions = companions ?? [],
       skipped = skipped ?? {},
       path = path ?? [];

  factory RaidClone.fromJson(Map<String, dynamic> json, StackSize stackSize) =>
      RaidClone(
        id: json['id'] as int,
        position: Vec2.fromJson(json['position'] as List<Object?>),
        radius: (json['radius'] as num).toDouble(),
        maxHp: (json['max_hp'] as num).toDouble(),
        hp: (json['hp'] as num).toDouble(),
        weapon: json['weapon'] as String,
        weaponLevel: json['weapon_level'] as int,
        cloneId: json['clone_id'] as String,
        name: json['name'] as String,
        bag: Bag.restore([
          for (final s in json['bag'] as List<Object?>)
            s == null ? null : ItemStack.fromJson(s as Map<String, dynamic>),
        ], stackSize),
        stayLeft: (json['stay_left'] as num).toDouble(),
        facing: Vec2.fromJson(json['facing'] as List<Object?>),
        fireCooldown: (json['fire_cooldown'] as num).toDouble(),
        aimTarget: json['aim_target'] as int?,
        aimProgress: (json['aim_progress'] as num).toDouble(),
        companions: [
          for (final c in json['companions'] as List<Object?>)
            RaidCompanion.fromJson(c! as Map<String, dynamic>),
        ],
        mode: CloneMode.values.byName(json['mode'] as String),
        target: json['target'] as int?,
        sinceHit: _seconds(json['since_hit']),
        spot: json['spot'] as int?,
        skipped: {...(json['skipped'] as List<Object?>).cast<int>()},
        goalTimer: (json['goal_timer'] as num).toDouble(),
        exit: json['exit'] as int?,
        waitLeft: (json['wait_left'] as num).toDouble(),
        path: [
          for (final p in json['path'] as List<Object?>)
            Vec2.fromJson(p! as List<Object?>),
        ],
        pathGoal: switch (json['path_goal']) {
          final List<Object?> goal => Vec2.fromJson(goal),
          _ => null,
        },
        repath: (json['repath'] as num).toDouble(),
      );

  /// Its default clone's catalog id.
  final String cloneId;

  /// Shown over its head.
  final String name;

  /// Filled from gathering spots only; dropped when it falls.
  final Bag bag;

  /// Seconds before it decides to leave.
  double stayLeft;

  /// Its potatoes; they follow it and leave or vanish with it.
  final List<RaidCompanion> companions;
  CloneMode mode;

  /// The body it is fighting.
  int? target;
  double sinceHit;

  /// The gathering spot it is walking to, and spots it gave up on.
  int? spot;
  final Set<int> skipped;
  double goalTimer;

  /// The exit it is heading for or waiting at.
  int? exit;
  double waitLeft;

  /// Waypoints toward [pathGoal], planned again every so often.
  List<Vec2> path;
  Vec2? pathGoal;
  double repath;

  @override
  RaidSide get side => RaidSide.clone;

  @override
  int get team => id;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'radius': radius,
    'max_hp': maxHp,
    'hp': hp,
    'weapon': weapon,
    'weapon_level': weaponLevel,
    'clone_id': cloneId,
    'name': name,
    'bag': bag.toJson(),
    'stay_left': stayLeft,
    'facing': facing.toJson(),
    'fire_cooldown': fireCooldown,
    'aim_target': aimTarget,
    'aim_progress': aimProgress,
    'companions': [for (final c in companions) c.toJson()],
    'mode': mode.name,
    'target': target,
    'since_hit': _secondsJson(sinceHit),
    'spot': spot,
    'skipped': [...skipped],
    'goal_timer': goalTimer,
    'exit': exit,
    'wait_left': waitLeft,
    'path': [for (final p in path) p.toJson()],
    'path_goal': pathGoal?.toJson(),
    'repath': repath,
  };
}

/// A shot in flight. Obstacles stop it; it hits the first body of the other
/// side it touches.
final class RaidBullet {
  RaidBullet({
    required this.id,
    required this.position,
    required this.velocity,
    required this.damage,
    required this.owner,
    required this.side,
    required this.team,
    required this.remaining,
  });

  factory RaidBullet.fromJson(Map<String, dynamic> json) => RaidBullet(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    velocity: Vec2.fromJson(json['velocity'] as List<Object?>),
    damage: (json['damage'] as num).toDouble(),
    owner: json['owner'] as int,
    side: RaidSide.values.byName(json['side'] as String),
    team: json['team'] as int,
    remaining: (json['remaining'] as num).toDouble(),
  );

  final int id;
  Vec2 position;

  /// Tiles per second.
  final Vec2 velocity;
  final double damage;

  /// The body that fired it.
  final int owner;
  final RaidSide side;

  /// The shooter's team; it hurts bodies of every other team.
  final int team;

  /// Distance it may still travel.
  double remaining;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'velocity': velocity.toJson(),
    'damage': damage,
    'owner': owner,
    'side': side.name,
    'team': team,
    'remaining': remaining,
  };
}

enum PileKind {
  /// A gathering spot placed at the start.
  spot,

  /// Left by a defeated enemy (or a fallen companion's seed).
  bundle,

  /// What a fallen clone gathered.
  cloneBundle,
}

/// Loot opened by standing next to it.
final class RaidPile {
  RaidPile({
    required this.id,
    required this.position,
    required this.kind,
    required this.loot,
    this.seen = false,
  });

  factory RaidPile.fromJson(Map<String, dynamic> json) => RaidPile(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    kind: PileKind.values.byName(json['kind'] as String),
    loot: LootPile.fromJson(json['loot'] as List<Object?>),
    seen: json['seen'] as bool,
  );

  final int id;
  final Vec2 position;
  final PileKind kind;
  final LootPile loot;

  /// The player has had it in sight: bundles stay on the minimap.
  bool seen;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'kind': kind.name,
    'loot': loot.toJson(),
    'seen': seen,
  };
}

/// One item lying on the floor, picked up by walking over it.
final class RaidFloorItem {
  RaidFloorItem({
    required this.id,
    required this.position,
    required this.stack,
  });

  factory RaidFloorItem.fromJson(Map<String, dynamic> json) => RaidFloorItem(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    stack: ItemStack.fromJson(json['stack'] as Map<String, dynamic>),
  );

  final int id;
  final Vec2 position;
  final ItemStack stack;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'stack': stack.toJson(),
  };
}

/// An exit open in this run (danger zones). Hidden until [found].
final class RaidExit {
  RaidExit({required this.id, required this.position, this.found = false});

  factory RaidExit.fromJson(Map<String, dynamic> json) => RaidExit(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    found: json['found'] as bool,
  );

  final int id;

  /// The exit tile's centre.
  final Vec2 position;

  /// Seen by the player, or shown when every exit is revealed.
  bool found;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'found': found,
  };
}

/// A signal sent from exit [exit], counting down to leaving.
final class RaidSignal {
  RaidSignal({required this.exit, required this.left});

  factory RaidSignal.fromJson(Map<String, dynamic> json) => RaidSignal(
    exit: json['exit'] as int,
    left: (json['left'] as num).toDouble(),
  );

  /// The [RaidExit.id] it was sent from.
  final int exit;

  /// Seconds until zero.
  double left;

  Map<String, dynamic> toJson() => {'exit': exit, 'left': left};
}

// JSON has no infinity: "never hit" is stored as null.
double _seconds(Object? json) =>
    json == null ? double.infinity : (json as num).toDouble();

double? _secondsJson(double seconds) => seconds.isFinite ? seconds : null;
