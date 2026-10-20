import 'dart:async';

import 'package:potato_core/potato_core.dart';
import 'package:potato_session/src/session_message.dart';
import 'package:potato_session/src/transport.dart';

/// A guest who passed the version check and is in the host's party.
final class HostedGuest {
  HostedGuest({
    required this.peerId,
    required this.start,
    this.memberIndex,
    this.connected = true,
  });

  final String peerId;
  final RaidMemberStart start;

  /// Index in `RaidSimulation.members` once the run starts (1..3).
  int? memberIndex;
  bool connected;
  int _lastMoveSeq = -1;
  bool _resultSent = false;

  String get name => start.name;
}

/// Runs a party exploration session on the host device (or dedicated server).
///
/// Before [startRun], accepts up to [maxGuests] guests whose build number and
/// catalog hash match the host's. Once [startRun] is called, drives the
/// authoritative [RaidSimulation], applies guest inputs, broadcasts events and
/// results on the reliable channel, and sends snapshots on the unreliable
/// channel every [snapshotEvery] (`realtime-session.md`).
final class HostSession {
  HostSession({
    required this.catalog,
    required this.transport,
    this.buildNumber = 0,
    this.codec = const JsonSessionCodec(),
    this.snapshotEvery = const Duration(milliseconds: 100),
    this.maxGuests = 3,
  }) : catalogHash = computeCatalogHash(catalog) {
    _packetSub = transport.packets.listen(_onPacket);
    _disconnectSub = transport.peerDisconnected.listen(_onPeerDisconnected);
  }

  final Catalog catalog;
  final String catalogHash;
  final HostTransport transport;
  final int buildNumber;
  final SessionCodec codec;
  final Duration snapshotEvery;
  final int maxGuests;

  late final StreamSubscription<SessionPacket> _packetSub;
  late final StreamSubscription<String> _disconnectSub;

  final Map<String, HostedGuest> _guests = {};
  final List<HostedGuest> _guestOrder = [];
  final _guestsChanged = StreamController<List<HostedGuest>>.broadcast();
  final List<RaidEvent> _hostEvents = [];

  RaidSimulation? _run;
  FixedStepClock? _clock;
  Duration _sinceSnapshot = Duration.zero;
  bool _closed = false;

  /// Guests currently in the party (waiting room or in the run).
  List<HostedGuest> get guests => List.unmodifiable(_guestOrder);

  /// Fires whenever the guest list or a guest's connection changes.
  Stream<List<HostedGuest>> get guestsChanged => _guestsChanged.stream;

  /// The authoritative run once [startRun] has been called.
  RaidSimulation? get run => _run;

  /// Starts the party run with [hostStart] as member 0 and the joined
  /// [guests] as members 1..N, and sends [RunStartedMessage] to each guest.
  RaidSimulation startRun({
    required String zone,
    required int seed,
    required RaidMemberStart hostStart,
    Map<String, MapChunk> chunks = const {},
  }) {
    if (_run != null) throw StateError('Run already started');
    _guestOrder
      ..clear()
      ..addAll(_guests.values);
    final starts = <RaidMemberStart>[
      hostStart,
      for (final g in _guestOrder) g.start,
    ];
    final sim = RaidSimulation.party(
      catalog: catalog,
      zone: zone,
      seed: seed,
      chunks: chunks,
      members: starts,
    );
    _run = sim;
    _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
    _sinceSnapshot = Duration.zero;

    final initialJson = sim.toJson();
    for (var i = 0; i < _guestOrder.length; i++) {
      final guest = _guestOrder[i];
      final memberIndex = i + 1;
      guest.memberIndex = memberIndex;
      _send(
        guest.peerId,
        SessionChannel.reliable,
        RunStartedMessage(memberIndex: memberIndex, runJson: initialJson),
      );
    }
    return sim;
  }

  /// Attaches an already-created (or restored) party [sim] and notifies
  /// connected guests.
  void attachRun(RaidSimulation sim) {
    _run = sim;
    _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
    _sinceSnapshot = Duration.zero;
  }

  /// Advances the run by [elapsed] in fixed steps and sends snapshots every
  /// [snapshotEvery]. Returns the number of simulation steps taken.
  int advance(
    Duration elapsed, {
    Duration maxElapsed = const Duration(milliseconds: 250),
  }) {
    final sim = _run;
    final clock = _clock;
    if (sim == null || clock == null || _closed) return 0;
    final steps = clock.advance(elapsed, maxElapsed: maxElapsed);
    for (var i = 0; i < steps && !sim.isOver; i++) {
      stepOnce();
    }
    _sinceSnapshot += elapsed;
    if (_sinceSnapshot >= snapshotEvery) {
      _sinceSnapshot = Duration.zero;
      broadcastSnapshot();
    }
    return steps;
  }

  /// Runs a single simulation step and dispatches any resulting events and
  /// member results to guests on the reliable channel.
  void stepOnce() {
    final sim = _run;
    if (sim == null || sim.isOver) return;
    sim.step();
    _flushEventsAndResults(sim);
  }

