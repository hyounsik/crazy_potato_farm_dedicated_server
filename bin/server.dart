import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';

const _defaultPort = 8080;

Future<void> main() async {
  final port = _readPort();
  final password = Platform.environment['PASSWORD'];
  final server = await DedicatedServer.start(
    address: InternetAddress.anyIPv4,
    port: port,
    password: password,
    log: stdout.writeln,
  );
  // A server process logs to stdout so container and service logs pick it up;
  // dart:developer's log() only reaches an attached debugger.
  stdout.writeln(
    'Dedicated server listening on port ${server.port}'
    '${password == null || password.isEmpty ? '' : ' (password required)'}',
  );
  server.transport.peerConnected.listen(
    (peer) => stdout.writeln('$peer connected'),
  );
  server.transport.peerDisconnected.listen(
    (peer) => stdout.writeln('$peer disconnected'),
  );

  await ProcessSignal.sigint.watch().first;
  await server.stop();
  stdout.writeln('Dedicated server stopped');
}

int _readPort() {
  final value = Platform.environment['PORT'];
  if (value == null) return _defaultPort;
  final port = int.tryParse(value);
  if (port == null || port < 0 || port > 65535) {
    stderr.writeln('Invalid PORT "$value"');
    exit(64);
  }
  return port;
}
