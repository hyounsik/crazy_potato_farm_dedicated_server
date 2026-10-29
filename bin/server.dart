import 'dart:async';
import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';

const _defaultPort = 8080;
const _defaultAdminPort = 8081;
const _defaultDataDir = 'data';

/// Settings come from the environment:
///
/// - `PORT`: where guests connect (default 8080).
/// - `PASSWORD`: what guests must send to join (default none). The admin
///   page can change it while the server runs.
/// - `DATA_DIR`: where the shared farm and the game data are kept (default
///   `data`).
/// - `ADMIN_PASSWORD`: turns the admin page on; without it there is none.
/// - `ADMIN_PORT`: the admin page's port (default 8081).
Future<void> main() async {
  final port = _readPort('PORT', _defaultPort);
  final adminPort = _readPort('ADMIN_PORT', _defaultAdminPort);
  final env = Platform.environment;
  final password = env['PASSWORD'];
  final adminPassword = env['ADMIN_PASSWORD'] ?? '';
  final logs = LogBuffer();
  // A server process logs to stdout so container and service logs pick it
  // up; dart:developer's log() only reaches an attached debugger.
  void log(String message) {
    logs.add(message);
    stdout.writeln(message);
  }

  final world = DedicatedWorld(
    store: WorldStore(Directory(env['DATA_DIR'] ?? _defaultDataDir)),
    log: log,
  );
  await world.open();
  final server = await DedicatedServer.start(
    address: InternetAddress.anyIPv4,
    port: port,
    password: password,
    log: log,
    world: world,
  );
  log(
    'Dedicated server listening on port ${server.port}'
    '${password == null || password.isEmpty ? '' : ' (password required)'}',
  );
  server.transport.peerConnected.listen((peer) => log('$peer connected'));
  server.transport.peerDisconnected.listen((peer) => log('$peer disconnected'));

  AdminServer? admin;
  if (adminPassword.isEmpty) {
    log('No ADMIN_PASSWORD: the admin page is off');
  } else {
    admin = await AdminServer.start(
      address: InternetAddress.anyIPv4,
      port: adminPort,
      password: adminPassword,
      server: server,
      logs: logs,
    );
    log('Admin page on port ${admin.port}');
  }

  await StreamGroupLite.first([
    ProcessSignal.sigint.watch(),
    if (!Platform.isWindows) ProcessSignal.sigterm.watch(),
  ]);
  await admin?.stop();
  await server.stop();
  log('Dedicated server stopped');
}

/// Waits for the first event on any of [streams].
abstract final class StreamGroupLite {
  static Future<void> first(List<Stream<Object?>> streams) {
    final done = Completer<void>();
    final subs = <StreamSubscription<Object?>>[];
    for (final stream in streams) {
      subs.add(
        stream.listen((_) {
          if (done.isCompleted) return;
          done.complete();
          for (final sub in subs) {
            unawaited(sub.cancel());
          }
        }),
      );
    }
    return done.future;
  }
}

int _readPort(String name, int fallback) {
  final value = Platform.environment[name];
  if (value == null) return fallback;
  final port = int.tryParse(value);
  if (port == null || port < 0 || port > 65535) {
    stderr.writeln('Invalid $name "$value"');
    exit(64);
  }
  return port;
}
