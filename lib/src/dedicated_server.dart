import 'dart:io';

import 'package:potato_dedicated_server/src/dedicated_room.dart';
import 'package:potato_dedicated_server/src/dedicated_world.dart';
import 'package:potato_dedicated_server/src/websocket_host_transport.dart';
import 'package:potato_session/potato_session.dart';

/// A running dedicated server bound to a network port.
///
/// Answers `GET /health` and takes guests' WebSocket connections on
/// [WebSocketFrame.path] into [transport]. When started with a [password],
/// a connection must send it in [WebSocketFrame.passwordHeader] or is
/// refused with 401. On that transport it hosts one exploration party at a
/// time ([room]), and with a [world] the server's one shared farm.
class DedicatedServer {
  DedicatedServer._(
    this._httpServer,
    this._password,
    this.log,
    this.world,
    Duration partyCountdown,
  ) {
    room = DedicatedRoom(
      transport: transport,
      log: log,
      world: world,
      partyCountdown: partyCountdown,
    );
    _httpServer.listen(_handleRequest);
  }

  final HttpServer _httpServer;
  String? _password;

  /// The password guests must send, or null for none. The admin page may
  /// change it while the server runs (2026-10-28, 사용자).
  String? get password => _password;
  set password(String? value) =>
      _password = value == null || value.isEmpty ? null : value;

  /// The server's shared farm, when it keeps one.
  final DedicatedWorld? world;

  /// Guests connected over WebSocket.
  final WebSocketHostTransport transport = WebSocketHostTransport();

  /// The exploration party on [transport].
  late final DedicatedRoom room;

  /// Where the server reports what happens.
  final void Function(String message)? log;

  /// The port the server is listening on, useful when started with port 0.
  int get port => _httpServer.port;

  /// Binds to [address]:[port] and starts serving requests. An empty
  /// [password] means none.
  static Future<DedicatedServer> start({
    required InternetAddress address,
    required int port,
    String? password,
    void Function(String message)? log,
    DedicatedWorld? world,
    Duration partyCountdown = const Duration(seconds: 60),
  }) async => DedicatedServer._(
    await HttpServer.bind(address, port),
    password == null || password.isEmpty ? null : password,
    log,
    world,
    partyCountdown,
  );

  /// Stops accepting requests and closes open connections.
  Future<void> stop() async {
    await room.close();
    await world?.close();
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
