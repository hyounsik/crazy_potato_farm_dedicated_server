import 'dart:async';
import 'dart:typed_data';

import 'package:potato_core/potato_core.dart';
import 'package:potato_session/src/session_message.dart';
import 'package:potato_session/src/transport.dart';

/// Where a guest's [ClientSession] stands in its lifecycle.
enum ClientSessionStage {
  /// Waiting for the transport to connect and the host to answer [HelloMessage].
  connecting,

  /// Accepted into the party; waiting for the host to start the run.
  waiting,

  /// Rejected by the host (version/catalog mismatch or party full).
  rejected,

  /// In the run: sending stick/commands, predicting own move, interpolating
  /// snapshots.
  playing,

  /// The host went quiet or its link dropped mid-run, in either zone
  /// (2026-10-24, 사용자: a safe zone waits too, so a host whose app went
  /// down takes the party back): the scene pauses and waits for the host up
  /// to `hostReconnectTimeout`.
  hostDisconnected,

  /// Everyone's run is over ([RunOverMessage]; 2026-10-22, 사용자: whoever
  /// is out first watches until then), or a safe run was lost (given up,
  /// or gone when the host came back), and [ClientSession.result] is ready to apply to the guest's
  /// farm. The host may then take the room back to the farm
  /// ([BackToFarmMessage]: [waiting] again).
  ended,

  /// The host disconnected in a danger zone and did not come back in time: the
  /// run is void (`multiplayer.md`), so the guest's farm stays as it was
  /// before setting out.
  aborted,
}

typedef _TimedSnapshot = ({Duration at, RaidSnapshot snapshot, _Read read});

/// A snapshot's bodies, read once when it arrives (2026-10-28): the screen
/// interpolates between two snapshots every frame, and reading them again
/// each frame made a guest's phone parse every enemy some 120 times a
/// second. Positions are kept apart because interpolation writes the
/// bodies' own.
final class _Read {
  _Read(RaidSnapshot snapshot, Catalog catalog)
    : members = [
        for (final m in snapshot.members) RaidMember.fromJson(m, catalog),
      ],
      enemies = [for (final e in snapshot.enemies) RaidEnemy.fromJson(e)],
      clones = [
        for (final c in snapshot.clones) RaidClone.fromJson(c, catalog.stackOf),
      ],
      clouds = [for (final c in snapshot.clouds) RaidCloud.fromJson(c)],
      bullets = [for (final b in snapshot.bullets) RaidBullet.fromJson(b)] {
    for (final m in members) {
      memberAt.add(m.player.position);
      for (final c in m.companions) {
        companionAt[c.id] = c.position;
      }
    }
    for (final e in enemies) {
      enemyAt[e.id] = e.position;
    }
    for (final c in clones) {
      cloneAt[c.id] = c.position;
      for (final cc in c.companions) {
        cloneCompanionAt[cc.id] = cc.position;
      }
    }
    for (final b in bullets) {
      bulletAt[b.id] = b.position;
    }
    for (final m in members) {
      bodyAt[m.player.id] = m.player.position;
    }
    bodyAt
      ..addAll(companionAt)
      ..addAll(enemyAt)
      ..addAll(cloneAt)
      ..addAll(cloneCompanionAt);
  }

  final List<RaidMember> members;
  final List<RaidEnemy> enemies;
  final List<RaidClone> clones;
  final List<RaidCloud> clouds;
  final List<RaidBullet> bullets;
  final List<Vec2> memberAt = [];
  final Map<int, Vec2> companionAt = {};
  final Map<int, Vec2> enemyAt = {};
  final Map<int, Vec2> cloneAt = {};
  final Map<int, Vec2> cloneCompanionAt = {};
  final Map<int, Vec2> bulletAt = {};

  /// Every body by id, to find where a bullet was fired from.
  final Map<int, Vec2> bodyAt = {};
}

