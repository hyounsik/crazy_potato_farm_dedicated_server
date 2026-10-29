import 'dart:async';

import 'package:potato_core/potato_core.dart';

/// Whether player [playerId] may send [command] into a [FarmRoom]. The room
/// itself has no idea of owners or guests: who may do what is put in from
/// outside (`save-and-online.md`, 2026-10-28, 사용자: no dedicated-server
/// branch in the shared code).
typedef FarmCommandPolicy = bool Function(String playerId, FarmCommand command);

/// Everyone may do anything: a dedicated server's shared farm, where every
/// player looks after it (2026-10-28, 사용자).
bool everyoneManages(String playerId, FarmCommand command) => true;

/// How a [FarmRoom] answered a command.
typedef FarmRoomReply = ({
  /// The room's policy did not let this player send it.
  bool refused,

  /// Why the farm turned it down, or null when it took.
  FarmRejection? rejection,
});

/// One farm that several players work on at once, judged in one place: the
/// farm's rules are the same as on a farm of one's own, and each player
/// acts with their own [PlayerKit] (worn gear, bag, truck bed), kept by
/// player id (`save-and-online.md`, 2026-10-28, 사용자).
///
/// Commands are applied in the order they come, so two players reaching
/// for the same thing cannot both get it. Time moves with [advance].
final class FarmRoom {
  FarmRoom({
    required this.farm,
    this._allow = everyoneManages,
    Map<String, PlayerKit> kits = const {},
  }) : _kits = Map.of(kits),
       _clock = FixedStepClock(farm.catalog.rules.farm.step);

  /// Rebuilds a room saved with [toJson].
  factory FarmRoom.fromJson(
    Catalog catalog,
    Map<String, dynamic> json, {
    FarmCommandPolicy allow = everyoneManages,
  }) => FarmRoom(
    farm: FarmDocument.decode(json['farm'] as Map<String, dynamic>)
        .toSimulation(catalog),
    allow: allow,
    kits: {
      for (final MapEntry(:key, :value)
          in ((json['kits'] as Map<String, dynamic>?) ?? const {}).entries)
        key: PlayerKit.fromJson(catalog, value as Map<String, dynamic>),
    },
  );

  /// The shared farm.
  final FarmSimulation farm;

  final FarmCommandPolicy _allow;
  final Map<String, PlayerKit> _kits;
  final FixedStepClock _clock;

  final StreamController<void> _changes = StreamController.broadcast(
    sync: true,
  );
  final StreamController<FarmEvent> _events = StreamController.broadcast(
    sync: true,
  );

  /// Fires after a command took or time moved the farm on.
  Stream<void> get changes => _changes.stream;

  /// What happened on the farm, as it happens.
  Stream<FarmEvent> get events => _events.stream;

  /// The players who have a kit here, in the order they first came.
  Iterable<String> get players => _kits.keys;

  /// Player [playerId]'s kit, a fresh one wearing the starting gear when
  /// they come for the first time.
  PlayerKit kitOf(String playerId) => _kits.putIfAbsent(
    playerId,
    () => PlayerKit(farm.catalog, equipped: farm.catalog.rules.gear.start),
  );

  /// Hands player [from]'s kit to [to], the same person under a new id (a
  /// reinstalled app): a move, never a copy (2026-10-29, 사용자). [to]'s own
  /// kit, if any, is replaced, and [from] keeps an empty one so coming back
  /// does not hand out the starting gear again. False when [from] has no
  /// kit here or is [to].
  bool moveKit(String from, String to) {
    final kit = _kits[from];
    if (kit == null || from == to) return false;
    _kits[to] = kit;
    _kits[from] = PlayerKit(farm.catalog);
    _publish();
    return true;
  }

  /// Player [playerId] sends [command], acting with their own kit.
  FarmRoomReply apply(String playerId, FarmCommand command) {
    if (!_allow(playerId, command)) return (refused: true, rejection: null);
    final rejection = farm.apply(command, by: kitOf(playerId));
    _publish();
    return (refused: false, rejection: rejection);
  }

  /// Moves the farm on by [elapsed], in whole fixed steps. Returns how many
  /// steps ran.
  int advance(Duration elapsed) {
    final steps = _clock.advance(elapsed);
    if (steps == 0) return 0;
    farm.runSteps(steps);
    _publish();
    return steps;
  }

  /// The room as saved: the farm in its usual save format, and each
  /// player's kit by id.
  Map<String, dynamic> toJson() => {
    'farm': FarmDocument.of(farm).toJson(),
    'kits': {
      for (final MapEntry(:key, :value) in _kits.entries) key: value.toJson(),
    },
  };

  Future<void> close() async {
    await _changes.close();
    await _events.close();
  }

  void _publish() {
    for (final event in farm.takeEvents()) {
      if (!_events.isClosed) _events.add(event);
    }
    if (!_changes.isClosed) _changes.add(null);
  }
}
