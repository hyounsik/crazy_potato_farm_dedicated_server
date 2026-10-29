import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:potato_dedicated_server/src/dedicated_world.dart';
import 'package:potato_session/potato_session.dart';
import 'package:potato_session/zlib_codec.dart';

/// Why [DedicatedRoom.moveKit] did not move a kit.
enum KitMoveRefusal {
  /// The server keeps no farm yet.
  noFarm,

  /// The kit's player has none here, or it would go to the same id.
  unknownPlayer,

  /// A run is going: wait until everyone is home.
  runGoing,

  /// One of the two is in the waiting room or the run: kick them first.
  inRoom,
}

/// The one exploration party a dedicated server hosts at a time.
///
/// The server ships without game data (it is unreleased content, kept out of
/// this public repository), so the room starts empty. The first guest to say
/// hello is asked for its catalog ([CatalogRequestMessage]); once that loads
/// and matches the guest's own catalog hash, the room opens a [HostSession]
/// with nobody playing on the server and replays the waiting hellos into it.
/// Later guests must match that build number and catalog hash.
///
/// The first guest leads: when they ask to set out, the room starts the run
/// with a fresh seed and steps it on a timer. When every connected member is
/// out, the room opens a new waiting room on the same catalog. When nobody is
/// connected any more, it forgets the catalog so an updated app can bring
/// its own.
///
/// With a [world] the room also keeps the server's one shared farm
/// (2026-10-28, 사용자): the game data stays with the world, so a guest on
/// the same data comes in without sending it again; guests' farm commands
/// go to the world, each acting with their own kit; and the farm and each
/// guest's kit are sent out as they change. A run over goes back to the
/// farm in the same room instead of a new one.
final class DedicatedRoom {
  DedicatedRoom({
    required this.transport,
    this.codec = const ZlibSessionCodec(),
    this.tickEvery = const Duration(milliseconds: 16),
    this.emptyRunGrace = const Duration(minutes: 2),
    this.log,
    this.world,
    this.shareEvery = const Duration(milliseconds: 500),
    Random? random,
  }) : _random = random ?? Random() {
    _packetSub = transport.packets.listen(_onPacket);
    _connectSub = transport.peerConnected.listen(_connected.add);
    _disconnectSub = transport.peerDisconnected.listen(_onPeerDisconnected);
  }

  final HostTransport transport;
  final SessionCodec codec;

  /// How often the run is stepped while it is going.
  final Duration tickEvery;

  /// How long a run goes on with nobody connected, so a guest whose link
  /// dropped can come back to it (2026-10-22 *(제안)*).
  final Duration emptyRunGrace;

  /// Where the room reports what happens (catalog in, run started, reset).
  final void Function(String message)? log;

  /// The server's shared farm, when it keeps one.
  final DedicatedWorld? world;

  /// How often at most the farm is sent out while it keeps changing.
  final Duration shareEvery;

  final List<StreamSubscription<void>> _worldSubs = [];
  Timer? _shareTimer;

  final Random _random;

  late final StreamSubscription<SessionPacket> _packetSub;
  late final StreamSubscription<String> _connectSub;
  late final StreamSubscription<String> _disconnectSub;

  final Set<String> _connected = {};

  /// Hellos that arrived before the room had a catalog, by peer.
  final Map<String, SessionPacket> _pendingHellos = {};

  Catalog? _catalog;
  int _buildNumber = 0;
  HostSession? _session;
  _RoomTransport? _relay;
  StreamSubscription<String>? _startSub;
  Timer? _ticker;
  final Stopwatch _sinceTick = Stopwatch();
  Duration _emptyFor = Duration.zero;
  bool _closed = false;

  /// The waiting room or run now, once a guest has brought a catalog.
  HostSession? get session => _session;

  /// The catalog the room runs on, or null until a guest brings one.
  Catalog? get catalog => _catalog;

