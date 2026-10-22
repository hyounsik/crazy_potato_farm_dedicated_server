import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:potato_session/potato_session.dart';
import 'package:test/test.dart';

Map<String, Object?> _loadCatalogFiles() {
  final candidates = [
    Directory('../potato_core/test/fixtures/catalog'),
    Directory('packages/potato_core/test/fixtures/catalog'),
    Directory(
      '../crazy_potato_farm_dedicated_server/packages/potato_core/test/fixtures/catalog',
    ),
  ];
  final dir = candidates.firstWhere(
    (d) => d.existsSync(),
    orElse: () =>
        throw StateError('Cannot find potato_core/test/fixtures/catalog'),
  );
  return {
    for (final file in dir.listSync())
      if (file is File && file.path.endsWith('.json'))
        file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
          file.readAsStringSync(),
        ),
  };
}

Catalog _testCatalog() {
  final files = _loadCatalogFiles();
  final zones =
      (files['zones']! as Map<String, dynamic>)['zones'] as List<Object?>;
  final open = jsonDecode(jsonEncode(zones.first)) as Map<String, dynamic>;
  open['id'] = 'open';
  open['map'] = {
    'size': 20,
    'entry': {'x': 10, 'y': 10},
    'clear_radius': 1,
    'rotate': false,
    'scatter': {'count': 0},
  };
  (open['enemies'] as Map)['count'] = 0;
  (open['enemies'] as Map)['packs'] = 0;
  (open['gathering'] as Map)['count'] = 0;
  zones.add(open);

  final danger = jsonDecode(jsonEncode(open)) as Map<String, dynamic>;
  danger['id'] = 'danger_open';
  (danger['map'] as Map)['exits'] = [
    {'x': 16, 'y': 10},
    {'x': 3, 'y': 10},
  ];
  danger['danger'] = {
    'open_exits': 2,
    'reveal_seconds': 60,
    'exit_radius': 0.9,
    'countdown_seconds': 5,
    'wait_sight_multiplier': 2,
    'hungry_damage_per_second': 10,
  };
  zones.add(danger);

  final res = Catalog.load(files);
  if (!res.isValid) throw StateError('Invalid catalog: ${res.issues}');
  return res.catalog!;
}

