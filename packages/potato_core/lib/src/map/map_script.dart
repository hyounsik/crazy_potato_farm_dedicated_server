import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_physics.dart';

/// Markers named `at:<place>` are the places a script points at, so a map
/// can be redrawn without touching its scripts.
const String placeMarkerPrefix = 'at:';

/// Who a script may always name: the player (the host, in a party) and the
/// zone's boss.
const String scriptFarmer = 'farmer';
const String scriptBoss = 'boss';

/// A move's start meaning wherever the body stands now (2026-11-14: the
/// player's farmer, whose place the script cannot know).
const String scriptHere = 'here';

/// Story bodies a script may put on a map besides enemies: they walk and
/// face but do not fight (2026-11-13, 사용자: John in a helmet and Ian with a pitchfork, the title screen's two potatoes). Each needs
/// its picture in the client.
const Set<String> storyCharacters = {'kevin', 'john', 'ian'};

/// What `pose` can set (2026-11-14, 사용자: the farmer sitting and lying,
/// as in the map editor's 인물 palette); `stand` goes back to standing.
const List<String> scriptPoses = [
  'stand',
  'sit_front',
  'sit_right',
  'sit_left',
  'lie_left',
  'lie_left_asleep',
  'lie_right',
  'lie_right_asleep',
];

/// A line of a story map's script (2026-11-12, 사용자: map editor M6).
///
/// Commands run one after another; one written with a leading `&` starts
/// together with the one before it. Attacks are for show and hurt nobody.
sealed class ScriptCommand {
  const ScriptCommand(this.line, {this.together = false});

  /// 1-based, for problems and the editor.
  final int line;

  /// Starts with the command before it instead of after it.
  final bool together;
}

/// `actor <name> <kind> at <place>`: puts a story body on the map.
final class ActorCommand extends ScriptCommand {
  const ActorCommand(
    super.line, {
    super.together,
    required this.name,
    required this.kind,
    required this.at,
  });
  final String name;
  final String kind;
  final String at;
}

/// `move <who> <from> -> <to> <time>`: walks from place to place.
final class MoveCommand extends ScriptCommand {
  const MoveCommand(
    super.line, {
    super.together,
    required this.who,
    required this.from,
    required this.to,
    required this.seconds,
  });
  final String who;
  final String from;
  final String to;
  final double seconds;
}

/// `mark <id> at <place>`: the arrow over a circle that leads the player.
final class MarkCommand extends ScriptCommand {
  const MarkCommand(
    super.line, {
    super.together,
    required this.id,
    required this.at,
  });
  final String id;
  final String at;
}

/// `wait <time>`.
final class WaitCommand extends ScriptCommand {
  const WaitCommand(super.line, {super.together, required this.seconds});
  final double seconds;
}

/// `wait reach <mark>`: until the player stands on it; the mark then goes.
final class WaitReachCommand extends ScriptCommand {
  const WaitReachCommand(super.line, {super.together, required this.mark});
  final String mark;
}

/// `wait defeated <enemy>`.
final class WaitDefeatedCommand extends ScriptCommand {
  const WaitDefeatedCommand(super.line, {super.together, required this.who});
  final String who;
}

/// `attack <enemy> <attack> at <target>`: one of its own attacks, once.
final class AttackCommand extends ScriptCommand {
  const AttackCommand(
    super.line, {
    super.together,
    required this.who,
    required this.attack,
    required this.target,
  });
  final String who;
  final String attack;
  final String target;
}

/// `farmer shoot at <target> <time>`.
final class ShootCommand extends ScriptCommand {
  const ShootCommand(
    super.line, {
    super.together,
    required this.target,
    required this.seconds,
  });
  final String target;
  final double seconds;
}

/// `farmer dash to <place>`.
final class DashCommand extends ScriptCommand {
  const DashCommand(super.line, {super.together, required this.to});
  final String to;
}

/// `farmer skill <companion>`: 1 is the first companion.
final class SkillCommand extends ScriptCommand {
  const SkillCommand(super.line, {super.together, required this.companion});
  final int companion;
}

/// `face <who> <target>`.
final class FaceCommand extends ScriptCommand {
  const FaceCommand(
    super.line, {
    super.together,
    required this.who,
    required this.target,
  });
  final String who;
  final String target;
}

/// `exit <who>`: a story character or a mark leaves the map.
final class ExitCommand extends ScriptCommand {
  const ExitCommand(super.line, {super.together, required this.who});
  final String who;
}

/// `pose <who> <pose>`: sits or lies down ([scriptPoses]), or stands.
final class PoseCommand extends ScriptCommand {
  const PoseCommand(
    super.line, {
    super.together,
    required this.who,
    required this.pose,
  });
  final String who;
  final String pose;
}

