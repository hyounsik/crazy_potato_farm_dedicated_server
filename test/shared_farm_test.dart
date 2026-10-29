import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:potato_session/potato_session.dart';
import 'package:potato_session/websocket_client.dart';
import 'package:potato_session/zlib_codec.dart';
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

/// Guests over WebSocket looking after the server's one farm together
/// (`save-and-online.md`, 2026-10-28, 사용자).
void main() {
  late Map<String, Object?> files;
  late Catalog catalog;
  late Directory dir;

  setUpAll(() {
    files = _catalogFiles();
    catalog = Catalog.load(files).catalog!;
  });
  setUp(() => dir = Directory.systemTemp.createTempSync('shared_farm_test'));
  tearDown(() => dir.deleteSync(recursive: true));

  Future<DedicatedServer> startServer() async {
    final world = DedicatedWorld(
      store: WorldStore(dir),
      saveAfter: const Duration(milliseconds: 20),
    );
    await world.open();
    final server = await DedicatedServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
      world: world,
    );
    addTearDown(server.stop);
    return server;
  }

  Future<ClientSession> join(
    DedicatedServer server,
    String name, {
    Map<String, Object?>? catalogFiles,
  }) async {
    final transport = await WebSocketClientTransport.connect(
      Uri.parse('ws://127.0.0.1:${server.port}'),
    );
    final session = ClientSession(
      codec: const ZlibSessionCodec(),
      catalog: catalog,
      transport: transport,
      start: RaidMemberStart(name: name),
      buildNumber: 7,
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

  int foodOf(ClientSession guest) =>
      FarmDocument.decode(guest.sharedFarm!).toSimulation(catalog).food;

  test('everyone works the one farm, each with their own kit', () async {
    final server = await startServer();
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.sharedFarm != null && a.kit != null);
    final b = await join(server, 'B');
    await until(() => b.sharedFarm != null && b.kit != null);
    final food = foodOf(a);

    final replies = <FarmReplyMessage>[];
    a.farmReplies.listen(replies.add);
    a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 10));
    await until(() => replies.isNotEmpty);
    expect(replies.single.rejection, isNull);
    expect(replies.single.refused, isFalse);

    await until(
      () => PlayerKit.fromJson(catalog, a.kit!).bag.countOf('food') == 10,
    );
    // The other guest sees the shared storage go down; their bag is theirs.
    await until(() => foodOf(b) == food - 10);
    expect(PlayerKit.fromJson(catalog, b.kit!).bag.countOf('food'), 0);
  });

  test('the farm is kept, and its game data spares the next guest sending '
      'it', () async {
    var server = await startServer();
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 7));
    await until(
      () => PlayerKit.fromJson(catalog, a.kit!).bag.countOf('food') == 7,
    );
    await server.stop();

    server = await startServer();
    // No game data this time: the world has it.
    final again = await join(server, 'A');
    await until(() => again.kit != null);
    expect(PlayerKit.fromJson(catalog, again.kit!).bag.countOf('food'), 7);
  });

  test('a run sets out with the kit and comes home to the farm', () async {
    final server = await startServer();
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 10));
    await until(
      () => PlayerKit.fromJson(catalog, a.kit!).bag.countOf('food') == 10,
    );
    final returned = <FarmEvent>[];
    server.world!.room!.events.listen((e) {
      if (e is Returned) returned.add(e);
    });

    a.requestStart(catalog.zones.keys.first);
    await until(() => a.stage == ClientSessionStage.playing);
    // The app sent no bag; the server packed the kit's.
    expect(a.run!.members[a.memberIndex].bag.countOf('food'), 10);

    a.sendCommand(const GoHome());
    await until(() => returned.isNotEmpty);
  });
}