/// Drives a guest's view of a party run hosted by [HostSession].
///
/// Sends [HelloMessage] on connection, builds a local [RaidSimulation] mirror
/// from [RunStartedMessage] with `focusIndex` set to this guest's member,
/// predicts the guest's own movement immediately with `RaidSimulation.predictMove`,
/// and interpolates other bodies [interpolationDelay] behind the latest
/// snapshot (`realtime-session.md`).
final class ClientSession {
  ClientSession({
    required this.catalog,
    required ClientTransport transport,
    required this.start,
    this.buildNumber = 0,
    this.playerId = '',
    this.accountId = '',
    this.catalogFiles,
    this.codec = const JsonSessionCodec(),
    this.interpolationDelay = const Duration(milliseconds: 100),
    this.hostReconnectTimeout = const Duration(seconds: 15),
    this.hostSilence = const Duration(milliseconds: 1500),
    this.bed = const [],
  }) : catalogHash = computeCatalogHash(catalog),
       _transport = transport {
    _listen(transport);
    if (transport.isConnected) _sendHello();
  }

  final Catalog catalog;
  final String catalogHash;

  /// The link to the host now; [resume] swaps in a new one.
  ClientTransport get transport => _transport;
  ClientTransport _transport;
  final RaidMemberStart start;
  final int buildNumber;

  /// The guest's truck bed as they bring it ([HelloMessage.bed]).
  final List<ItemStack?> bed;

  /// This installation's id, sent in [HelloMessage.playerId].
  final String playerId;

  /// The player's account id in host mode, sent in
  /// [HelloMessage.accountId] (empty without one).
  final String accountId;

  /// The data files [catalog] was loaded from, sent when a dedicated server
  /// asks for them ([CatalogRequestMessage]). Without them such a server
  /// cannot be joined.
  final Map<String, Object?>? catalogFiles;

  final SessionCodec codec;
  final Duration interpolationDelay;

  /// How long to wait for the host after the link drops before the run is
  /// lost (void in a danger zone, home with what was gathered in a safe
  /// one); null waits until [giveUp] or a [resume].
  final Duration? hostReconnectTimeout;

  /// How long the host may send nothing mid-run before the guest waits for
  /// it ([ClientSessionStage.hostDisconnected]); null only waits for the
  /// link to drop. The host sends a snapshot every 100ms, and an app that
  /// went down can take its link many seconds to drop (2026-10-24, 사용자:
  /// the guest should know right away). A word from the host plays on.
  final Duration? hostSilence;

  late StreamSubscription<({SessionChannel channel, Uint8List bytes})>
  _packetSub;
  late StreamSubscription<bool> _connSub;

  /// Waiting for the host to take this guest back after [resume].
  bool _resuming = false;

  ClientSessionStage _stage = ClientSessionStage.connecting;
  final _stageController = StreamController<ClientSessionStage>.broadcast();
  SessionJoinRejection? _joinRejection;
  SessionLobby? _lobby;
  final _lobbyController = StreamController<SessionLobby>.broadcast();
  Map<String, dynamic>? _sharedFarm;
  final _farmController = StreamController<Map<String, dynamic>>.broadcast();
  String? _partyZone;
  DateTime? _departsAt;
  final _partyController = StreamController<String?>.broadcast();
  List<TruckBedView> _beds = const [];
  final _bedsController = StreamController<List<TruckBedView>>.broadcast();
  final _bedGifts =
      StreamController<({ItemStack? stack, BedRefusal? refusal})>.broadcast();

  RaidSimulation? _run;
  int _memberIndex = 0;
  FixedStepClock? _clock;
  Duration _clientClock = Duration.zero;
  Duration _disconnectedFor = Duration.zero;
  Duration _quietFor = Duration.zero;
  int _moveSeq = 0;
  Vec2 _lastSentMove = Vec2.zero;
  Vec2 _reconcileError = Vec2.zero;
  bool _helloSent = false;
  bool _closed = false;

  final List<_TimedSnapshot> _snapshots = [];
  final List<RaidEvent> _events = [];
  final List<RaidRejection> _rejections = [];
  final List<QuickChatLine> _chats = [];
  final Map<int, ({FarmWalk walk, int seq})> _walkers = {};
  int _walkSeq = 0;
  RaidResult? _result;

