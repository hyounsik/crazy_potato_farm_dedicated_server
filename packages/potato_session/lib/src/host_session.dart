import 'dart:async';

import 'package:potato_core/potato_core.dart';
import 'package:potato_session/src/session_message.dart';
import 'package:potato_session/src/transport.dart';

/// A guest who passed the version check and is in the host's party.
final class HostedGuest {
  HostedGuest({
    required this.peerId,
    required this.start,
    this.playerId = '',
    this.memberIndex,
    this.connected = true,
  });

  /// The guest's link now; a guest who comes back mid-run gets a new one.
  String peerId;

  /// What the guest brings; replaced when they get ready again
  /// ([ReadyMessage.start]).
  RaidMemberStart start;

  /// The guest's installation id from [HelloMessage.playerId].
  final String playerId;

  /// Index in `RaidSimulation.members` once the run starts: 1..3 when the
  /// host plays, 0..3 on a dedicated server.
  int? memberIndex;
  bool connected;

  /// Ready to set out for the zone the host picked (2026-10-22, 사용자).
  /// Everyone in the room goes together, so the host waits for all.
  bool ready = false;

  /// Where they walk on the host's farm, the latest heard (null: not yet).
  FarmWalk? walk;
  int _lastMoveSeq = -1;
  int _lastWalkSeq = -1;
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
///
/// With [hostPlays] false (a dedicated server) nobody plays on the host:
/// guests are members 0..N, each guest gets [LobbyMessage] when the waiting
/// room changes, and the first guest (the leader) asks to set out with
/// [StartRunMessage], which arrives on [startRequests].
final class HostSession {
  HostSession({
    required this.catalog,
    required this.transport,
    this.buildNumber = 0,
    this.codec = const JsonSessionCodec(),
    this.snapshotEvery = const Duration(milliseconds: 100),
    this.hostPlays = true,
    this.hostName = '',
    int? maxGuests,
  }) : catalogHash = computeCatalogHash(catalog),
       maxGuests = maxGuests ?? (hostPlays ? 3 : 4) {
    _packetSub = transport.packets.listen(_onPacket);
    _disconnectSub = transport.peerDisconnected.listen(_onPeerDisconnected);
  }

  final Catalog catalog;
  final String catalogHash;
  final HostTransport transport;
  final int buildNumber;
  final SessionCodec codec;
  final Duration snapshotEvery;
  final bool hostPlays;

  /// The host player's name, first in [LobbyMessage] when [hostPlays].
  final String hostName;

  /// The zone the host picked to set out for, or null while friends only
  /// gather at the farm ([openParty]).
  String? get partyZone => _partyZone;
  String? _partyZone;

  /// When everyone sets out anyway, ready or not (2026-10-22, 사용자: 30 s);
  /// null without a countdown. The owner sets out when it passes.
  DateTime? get departsAt => _departsAt;
  DateTime? _departsAt;
  bool _overSent = false;
  final int maxGuests;

  late final StreamSubscription<SessionPacket> _packetSub;
  late final StreamSubscription<String> _disconnectSub;

  final Map<String, HostedGuest> _guests = {};
  final List<HostedGuest> _guestOrder = [];
  final _guestsChanged = StreamController<List<HostedGuest>>.broadcast();
  final _startRequests = StreamController<String>.broadcast();
  final List<RaidEvent> _hostEvents = [];
  final List<QuickChatLine> _chats = [];
  Map<String, dynamic>? _sharedFarm;
  int _walkSeq = 0;

  /// Quick messages kept for the host's screen until [takeChats]; a dedicated
  /// server never takes them, so only the latest few are kept.
  static const int _keptChats = 10;

  RaidSimulation? _run;
  FixedStepClock? _clock;
  Duration _sinceSnapshot = Duration.zero;
  bool _closed = false;

  /// Guests currently in the room (at the farm or in the run). All of them
  /// set out together.
  List<HostedGuest> get guests => List.unmodifiable(_guestOrder);

  /// Whether every guest is ready to set out (2026-10-22, 사용자).
  bool get allReady => _guestOrder.every((g) => g.ready);

  /// Fires whenever the guest list or a guest's connection changes.
  Stream<List<HostedGuest>> get guestsChanged => _guestsChanged.stream;

  /// Zones the leader asked to set out to (only when not [hostPlays]). The
  /// zone is known to [catalog]; the owner picks the seed and calls
  /// [startRun].
  Stream<String> get startRequests => _startRequests.stream;

  /// The authoritative run once [startRun] has been called.
  RaidSimulation? get run => _run;

