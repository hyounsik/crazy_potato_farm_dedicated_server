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

/// A stand-in for the list service (Cloud Functions `publicServer`).
class _FakeList {
  _FakeList(this._server) {
    _server.listen(_handle);
  }

  static Future<_FakeList> start() async =>
      _FakeList(await HttpServer.bind(InternetAddress.loopbackIPv4, 0));

  final HttpServer _server;
  final heartbeats = <Map<String, dynamic>>[];

  /// What the next heartbeats get: null for OK, else the error.
  String? heartbeatError;

  Uri get url => Uri.parse('http://127.0.0.1:${_server.port}/publicServer/');

  Future<void> _handle(HttpRequest request) async {
    final body = jsonDecode(
      await utf8.decoder.bind(request).join(),
    ) as Map<String, dynamic>;
    final response = request.response;
    if (request.uri.path.endsWith('/heartbeat')) {
      heartbeats.add(body);
      final error = heartbeatError;
      if (error == null) {
        response.write(jsonEncode({'server_id': 's1', 'next_seconds': 300}));
      } else {
        response
          ..statusCode = error == 'bad-key' ? 401 : 403
          ..write(jsonEncode({'error': error}));
      }
    } else if (request.uri.path.endsWith('/ticket')) {
      if (body['ticket'] == 'good') {
        response.write(jsonEncode({'player_id': 'acct-1'}));
      } else {
        response
          ..statusCode = 403
          ..write(jsonEncode({'error': 'bad-ticket'}));
      }
    } else {
      response.statusCode = 404;
    }
    await response.close();
  }

  Future<void> close() => _server.close(force: true);
}

/// The public server list (`save-and-online.md`, 2026-10-31, 사용자).
void main() {
  late _FakeList list;

  setUp(() async {
    list = await _FakeList.start();
    addTearDown(list.close);
  });

  Future<void> until(bool Function() done) async {
    final deadline = DateTime.now().add(const Duration(seconds: 5));
    while (!done()) {
      if (DateTime.now().isAfter(deadline)) fail('Timed out');
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
  }

  PublicListing listing({ListingStatus Function()? status}) {
    final listing = PublicListing(
      serviceUrl: list.url,
      key: 'pfk_test',
      name: 'Potato KR',
      region: 'KR',
      port: 8080,
      status:
          status ?? () => (protocol: 2, build: 7, players: 1, maxPlayers: 4),
      minGap: Duration.zero,
    );
    addTearDown(listing.close);
    return listing;
  }

  test('heartbeats carry the key, nonce and who is on', () async {
    final l = listing()..start(firstWithin: Duration.zero);
    await until(() => list.heartbeats.isNotEmpty);
    expect(list.heartbeats.single, {
      'key': 'pfk_test',
      'name': 'Potato KR',
      'region': 'KR',
      'host': '',
      'port': 8080,
      'nonce': l.nonce,
      'protocol': 2,
      'build': 7,
      'players': 1,
      'max_players': 4,
    });
    // A player count change goes out soon.
    l.changed();
    await until(() => list.heartbeats.length == 2);
    expect(l.stopped, isFalse);
  });

  test('a refused key or a closed list stops the heartbeats', () async {
    for (final error in ['bad-key', 'closed']) {
      list
        ..heartbeats.clear()
        ..heartbeatError = error;
      final l = listing()..start(firstWithin: Duration.zero);
      await until(() => l.stopped);
      l.changed();
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(list.heartbeats, hasLength(1), reason: error);
      // Closed: a private server again; a revoked key keeps tickets.
      expect(l.listClosed, error == 'closed');
    }
  });

  test('tickets turn into the player id the list vouches for', () async {
    final l = listing();
    expect(await l.checkTicket('good'), 'acct-1');
    expect(await l.checkTicket('used'), isNull);
  });

  group('a listed server', () {
    late Directory dir;
    late DedicatedServer server;
    late Catalog catalog;
    late Map<String, Object?> files;

    setUp(() async {
      files = _catalogFiles();
      catalog = Catalog.load(files).catalog!;
      dir = Directory.systemTemp.createTempSync('public_listing_test');
      addTearDown(() => dir.deleteSync(recursive: true));
      final world = DedicatedWorld(store: WorldStore(dir));
      await world.open();
      server = await DedicatedServer.start(
        address: InternetAddress.loopbackIPv4,
        port: 0,
        password: 'pw',
        world: world,
        listing: listing(),
      );
      addTearDown(server.stop);
    });

    test('answers /ping with its nonce', () async {
      final client = HttpClient();
      addTearDown(() => client.close(force: true));
      final response = await (await client.get(
        '127.0.0.1',
        server.port,
        '/ping',
      )).close();
      expect(
        await response.transform(utf8.decoder).join(),
        server.listing!.nonce,
      );
    });

    test('turns away players without a good ticket', () async {
      final uri = Uri.parse('ws://127.0.0.1:${server.port}');
      for (final ticket in [null, 'used']) {
        await expectLater(
          WebSocketClientTransport.connect(uri, password: 'pw', ticket: ticket),
          throwsA(isA<WebSocketException>()),
          reason: '$ticket',
        );
      }
    });

    test('knows a player by the ticket, not the installation id', () async {
      final transport = await WebSocketClientTransport.connect(
        Uri.parse('ws://127.0.0.1:${server.port}'),
        password: 'pw',
        ticket: 'good',
      );
      final session = ClientSession(
        codec: const ZlibSessionCodec(),
        catalog: catalog,
        transport: transport,
        start: const RaidMemberStart(name: 'A'),
        buildNumber: 7,
        playerId: 'install-A',
        catalogFiles: files,
      );
      addTearDown(() async {
        await session.close();
        await transport.close();
      });
      await until(() => session.kit != null);
      expect(server.world!.room!.players, contains('acct-1'));
      expect(server.world!.room!.players, isNot(contains('install-A')));
      expect(server.listingStatus.players, 1);
      expect(server.listingStatus.build, 7);
    });
  });
}