  ClientSessionStage get stage => _stage;
  Stream<ClientSessionStage> get stageStream => _stageController.stream;

  /// Why the host refused the join, when [stage] is [ClientSessionStage.rejected].
  SessionJoinRejection? get joinRejection => _joinRejection;

  /// Whether the link to the host (or server) is up, and its changes. A
  /// dedicated server's waiting room closes when it drops.
  bool get isConnected => transport.isConnected;
  Stream<bool> get connectionStream => transport.connection;

  /// Who is in the waiting room, in party colour order (the host first in
  /// host mode; on a dedicated server the first is the leader).
  SessionLobby? get lobby => _lobby;
  Stream<SessionLobby> get lobbyStream => _lobbyController.stream;

  /// The zone the host picked to set out for, or null.
  String? get partyZone => _partyZone;
  Stream<String?> get partyZoneStream => _partyController.stream;

  /// When everyone sets out anyway, ready or not (null: no countdown).
  DateTime? get departsAt => _departsAt;

  /// Whether this guest said they are ready to set out, as the host has it.
  bool get isReady {
    final lobby = _lobby;
    if (lobby == null) return false;
    return lobby.you < lobby.ready.length && lobby.ready[lobby.you];
  }

  /// Tells the host this guest is ready to set out for the picked zone, or
  /// not any more (2026-10-22, 사용자); the lobby shows it. [start] is what
  /// the guest brings now; it may go without being ready (back from a run).
  void setReady(bool ready, {RaidMemberStart? start}) {
    if (_stage != ClientSessionStage.waiting) return;
    if (_partyZone == null && start == null) return;
    _send(SessionChannel.reliable, ReadyMessage(ready: ready, start: start));
  }

  /// The host's farm document while the party gathers there (host mode).
  Map<String, dynamic>? get sharedFarm => _sharedFarm;
  Stream<Map<String, dynamic>> get sharedFarmStream => _farmController.stream;

  /// Whether this guest leads a dedicated server's waiting room (first in
  /// [lobby]) and so picks the zone and sets out.
  bool get isLeader => _lobby?.you == 0;

  /// Asks a dedicated server to set out to [zone]. Only the leader's request
  /// counts; the run begins with [RunStartedMessage] as in host mode.
  void requestStart(String zone) {
    if (_stage != ClientSessionStage.waiting || !isLeader) return;
    _send(SessionChannel.reliable, StartRunMessage(zone));
  }

  /// The local mirror of the run, with `focusIndex` pointing at this guest's
  /// member so `run.player`, `run.bag`, `run.companions` and `run.signal` all
  /// read this guest's state.
  RaidSimulation? get run => _run;

  int get memberIndex => _memberIndex;

  /// The guest's final result once [stage] is [ClientSessionStage.ended].
  RaidResult? get result => _result ?? _run?.result;

  /// Sets the stick direction, predicts locally on the next [advance], and
  /// sends [MoveMessage] to the host on the unreliable channel.
  void setMove(Vec2 direction) {
    final sim = _run;
    if (sim == null || _stage != ClientSessionStage.playing) return;
    sim.setMove(direction);
    final clamped = sim.members[_memberIndex].move;
    if (clamped == _lastSentMove) return;
    _lastSentMove = clamped;
    _send(
      SessionChannel.unreliable,
      MoveMessage(direction: clamped, seq: ++_moveSeq),
    );
  }

  /// Sends [command] to the host on the reliable channel. Dash is also applied
  /// locally right away so the burst feels immediate.
  void sendCommand(RaidCommand command) {
    final sim = _run;
    if (sim == null || _stage != ClientSessionStage.playing) return;
    if (command is Dash) {
      sim.apply(command);
    }
    _send(SessionChannel.reliable, CommandMessage(command));
  }

