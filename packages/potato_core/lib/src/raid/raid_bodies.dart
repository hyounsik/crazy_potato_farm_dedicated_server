import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// Which side a body or shot is on. Shots only hurt the other side.
enum RaidSide { player, wild }

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
  bool get isDown => hp <= 0;
}

final class RaidPlayer extends RaidBody {
  RaidPlayer({
    required super.id,
    required super.position,
    required super.radius,
    required super.maxHp,
    required this.weapon,
    this.weaponLevel = 0,
    super.hp,
    this.facing = const Vec2(1, 0),
    this.dashLeft = 0,
    this.dashCooldown = 0,
    this.dashDirection = Vec2.zero,
    this.sinceHit = double.infinity,
    this.foodOwed = 0,
    this.hungrySeconds = 0,
    this.fireCooldown = 0,
    this.aimTarget,
    this.aimProgress = 0,
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

  /// The weapon's catalog id.
  String weapon;

  /// How far the weapon was strengthened at the workbench.
  int weaponLevel;
  Vec2 facing;
  double dashLeft;
  double dashCooldown;
  Vec2 dashDirection;
  double sinceHit;

  /// Food eaten but not yet taken from the bag (only whole ones are).
  double foodOwed;

  /// How long the bag has been out of food.
  double hungrySeconds;
  double fireCooldown;

  /// Charging weapons: the body being aimed at and for how long.
  int? aimTarget;
  double aimProgress;

  bool get isDashing => dashLeft > 0;

  @override
  RaidSide get side => RaidSide.player;

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
  );

  /// The farm potato's id, to send it back home.
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

  @override
  RaidSide get side => RaidSide.player;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'radius': radius,
    'max_hp': maxHp,
    'hp': hp,
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
    required this.remaining,
  });

  factory RaidBullet.fromJson(Map<String, dynamic> json) => RaidBullet(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    velocity: Vec2.fromJson(json['velocity'] as List<Object?>),
    damage: (json['damage'] as num).toDouble(),
    owner: json['owner'] as int,
    side: RaidSide.values.byName(json['side'] as String),
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

  /// Distance it may still travel.
  double remaining;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'velocity': velocity.toJson(),
    'damage': damage,
    'owner': owner,
    'side': side.name,
    'remaining': remaining,
  };
}

enum PileKind {
  /// A gathering spot placed at the start.
  spot,

  /// Left by a defeated enemy.
  bundle,
}

/// Loot opened by standing next to it.
final class RaidPile {
  RaidPile({
    required this.id,
    required this.position,
    required this.kind,
    required this.loot,
  });

  factory RaidPile.fromJson(Map<String, dynamic> json) => RaidPile(
    id: json['id'] as int,
    position: Vec2.fromJson(json['position'] as List<Object?>),
    kind: PileKind.values.byName(json['kind'] as String),
    loot: LootPile.fromJson(json['loot'] as List<Object?>),
  );

  final int id;
  final Vec2 position;
  final PileKind kind;
  final LootPile loot;

  Map<String, dynamic> toJson() => {
    'id': id,
    'position': position.toJson(),
    'kind': kind.name,
    'loot': loot.toJson(),
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