  void _onPacket(SessionPacket packet) {
    if (_closed) return;
    final relay = _relay;
    if (relay != null) {
      // Farm commands are the world's, between runs; the rest is the
      // session's.
      if (world != null && _session?.run == null) {
        if (_decode(packet) case final FarmCommandMessage msg) {
          return _onFarmCommand(packet.peerId, msg.command);
        }
      }
      relay.deliver(packet);
      return;
    }
    final msg = _decode(packet);
    switch (msg) {
      case HelloMessage(:final catalogHash, :final buildNumber)
          when world?.catalog != null && world?.catalogHash == catalogHash:
        // The world already has this game data.
        _catalog = world!.catalog;
        _buildNumber = buildNumber;
        log?.call('Game data $catalogHash from the world');
        _openWaitingRoom();
        _relay!.deliver(packet);
      case HelloMessage():
        _pendingHellos[packet.peerId] = packet;
        _send(packet.peerId, const CatalogRequestMessage());
      case CatalogMessage(:final files):
        _onCatalog(packet.peerId, files);
      default:
        break;
    }
  }

  void _onCatalog(String peerId, Map<String, dynamic> files) {
    final helloPacket = _pendingHellos[peerId];
    if (helloPacket == null) return;
    final hello = codec.decode(helloPacket.bytes) as HelloMessage;
    final CatalogLoadResult loaded;
    try {
      loaded = Catalog.load(files);
    } on Object {
      return _reject(peerId);
    }
    final catalog = loaded.catalog;
    if (catalog == null || computeCatalogHash(catalog) != hello.catalogHash) {
      return _reject(peerId);
    }
    _catalog = catalog;
    _buildNumber = hello.buildNumber;
    if (world case final world?) {
      unawaited(
        world.adoptCatalog(
          catalog: catalog,
          files: files,
          hash: hello.catalogHash,
          buildNumber: hello.buildNumber,
        ),
      );
    }
    log?.call(
      'Catalog ${hello.catalogHash} (build ${hello.buildNumber}) '
      'from $peerId',
    );
    _openWaitingRoom();
    final waiting = _pendingHellos.values.toList();
    _pendingHellos.clear();
    for (final packet in waiting) {
      _relay!.deliver(packet);
    }
  }

  void _reject(String peerId) {
    _pendingHellos.remove(peerId);
    _send(
      peerId,
      const WelcomeMessage(
        accepted: false,
        rejection: SessionJoinRejection.versionMismatch,
      ),
    );
  }

  void _openWaitingRoom() {
    final relay = _RoomTransport(transport);
    final session = HostSession(
      catalog: _catalog!,
      transport: relay,
      buildNumber: _buildNumber,
      codec: codec,
      hostPlays: false,
    );
    _relay = relay;
    _session = session;
    _startSub = session.startRequests.listen(_startRun);
    if (world case final world?) {
      _worldSubs
        ..add(world.changes.listen((_) => _shareSoon()))
        ..add(session.guestsChanged.listen((_) => _shareSoon()))
        ..add(session.memberResults.listen(_bringHome));
      _shareFarm();
    }
  }

  SessionMessage? _decode(SessionPacket packet) {
    try {
      return codec.decode(packet.bytes);
    } on Object {
      return null;
    }
  }

  /// Hands player [from]'s kit to [to] for the admin page, when someone
  /// came back under a new installation id (2026-10-29, 사용자). Only while
  /// no run is going and neither is in the room: a run takes copies of the
  /// bag along and puts what it brings back into whoever set out, so a move
  /// meanwhile would copy the kit. Null when it moved.
  Future<KitMoveRefusal?> moveKit(String from, String to) async {
    final world = this.world;
    final room = world?.room;
    if (world == null || room == null) return KitMoveRefusal.noFarm;
    if (from == to || !room.players.contains(from)) {
      return KitMoveRefusal.unknownPlayer;
    }
    final session = _session;
    if (session?.run != null) return KitMoveRefusal.runGoing;
    for (final g in session?.guests ?? const <HostedGuest>[]) {
      final player = g.playerId.isEmpty ? g.peerId : g.playerId;
      if (player == from || player == to) return KitMoveRefusal.inRoom;
    }
    await world.moveKit(from, to);
    log?.call('Kit of $from moved to $to');
    return null;
  }