  /// Advances local prediction and snapshot interpolation by [elapsed].
  void advance(
    Duration elapsed, {
    Duration maxElapsed = const Duration(milliseconds: 250),
  }) {
    if (_closed) return;
    final sim = _run;
    if (_stage == ClientSessionStage.hostDisconnected) {
      _disconnectedFor += elapsed;
      final timeout = hostReconnectTimeout;
      if (timeout != null && _disconnectedFor >= timeout) _runLost();
      return;
    }
    final clock = _clock;
    if (sim == null || clock == null || _stage != ClientSessionStage.playing) {
      return;
    }
    _quietFor += elapsed;
    final silence = hostSilence;
    if (silence != null && _quietFor >= silence) {
      _disconnectedFor = Duration.zero;
      _setStage(ClientSessionStage.hostDisconnected);
      return;
    }
    final clamped = elapsed > maxElapsed ? maxElapsed : elapsed;
    _clientClock += clamped;
    final steps = clock.advance(clamped, maxElapsed: maxElapsed);
    for (var i = 0; i < steps; i++) {
      sim.predictMove();
      if (!_reconcileError.isZero) {
        final step = _reconcileError * 0.25;
        _reconcileError = _reconcileError - step;
        if (_reconcileError.length < 0.01) _reconcileError = Vec2.zero;
        sim.player.position = sim.map.move(
          sim.player.position,
          step,
          sim.player.radius,
        );
      }
    }
    _interpolate(sim);
    // Out of the run (extracted, fainted...): the result is kept, and the
    // guest watches until everyone's run is over.
    if (sim.outcome != null) _result ??= sim.result;
  }

  /// Every truck bed in the host's room by place in the lobby, the host's
  /// first (2026-10-28); this guest's is at `lobby.you`.
  List<TruckBedView> get beds => _beds;
  Stream<List<TruckBedView>> get bedsStream => _bedsController.stream;

  /// Stacks the host hands this guest: taken from a bed, or not let on one
  /// (with why). The guest puts them on their own side.
  Stream<({ItemStack? stack, BedRefusal? refusal})> get bedGifts =>
      _bedGifts.stream;

  /// Puts [stack] on [owner]'s bed (a place in the lobby). The caller has
  /// taken it off their own side already; what does not go on comes back
  /// in [bedGifts].
  void putInBed(int owner, ItemStack stack) {
    if (_stage != ClientSessionStage.waiting) return;
    _send(SessionChannel.reliable, BedPutMessage(owner: owner, stack: stack));
  }

  /// Asks for the stack of [item] in [owner]'s bed slot [slot], or only
  /// [count] of it; it comes in [bedGifts], or why not. With [into] it goes
  /// straight onto that bed.
  void takeFromBed(int owner, int slot, String item, {int? into, int? count}) {
    if (_stage != ClientSessionStage.waiting) return;
    _send(
      SessionChannel.reliable,
      BedTakeMessage(
        owner: owner,
        slot: slot,
        item: item,
        into: into,
        count: count,
      ),
    );
  }

  /// Opens this guest's own bed to everyone, or locks it again.
  void setBedOpen(bool open) {
    if (_stage != ClientSessionStage.waiting) return;
    _send(SessionChannel.reliable, BedLockMessage(open: open));
  }

  /// Collects events received from the host since the last call.
  List<RaidEvent> takeEvents() {
    final out = List<RaidEvent>.of(_events);
    _events.clear();
    return out;
  }

  /// Sends [chat] to the party in a run, or to everyone on the host's farm
  /// before it. It shows on this guest's screen right away (in
  /// [takeChats]); the host's relay of it is not shown twice. A
  /// [QuickChat.custom] one needs [text] ([quickChatText]).
  void sendChat(QuickChat chat, {String? text}) {
    final words = chat == QuickChat.custom ? quickChatText(text) : null;
    if (chat == QuickChat.custom && words == null) return;
    final int from;
    if (_stage == ClientSessionStage.playing && _run != null) {
      from = _memberIndex;
    } else if (_stage == ClientSessionStage.waiting && _lobby != null) {
      from = _lobby!.you;
    } else {
      return;
    }
    _chats.add((from: from, chat: chat, text: words));
    _send(SessionChannel.reliable, QuickChatMessage(chat, text: words));
  }

