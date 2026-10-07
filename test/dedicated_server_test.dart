import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:test/test.dart';

void main() {
  late DedicatedServer server;
  late HttpClient client;

  setUp(() async {
    server = await DedicatedServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
    );
    client = HttpClient();
  });

  tearDown(() async {
    client.close(force: true);
    await server.stop();
  });

  Future<HttpClientResponse> get(String path) async {
    final request = await client.get('127.0.0.1', server.port, path);
    return request.close();
  }

  test('answers health checks', () async {
    final response = await get('/health');
    expect(response.statusCode, HttpStatus.ok);
    expect(await response.transform(SystemEncoding().decoder).join(), 'ok');
  });

  test('returns 404 for unknown paths', () async {
    final response = await get('/unknown');
    expect(response.statusCode, HttpStatus.notFound);
    await response.drain<void>();
  });
}
