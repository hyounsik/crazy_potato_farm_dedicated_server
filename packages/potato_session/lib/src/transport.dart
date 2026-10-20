import 'dart:async';
import 'dart:typed_data';

/// The two data paths between the host and a guest (`realtime-session.md`).
enum SessionChannel {
  /// Ordered, guaranteed delivery: handshake, commands, events, run results.
  reliable,

  /// Unordered, no retransmission: stick input and periodic state snapshots.
  /// A lost packet is replaced by the next one.
  unreliable,
}

/// A message arriving from a peer on [channel].
typedef SessionPacket = ({
  String peerId,
  SessionChannel channel,
  Uint8List bytes,
});

/// Transport on the host side: talks to up to three guests in a star layout.
///
/// Host mode injects a WebRTC implementation; the dedicated server injects a
/// WebSocket one; tests use [InMemorySessionNetwork].
abstract interface class HostTransport {
  /// Packets arriving from any connected guest.
  Stream<SessionPacket> get packets;

  /// Fires when a guest's connection is ready to carry reliable messages.
  Stream<String> get peerConnected;

  /// Fires when a guest's connection drops.
  Stream<String> get peerDisconnected;

  /// Sends [bytes] to guest [peerId] on [channel]. Drops silently if the
  /// guest is not connected.
  void send(String peerId, SessionChannel channel, Uint8List bytes);

  /// Sends [bytes] to every connected guest on [channel].
  void broadcast(SessionChannel channel, Uint8List bytes);

  Future<void> close();
}

/// Transport on a guest's side: talks only to the host.
abstract interface class ClientTransport {
  /// Packets arriving from the host.
  Stream<({SessionChannel channel, Uint8List bytes})> get packets;

  /// Fires `true` when connected to the host and `false` when the connection
  /// drops.
  Stream<bool> get connection;

  bool get isConnected;

  /// Sends [bytes] to the host on [channel].
  void send(SessionChannel channel, Uint8List bytes);

  Future<void> close();
}

/// An in-memory star network for tests and local verification, with optional
/// packet loss on the unreliable channel and manual disconnect simulation.
final class InMemorySessionNetwork {
  final _hostPackets = StreamController<SessionPacket>.broadcast();
  final _peerConnected = StreamController<String>.broadcast();
  final _peerDisconnected = StreamController<String>.broadcast();
  final Map<String, _InMemoryClient> _clients = {};
  bool _closed = false;

  /// When true, unreliable packets are dropped to test recovery.
  bool dropUnreliable = false;

  late final HostTransport host = _InMemoryHost(this);

  /// Connects a new guest with [peerId] to [host].
  ClientTransport connectClient(String peerId) {
    final client = _InMemoryClient(this, peerId);
    _clients[peerId] = client;
    scheduleMicrotask(() {
      if (_closed || !_clients.containsKey(peerId)) return;
      client._setConnected(true);
      _peerConnected.add(peerId);
    });
    return client;
  }

  /// Simulates guest [peerId]'s connection dropping.
  void disconnectClient(String peerId) {
    final client = _clients.remove(peerId);
    if (client == null) return;
    client._setConnected(false);
    if (!_closed) _peerDisconnected.add(peerId);
  }

  /// Simulates the host's connection dropping for every guest.
  void disconnectHost() {
    for (final client in _clients.values.toList()) {
      client._setConnected(false);
    }
    _clients.clear();
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    disconnectHost();
    await _hostPackets.close();
    await _peerConnected.close();
    await _peerDisconnected.close();
  }
}

final class _InMemoryHost implements HostTransport {
  _InMemoryHost(this._net);

  final InMemorySessionNetwork _net;

  @override
  Stream<SessionPacket> get packets => _net._hostPackets.stream;

  @override
  Stream<String> get peerConnected => _net._peerConnected.stream;

  @override
  Stream<String> get peerDisconnected => _net._peerDisconnected.stream;

  @override
  void send(String peerId, SessionChannel channel, Uint8List bytes) {
    if (_net._closed) return;
    if (channel == SessionChannel.unreliable && _net.dropUnreliable) return;
    final client = _net._clients[peerId];
    if (client == null || !client.isConnected) return;
    client._packets.add((channel: channel, bytes: Uint8List.fromList(bytes)));
  }

  @override
  void broadcast(SessionChannel channel, Uint8List bytes) {
    for (final peerId in _net._clients.keys.toList()) {
      send(peerId, channel, bytes);
    }
  }

  @override
  Future<void> close() => _net.close();
}

final class _InMemoryClient implements ClientTransport {
  _InMemoryClient(this._net, this.peerId);

  final InMemorySessionNetwork _net;
  final String peerId;
  final _packets =
      StreamController<({SessionChannel channel, Uint8List bytes})>.broadcast();
  final _connection = StreamController<bool>.broadcast();
  bool _connected = false;

  @override
  Stream<({SessionChannel channel, Uint8List bytes})> get packets =>
      _packets.stream;

  @override
  Stream<bool> get connection => _connection.stream;

  @override
  bool get isConnected => _connected;

  void _setConnected(bool value) {
    if (_connected == value) return;
    _connected = value;
    if (!_connection.isClosed) _connection.add(value);
  }

  @override
  void send(SessionChannel channel, Uint8List bytes) {
    if (_net._closed || !_connected) return;
    if (channel == SessionChannel.unreliable && _net.dropUnreliable) return;
    _net._hostPackets.add((
      peerId: peerId,
      channel: channel,
      bytes: Uint8List.fromList(bytes),
    ));
  }

  @override
  Future<void> close() async {
    _net.disconnectClient(peerId);
    await _packets.close();
    await _connection.close();
  }
}