/// `cue <name>`: a moment the story can hang a scene on
/// (`map:<map>/cue:<name>`).
final class CueCommand extends ScriptCommand {
  const CueCommand(super.line, {super.together, required this.name});
  final String name;
}

/// Something wrong on a line.
final class ScriptProblem {
  const ScriptProblem(this.line, this.message);
  final int line;
  final String message;

  @override
  String toString() => 'line $line: $message';
}

/// Whom a script may put on a map and what they can do.
final class ScriptCast {
  const ScriptCast({
    this.enemies = const {},
    this.characters = const {},
    this.boss,
  });

  /// Enemy kinds by id (`enemies.json`): they can attack and be defeated.
  final Map<String, EnemyData> enemies;

  /// Story bodies that only walk and face (John, Ian).
  final Set<String> characters;

  /// The map's zone's boss, for [scriptBoss].
  final EnemyData? boss;

  /// The attacks [enemy] can be told to make: its plain one, then a
  /// boss's patterns. Clouds and shots are numbered from 1 in data order.
  static List<String> attacksOf(EnemyData enemy) {
    final boss = enemy.boss;
    return [
      enemy.attack.name,
      if (boss != null) ...[
        if (boss.chargeSpeed > 0) 'charge',
        if (boss.chargeChain != null) 'charge_chain',
        if (boss.sprayBullets > 0) 'spray',
        if (boss.jump != null) 'jump',
        if (boss.burrow != null) 'burrow',
        for (var i = 1; i <= boss.clouds.length; i++) 'cloud:$i',
        for (var i = 1; i <= boss.shots.length; i++) 'shot:$i',
      ],
    ];
  }
}

/// A named script of a story map, read from its text.
final class MapScript {
  MapScript._(this.name, this.commands, this.starts, this.problems);

  /// Reads [text] line by line. Lines it cannot read are left out and
  /// reported in [problems]; [check] finds what the map and cast refuse.
  factory MapScript.parse(String name, String text) {
    final commands = <ScriptCommand>[];
    final starts = <double?>[];
    final problems = <ScriptProblem>[];
    for (final (index, raw) in text.split('\n').indexed) {
      var line = raw.split('#').first.trim();
      if (line.isEmpty) continue;
      try {
        double? at;
        if (RegExp(r'^@(\S*)\s*(.*)$').firstMatch(line) case final m?) {
          at = double.tryParse(m[1]!);
          if (at == null || at < 0) {
            throw FormatException('"@${m[1]}" is not a start time like @1.5');
          }
          line = m[2]!;
          if (line.startsWith('&')) {
            throw const FormatException('a timed line cannot start with &');
          }
        }
        commands.add(_readLine(index + 1, line));
        starts.add(at);
      } on FormatException catch (e) {
        problems.add(ScriptProblem(index + 1, e.message));
      }
    }
    return MapScript._(
      name,
      List.unmodifiable(commands),
      List.unmodifiable(starts),
      problems,
    );
  }

  final String name;
  final List<ScriptCommand> commands;

  /// Each command's start time (`@1.5`), or null for a line without one
  /// (2026-11-14, 사용자: the map editor's timeline). A script with any
  /// is timed: a clock runs, each line starts at its time whatever else is
  /// still running, a line without a time starts with the one before, and
  /// the clock stops while the farmer is waited for at a mark or an enemy
  /// to fall.
  final List<double?> starts;

  /// Whether [starts] has any time: the script runs on a clock.
  bool get timed => starts.any((t) => t != null);

  /// Lines [MapScript.parse] could not read.
  final List<ScriptProblem> problems;

  /// The hooks the story can hang scenes on, for map [mapId]: each mark
  /// reached, enemy defeated and cue, in script order.
  List<String> hooks(String mapId) => [
    for (final command in commands)
      switch (command) {
        WaitReachCommand(:final mark) => 'map:$mapId/reach:$mark',
        WaitDefeatedCommand(:final who) => 'map:$mapId/defeated:$who',
        CueCommand(:final name) => 'map:$mapId/cue:$name',
        _ => null,
      },
  ].nonNulls.toList();

  /// [problems] and what [map] and [cast] refuse: unknown places and names,
  /// walks between places that do not connect, attacks a body lacks.
  List<ScriptProblem> check(MapData map, ScriptCast cast) => [
    ...problems,
    ..._ScriptChecker(map, cast).run(commands),
    ..._timeProblems(),
  ]..sort((a, b) => a.line.compareTo(b.line));