  /// This guest walks on the host's farm (2026-10-22, 사용자): sent on
  /// unreliable, the host passes it on to everyone there.
  void sendWalk(FarmWalk walk) {
    if (_stage != ClientSessionStage.waiting) return;
    _send(SessionChannel.unreliable, FarmWalkMessage(walk, seq: ++_walkSeq));
  }

  /// Where the others walk on the host's farm, by their place in the lobby
  /// (their party colour): the host is 0. Forgotten when the lobby changes,
  /// since places move up when someone leaves; everyone sends again soon.
  Map<int, FarmWalk> get walkers => {
    for (final MapEntry(:key, :value) in _walkers.entries) key: value.walk,
  };

  /// Collects quick messages since the last call, this guest's own included.
  List<QuickChatLine> takeChats() {
    final out = List<QuickChatLine>.of(_chats);
    _chats.clear();
    return out;
  }

  /// Collects command rejections received from the host since the last call.
  List<RaidRejection> takeRejections() {
    final out = List<RaidRejection>.of(_rejections);
    _rejections.clear();
    return out;
  }

  void _onConnection(bool connected) {
    if (_closed) return;
    if (connected) {
      if (_resuming) {
        _sendHello();
      } else if (!_helloSent && _stage == ClientSessionStage.connecting) {
        _sendHello();
      } else if (_stage == ClientSessionStage.hostDisconnected) {
        _playOn();
      }
      return;
    }
    if (_stage == ClientSessionStage.playing && _run != null) {
      _disconnectedFor = Duration.zero;
      _setStage(ClientSessionStage.hostDisconnected);
    }
  }

  /// The host is heard from again on the same link.
  void _playOn() {
    _disconnectedFor = Duration.zero;
    _quietFor = Duration.zero;
    _setStage(ClientSessionStage.playing);
  }

  /// The run is not coming back: void in a danger zone (the guest cannot
  /// tell their own link dropping from the host going away), home with what
  /// was gathered in a safe one (`multiplayer.md`).
  void _runLost() {
    _resuming = false;
    final sim = _run;
    if (sim != null && !sim.isDanger) {
      _finishSafeDisconnect(sim);
    } else {
      _setStage(ClientSessionStage.aborted);
    }
  }

  void _listen(ClientTransport transport) {
    _packetSub = transport.packets.listen(_onPacket);
    _connSub = transport.connection.listen(_onConnection);
  }

  /// Takes [transport] in place of the link that dropped mid-run and asks
  /// the host to take this guest back as the same member; the host answers
  /// with the run as it is now (2026-10-22, 사용자). If the run is gone the
  /// stage turns [ClientSessionStage.aborted]. The caller closes the old
  /// transport.
  Future<void> resume(ClientTransport transport) async {
    if (_closed ||
        _run == null ||
        _stage != ClientSessionStage.hostDisconnected) {
      return;
    }
    await _packetSub.cancel();
    await _connSub.cancel();
    _transport = transport;
    _resuming = true;
    _listen(transport);
    if (transport.isConnected) _sendHello();
  }

  /// Stops waiting for the link to come back (2026-10-22, 사용자).
  ///
  /// In a safe zone the guest goes home with what they gathered. In a
  /// danger zone the run is void ([ClientSessionStage.aborted]: back to
  /// before setting out), since the guest cannot tell their own link
  /// dropping from the host going away; but a guest who was down (or
  /// already out) when the link dropped fails, so dropping the link is no
  /// way out of a lost fight. Judged from the last state this guest got.
  void giveUp() {
    final sim = _run;
    if (sim == null || _stage != ClientSessionStage.hostDisconnected) return;
    _resuming = false;
    if (!sim.isDanger) return _finishSafeDisconnect(sim);
    final me = sim.members[_memberIndex];
    if (!me.isDowned && !me.player.isDown && !me.isOut) {
      _setStage(ClientSessionStage.aborted);
      return;
    }
    me.outcome ??= RaidOutcome.fainted;
    _result = sim.resultOf(me);
    _setStage(ClientSessionStage.ended);
  }