  /// The player id of the guest on link [peerId]: their installation id,
  /// or the link itself without one.
  String? _playerOf(String peerId) {
    for (final g in _session?.guests ?? const <HostedGuest>[]) {
      if (g.peerId == peerId) return g.playerId.isEmpty ? peerId : g.playerId;
    }
    return null;
  }

  void _onFarmCommand(String peerId, FarmCommand command) {
    final player = _playerOf(peerId);
    final reply = player == null ? null : world?.apply(player, command);
    if (reply == null) return;
    _send(
      peerId,
      FarmReplyMessage(refused: reply.refused, rejection: reply.rejection),
    );
    _sendKit(peerId, player!);
  }

  void _sendKit(String peerId, String player) {
    final room = world?.room;
    if (room == null) return;
    _send(peerId, KitMessage(room.kitOf(player).toJson()));
  }

  /// What guest [guest] sets out with from the shared farm: their own
  /// kit's gear and bag, and the farm's potatoes they asked for, which
  /// leave the farm until they come back (2026-10-28, 사용자: each goes with
  /// their own bag and gear). The app's own idea of its gear and bag is not
  /// trusted. Potatoes that cannot go stay home.
  RaidMemberStart _startFromKit(FarmRoom room, HostedGuest guest, String zone) {
    final player = guest.playerId.isEmpty ? guest.peerId : guest.playerId;
    final kit = room.kitOf(player);
    final asked = [for (final c in guest.start.companions) c.potatoId];
    final modes = {for (final c in guest.start.companions) c.potatoId: c.mode};
    var going = asked;
    var start = memberStartFor(
      room.farm,
      name: guest.start.name,
      food: 0,
      potatoIds: going,
      modes: modes,
      kit: kit,
    );
    final departed = room.apply(
      player,
      FarmCommand.depart(zone: zone, food: 0, potatoIds: going),
    );
    if (departed.rejection != null && going.isNotEmpty) {
      log?.call('${guest.start.name}: companions stay (${departed.rejection})');
      going = const [];
      start = memberStartFor(
        room.farm,
        name: guest.start.name,
        food: 0,
        kit: kit,
      );
      room.apply(player, FarmCommand.depart(zone: zone, food: 0));
    }
    return start;
  }

  /// A guest's run is over: what they bring goes into their own bag, and
  /// the farm's potatoes come back to it (or are lost in a failed danger
  /// run).
  void _bringHome(({HostedGuest guest, RaidResult result}) done) {
    final room = world?.room;
    final catalog = world?.catalog;
    if (room == null || catalog == null) return;
    final guest = done.guest;
    final player = guest.playerId.isEmpty ? guest.peerId : guest.playerId;
    final reply = room.apply(
      player,
      done.result.homecoming(catalog, toBag: true),
    );
    if (reply.rejection != null) {
      log?.call(
        '${guest.start.name}: could not come home (${reply.rejection})',
      );
    }
  }

  /// Sends the farm out soon, once however often it changes meanwhile.
  void _shareSoon() {
    _shareTimer ??= Timer(shareEvery, () {
      _shareTimer = null;
      _shareFarm();
    });
  }

  /// Shows the shared farm to everyone here, and each their own kit.
  void _shareFarm() {
    final session = _session;
    final room = world?.room;
    if (session == null || room == null || session.run != null) return;
    session.shareFarm(FarmDocument.of(room.farm).toJson());
    for (final g in session.guests) {
      if (!g.connected) continue;
      _sendKit(g.peerId, g.playerId.isEmpty ? g.peerId : g.playerId);
    }
  }

  void _startRun(String zone) {
    final session = _session;
    if (session == null || session.run != null) return;
    final seed = _random.nextInt(1 << 32);
    final farmRoom = world?.room;
    session.startRun(
      zone: zone,
      seed: seed,
      startOf: farmRoom == null
          ? null
          : (g) => _startFromKit(farmRoom, g, zone),
    );
    log?.call('Run to $zone with ${session.guests.length} (seed $seed)');
    _sinceTick
      ..reset()
      ..start();
    _emptyFor = Duration.zero;
    _ticker = Timer.periodic(tickEvery, (_) => _tick());
  }

