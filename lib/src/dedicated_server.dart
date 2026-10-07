import 'dart:io';

/// A running dedicated server bound to a network port.
///
/// Only answers `GET /health` for now; session hosting is wired in once the
/// networking design is settled.
class DedicatedServer {
  DedicatedServer._(this._httpServer) {
    _httpServer.listen(_handleRequest);
  }

  final HttpServer _httpServer;

  /// The port the server is listening on, useful when started with port 0.
  int get port => _httpServer.port;

  /// Binds to [address]:[port] and starts serving requests.
  static Future<DedicatedServer> start({
    required InternetAddress address,
    required int port,
  }) async => DedicatedServer._(await HttpServer.bind(address, port));

  /// Stops accepting requests and closes open connections.
  Future<void> stop() => _httpServer.close(force: true);

  void _handleRequest(HttpRequest request) {
    final response = request.response;
    if (request.method == 'GET' && request.uri.path == '/health') {
      response.write('ok');
    } else {
      response.statusCode = HttpStatus.notFound;
    }
    response.close();
  }
}
