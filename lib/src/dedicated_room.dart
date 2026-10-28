import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:potato_session/potato_session.dart';
import 'package:potato_session/zlib_codec.dart';

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
final class DedicatedRoom {
  DedicatedRoom({
    required this.transport,
    this.codec = const ZlibSessionCodec(),
    this.tickEvery = const Duration(milliseconds: 16),
    this.emptyRunGrace = const Duration(minutes: 2),
    this.log,
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
      relay.deliver(packet);
      return;
    }
    final SessionMessage msg;
    try {
      msg = codec.decode(packet.bytes);
    } on Object {
      return;
    }
    switch (msg) {
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
  }

  void _startRun(String zone) {
    final session = _session;
    if (session == null || session.run != null) return;
    final seed = _random.nextInt(1 << 32);
    session.startRun(zone: zone, seed: seed);
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
    }
    unawaited(
      _closeSession().then((_) {
        if (!_closed && _catalog != null) _openWaitingRoom();
      }),
    );
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
