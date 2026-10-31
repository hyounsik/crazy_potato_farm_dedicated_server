/// A guest's [ClientTransport] to a dedicated server over WebSocket.
///
/// Kept apart from `potato_session.dart` because it needs `dart:io`: host
/// mode never imports it.
library;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:potato_session/potato_session.dart';

/// Talks to a dedicated server at [uri] (`ws://host:port`, or `wss://`
/// behind a TLS proxy). Frames follow [WebSocketFrame].
final class WebSocketClientTransport implements ClientTransport {
  WebSocketClientTransport._(this._socket) {
    _connected = true;
    _socket.listen(
      (data) {
        if (data is! List<int>) return;
        final packet = WebSocketFrame.decode(
          data is Uint8List ? data : Uint8List.fromList(data),
        );
        if (packet != null && !_packets.isClosed) _packets.add(packet);
      },
      onDone: _drop,
      onError: (Object _) => _drop(),
      cancelOnError: true,
    );
  }

  /// Connects to the server at [uri], sending [password] when the server
  /// asks for one, and [ticket] for a server on the public list. Throws
  /// [WebSocketException] when the server refuses (wrong password: HTTP
  /// 401, no good ticket: 403) or cannot be reached.
  static Future<WebSocketClientTransport> connect(
    Uri uri, {
    String? password,
    String? ticket,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final socket = await WebSocket.connect(
      uri.replace(path: WebSocketFrame.path).toString(),
      headers: {
        if (password != null && password.isNotEmpty)
          WebSocketFrame.passwordHeader: password,
        if (ticket != null && ticket.isNotEmpty)
          WebSocketFrame.ticketHeader: ticket,
      },
    ).timeout(timeout);
    return WebSocketClientTransport._(socket);
  }

  final WebSocket _socket;
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

  void _drop() {
    if (!_connected) return;
    _connected = false;
    if (!_connection.isClosed) _connection.add(false);
  }

  @override
  void send(SessionChannel channel, Uint8List bytes) {
    if (!_connected) return;
    _socket.add(WebSocketFrame.encode(channel, bytes));
  }

  @override
  Future<void> close() async {
    _drop();
    await _socket.close();
    await _packets.close();
    await _connection.close();
  }
}