  void _finishSafeDisconnect(RaidSimulation sim) {
    final me = sim.members[_memberIndex];
    me.outcome ??= RaidOutcome.wentHome;
    _result = sim.resultOf(me);
    _setStage(ClientSessionStage.ended);
  }

  void _sendHello() {
    _helloSent = true;
    _send(
      SessionChannel.reliable,
      HelloMessage(
        buildNumber: buildNumber,
        catalogHash: catalogHash,
        start: start,
        playerId: playerId,
        accountId: accountId,
        bed: bed,
      ),
    );
  }

  void _onPacket(({SessionChannel channel, Uint8List bytes}) packet) {
    if (_closed) return;
    final SessionMessage msg;
    try {
      msg = codec.decode(packet.bytes);
    } on Object {
      return;
    }
    _quietFor = Duration.zero;
    switch (msg) {
      case WelcomeMessage(:final accepted) when _resuming:
        // Taken back: the run follows. Turned away: the run is gone.
        if (!accepted) _runLost();
      case LobbyMessage() when _resuming:
        // A new waiting room instead of the run: the run is over.
        _runLost();
      case WelcomeMessage(:final accepted, :final rejection):
        if (accepted) {
          _setStage(ClientSessionStage.waiting);
        } else {
          _joinRejection = rejection ?? SessionJoinRejection.versionMismatch;
          _setStage(ClientSessionStage.rejected);
        }
      case CatalogRequestMessage():
        final files = catalogFiles;
        if (files == null) {
          _joinRejection = SessionJoinRejection.versionMismatch;
          _setStage(ClientSessionStage.rejected);
        } else {
          _send(SessionChannel.reliable, CatalogMessage({...files}));
        }
      case PartyStateMessage(:final zone, :final left):
        _partyZone = zone;
        _departsAt = left > Duration.zero ? DateTime.now().add(left) : null;
        if (!_partyController.isClosed) _partyController.add(zone);
      case FarmViewMessage(:final farm):
        _sharedFarm = farm;
        if (!_farmController.isClosed) _farmController.add(farm);
      case LobbyMessage(:final lobby):
        _lobby = lobby;
        _walkers.clear();
        if (!_lobbyController.isClosed) _lobbyController.add(lobby);
      case RunStartedMessage(:final memberIndex, :final runJson):
        // First start, or the run as it is now after [resume].
        _resuming = false;
        _disconnectedFor = Duration.zero;
        _reconcileError = Vec2.zero;
        _lastSentMove = Vec2.zero;
        _memberIndex = memberIndex;
        _result = null;
        // The farm's greetings and walkers stay on the farm.
        _chats.clear();
        _walkers.clear();
        final sim = RaidSimulation.fromJson(runJson, catalog)
          ..focusIndex = memberIndex;
        _run = sim;
        _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
        _clientClock = Duration.zero;
        final first = RaidSnapshot.fromRun(sim);
        _snapshots
          ..clear()
          ..add((
            at: Duration.zero,
            snapshot: first,
            read: _Read(first, catalog),
          ));
        _setStage(ClientSessionStage.playing);
      case SnapshotMessage(:final snapshot):
        if (_stage == ClientSessionStage.hostDisconnected && !_resuming) {
          _playOn();
        }
        _onSnapshot(snapshot);
      case EventsMessage(:final events):
        _events.addAll(events);
      case QuickChatMessage(:final chat, :final from, :final text):
        // Own messages show when sent, not again when relayed.
        final me = _run != null ? _memberIndex : _lobby?.you;
        final words = chat == QuickChat.custom ? quickChatText(text) : null;
        if (chat == QuickChat.custom && words == null) break;
        if (from >= 0 && from != me) {
          _chats.add((from: from, chat: chat, text: words));
        }
      case FarmWalkMessage(:final walk, :final seq, :final from):
        final last = _walkers[from]?.seq ?? -1;
        if (_run == null && from >= 0 && from != _lobby?.you && seq > last) {
          _walkers[from] = (walk: walk, seq: seq);
        }
      case CommandRejectedMessage(:final rejection):
        _rejections.add(rejection);
      case MemberResultMessage(:final memberIndex, :final result):
        if (memberIndex == _memberIndex) {
          _result = result;
          final sim = _run;
          if (sim != null && memberIndex < sim.members.length) {
            sim.members[memberIndex].outcome = result.outcome;
          }
        }
      case BedsMessage(:final beds):
        _beds = beds;
        if (!_bedsController.isClosed) _bedsController.add(beds);
      case BedGiveMessage(:final stack, :final refusal):
        if (!_bedGifts.isClosed) {
          _bedGifts.add((stack: stack, refusal: refusal));
        }
      case RunOverMessage():
        _setStage(ClientSessionStage.ended);
      case BackToFarmMessage():
        _run = null;
        _clock = null;
        _snapshots.clear();
        _walkers.clear();
        _chats.clear();
        _partyZone = null;
        _departsAt = null;
        if (!_partyController.isClosed) _partyController.add(null);
        _setStage(ClientSessionStage.waiting);
      default:
        break;
    }
  }

