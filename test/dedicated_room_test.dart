import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:potato_session/potato_session.dart';
import 'package:potato_session/zlib_codec.dart';
import 'package:potato_session/websocket_client.dart';
import 'package:test/test.dart';

Map<String, Object?> _catalogFiles() {
  final dir = Directory('packages/potato_core/test/fixtures/catalog');
  return {
    for (final file in dir.listSync())
      if (file is File && file.path.endsWith('.json'))
        file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
          file.readAsStringSync(),
        ),
  };
}

/// Two guests over WebSocket on a server that ships without game data: the
/// first brings the catalog, the leader sets out, and the room forgets the
/// catalog once everyone has left.
void main() {
  late DedicatedServer server;
  late Map<String, Object?> files;
  late Catalog catalog;
  final logs = <String>[];

  setUpAll(() {
    files = _catalogFiles();
    catalog = Catalog.load(files).catalog!;
  });

  setUp(() async {
    logs.clear();
    server = await DedicatedServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
      log: logs.add,
    );
  });
  tearDown(() => server.stop());

  Future<ClientSession> join(
    String name, {
    Map<String, Object?>? catalogFiles,
    int buildNumber = 7,
  }) async {
    final transport = await WebSocketClientTransport.connect(
      Uri.parse('ws://127.0.0.1:${server.port}'),
    );
    final session = ClientSession(
      codec: const ZlibSessionCodec(),
      catalog: catalog,
      transport: transport,
      start: RaidMemberStart(name: name),
      buildNumber: buildNumber,
      playerId: 'install-$name',
      catalogFiles: catalogFiles,
    );
    addTearDown(() async {
      await session.close();
      await transport.close();
    });
    return session;
  }

  Future<void> until(bool Function() done) async {
    final deadline = DateTime.now().add(const Duration(seconds: 5));
    while (!done()) {
      if (DateTime.now().isAfter(deadline)) fail('Timed out');
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
  }

  test('the first guest brings the catalog and anyone sets out', () async {
    final leader = await join('Lead', catalogFiles: files);
    await until(() => leader.stage == ClientSessionStage.waiting);
    expect(server.room.catalog, isNotNull);

    // Later guests need not bring data, but must match build and catalog.
    final other = await join('Other');
    await until(() => other.lobby?.names.length == 2);
    expect(leader.lobby?.names, ['Lead', 'Other']);

    leader.requestStart(catalog.zones.keys.first);
    await until(
      () =>
          leader.stage == ClientSessionStage.playing &&
          other.stage == ClientSessionStage.playing,
    );
    expect(leader.memberIndex, 0);
    expect(other.memberIndex, 1);

    // The server steps the run and sends snapshots.
    final tick = leader.run!.tick;
    await until(() {
      leader.advance(const Duration(milliseconds: 16));
      return leader.run!.tick > tick;
    });
  });

  test('a guest on another build is turned away', () async {
    final leader = await join('Lead', catalogFiles: files);
    await until(() => leader.stage == ClientSessionStage.waiting);
    final stale = await join('Stale', buildNumber: 6);
    await until(() => stale.stage == ClientSessionStage.rejected);
    expect(stale.joinRejection, SessionJoinRejection.versionMismatch);
  });

  test('a first guest without data cannot open the room', () async {
    final guest = await join('NoData');
    await until(() => guest.stage == ClientSessionStage.rejected);
    expect(server.room.catalog, isNull);
  });

  test('forgets the catalog when everyone has left', () async {
    final transport = await WebSocketClientTransport.connect(
      Uri.parse('ws://127.0.0.1:${server.port}'),
    );
    final guest = ClientSession(
      codec: const ZlibSessionCodec(),
      catalog: catalog,
      transport: transport,
      start: const RaidMemberStart(name: 'Solo'),
      catalogFiles: files,
    );
    await until(() => guest.stage == ClientSessionStage.waiting);
    expect(server.room.catalog, isNotNull);

    await guest.close();
    await transport.close();
    await until(() => server.room.catalog == null);
    expect(server.room.session, isNull);
  });

  test('a guest whose link dropped mid-run comes back to it', () async {
    final first = await WebSocketClientTransport.connect(
      Uri.parse('ws://127.0.0.1:${server.port}'),
    );
    final guest = ClientSession(
      codec: const ZlibSessionCodec(),
      catalog: catalog,
      transport: first,
      start: const RaidMemberStart(name: 'Solo', food: 20),
      buildNumber: 7,
      playerId: 'install-solo',
      catalogFiles: files,
      hostReconnectTimeout: null,
    );
    addTearDown(guest.close);
    await until(() => guest.stage == ClientSessionStage.waiting);
    final danger = catalog.zones.values.firstWhere((z) => z.danger != null);
    guest.requestStart(danger.id);
    await until(() => guest.stage == ClientSessionStage.playing);

    await first.close();
    // Closing our own end is a dropped link as far as the session knows.
    await until(() => server.room.session!.guests.single.connected == false);
    expect(server.room.session!.run, isNotNull, reason: 'kept for a while');

    final again = await WebSocketClientTransport.connect(
      Uri.parse('ws://127.0.0.1:${server.port}'),
    );
    addTearDown(again.close);
    // The guest's own stage follows its old link; resume once it noticed.
    await until(() => guest.stage == ClientSessionStage.hostDisconnected);
    await guest.resume(again);
    await until(() => guest.stage == ClientSessionStage.playing);
    expect(guest.memberIndex, 0);
    expect(server.room.session!.guests.single.connected, isTrue);
  });

  test('with nobody back in time the run ends', () async {
    final net = InMemorySessionNetwork();
    final room = DedicatedRoom(
      transport: net.host,
      emptyRunGrace: const Duration(milliseconds: 100),
      tickEvery: const Duration(milliseconds: 5),
    );
    addTearDown(room.close);
    final guest = ClientSession(
      codec: const ZlibSessionCodec(),
      catalog: catalog,
      transport: net.connectClient('g'),
      start: const RaidMemberStart(name: 'G', food: 20),
      catalogFiles: files,
      playerId: 'install-g',
    );
    addTearDown(guest.close);
    await until(() => guest.stage == ClientSessionStage.waiting);
    guest.requestStart(catalog.zones.keys.first);
    await until(() => guest.stage == ClientSessionStage.playing);

    net.disconnectClient('g');
    await until(() => room.session == null);
    expect(room.catalog, isNull);
  });
}
