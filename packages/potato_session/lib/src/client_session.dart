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

  /// The host's connection dropped during a danger run; the scene pauses and
  /// waits up to `hostReconnectTimeout` before voiding the run.
  hostDisconnected,

  /// This guest's run finished normally (extracted, fainted, went home,
  /// starved) and [ClientSession.result] is ready to apply to the guest's farm.
  ended,

  /// The host disconnected in a danger zone and did not come back in time: the
  /// run is void (`multiplayer.md`), so the guest's farm stays as it was
  /// before setting out.
  aborted,
}

typedef _TimedSnapshot = ({Duration at, RaidSnapshot snapshot});

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
    required this.transport,
    required this.start,
    this.buildNumber = 0,
    this.playerId = '',
    this.catalogFiles,
    this.codec = const JsonSessionCodec(),
    this.interpolationDelay = const Duration(milliseconds: 100),
    this.hostReconnectTimeout = const Duration(seconds: 15),
  }) : catalogHash = computeCatalogHash(catalog) {
    _packetSub = transport.packets.listen(_onPacket);
    _connSub = transport.connection.listen(_onConnection);
    if (transport.isConnected) _sendHello();
  }

  final Catalog catalog;
  final String catalogHash;
  final ClientTransport transport;
  final RaidMemberStart start;
  final int buildNumber;

  /// This installation's id, sent in [HelloMessage.playerId].
  final String playerId;

  /// The data files [catalog] was loaded from, sent when a dedicated server
  /// asks for them ([CatalogRequestMessage]). Without them such a server
  /// cannot be joined.
  final Map<String, Object?>? catalogFiles;

  final SessionCodec codec;
  final Duration interpolationDelay;
  final Duration hostReconnectTimeout;

  late final StreamSubscription<({SessionChannel channel, Uint8List bytes})>
  _packetSub;
  late final StreamSubscription<bool> _connSub;

  ClientSessionStage _stage = ClientSessionStage.connecting;
  final _stageController = StreamController<ClientSessionStage>.broadcast();
  SessionJoinRejection? _joinRejection;
  SessionLobby? _lobby;
  final _lobbyController = StreamController<SessionLobby>.broadcast();

  RaidSimulation? _run;
  int _memberIndex = 0;
  FixedStepClock? _clock;
  Duration _clientClock = Duration.zero;
  Duration _disconnectedFor = Duration.zero;
  int _moveSeq = 0;
  Vec2 _lastSentMove = Vec2.zero;
  Vec2 _reconcileError = Vec2.zero;
  bool _helloSent = false;
  bool _closed = false;

  final List<_TimedSnapshot> _snapshots = [];
  final List<RaidEvent> _events = [];
  final List<RaidRejection> _rejections = [];
  final List<QuickChatLine> _chats = [];
  RaidResult? _result;

  ClientSessionStage get stage => _stage;
  Stream<ClientSessionStage> get stageStream => _stageController.stream;

  /// Why the host refused the join, when [stage] is [ClientSessionStage.rejected].
  SessionJoinRejection? get joinRejection => _joinRejection;

  /// Whether the link to the host (or server) is up, and its changes. A
  /// dedicated server's waiting room closes when it drops.
  bool get isConnected => transport.isConnected;
  Stream<bool> get connectionStream => transport.connection;

  /// Who is in a dedicated server's waiting room; null in host mode.
  SessionLobby? get lobby => _lobby;
  Stream<SessionLobby> get lobbyStream => _lobbyController.stream;

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
      if (_disconnectedFor >= hostReconnectTimeout) {
        if (sim != null && !sim.isDanger) {
          // Safe zone: keep what was gathered and go home (`multiplayer.md`).
          _finishSafeDisconnect(sim);
        } else {
          _setStage(ClientSessionStage.aborted);
        }
      }
      return;
    }
    final clock = _clock;
    if (sim == null || clock == null || _stage != ClientSessionStage.playing) {
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
    if (sim.outcome != null) {
      _result ??= sim.result;
      _setStage(ClientSessionStage.ended);
    }
  }

  /// Collects events received from the host since the last call.
  List<RaidEvent> takeEvents() {
    final out = List<RaidEvent>.of(_events);
    _events.clear();
    return out;
  }

  /// Sends [chat] to the party. It shows on this guest's screen right away
  /// (in [takeChats]); the host's relay of it is not shown twice.
  void sendChat(QuickChat chat) {
    if (_run == null || _stage != ClientSessionStage.playing) return;
    _chats.add((from: _memberIndex, chat: chat));
    _send(SessionChannel.reliable, QuickChatMessage(chat));
  }

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
      if (!_helloSent && _stage == ClientSessionStage.connecting) {
        _sendHello();
      } else if (_stage == ClientSessionStage.hostDisconnected) {
        _disconnectedFor = Duration.zero;
        _setStage(ClientSessionStage.playing);
      }
      return;
    }
    final sim = _run;
    if (_stage == ClientSessionStage.playing && sim != null) {
      if (!sim.isDanger) {
        _finishSafeDisconnect(sim);
      } else {
        _disconnectedFor = Duration.zero;
        _setStage(ClientSessionStage.hostDisconnected);
      }
    }
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
    switch (msg) {
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
      case LobbyMessage(:final lobby):
        _lobby = lobby;
        if (!_lobbyController.isClosed) _lobbyController.add(lobby);
      case RunStartedMessage(:final memberIndex, :final runJson):
        _memberIndex = memberIndex;
        final sim = RaidSimulation.fromJson(runJson, catalog)
          ..focusIndex = memberIndex;
        _run = sim;
        _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
        _clientClock = Duration.zero;
        _snapshots
          ..clear()
          ..add((at: Duration.zero, snapshot: RaidSnapshot.fromRun(sim)));
        _setStage(ClientSessionStage.playing);
      case SnapshotMessage(:final snapshot):
        _onSnapshot(snapshot);
      case EventsMessage(:final events):
        _events.addAll(events);
      case QuickChatMessage(:final chat, :final from):
        if (_run != null && from >= 0 && from != _memberIndex) {
          _chats.add((from: from, chat: chat));
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
          _setStage(ClientSessionStage.ended);
        }
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
    _snapshots.add((at: _clientClock, snapshot: snapshot));
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

    final snapA = before.snapshot;
    final snapB = after.snapshot;

    // Other party members and every member's companions.
    for (var i = 0; i < snapB.members.length && i < sim.members.length; i++) {
      final memberB = RaidMember.fromJson(snapB.members[i], catalog);
      final memberA = i < snapA.members.length
          ? RaidMember.fromJson(snapA.members[i], catalog)
          : memberB;
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
          ..player.position = _lerpVec(
            memberA.player.position,
            memberB.player.position,
            t,
          );
      }
      final prevById = {for (final c in memberA.companions) c.id: c};
      dest.companions
        ..clear()
        ..addAll([
          for (final c in memberB.companions)
            c
              ..position = _lerpVec(
                prevById[c.id]?.position ?? c.position,
                c.position,
                t,
              ),
        ]);
    }

    // Enemies.
    final enemyA = {
      for (final e in snapA.enemies) (e['id'] as int): RaidEnemy.fromJson(e),
    };
    sim.enemies
      ..clear()
      ..addAll([
        for (final e in snapB.enemies)
          () {
            final cur = RaidEnemy.fromJson(e);
            final prev = enemyA[cur.id];
            if (prev != null) {
              cur.position = _lerpVec(prev.position, cur.position, t);
            }
            return cur;
          }(),
      ]);

    // Clones and their companions.
    final cloneA = {
      for (final c in snapA.clones)
        (c['id'] as int): RaidClone.fromJson(c, catalog.stackOf),
    };
    sim.clones
      ..clear()
      ..addAll([
        for (final c in snapB.clones)
          () {
            final cur = RaidClone.fromJson(c, catalog.stackOf);
            final prev = cloneA[cur.id];
            if (prev != null) {
              cur.position = _lerpVec(prev.position, cur.position, t);
              final compA = {for (final cc in prev.companions) cc.id: cc};
              for (final cc in cur.companions) {
                if (compA[cc.id] case final prevComp?) {
                  cc.position = _lerpVec(prevComp.position, cc.position, t);
                }
              }
            }
            return cur;
          }(),
      ]);

    // Bullets.
    final bulletA = {
      for (final b in snapA.bullets) (b['id'] as int): RaidBullet.fromJson(b),
    };
    sim.bullets
      ..clear()
      ..addAll([
        for (final b in snapB.bullets)
          () {
            final cur = RaidBullet.fromJson(b);
            final prev = bulletA[cur.id];
            if (prev != null) {
              cur.position = _lerpVec(prev.position, cur.position, t);
            }
            return cur;
          }(),
      ]);
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
  }
}