  void _onSnapshot(RaidSnapshot snapshot) {
    final sim = _run;
    if (sim == null) return;
    if (_snapshots.isNotEmpty &&
        snapshot.tick <= _snapshots.last.snapshot.tick) {
      return;
    }
    _snapshots.add((
      at: _clientClock,
      snapshot: snapshot,
      read: _Read(snapshot, catalog),
    ));
    while (_snapshots.length > 12) {
      _snapshots.removeAt(0);
    }
    // Apply world items, piles, exits and own authoritative state right away.
    sim.piles
      ..clear()
      ..addAll([for (final p in snapshot.piles) RaidPile.fromJson(p)]);
    sim.floorItems
      ..clear()
      ..addAll([
        for (final f in snapshot.floorItems) RaidFloorItem.fromJson(f),
      ]);
    sim.exits
      ..clear()
      ..addAll([for (final e in snapshot.exits) RaidExit.fromJson(e)]);

    if (_memberIndex < snapshot.members.length &&
        _memberIndex < sim.members.length) {
      final auth = RaidMember.fromJson(snapshot.members[_memberIndex], catalog);
      final me = sim.members[_memberIndex];
      final predictedPos = me.player.position;
      final predictedFacing = me.player.facing;
      final move = me.move;
      me
        ..bag = auth.bag
        ..signal = auth.signal
        ..kept = auth.kept
        ..outcome = auth.outcome
        ..downLeft = auth.downLeft
        ..revive = auth.revive
        ..player.hp = auth.player.hp
        ..player.equipped = auth.player.equipped
        ..player.weapon = auth.player.weapon
        ..player.weaponLevel = auth.player.weaponLevel
        ..player.sinceHit = auth.player.sinceHit
        ..player.hungrySeconds = auth.player.hungrySeconds
        ..player.aimTarget = auth.player.aimTarget
        ..player.aimProgress = auth.player.aimProgress;
      // Reconcile predicted position with the host's authoritative position.
      final diff = auth.player.position - predictedPos;
      if (diff.length > 1.5 || auth.player.isDashing) {
        me.player.position = auth.player.position;
        _reconcileError = Vec2.zero;
      } else if (diff.length > 0.05) {
        _reconcileError = diff;
      } else {
        _reconcileError = Vec2.zero;
      }
      if (!move.isZero) me.player.facing = predictedFacing;
    }
    sim.applySnapshotMeta(tick: snapshot.tick, revealed: snapshot.revealed);
  }