  /// A timed script's lines must not go back in time.
  List<ScriptProblem> _timeProblems() {
    final found = <ScriptProblem>[];
    var last = 0.0;
    for (final (i, at) in starts.indexed) {
      if (at == null) continue;
      if (at < last) {
        found.add(
          ScriptProblem(commands[i].line, 'starts before the line above'),
        );
      }
      last = at;
    }
    return found;
  }
}

/// The tile of place [name] on [map], or null. A place may also be a tile
/// written `x,y` (2026-11-14: the timeline marks tiles without naming
/// them).
TilePos? scriptPlace(MapData map, String name) {
  if (RegExp(r'^(\d+),(\d+)$').firstMatch(name) case final m?) {
    final tile = TilePos(int.parse(m[1]!), int.parse(m[2]!));
    final inside =
        tile.x >= 0 && tile.y >= 0 && tile.x < map.size && tile.y < map.size;
    return inside ? tile : null;
  }
  final tiles = map.markers['$placeMarkerPrefix$name'];
  return tiles == null || tiles.isEmpty ? null : tiles.first;
}

ScriptCommand _readLine(int line, String text) {
  final together = text.startsWith('&');
  final words = (together ? text.substring(1) : text).trim().split(
    RegExp(r'\s+'),
  );
  ScriptCommand fail(String usage) =>
      throw FormatException('expected "$usage"');
  final w = words;
  return switch (w) {
    ['actor', final name, final kind, 'at', final at] => ActorCommand(
      line,
      together: together,
      name: name,
      kind: kind,
      at: at,
    ),
    ['actor', ...] => fail('actor <name> <kind> at <place>'),
    ['move', final who, final from, '->', final to, final time] => MoveCommand(
      line,
      together: together,
      who: who,
      from: from,
      to: to,
      seconds: _seconds(time),
    ),
    ['move', ...] => fail('move <who> <from> -> <to> <time>'),
    ['mark', final id, 'at', final at] => MarkCommand(
      line,
      together: together,
      id: id,
      at: at,
    ),
    ['mark', ...] => fail('mark <id> at <place>'),
    ['wait', 'reach', final mark] => WaitReachCommand(
      line,
      together: together,
      mark: mark,
    ),
    ['wait', 'defeated', final who] => WaitDefeatedCommand(
      line,
      together: together,
      who: who,
    ),
    ['wait', final time] => WaitCommand(
      line,
      together: together,
      seconds: _seconds(time),
    ),
    ['wait', ...] => fail(
      'wait <time> | wait reach <mark> | wait defeated <enemy>',
    ),
    ['attack', final who, final attack, 'at', final target] => AttackCommand(
      line,
      together: together,
      who: who,
      attack: attack,
      target: target,
    ),
    ['attack', ...] => fail('attack <enemy> <attack> at <target>'),
    ['farmer', 'shoot', 'at', final target, final time] => ShootCommand(
      line,
      together: together,
      target: target,
      seconds: _seconds(time),
    ),
    ['farmer', 'dash', 'to', final to] => DashCommand(
      line,
      together: together,
      to: to,
    ),
    ['farmer', 'skill', final slot] => SkillCommand(
      line,
      together: together,
      companion: _companion(slot),
    ),
    ['farmer', ...] => fail(
      'farmer shoot at <target> <time> | farmer dash to <place> | '
      'farmer skill <companion>',
    ),
    ['face', final who, final target] => FaceCommand(
      line,
      together: together,
      who: who,
      target: target,
    ),
    ['face', ...] => fail('face <who> <target>'),
    ['exit', final who] => ExitCommand(line, together: together, who: who),
    ['exit', ...] => fail('exit <who>'),
    ['pose', final who, final pose] => PoseCommand(
      line,
      together: together,
      who: who,
      pose: pose,
    ),
    ['pose', ...] => fail('pose <who> <pose>'),
    ['cue', final name] => CueCommand(line, together: together, name: name),
    ['cue', ...] => fail('cue <name>'),
    _ => throw FormatException('unknown command "${w.first}"'),
  };
}

double _seconds(String text) {
  final match = RegExp(r'^(\d+(?:\.\d+)?)s$').firstMatch(text);
  final seconds = match == null ? null : double.parse(match[1]!);
  if (seconds == null || seconds <= 0) {
    throw FormatException('"$text" is not a time like 1.5s');
  }
  return seconds;
}

int _companion(String text) {
  final slot = int.tryParse(text);
  if (slot == null || slot < 1) {
    throw FormatException('"$text" is not a companion number from 1');
  }
  return slot;
}

/// Walks the commands in order, knowing who is on the map so far.
final class _ScriptChecker {
  _ScriptChecker(this.map, this.cast);

