import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';

const _defaultPort = 8080;

Future<void> main() async {
  final port = _readPort();
  final server = await DedicatedServer.start(
    address: InternetAddress.anyIPv4,
    port: port,
  );
  // A server process logs to stdout so container and service logs pick it up;
  // dart:developer's log() only reaches an attached debugger.
  stdout.writeln('Dedicated server listening on port ${server.port}');

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