  /// Starts the party run with [hostStart] as member 0 and every guest in
  /// the room as members 1..N (nobody stays behind, 2026-10-22, 사용자), and
  /// sends [RunStartedMessage] to each guest.
  /// Without [hostPlays], [hostStart] is left out and guests are 0..N-1.
  RaidSimulation startRun({
    required String zone,
    required int seed,
    RaidMemberStart? hostStart,
    Map<String, MapChunk> chunks = const {},
  }) {
    if (_run != null) throw StateError('Run already started');
    if (hostPlays != (hostStart != null)) {
      throw ArgumentError.value(hostStart, 'hostStart');
    }
    _guestOrder
      ..clear()
      ..addAll(_guests.values);
    // The farm's greetings stay on the farm.
    _chats.clear();
    final starts = <RaidMemberStart>[
      ?hostStart,
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
    _departsAt = null;
    _overSent = false;

    final initialJson = sim.toJson();
    for (var i = 0; i < _guestOrder.length; i++) {
      final guest = _guestOrder[i];
      final memberIndex = hostPlays ? i + 1 : i;
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
    if (sim.isOver) _flushEventsAndResults(sim);
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
    if (sim == null) return;
    // Over already (the host's own last move ended it): only tell everyone.
    if (!sim.isOver) sim.step();
    _flushEventsAndResults(sim);
  }

  void _flushEventsAndResults(RaidSimulation sim) {
    _flushResults(sim);
    if (sim.isOver && !_overSent) {
      _overSent = true;
      _broadcast(SessionChannel.reliable, const RunOverMessage());
    }
  }

  void _flushResults(RaidSimulation sim) {
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

  /// Collects quick messages for the host's screen since the last call,
  /// the host's own included.
  List<QuickChatLine> takeChats() {
    final out = List<QuickChatLine>.of(_chats);
    _chats.clear();
    return out;
  }

  /// Picks [zone] to set out for: everyone at the farm gets ready for it
  /// ([ReadyMessage]); readiness starts over. With a [countdown], everyone
  /// sets out when it ends, ready or not ([departsAt]).
  void openParty(String zone, {Duration countdown = Duration.zero}) {
    if (_run != null || _closed) return;
    _partyZone = zone;
    _departsAt = countdown > Duration.zero
        ? DateTime.now().add(countdown)
        : null;
    _setAllReady(false);
    _broadcast(SessionChannel.reliable, _partyState());
    _notifyGuests();
  }

  PartyStateMessage _partyState() {
    final at = _departsAt;
    final left = at == null ? Duration.zero : at.difference(DateTime.now());
    return PartyStateMessage(
      _partyZone,
      left: left.isNegative ? Duration.zero : left,
    );
  }

  /// Back at the farm after everyone's run ended, the room still open
  /// (2026-10-22, 사용자): guests gather again for the next run. Those
  /// whose link dropped in the run leave the room.
  void returnToFarm() {
    if (_run == null || _closed) return;
    _run = null;
    _clock = null;
    _partyZone = null;
    _departsAt = null;
    _overSent = false;
    _hostEvents.clear();
    _chats.clear();
    for (final g in _guestOrder.where((g) => !g.connected).toList()) {
      _guests.remove(g.peerId);
      _guestOrder.remove(g);
    }
    for (final g in _guestOrder) {
      g
        ..memberIndex = null
        ..ready = false
        ..walk = null
        .._resultSent = false
        .._lastMoveSeq = -1
        .._lastWalkSeq = -1;
    }
    _broadcast(SessionChannel.reliable, const BackToFarmMessage());
    if (_sharedFarm case final farm?) {
      _broadcast(SessionChannel.reliable, FarmViewMessage(farm));
    }
    _notifyGuests();
  }

  /// Takes the pick back: nobody is getting ready.
  void closeParty() {
    if (_run != null || _closed || !hostPlays) return;
    _partyZone = null;
    _departsAt = null;
    _setAllReady(false);
    _broadcast(SessionChannel.reliable, const PartyStateMessage(null));
    _notifyGuests();
  }

  void _setAllReady(bool ready) {
    for (final g in _guestOrder) {
      g.ready = ready;
    }
  }

  /// Shows the host's farm document [farm] to the guests gathering in the
  /// waiting room; a guest who joins later gets the latest one.
  void shareFarm(Map<String, dynamic> farm) {
    if (_run != null || _closed) return;
    _sharedFarm = farm;
    _broadcast(SessionChannel.reliable, FarmViewMessage(farm));
  }

  /// The host player (member 0, first in the lobby) sends [chat] to the
  /// party in a run, or to the visitors on the farm.
  void sendChat(QuickChat chat, {String? text}) {
    if (!hostPlays || _closed) return;
    _relayChat(0, chat, text);
  }

  /// The host player walks on their farm: everyone there sees it
  /// (2026-10-22, 사용자).
  void sendWalk(FarmWalk walk) {
    if (!hostPlays || _run != null || _closed) return;
    _broadcast(
      SessionChannel.unreliable,
      FarmWalkMessage(walk, seq: ++_walkSeq, from: 0),
    );
  }

  /// Where the guests walk on the host's farm, by their place in the lobby
  /// (their party colour).
  Map<int, FarmWalk> get walkers => {
    for (final (i, g) in _guestOrder.indexed) _lobbySlot(i): ?g.walk,
  };

  /// A guest's place in the lobby: after the host when the host plays.
  int _lobbySlot(int guestIndex) => (hostPlays ? 1 : 0) + guestIndex;

  /// The host words a typed message the same for everyone: one line, cut
  /// to [quickChatTextMax], or nothing when empty.
  void _relayChat(int from, QuickChat chat, [String? text]) {
    final words = chat == QuickChat.custom ? quickChatText(text) : null;
    if (chat == QuickChat.custom && words == null) return;
    _chats.add((from: from, chat: chat, text: words));
    if (_chats.length > _keptChats) _chats.removeAt(0);
    _broadcast(
      SessionChannel.reliable,
      QuickChatMessage(chat, from: from, text: words),
    );
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
      case StartRunMessage(:final zone):
        _onStartRun(packet.peerId, zone);
      case ReadyMessage(:final ready, :final start):
        _onReady(packet.peerId, ready, start);
      case QuickChatMessage(:final chat, :final text):
        final guest = _guests[packet.peerId];
        if (guest == null) break;
        // In a run by member index; on the farm by place in the lobby.
        final index = _run != null
            ? guest.memberIndex
            : _lobbySlot(_guestOrder.indexOf(guest));
        if (index != null) _relayChat(index, chat, text);
      case FarmWalkMessage(:final walk, :final seq):
        _onWalk(packet.peerId, walk, seq);
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
    // Back mid-run (the link dropped, the app stayed up): the same member
    // again, with the run as it is now (2026-10-22, 사용자).
    if (_run != null) {
      final back = _guestOrder
          .where(
            (g) =>
                g.memberIndex != null &&
                (g.peerId == peerId ||
                    (msg.playerId.isNotEmpty && g.playerId == msg.playerId)),
          )
          .firstOrNull;
      if (back != null) return _rejoin(back, peerId);
    }
    // The same installation again in the waiting room: it replaces the
    // stale connection it left behind.
    if (_run == null && msg.playerId.isNotEmpty) {
      final stale = _guestOrder
          .where((g) => g.peerId != peerId && g.playerId == msg.playerId)
          .map((g) => g.peerId)
          .toList();
      for (final id in stale) {
        _guests.remove(id);
        _guestOrder.removeWhere((g) => g.peerId == id);
      }
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
    final guest = HostedGuest(
      peerId: peerId,
      start: msg.start,
      playerId: msg.playerId,
    );
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
    if (_sharedFarm case final farm?) {
      _send(peerId, SessionChannel.reliable, FarmViewMessage(farm));
    }
    if (_partyZone != null) {
      _send(peerId, SessionChannel.reliable, _partyState());
    }
    _notifyGuests();
  }

  void _rejoin(HostedGuest guest, String peerId) {
    final sim = _run!;
    final index = guest.memberIndex!;
    _guests.remove(guest.peerId);
    guest
      ..peerId = peerId
      ..connected = true
      .._lastMoveSeq = -1
      .._resultSent = false;
    _guests[peerId] = guest;
    _send(
      peerId,
      SessionChannel.reliable,
      const WelcomeMessage(accepted: true),
    );
    _send(
      peerId,
      SessionChannel.reliable,
      RunStartedMessage(memberIndex: index, runJson: sim.toJson()),
    );
    // A member whose run ended while away gets their result again, and
    // the end of everyone's run if it came.
    _flushEventsAndResults(sim);
    if (_overSent) {
      _send(peerId, SessionChannel.reliable, const RunOverMessage());
    }
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

  void _onWalk(String peerId, FarmWalk walk, int seq) {
    final guest = _guests[peerId];
    if (guest == null || _run != null || seq <= guest._lastWalkSeq) return;
    guest
      ..walk = walk
      .._lastWalkSeq = seq;
    _broadcast(
      SessionChannel.unreliable,
      FarmWalkMessage(
        walk,
        seq: seq,
        from: _lobbySlot(_guestOrder.indexOf(guest)),
      ),
    );
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

  void _onReady(String peerId, bool ready, RaidMemberStart? start) {
    final guest = _guests[peerId];
    if (guest == null || _run != null) return;
    if (start != null) guest.start = start;
    final next = ready && _partyZone != null;
    if (guest.ready == next) return;
    guest.ready = next;
    _notifyGuests();
  }

  void _onStartRun(String peerId, String zone) {
    if (hostPlays || _run != null || _guestOrder.isEmpty) return;
    if (_guestOrder.first.peerId != peerId) return;
    if (!catalog.zones.containsKey(zone)) return;
    _startRequests.add(zone);
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
    if (_run != null) return;
    // With the host playing, they come first and guests follow.
    final first = hostPlays ? 1 : 0;
    final names = [
      if (hostPlays) hostName,
      for (final g in _guestOrder) g.name,
    ];
    final ready = [if (hostPlays) true, for (final g in _guestOrder) g.ready];
    for (final (i, g) in _guestOrder.indexed) {
      _send(
        g.peerId,
        SessionChannel.reliable,
        LobbyMessage((names: names, ready: ready, you: first + i)),
      );
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
    await _startRequests.close();
  }
}
