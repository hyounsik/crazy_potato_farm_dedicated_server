import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/map/map_data.dart';
import 'package:potato_core/src/map/map_physics.dart';
import 'package:potato_core/src/map/map_script.dart';

/// Who or where a script action aims at, as it stood when the action began.
typedef ScriptAim = ({String? body, Vec2 point});

/// What a script hands to whoever plays it out (the raid, or the map
/// editor's preview): attacks and the farmer's moves are theirs to show.
sealed class ScriptAction {
  const ScriptAction();
}

final class ScriptAttack extends ScriptAction {
  const ScriptAttack(this.who, this.attack, this.aim);
  final String who;
  final String attack;
  final ScriptAim aim;
}

final class ScriptShoot extends ScriptAction {
  const ScriptShoot(this.aim, this.seconds);
  final ScriptAim aim;
  final double seconds;
}

final class ScriptDash extends ScriptAction {
  const ScriptDash(this.to);
  final Vec2 to;
}

final class ScriptSkill extends ScriptAction {
  const ScriptSkill(this.companion);
  final int companion;
}

final class ScriptCue extends ScriptAction {
  const ScriptCue(this.name);
  final String name;
}

/// A body a script has put on the map or moves.
final class ScriptBody {
  ScriptBody(this.name, this.kind, this.position);

  final String name;

  /// Null for the farmer and the boss, which the map already has.
  final String? kind;
  Vec2 position;
  Vec2 facing = const Vec2(0, 1);

  /// Whether a move walks it now.
  bool walking = false;
}

/// One run of a checked [MapScript] over time, apart from any screen.
///
/// The player walks the farmer as usual, and the game reports where with
/// [farmerAt], except while [holdsFarmer]. Run only a script whose
/// [MapScript.check] found nothing: a name it does not know is skipped.
final class ScriptRun {
  ScriptRun(MapScript script, this.map, {required Vec2 farmer, Vec2? boss})
    : _steps = _stepsOf(script.commands) {
    bodies[scriptFarmer] = ScriptBody(scriptFarmer, null, farmer);
    if (boss != null) bodies[scriptBoss] = ScriptBody(scriptBoss, null, boss);
    _startNext();
  }

  final MapData map;

  /// Who is on the map, by name.
  final Map<String, ScriptBody> bodies = {};

  /// Marks standing now, by id.
  final Map<String, Vec2> marks = {};

  /// Seconds since the start.
  double elapsed = 0;

  final List<List<ScriptCommand>> _steps;
  int _next = 0;
  final List<_Task> _running = [];
  final List<ScriptAction> _actions = [];
  final Set<String> _defeated = {};

  bool get done => _running.isEmpty && _next >= _steps.length;

  /// The commands running now, for the editor to light up.
  List<ScriptCommand> get running => [for (final t in _running) t.command];

  /// Whether the script moves the farmer now, so the player cannot.
  bool get holdsFarmer => _running.any((t) => t.holdsFarmer);

  /// Marks the run waits for the farmer to reach.
  Iterable<String> get waitingReach => _running
      .map((t) => t.command)
      .whereType<WaitReachCommand>()
      .map((c) => c.mark);

  /// Enemies the run waits on to fall.
  Iterable<String> get waitingDefeated => _running
      .map((t) => t.command)
      .whereType<WaitDefeatedCommand>()
      .map((c) => c.who);

  /// Where the player has walked the farmer.
  void farmerAt(Vec2 at) {
    if (!holdsFarmer) bodies[scriptFarmer]?.position = at;
  }

  /// [who] has fallen (the raid says so; the preview when clicked).
  void defeated(String who) => _defeated.add(who);

  /// Counts mark [id] as reached, as if the farmer stood on it.
  void reach(String id) {
    if (marks[id] case final at?) bodies[scriptFarmer]?.position = at;
  }

  /// The actions begun since the last call.
  List<ScriptAction> takeActions() {
    final taken = [..._actions];
    _actions.clear();
    return taken;
  }

  /// Moves the run on by [dt] seconds. It stops for the rest of the frame
  /// at a moment the story may hang a scene on (a mark reached, an enemy
  /// down, a cue), so whoever plays it can hold the run until the scene is
  /// over before the next line starts.
  void advance(double dt) {
    elapsed += dt;
    var left = dt;
    // A step that ends mid-frame hands the rest of the frame to the next.
    while (!done) {
      var moment = false;
      for (final task in [..._running]) {
        if (!task.advance(this, left)) continue;
        _running.remove(task);
        moment = moment || task is _WaitTask;
      }
      if (_running.isNotEmpty || moment) return;
      left = 0;
      if (_startNext()) return;
    }
  }

  /// Starts the next steps until one keeps running; true when it stopped
  /// at a cue instead.
  bool _startNext() {
    while (_running.isEmpty && _next < _steps.length) {
      final step = _steps[_next++];
      for (final command in step) {
        final task = _start(command);
        if (task != null) _running.add(task);
      }
      if (step.any((c) => c is CueCommand)) return true;
    }
    return false;
  }