  void _flushEventsAndResults(RaidSimulation sim) {
    final events = sim.takeEvents();
    if (events.isNotEmpty) {
      _hostEvents.addAll(events);
      _broadcast(
        SessionChannel.reliable,
        EventsMessage(tick: sim.tick, events: events),
      );
    }
    for (final guest in _guestOrder) {
      if (guest._resultSent) continue;
      final index = guest.memberIndex;
      if (index == null || index >= sim.members.length) continue;
      final member = sim.members[index];
      final result = sim.resultOf(member);
      if (result == null) continue;
      guest._resultSent = true;
      _send(
        guest.peerId,
        SessionChannel.reliable,
        MemberResultMessage(memberIndex: index, result: result),
      );
    }
  }

  /// Sends a state snapshot to every connected guest on the unreliable
  /// channel now.
  void broadcastSnapshot() {
    final sim = _run;
    if (sim == null || _closed) return;
    _broadcast(
      SessionChannel.unreliable,
      SnapshotMessage(RaidSnapshot.fromRun(sim)),
    );
  }

  /// Collects events for the host's own screen since the last call.
  List<RaidEvent> takeHostEvents() {
    final out = List<RaidEvent>.of(_hostEvents);
    _hostEvents.clear();
    return out;
  }

  void _onPacket(SessionPacket packet) {
    if (_closed) return;
    final SessionMessage msg;
    try {
      msg = codec.decode(packet.bytes);
    } on Object {
      return;
    }
    switch (msg) {
      case HelloMessage():
        _onHello(packet.peerId, msg);
      case MoveMessage():
        _onMove(packet.peerId, msg);
      case CommandMessage():
        _onCommand(packet.peerId, msg);
      default:
        break;
    }
  }

  void _onHello(String peerId, HelloMessage msg) {
    if (msg.buildNumber != buildNumber || msg.catalogHash != catalogHash) {
      _send(
        peerId,
        SessionChannel.reliable,
        const WelcomeMessage(
          accepted: false,
          rejection: SessionJoinRejection.versionMismatch,
        ),
      );
      return;
    }
    if (_run != null ||
        (!_guests.containsKey(peerId) && _guests.length >= maxGuests)) {
      _send(
        peerId,
        SessionChannel.reliable,
        const WelcomeMessage(
          accepted: false,
          rejection: SessionJoinRejection.sessionFull,
        ),
      );
      return;
    }
    final guest = HostedGuest(peerId: peerId, start: msg.start);
    _guests[peerId] = guest;
    final existing = _guestOrder.indexWhere((g) => g.peerId == peerId);
    if (existing >= 0) {
      _guestOrder[existing] = guest;
    } else {
      _guestOrder.add(guest);
    }
    _send(
      peerId,
      SessionChannel.reliable,
      const WelcomeMessage(accepted: true),
    );
    _notifyGuests();
  }

  void _onMove(String peerId, MoveMessage msg) {
    final sim = _run;
    final guest = _guests[peerId];
    if (sim == null || guest == null) return;
    if (msg.seq < guest._lastMoveSeq) return;
    guest._lastMoveSeq = msg.seq;
    final index = guest.memberIndex;
    if (index == null || index >= sim.members.length) return;
    sim.setMoveOf(sim.members[index], msg.direction);
  }

  void _onCommand(String peerId, CommandMessage msg) {
    final sim = _run;
    final guest = _guests[peerId];
    if (sim == null || guest == null) return;
    final index = guest.memberIndex;
    if (index == null || index >= sim.members.length) return;
    final rejection = sim.applyOf(sim.members[index], msg.command);
    if (rejection != null) {
      _send(peerId, SessionChannel.reliable, CommandRejectedMessage(rejection));
      return;
    }
    _flushEventsAndResults(sim);
  }

  void _onPeerDisconnected(String peerId) {
    final guest = _guests[peerId];
    if (guest == null) return;
    final sim = _run;
    if (sim == null) {
      // Still in the waiting room: remove them from the party.
      _guests.remove(peerId);
      _guestOrder.removeWhere((g) => g.peerId == peerId);
      _notifyGuests();
      return;
    }
    // In a run: their character stays in the world defenseless (no stick
    // input), companions keep fighting (`multiplayer.md`).
    guest.connected = false;
    final index = guest.memberIndex;
    if (index != null && index < sim.members.length) {
      sim.setMoveOf(sim.members[index], Vec2.zero);
    }
    _notifyGuests();
  }

  void _notifyGuests() {
    if (!_guestsChanged.isClosed) {
      _guestsChanged.add(List.unmodifiable(_guestOrder));
    }
  }

  void _send(String peerId, SessionChannel channel, SessionMessage message) {
    transport.send(peerId, channel, codec.encode(message));
  }

  void _broadcast(SessionChannel channel, SessionMessage message) {
    transport.broadcast(channel, codec.encode(message));
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    await _packetSub.cancel();
    await _disconnectSub.cancel();
    await _guestsChanged.close();
  }
}
