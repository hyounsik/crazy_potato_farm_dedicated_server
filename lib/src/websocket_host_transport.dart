import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:potato_session/potato_session.dart';

/// The dedicated server's [HostTransport]: one WebSocket per guest, framed
/// with [WebSocketFrame]. The server hands it each accepted socket through
/// [accept]; guests get ids `guest-1`, `guest-2`, ... in the order they came.
final class WebSocketHostTransport implements HostTransport {
  final _packets = StreamController<SessionPacket>.broadcast();
  final _peerConnected = StreamController<String>.broadcast();
  final _peerDisconnected = StreamController<String>.broadcast();
  final Map<String, WebSocket> _sockets = {};
  int _nextId = 1;
  bool _closed = false;

  @override
  Stream<SessionPacket> get packets => _packets.stream;

  @override
  Stream<String> get peerConnected => _peerConnected.stream;

  @override
  Stream<String> get peerDisconnected => _peerDisconnected.stream;

  /// Guests connected now.
  Iterable<String> get peers => _sockets.keys;

  /// Takes [socket] in as a new guest and returns its id. A closed
  /// transport closes the socket instead.
  String accept(WebSocket socket) {
    final peerId = 'guest-${_nextId++}';
    if (_closed) {
      unawaited(socket.close(WebSocketStatus.goingAway));
      return peerId;
    }
    _sockets[peerId] = socket;
    socket.listen(
      (data) {
        if (_closed || data is! List<int>) return;
        final packet = WebSocketFrame.decode(
          data is Uint8List ? data : Uint8List.fromList(data),
        );
        if (packet == null) return;
        _packets.add((
          peerId: peerId,
          channel: packet.channel,
          bytes: packet.bytes,
        ));
      },
      onDone: () => _drop(peerId),
      onError: (Object _) => _drop(peerId),
      cancelOnError: true,
    );
    _peerConnected.add(peerId);
    return peerId;
  }

  void _drop(String peerId) {
    if (_sockets.remove(peerId) == null || _closed) return;
    _peerDisconnected.add(peerId);
  }

  @override
  void send(String peerId, SessionChannel channel, Uint8List bytes) {
    if (_closed) return;
    _sockets[peerId]?.add(WebSocketFrame.encode(channel, bytes));
  }

  @override
  void broadcast(SessionChannel channel, Uint8List bytes) {
    if (_closed) return;
    final frame = WebSocketFrame.encode(channel, bytes);
    for (final socket in _sockets.values) {
      socket.add(frame);
    }
  }

  @override
  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    final sockets = _sockets.values.toList();
    _sockets.clear();
    await Future.wait([
      for (final socket in sockets) socket.close(WebSocketStatus.goingAway),
    ]);
    await _packets.close();
    await _peerConnected.close();
    await _peerDisconnected.close();
  }
}