  /// Does [command]'s instant part; returns what keeps running, if any.
  _Task? _start(ScriptCommand command) {
    switch (command) {
      case ActorCommand(:final name, :final kind, :final at):
        final tile = scriptPlace(map, at);
        if (tile != null) {
          bodies[name] = ScriptBody(name, kind, scriptCentre(tile));
        }
      case MarkCommand(:final id, :final at):
        if (scriptPlace(map, at) case final tile?) {
          marks[id] = scriptCentre(tile);
        }
      case MoveCommand():
        return _MoveTask.of(command, this);
      case WaitCommand(:final seconds):
        return _TimeTask(command, seconds);
      case WaitReachCommand() || WaitDefeatedCommand():
        return _WaitTask(command);
      case AttackCommand(:final who, :final attack, :final target):
        _faceAt(who, target);
        _actions.add(ScriptAttack(who, attack, _aim(target)));
      case ShootCommand(:final target, :final seconds):
        _faceAt(scriptFarmer, target);
        _actions.add(ScriptShoot(_aim(target), seconds));
        return _TimeTask(command, seconds);
      case DashCommand(:final to):
        if (scriptPlace(map, to) case final tile?) {
          _actions.add(ScriptDash(scriptCentre(tile)));
        }
      case SkillCommand(:final companion):
        _actions.add(ScriptSkill(companion));
      case FaceCommand(:final who, :final target):
        _faceAt(who, target);
      case CueCommand(:final name):
        _actions.add(ScriptCue(name));
    }
    return null;
  }

  ScriptAim _aim(String target) {
    if (bodies[target] case final body?) {
      return (body: target, point: body.position);
    }
    if (marks[target] case final at?) return (body: null, point: at);
    final tile = scriptPlace(map, target);
    return (body: null, point: tile == null ? Vec2.zero : scriptCentre(tile));
  }

  void _faceAt(String who, String target) {
    final body = bodies[who];
    if (body == null) return;
    final toward = _aim(target).point - body.position;
    if (toward.length > 0) body.facing = toward / toward.length;
  }

  static List<List<ScriptCommand>> _stepsOf(List<ScriptCommand> commands) {
    final steps = <List<ScriptCommand>>[];
    for (final command in commands) {
      if (command.together && steps.isNotEmpty) {
        steps.last.add(command);
      } else {
        steps.add([command]);
      }
    }
    return steps;
  }
}

/// A command that takes time. [advance] returns whether it has finished.
sealed class _Task {
  _Task(this.command);
  final ScriptCommand command;
  bool get holdsFarmer => false;
  bool advance(ScriptRun run, double dt);
}

final class _TimeTask extends _Task {
  _TimeTask(super.command, this.seconds);
  final double seconds;
  double _spent = 0;

  @override
  bool get holdsFarmer => command is ShootCommand;

  @override
  bool advance(ScriptRun run, double dt) => (_spent += dt) >= seconds;
}

final class _WaitTask extends _Task {
  _WaitTask(super.command);

  /// How near the farmer's middle must be to a mark's to stand on it.
  static const double reachDistance = 0.5;

  @override
  bool advance(ScriptRun run, double dt) => switch (command) {
    WaitReachCommand(:final mark) => _reached(run, mark),
    WaitDefeatedCommand(:final who) => run._defeated.contains(who),
    _ => true,
  };

  bool _reached(ScriptRun run, String mark) {
    final at = run.marks[mark];
    final farmer = run.bodies[scriptFarmer];
    if (at == null || farmer == null) return true;
    if (farmer.position.distanceTo(at) > reachDistance) return false;
    run.marks.remove(mark);
    return true;
  }
}

/// Walks a body (along a found path) or slides a mark (straight) from one
/// place to another over the given time.
final class _MoveTask extends _Task {
  _MoveTask(MoveCommand super.command, this.who, this.points)
    : _length = _lengthOf(points);

  static _Task? of(MoveCommand command, ScriptRun run) {
    final from = scriptPlace(run.map, command.from);
    final to = scriptPlace(run.map, command.to);
    if (from == null || to == null) return null;
    final start = scriptCentre(from);
    final end = scriptCentre(to);
    final isMark = run.marks.containsKey(command.who);
    if (!isMark && !run.bodies.containsKey(command.who)) return null;
    final path = isMark ? [end] : run.map.findPath(start, end);
    return _MoveTask(command, command.who, [start, ...path]);
  }

  final String who;
  final List<Vec2> points;
  final double _length;
  double _spent = 0;

  MoveCommand get move => command as MoveCommand;

  @override
  bool get holdsFarmer => who == scriptFarmer;

  @override
  bool advance(ScriptRun run, double dt) {
    _spent += dt;
    final share = (_spent / move.seconds).clamp(0.0, 1.0);
    final (at, heading) = _along(share * _length);
    final body = run.bodies[who];
    if (body != null) {
      body
        ..position = at
        ..walking = share < 1;
      if (heading.length > 0) body.facing = heading / heading.length;
    } else if (run.marks.containsKey(who)) {
      run.marks[who] = at;
    }
    return share >= 1;
  }

  /// The point [distance] along the path, and the way it heads there.
  (Vec2, Vec2) _along(double distance) {
    var left = distance;
    for (var i = 1; i < points.length; i++) {
      final leg = points[i] - points[i - 1];
      final length = leg.length;
      if (left <= length && length > 0) {
        return (points[i - 1] + leg * (left / length), leg);
      }
      left -= length;
    }
    final last = points.length > 1
        ? points.last - points[points.length - 2]
        : Vec2.zero;
    return (points.last, last);
  }

  static double _lengthOf(List<Vec2> points) {
    var length = 0.0;
    for (var i = 1; i < points.length; i++) {
      length += points[i].distanceTo(points[i - 1]);
    }
    return length;
  }
}
