import 'dart:io';
import 'dart:typed_data';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:potato_session/potato_session.dart';
import 'package:potato_session/websocket_client.dart';
import 'package:test/test.dart';

/// Guests reach a dedicated server over WebSocket: both channels both ways,
/// the password gate, and drops seen from each side.
void main() {
  late DedicatedServer server;
  Uri address() => Uri.parse('ws://127.0.0.1:${server.port}');
  Uint8List bytes(List<int> values) => Uint8List.fromList(values);

  group('without a password', () {
    setUp(() async {
      server = await DedicatedServer.start(
        address: InternetAddress.loopbackIPv4,
        port: 0,
      );
    });
    tearDown(() => server.stop());

    test('carries packets both ways on both channels', () async {
      final joined = server.transport.peerConnected.first;
      final guest = await WebSocketClientTransport.connect(address());
      addTearDown(guest.close);
      final peer = await joined;
      expect(peer, 'guest-1');
      expect(guest.isConnected, isTrue);

      final atServer = server.transport.packets.take(2).toList();
      guest
        ..send(SessionChannel.reliable, bytes([1, 2, 3]))
        ..send(SessionChannel.unreliable, bytes([4]));
      final got = await atServer;
      expect(got.map((p) => p.peerId), everyElement(peer));
      expect(got.map((p) => p.channel), [
        SessionChannel.reliable,
        SessionChannel.unreliable,
      ]);
      expect(got.map((p) => p.bytes), [
        [1, 2, 3],
        [4],
      ]);

      final atGuest = guest.packets.take(2).toList();
      server.transport.send(peer, SessionChannel.reliable, bytes([9]));
      server.transport.broadcast(SessionChannel.unreliable, bytes([8, 7]));
      final back = await atGuest;
      expect(back.map((p) => p.channel), [
        SessionChannel.reliable,
        SessionChannel.unreliable,
      ]);
      expect(back.map((p) => p.bytes), [
        [9],
        [8, 7],
      ]);
    });

    test('a guest that leaves is reported gone', () async {
      final joined = server.transport.peerConnected.first;
      final guest = await WebSocketClientTransport.connect(address());
      final peer = await joined;
      final left = server.transport.peerDisconnected.first;
      await guest.close();
      expect(await left, peer);
      expect(server.transport.peers, isEmpty);
    });

    test('a guest sees the server going away', () async {
      final guest = await WebSocketClientTransport.connect(address());
      addTearDown(guest.close);
      final dropped = guest.connection.firstWhere((up) => !up);
      await server.stop();
      expect(await dropped, isFalse);
      expect(guest.isConnected, isFalse);
    });
  });

  group('with a password', () {
    setUp(() async {
      server = await DedicatedServer.start(
        address: InternetAddress.loopbackIPv4,
        port: 0,
        password: 'potato',
      );
    });
    tearDown(() => server.stop());

    test('lets in a guest with the password', () async {
      final guest = await WebSocketClientTransport.connect(
        address(),
        password: 'potato',
      );
      addTearDown(guest.close);
      expect(guest.isConnected, isTrue);
    });

    test('refuses a guest without it', () async {
      await expectLater(
        WebSocketClientTransport.connect(address(), password: 'wrong'),
        throwsA(isA<WebSocketException>()),
      );
      await expectLater(
        WebSocketClientTransport.connect(address()),
        throwsA(isA<WebSocketException>()),
      );
      expect(server.transport.peers, isEmpty);
    });
  });

  test('frames round-trip and reject junk', () {
    final frame = WebSocketFrame.encode(SessionChannel.unreliable, bytes([5]));
    expect(frame, [1, 5]);
    final packet = WebSocketFrame.decode(frame)!;
    expect(packet.channel, SessionChannel.unreliable);
    expect(packet.bytes, [5]);
    expect(WebSocketFrame.decode(bytes([])), isNull);
    expect(WebSocketFrame.decode(bytes([7, 1])), isNull);
  });
}
