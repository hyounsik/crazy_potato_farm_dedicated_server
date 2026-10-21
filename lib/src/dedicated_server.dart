import 'dart:io';

import 'package:potato_dedicated_server/src/websocket_host_transport.dart';
import 'package:potato_session/potato_session.dart';

/// A running dedicated server bound to a network port.
///
/// Answers `GET /health` and takes guests' WebSocket connections on
/// [WebSocketFrame.path] into [transport]. When started with a [password],
/// a connection must send it in [WebSocketFrame.passwordHeader] or is
/// refused with 401. What the server hosts on that transport comes next.
class DedicatedServer {
  DedicatedServer._(this._httpServer, this._password) {
    _httpServer.listen(_handleRequest);
  }

  final HttpServer _httpServer;
  final String? _password;

  /// Guests connected over WebSocket.
  final WebSocketHostTransport transport = WebSocketHostTransport();

  /// The port the server is listening on, useful when started with port 0.
  int get port => _httpServer.port;

  /// Binds to [address]:[port] and starts serving requests. An empty
  /// [password] means none.
  static Future<DedicatedServer> start({
    required InternetAddress address,
    required int port,
    String? password,
  }) async => DedicatedServer._(
    await HttpServer.bind(address, port),
    password == null || password.isEmpty ? null : password,
  );

  /// Stops accepting requests and closes open connections.
  Future<void> stop() async {
    await transport.close();
    await _httpServer.close(force: true);
  }

  Future<void> _handleRequest(HttpRequest request) async {
    final response = request.response;
    if (request.method == 'GET' && request.uri.path == '/health') {
      response.write('ok');
    } else if (request.uri.path == WebSocketFrame.path &&
        WebSocketTransformer.isUpgradeRequest(request)) {
      final password = _password;
      if (password != null &&
          request.headers.value(WebSocketFrame.passwordHeader) != password) {
        response.statusCode = HttpStatus.unauthorized;
      } else {
        transport.accept(await WebSocketTransformer.upgrade(request));
        return;
      }
    } else {
      response.statusCode = HttpStatus.notFound;
    }
    await response.close();
  }
}