  void _tick() {
    final session = _session;
    final run = session?.run;
    if (session == null || run == null) return;
    final elapsed = _sinceTick.elapsed;
    _sinceTick
      ..reset()
      ..start();
    session.advance(elapsed);
    // A guest who dropped stays in the world defenseless and may come back
    // (`HostSession` takes them back as the same member). The run is done
    // for the room once everyone still here is out; with nobody here it
    // waits [emptyRunGrace] for someone to come back.
    final stillHere = [
      for (final g in session.guests)
        if (g.connected && g.memberIndex != null) run.members[g.memberIndex!],
    ];
    if (!run.isOver && stillHere.isEmpty) {
      _emptyFor += elapsed;
      if (_emptyFor < emptyRunGrace) return;
      log?.call('Nobody came back');
      if (_connected.isEmpty) _catalog = null;
    } else {
      _emptyFor = Duration.zero;
      if (!run.isOver && !stillHere.every((m) => m.isOut)) return;
      log?.call('Run over');
      // With a farm, everyone is back on it in the same room (2026-10-29,
      // 사용자): saying hello again mid-run would put a guest back in it.
      if (world != null) return _backToFarm(session);
    }
    unawaited(
      _closeSession().then((_) {
        if (!_closed && _catalog != null) _openWaitingRoom();
      }),
    );
  }

  void _backToFarm(HostSession session) {
    _ticker?.cancel();
    _ticker = null;
    _sinceTick.stop();
    session.returnToFarm();
    _shareFarm();
  }

  void _onPeerDisconnected(String peerId) {
    _connected.remove(peerId);
    _pendingHellos.remove(peerId);
    _relay?.disconnect(peerId);
    // A run in progress keeps going for a guest to come back to; [_tick]
    // ends it.
    final run = _session?.run;
    if (run != null && !run.isOver) return;
    if (_connected.isEmpty && (_session != null || _catalog != null)) {
      log?.call('Everyone left; waiting for a new catalog');
      _catalog = null;
      unawaited(_closeSession());
    }
  }

  Future<void> _closeSession() async {
    _ticker?.cancel();
    _ticker = null;
    _shareTimer?.cancel();
    _shareTimer = null;
    for (final sub in _worldSubs) {
      await sub.cancel();
    }
    _worldSubs.clear();
    _sinceTick.stop();
    final session = _session;
    final relay = _relay;
    final startSub = _startSub;
    _session = null;
    _relay = null;
    _startSub = null;
    await startSub?.cancel();
    await session?.close();
    await relay?.close();
  }

  void _send(String peerId, SessionMessage message) {
    transport.send(peerId, SessionChannel.reliable, codec.encode(message));
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    await _closeSession();
    await _packetSub.cancel();
    await _connectSub.cancel();
    await _disconnectSub.cancel();
  }
}

/// The room's view of the server transport for one [HostSession]: packets
/// and drops are handed in by the room (so hellos that came before the
/// catalog can be replayed), sends go straight out. Closing it leaves the
/// guests' connections open for the next waiting room.
final class _RoomTransport implements HostTransport {
  _RoomTransport(this._inner);

  final HostTransport _inner;
  final _packets = StreamController<SessionPacket>.broadcast(sync: true);
  final _peerConnected = StreamController<String>.broadcast();
  final _peerDisconnected = StreamController<String>.broadcast(sync: true);

  void deliver(SessionPacket packet) {
    if (!_packets.isClosed) _packets.add(packet);
  }

  void disconnect(String peerId) {
    if (!_peerDisconnected.isClosed) _peerDisconnected.add(peerId);
  }

  @override
  Stream<SessionPacket> get packets => _packets.stream;

  @override
  Stream<String> get peerConnected => _peerConnected.stream;

  @override
  Stream<String> get peerDisconnected => _peerDisconnected.stream;

  @override
  void send(String peerId, SessionChannel channel, Uint8List bytes) =>
      _inner.send(peerId, channel, bytes);

  @override
  void broadcast(SessionChannel channel, Uint8List bytes) =>
      _inner.broadcast(channel, bytes);

  @override
  Future<void> close() async {
    await _packets.close();
    await _peerConnected.close();
    await _peerDisconnected.close();
  }
}