  void _interpolate(RaidSimulation sim) {
    if (_snapshots.isEmpty) return;
    final targetTime = _clientClock > interpolationDelay
        ? _clientClock - interpolationDelay
        : Duration.zero;
    _TimedSnapshot before = _snapshots.first;
    _TimedSnapshot after = _snapshots.last;
    for (var i = 0; i < _snapshots.length - 1; i++) {
      final a = _snapshots[i];
      final b = _snapshots[i + 1];
      if (a.at <= targetTime && targetTime <= b.at) {
        before = a;
        after = b;
        break;
      }
    }
    if (targetTime >= _snapshots.last.at) {
      before = _snapshots.last;
      after = _snapshots.last;
    }
    final span = (after.at - before.at).inMicroseconds;
    final t = span <= 0
        ? 1.0
        : ((targetTime - before.at).inMicroseconds / span).clamp(0.0, 1.0);

    final a = before.read;
    final b = after.read;
    Vec2 lerp(Vec2? from, Vec2 to) => from == null ? to : _lerpVec(from, to, t);

    // Other party members and every member's companions.
    for (var i = 0; i < b.members.length && i < sim.members.length; i++) {
      final memberB = b.members[i];
      final dest = sim.members[i];
      if (i != _memberIndex) {
        dest
          ..bag = memberB.bag
          ..signal = memberB.signal
          ..outcome = memberB.outcome
          ..downLeft = memberB.downLeft
          ..revive = memberB.revive
          ..player.hp = memberB.player.hp
          ..player.facing = memberB.player.facing
          ..player.weapon = memberB.player.weapon
          ..player.equipped = memberB.player.equipped
          ..player.position = lerp(
            i < a.memberAt.length ? a.memberAt[i] : null,
            b.memberAt[i],
          );
      }
      for (final c in memberB.companions) {
        c.position = lerp(a.companionAt[c.id], b.companionAt[c.id]!);
      }
      dest.companions
        ..clear()
        ..addAll(memberB.companions);
    }

    // Enemies.
    for (final e in b.enemies) {
      e.position = lerp(a.enemyAt[e.id], b.enemyAt[e.id]!);
    }
    sim.enemies
      ..clear()
      ..addAll(b.enemies);

    // Clones and their companions.
    for (final c in b.clones) {
      c.position = lerp(a.cloneAt[c.id], b.cloneAt[c.id]!);
      for (final cc in c.companions) {
        cc.position = lerp(
          a.cloneCompanionAt[cc.id],
          b.cloneCompanionAt[cc.id]!,
        );
      }
    }
    sim.clones
      ..clear()
      ..addAll(b.clones);

    // Boss clouds stay put: the latest as they are.
    sim.clouds
      ..clear()
      ..addAll(b.clouds);

    // Bullets fly straight, too fast for snapshots a tenth of a second
    // apart (a rapid shot lives about 0.27 s): each is flown from where the
    // newer snapshot saw it at its own speed (2026-10-28, 사용자: rapid
    // fire stuttered). One the older snapshot had not seen yet starts from
    // whoever fired it, and none flies past the distance it had left.
    final ahead = (targetTime - after.at).inMicroseconds / 1e6;
    sim.bullets
      ..clear()
      ..addAll([
        for (final bullet in b.bullets)
          if (_flown(bullet, a, b, ahead) case final at?) bullet..position = at,
      ]);
  }

  /// Where [bullet] is [ahead] seconds after snapshot [b] saw it (behind it
  /// when negative), or null while it is not out of the gun yet or already
  /// spent.
  static Vec2? _flown(RaidBullet bullet, _Read a, _Read b, double ahead) {
    final seen = b.bulletAt[bullet.id]!;
    final speed = bullet.velocity.length;
    if (ahead * speed > bullet.remaining) return null;
    if (ahead < 0 && !a.bulletAt.containsKey(bullet.id)) {
      final from = b.bodyAt[bullet.owner];
      if (from != null && -ahead * speed > seen.distanceTo(from)) return null;
    }
    return seen + bullet.velocity * ahead;
  }

  static Vec2 _lerpVec(Vec2 a, Vec2 b, double t) =>
      Vec2(a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t);

  void _setStage(ClientSessionStage next) {
    if (_stage == next) return;
    _stage = next;
    if (!_stageController.isClosed) _stageController.add(next);
  }

  void _send(SessionChannel channel, SessionMessage message) {
    transport.send(channel, codec.encode(message));
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    await _packetSub.cancel();
    await _connSub.cancel();
    await _stageController.close();
    await _lobbyController.close();
    await _farmController.close();
    await _partyController.close();
    await _bedsController.close();
    await _bedGifts.close();
  }
}