Future<void> _pumpMicrotasks([int turns = 4]) async {
  for (var i = 0; i < turns; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  late Catalog catalog;

  setUpAll(() {
    catalog = _testCatalog();
  });

  group('Handshake & Version Check', () {
    test('accepts matching build number and catalog hash', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(
        catalog: catalog,
        transport: net.host,
        buildNumber: 42,
      );
      final client = ClientSession(
        catalog: catalog,
        transport: net.connectClient('guest_1'),
        buildNumber: 42,
        start: const RaidMemberStart(name: 'Guest One'),
      );

      await _pumpMicrotasks();

      expect(client.stage, ClientSessionStage.waiting);
      expect(host.guests, hasLength(1));
      expect(host.guests.single.peerId, 'guest_1');
      expect(host.guests.single.name, 'Guest One');

      await client.close();
      await host.close();
    });

    test('rejects mismatched build number or catalog hash', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(
        catalog: catalog,
        transport: net.host,
        buildNumber: 10,
      );
      final client = ClientSession(
        catalog: catalog,
        transport: net.connectClient('guest_bad_ver'),
        buildNumber: 11,
        start: const RaidMemberStart(name: 'Wrong Build'),
      );

      await _pumpMicrotasks();

      expect(client.stage, ClientSessionStage.rejected);
      expect(client.joinRejection, SessionJoinRejection.versionMismatch);
      expect(host.guests, isEmpty);

      await client.close();
      await host.close();
    });

    test('rejects when party is full (maxGuests)', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(
        catalog: catalog,
        transport: net.host,
        maxGuests: 1,
      );
      final c1 = ClientSession(
        catalog: catalog,
        transport: net.connectClient('g1'),
        start: const RaidMemberStart(name: 'G1'),
      );
      final c2 = ClientSession(
        catalog: catalog,
        transport: net.connectClient('g2'),
        start: const RaidMemberStart(name: 'G2'),
      );

      await _pumpMicrotasks();

      expect(c1.stage, ClientSessionStage.waiting);
      expect(c2.stage, ClientSessionStage.rejected);
      expect(c2.joinRejection, SessionJoinRejection.sessionFull);
      expect(host.guests, hasLength(1));

      await c1.close();
      await c2.close();
      await host.close();
    });
  });

  group('2-Player Co-op Exploration over InMemorySessionNetwork', () {
    test('host starts run, guest predicts move, host broadcasts snapshots & results', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(catalog: catalog, transport: net.host);
      final guest = ClientSession(
        catalog: catalog,
        transport: net.connectClient('guest_2'),
        start: const RaidMemberStart(
          name: 'Guest Two',
          companions: [
            CompanionStart(
              potatoId: 2,
              type: PotatoType.combat,
              grade: Grade.normal,
            ),
          ],
        ),
      );

      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.waiting);

      host.startRun(
        zone: 'open',
        seed: 7,
        hostStart: const RaidMemberStart(
          name: 'Host One',
          companions: [
            CompanionStart(
              potatoId: 1,
              type: PotatoType.combat,
              grade: Grade.normal,
            ),
          ],
        ),
      );

      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.playing);
      expect(guest.memberIndex, 1);
      expect(guest.run, isNotNull);
      expect(guest.run!.focusIndex, 1);
      expect(guest.run!.player.name, 'Guest Two');
      expect(guest.run!.companions.single.potatoId, 2);
      expect(guest.run!.members, hasLength(2));

      final initialGuestX = guest.run!.player.position.x;
      final initialHostY = guest.run!.members[0].player.position.y;

      // Guest moves right (+x), Host moves down (+y).
      guest.setMove(const Vec2(1, 0));
      host.run!.setMove(const Vec2(0, 1));
      await _pumpMicrotasks();

      // Advance 500ms in 50ms steps on both sides.
      for (var i = 0; i < 10; i++) {
        host.advance(const Duration(milliseconds: 50));
        guest.advance(const Duration(milliseconds: 50));
        await _pumpMicrotasks();
      }

      // Guest predicted and reconciled its own +x movement; host also moved +y.
      expect(guest.run!.player.position.x, greaterThan(initialGuestX + 0.5));
      expect(
        host.run!.members[1].player.position.x,
        closeTo(guest.run!.player.position.x, 0.25),
      );
      // Guest interpolated the host's +y movement from snapshots.
      expect(
        guest.run!.members[0].player.position.y,
        greaterThan(initialHostY + 0.2),
      );

      // Guest sends GoHome in safe zone; receives MemberResultMessage.
      guest.sendCommand(const GoHome());
      await _pumpMicrotasks();

      expect(guest.stage, ClientSessionStage.ended);
      expect(guest.result, isNotNull);
      expect(guest.result!.outcome, RaidOutcome.wentHome);

      // Host is still running until host also goes home.
      expect(host.run!.outcome, isNull);
      host.run!.apply(const GoHome());
      expect(host.run!.isOver, isTrue);

      await guest.close();
      await host.close();
    });
  });

  group('Disconnection Handling', () {
    test(
      'guest disconnect stops guest movement and leaves character defenseless',
      () async {
        final net = InMemorySessionNetwork();
        final host = HostSession(catalog: catalog, transport: net.host);
        final guest = ClientSession(
          catalog: catalog,
          transport: net.connectClient('guest_dc'),
          start: const RaidMemberStart(name: 'Guest DC'),
        );

        await _pumpMicrotasks();
        host.startRun(
          zone: 'danger_open',
          seed: 11,
          hostStart: const RaidMemberStart(name: 'Host'),
        );
        await _pumpMicrotasks();

        guest.setMove(const Vec2(1, 0));
        await _pumpMicrotasks();
        host.advance(const Duration(milliseconds: 100));
        expect(host.run!.members[1].move.x, greaterThan(0));

        // Guest drops connection.
        net.disconnectClient('guest_dc');
        await _pumpMicrotasks();

        expect(host.guests.single.connected, isFalse);
        expect(host.run!.members[1].move, Vec2.zero);

        await guest.close();
        await host.close();
      },
    );

    test(
      'host disconnect in danger zone pauses guest and aborts after timeout',
      () async {
        final net = InMemorySessionNetwork();
        final host = HostSession(catalog: catalog, transport: net.host);
        final guest = ClientSession(
          catalog: catalog,
          transport: net.connectClient('guest_abort'),
          start: const RaidMemberStart(name: 'Guest Abort'),
          hostReconnectTimeout: const Duration(seconds: 5),
        );

        await _pumpMicrotasks();
        host.startRun(
          zone: 'danger_open',
          seed: 12,
          hostStart: const RaidMemberStart(name: 'Host'),
        );
        await _pumpMicrotasks();
        expect(guest.stage, ClientSessionStage.playing);

        // Host connection drops.
        net.disconnectHost();
        await _pumpMicrotasks();
        expect(guest.stage, ClientSessionStage.hostDisconnected);

        // Advancing before timeout keeps stage in hostDisconnected.
        guest.advance(const Duration(seconds: 3));
        expect(guest.stage, ClientSessionStage.hostDisconnected);

        // Advancing past timeout voids the run (aborted) so pre-departure state is restored.
        guest.advance(const Duration(seconds: 3));
        expect(guest.stage, ClientSessionStage.aborted);

        await guest.close();
        await host.close();
      },
    );
  });

  group('Without a host player (dedicated server)', () {
    test('guests are members from 0 and the leader sets out', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(
        catalog: catalog,
        transport: net.host,
        hostPlays: false,
      );
      final requests = <String>[];
      host.startRequests.listen(requests.add);
      final leader = ClientSession(
        catalog: catalog,
        transport: net.connectClient('a'),
        start: const RaidMemberStart(name: 'Lead'),
        playerId: 'install-a',
      );
      await _pumpMicrotasks();
      final other = ClientSession(
        catalog: catalog,
        transport: net.connectClient('b'),
        start: const RaidMemberStart(name: 'Other'),
        playerId: 'install-b',
      );
      await _pumpMicrotasks();

      expect(leader.lobby?.names, ['Lead', 'Other']);
      expect(leader.lobby?.you, 0);
      expect(other.lobby?.names, ['Lead', 'Other']);
      expect(other.lobby?.you, 1);
      expect(leader.isLeader, isTrue);
      expect(other.isLeader, isFalse);

      other.requestStart('open');
      leader.requestStart('no_such_zone');
      await _pumpMicrotasks();
      expect(requests, isEmpty);

      leader.requestStart('open');
      await _pumpMicrotasks();
      expect(requests, ['open']);

      host.startRun(zone: 'open', seed: 3);
      await _pumpMicrotasks();
      expect(host.run!.members, hasLength(2));
      expect(leader.stage, ClientSessionStage.playing);
      expect(leader.memberIndex, 0);
      expect(other.memberIndex, 1);

      await leader.close();
      await other.close();
      await host.close();
    });

    test(
      'the same installation replaces its stale waiting-room entry',
      () async {
        final net = InMemorySessionNetwork();
        final host = HostSession(
          catalog: catalog,
          transport: net.host,
          hostPlays: false,
        );
        final first = ClientSession(
          catalog: catalog,
          transport: net.connectClient('old'),
          start: const RaidMemberStart(name: 'Me'),
          playerId: 'install-me',
        );
        await _pumpMicrotasks();
        final again = ClientSession(
          catalog: catalog,
          transport: net.connectClient('new'),
          start: const RaidMemberStart(name: 'Me'),
          playerId: 'install-me',
        );
        await _pumpMicrotasks();

        expect(host.guests.map((g) => g.peerId), ['new']);
        expect(again.lobby?.names, ['Me']);
        expect(again.lobby?.you, 0);

        await first.close();
        await again.close();
        await host.close();
      },
    );

    test('host mode still needs the host to play', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(catalog: catalog, transport: net.host);
      expect(() => host.startRun(zone: 'open', seed: 1), throwsArgumentError);
      await host.close();
    });
  });

  group('Quick messages', () {
    test('the host relays them to everyone with the sender', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(catalog: catalog, transport: net.host);
      final a = ClientSession(
        catalog: catalog,
        transport: net.connectClient('a'),
        start: const RaidMemberStart(name: 'A'),
      );
      final b = ClientSession(
        catalog: catalog,
        transport: net.connectClient('b'),
        start: const RaidMemberStart(name: 'B'),
      );
      await _pumpMicrotasks();
      // Not before the run.
      a.sendChat(QuickChat.go);
      host.startRun(
        zone: 'open',
        seed: 1,
        hostStart: const RaidMemberStart(name: 'H'),
      );
      await _pumpMicrotasks();
      expect(host.takeChats(), isEmpty);

      a.sendChat(QuickChat.help);
      host.sendChat(QuickChat.gather);
      await _pumpMicrotasks();
      const sent = [
        (from: 1, chat: QuickChat.help),
        (from: 0, chat: QuickChat.gather),
      ];

      expect(a.takeChats(), unorderedEquals(sent));
      expect(b.takeChats(), unorderedEquals(sent));
      expect(host.takeChats(), unorderedEquals(sent));

      await a.close();
      await b.close();
      await host.close();
    });

    test('an unknown quick message id is dropped', () {
      const codec = JsonSessionCodec();
      final bytes = Uint8List.fromList(
        utf8.encode('{"type":"quick_chat","chat":"wave","from":1}'),
      );
      expect(() => codec.decode(bytes), throwsArgumentError);
    });
  });

  group('Gathering at the host farm', () {
    test('guests see the host first in the lobby and get the shared farm, '
        'the latest one when they join late', () async {
      final net = InMemorySessionNetwork();
      final host = HostSession(
        catalog: catalog,
        transport: net.host,
        hostName: 'Host',
      );
      final a = ClientSession(
        catalog: catalog,
        transport: net.connectClient('a'),
        start: const RaidMemberStart(name: 'A'),
      );
      await _pumpMicrotasks();
      host.shareFarm({'v': 1});
      await _pumpMicrotasks();
      expect(a.sharedFarm, {'v': 1});
      expect(a.lobby?.names, ['Host', 'A']);
      expect(a.lobby?.you, 1);
      expect(a.isLeader, isFalse);

      host.shareFarm({'v': 2});
      final b = ClientSession(
        catalog: catalog,
        transport: net.connectClient('b'),
        start: const RaidMemberStart(name: 'B'),
      );
      await _pumpMicrotasks();
      expect(b.sharedFarm, {'v': 2});
      expect(a.lobby?.names, ['Host', 'A', 'B']);
      expect(b.lobby?.you, 2);

      // Not once the run is under way.
      host.startRun(
        zone: 'open',
        seed: 1,
        hostStart: const RaidMemberStart(name: 'Host'),
      );
      host.shareFarm({'v': 3});
      await _pumpMicrotasks();
      expect(a.sharedFarm, {'v': 2});

      await a.close();
      await b.close();
      await host.close();
    });
  });

  group('Coming back mid-run (2026-10-22)', () {
    Future<(InMemorySessionNetwork, HostSession, ClientSession)> started({
      String zone = 'danger_open',
    }) async {
      final net = InMemorySessionNetwork();
      final host = HostSession(catalog: catalog, transport: net.host);
      final guest = ClientSession(
        catalog: catalog,
        transport: net.connectClient('a'),
        start: const RaidMemberStart(name: 'A', food: 20),
        playerId: 'install-a',
        hostReconnectTimeout: null,
      );
      await _pumpMicrotasks();
      host.startRun(
        zone: zone,
        seed: 2,
        hostStart: const RaidMemberStart(name: 'H', food: 20),
      );
      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.playing);
      return (net, host, guest);
    }

    test('a guest whose link dropped comes back as the same member', () async {
      final (net, host, guest) = await started();
      final run = host.run!;
      run.setMoveOf(run.members[1], const Vec2(1, 0));
      net.disconnectClient('a');
      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.hostDisconnected);
      expect(host.guests.single.connected, isFalse);

      // Waits as long as it takes (no timeout), the run goes on meanwhile.
      guest.advance(const Duration(minutes: 5));
      expect(guest.stage, ClientSessionStage.hostDisconnected);
      for (var i = 0; i < 20; i++) {
        host.stepOnce();
      }
      final movedTo = run.members[1].player.position;

      await guest.resume(net.connectClient('a2'));
      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.playing);
      expect(guest.memberIndex, 1);
      expect(guest.run!.members[1].player.position, movedTo);
      expect(host.guests.single.peerId, 'a2');
      expect(host.guests.single.connected, isTrue);

      // Commands reach the host from the new link.
      guest.setMove(const Vec2(0, 1));
      await _pumpMicrotasks();
      expect(run.members[1].move, const Vec2(0, 1));

      await guest.close();
      await host.close();
    });

    test('if the run is gone the guest run is void', () async {
      final (net, host, guest) = await started();
      net.disconnectClient('a');
      await _pumpMicrotasks();
      await host.close();

      // Another session with no run takes the hello into its waiting room.
      final other = InMemorySessionNetwork();
      final fresh = HostSession(catalog: catalog, transport: other.host);
      await guest.resume(other.connectClient('a'));
      await _pumpMicrotasks();
      expect(guest.stage, ClientSessionStage.aborted);

      await guest.close();
      await fresh.close();
    });

    test('giving up voids a danger run for a guest who was standing', () async {
      final (net, host, guest) = await started();
      net.disconnectClient('a');
      await _pumpMicrotasks();
      guest.giveUp();
      expect(guest.stage, ClientSessionStage.aborted);
      await guest.close();
      await host.close();
    });

    test('giving up fails it for a guest who was down', () async {
      final (net, host, guest) = await started();
      final run = host.run!;
      run.enemies.clear();
      run.clones.clear();
      final me = run.members[1];
      me.player.position = run.members[0].player.position + const Vec2(4, 0);
      me.player.hp = 0;
      host.stepOnce();
      host.broadcastSnapshot();
      await _pumpMicrotasks();
      expect(guest.run!.members[1].isDowned, isTrue);

      net.disconnectClient('a');
      await _pumpMicrotasks();
      guest.giveUp();
      expect(guest.stage, ClientSessionStage.ended);
      expect(guest.result!.lost, isTrue);
      await guest.close();
      await host.close();
    });
  });
}