  final MapData map;
  final ScriptCast cast;
  final problems = <ScriptProblem>[];

  /// Bodies by name → their kind (null for the farmer and character
  /// kinds that cannot fight).
  final Map<String, EnemyData?> bodies = {};
  final Set<String> marks = {};

  List<ScriptProblem> run(List<ScriptCommand> commands) {
    bodies[scriptFarmer] = null;
    if (cast.boss case final boss?) bodies[scriptBoss] = boss;
    for (final command in commands) {
      _check(command);
    }
    return problems;
  }

  void _issue(ScriptCommand command, String message) =>
      problems.add(ScriptProblem(command.line, message));

  void _check(ScriptCommand command) {
    switch (command) {
      case ActorCommand():
        _actor(command);
      case MoveCommand():
        _move(command);
      case MarkCommand(:final id, :final at):
        _place(command, at);
        if (bodies.containsKey(id)) _issue(command, '"$id" is a body');
        marks.add(id);
      case WaitReachCommand(:final mark):
        if (!marks.contains(mark)) _issue(command, 'no mark "$mark" yet');
      case WaitDefeatedCommand(:final who):
        _enemy(command, who);
      case AttackCommand():
        _attack(command);
      case ShootCommand(:final target):
        _target(command, target);
      case DashCommand(:final to):
        _place(command, to);
      case FaceCommand(:final who, :final target):
        if (!bodies.containsKey(who)) _issue(command, 'no body "$who" yet');
        _target(command, target);
      case ExitCommand(:final who):
        if (marks.remove(who)) break;
        if (!bodies.containsKey(who)) {
          _issue(command, 'no body or mark "$who" yet');
        } else if (bodies[who] != null ||
            who == scriptFarmer ||
            who == scriptBoss) {
          _issue(command, 'only story characters and marks leave');
        } else {
          bodies.remove(who);
        }
      case PoseCommand(:final who, :final pose):
        if (!bodies.containsKey(who)) _issue(command, 'no body "$who" yet');
        if (!scriptPoses.contains(pose)) {
          _issue(command, 'no pose "$pose" (${scriptPoses.join(', ')})');
        }
      case WaitCommand() || SkillCommand() || CueCommand():
        break;
    }
  }

  void _actor(ActorCommand command) {
    final ActorCommand(:name, :kind, :at) = command;
    _place(command, at);
    if (name == scriptFarmer || name == scriptBoss) {
      _issue(command, '"$name" is always there');
    } else if (bodies.containsKey(name) || marks.contains(name)) {
      _issue(command, '"$name" is already used');
    }
    final enemy = cast.enemies[kind];
    if (enemy == null && !cast.characters.contains(kind)) {
      _issue(command, 'no kind "$kind"');
    }
    bodies[name] = enemy;
  }

  void _move(MoveCommand command) {
    final MoveCommand(:who, :from, :to) = command;
    final isMark = marks.contains(who);
    if (!isMark && !bodies.containsKey(who)) {
      _issue(command, 'no body or mark "$who" yet');
    }
    final start = from == scriptHere ? null : _place(command, from);
    final end = _place(command, to);
    if (isMark || start == null || end == null) return;
    if (map.findPath(scriptCentre(start), scriptCentre(end)).isEmpty) {
      _issue(command, 'cannot walk from "$from" to "$to"');
    }
  }

  void _attack(AttackCommand command) {
    final enemy = _enemy(command, command.who);
    _target(command, command.target);
    if (enemy == null) return;
    final attacks = ScriptCast.attacksOf(enemy);
    if (!attacks.contains(command.attack)) {
      _issue(
        command,
        '"${command.who}" has no attack "${command.attack}" '
        '(${attacks.join(', ')})',
      );
    }
  }

  EnemyData? _enemy(ScriptCommand command, String who) {
    if (!bodies.containsKey(who)) {
      _issue(command, 'no body "$who" yet');
      return null;
    }
    final enemy = bodies[who];
    if (enemy == null) _issue(command, '"$who" is not an enemy');
    return enemy;
  }

  void _target(ScriptCommand command, String target) {
    if (bodies.containsKey(target) || marks.contains(target)) return;
    if (scriptPlace(map, target) == null) {
      _issue(command, 'no body or place "$target"');
    }
  }

  TilePos? _place(ScriptCommand command, String name) {
    final tile = scriptPlace(map, name);
    if (tile == null) {
      _issue(command, 'no place "$name" (marker at:$name or x,y on the map)');
    }
    return tile;
  }
}

/// The middle of [tile], where script bodies stand.
Vec2 scriptCentre(TilePos tile) => Vec2(tile.x + 0.5, tile.y + 0.5);
