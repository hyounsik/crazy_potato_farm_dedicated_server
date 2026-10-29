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

  Future<DedicatedServer> startServer({
    Duration partyCountdown = const Duration(seconds: 60),
  }) async {
    final world = DedicatedWorld(
      store: WorldStore(dir),
      saveAfter: const Duration(milliseconds: 20),
    );
    await world.open();
    final server = await DedicatedServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
      world: world,
      partyCountdown: partyCountdown,
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

    a
      ..requestStart(catalog.zones.keys.first)
      ..setReady(true, start: const RaidMemberStart(name: 'A'));
    await until(() => a.stage == ClientSessionStage.playing);
    // The app sent no bag; the server packed the kit's.
    expect(a.run!.members[a.memberIndex].bag.countOf('food'), 10);

    a.sendCommand(const GoHome());
    await until(() => returned.isNotEmpty);
    // Back on the farm in the same room, without saying hello again.
    await until(() => a.stage == ClientSessionStage.waiting);
    expect(a.run, isNull);
    final replies = <FarmReplyMessage>[];
    a.farmReplies.listen(replies.add);
    a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 1));
    await until(() => replies.isNotEmpty);
    expect(replies.single.refused, isFalse);
  });

  test('a kit moves to a new id only while neither is in the room', () async {
    final server = await startServer();
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 5));
    await until(
      () => PlayerKit.fromJson(catalog, a.kit!).bag.countOf('food') == 5,
    );
    expect(
      await server.room.moveKit('install-A', 'install-B'),
      KitMoveRefusal.inRoom,
    );

    for (final peer in server.transport.peers.toList()) {
      await server.transport.kick(peer);
    }
    await until(() => server.room.session?.guests.isEmpty ?? true);
    expect(await server.room.moveKit('install-A', 'install-B'), isNull);
    expect(
      await server.room.moveKit('install-A', 'install-A'),
      KitMoveRefusal.unknownPlayer,
    );

    final b = await join(server, 'B');
    await until(() => b.kit != null);
    expect(PlayerKit.fromJson(catalog, b.kit!).bag.countOf('food'), 5);
    expect(server.world!.room!.kitOf('install-A').bag.countOf('food'), 0);
  });

  test('no kit moves while a run is going', () async {
    final server = await startServer();
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    a
      ..requestStart(catalog.zones.keys.first)
      ..setReady(true, start: const RaidMemberStart(name: 'A'));
    await until(() => a.stage == ClientSessionStage.playing);
    expect(
      await server.room.moveKit('install-A', 'install-B'),
      KitMoveRefusal.runGoing,
    );
  });

  test('anyone opens the party; those ready go when the countdown ends, '
      'the rest keep at the farm and newcomers come to it', () async {
    final server = await startServer(
      partyCountdown: const Duration(milliseconds: 300),
    );
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    final b = await join(server, 'B');
    await until(() => b.kit != null && a.lobby?.names.length == 2);

    // B, not first in, opens it; only A gets ready.
    b.requestStart(catalog.zones.keys.first);
    await until(() => a.partyZone != null && a.departsAt != null);
    a.setReady(true);
    await until(() => a.stage == ClientSessionStage.playing);
    expect(b.stage, ClientSessionStage.waiting);
    expect(server.room.session!.run!.members, hasLength(1));
    await until(() => b.partyZone == null);

    // B keeps working the farm while A is out.
    final replies = <FarmReplyMessage>[];
    b.farmReplies.listen(replies.add);
    b.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 2));
    await until(() => replies.isNotEmpty);
    expect(replies.single.refused, isFalse);
    expect(replies.single.rejection, isNull);

    // Someone new comes to the farm meanwhile and sees B walk.
    final c = await join(server, 'C');
    await until(() => c.kit != null && c.lobby?.names.length == 3);
    b.sendWalk(const FarmWalk(at: Vec2(3, 4), facing: Vec2(1, 0)));
    await until(() => c.walkers.isNotEmpty);

    // A comes home to the same room.
    a.sendCommand(const GoHome());
    await until(() => a.stage == ClientSessionStage.waiting);
    expect(server.room.session!.run, isNull);
  });

  test('a party nobody got ready for is called off', () async {
    final server = await startServer(
      partyCountdown: const Duration(milliseconds: 200),
    );
    final a = await join(server, 'A', catalogFiles: files);
    await until(() => a.kit != null);
    a.requestStart(catalog.zones.keys.first);
    await until(() => a.partyZone != null);
    await until(() => a.partyZone == null);
    expect(server.room.session!.run, isNull);
    expect(a.stage, ClientSessionStage.waiting);
  });

  test(
    'truck beds trade what the kits really hold, by the lock rules',
    () async {
      final server = await startServer();
      final a = await join(server, 'A', catalogFiles: files);
      await until(() => a.kit != null);
      final b = await join(server, 'B');
      await until(() => b.kit != null && b.beds.length == 2);
      PlayerKit kitOf(String name) =>
          server.world!.room!.kitOf('install-$name');
      final gifts = <BedRefusal?>[];
      b.bedGifts.listen((g) => gifts.add(g.refusal));

      a.sendFarmCommand(const FarmCommand.loadBag(item: 'food', count: 5));
      await until(() => kitOf('A').bag.countOf('food') == 5);

      // A puts 3 of it on their own bed (locked: only A may).
      a.putInBed(0, ItemStack('food', 3));
      await until(() => b.beds[0].slots.any((s) => s?.item == 'food'));
      expect(kitOf('A').bag.countOf('food'), 2);
      expect(kitOf('A').bed.countOf('food'), 3);

      // B cannot reach a locked bed, nor put what B does not have.
      b.takeFromBed(0, 0, 'food');
      b.putInBed(0, ItemStack('food', 9));
      await until(() => gifts.length == 2);
      expect(gifts, [BedRefusal.locked, BedRefusal.gone]);
      expect(kitOf('B').bag.countOf('food'), 0);

      // Opened, B takes it straight into B's kit.
      a.setBedOpen(true);
      await until(() => b.beds[0].open);
      final slot = b.beds[0].slots.indexWhere((s) => s?.item == 'food');
      b.takeFromBed(0, slot, 'food');
      await until(() => kitOf('B').bag.countOf('food') == 3);
      expect(kitOf('A').bed.countOf('food'), 0);
      // Kept on disk with the kits, and B's app hears its kit.
      await until(
        () => PlayerKit.fromJson(catalog, b.kit!).bag.countOf('food') == 3,
      );
    },
  );
}
