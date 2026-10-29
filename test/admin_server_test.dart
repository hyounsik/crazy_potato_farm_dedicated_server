import 'dart:convert';
import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:test/test.dart';

/// The admin page on its own port (2026-10-28, 사용자): status, the log's
/// tail, who is here, and the join password.
void main() {
  late DedicatedServer server;
  late AdminServer admin;
  late LogBuffer logs;
  late HttpClient http;

  setUp(() async {
    logs = LogBuffer();
    server = await DedicatedServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
      log: logs.add,
    );
    admin = await AdminServer.start(
      address: InternetAddress.loopbackIPv4,
      port: 0,
      password: 'secret',
      server: server,
      logs: logs,
    );
    http = HttpClient();
  });
  tearDown(() async {
    http.close(force: true);
    await admin.stop();
    await server.stop();
  });

  Future<(int, Object?)> call(
    String method,
    String path, {
    String? key = 'secret',
    Map<String, Object?>? body,
  }) async {
    final request = await http.openUrl(
      method,
      Uri.parse('http://127.0.0.1:${admin.port}$path'),
    );
    if (key != null) {
      request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $key');
    }
    if (body != null) request.write(jsonEncode(body));
    final response = await request.close();
    final text = await utf8.decodeStream(response);
    final json = response.headers.contentType?.mimeType == 'application/json'
        ? jsonDecode(text)
        : text;
    return (response.statusCode, json);
  }

  test('the page opens without the password; the rest needs it', () async {
    final (pageStatus, page) = await call('GET', '/', key: null);
    expect(pageStatus, 200);
    expect(page, contains('Potato server admin'));
    expect((await call('GET', '/api/status', key: null)).$1, 401);
    expect((await call('GET', '/api/status', key: 'wrong')).$1, 401);
  });

  test('status, log and the join password', () async {
    logs.add('hello log');
    final (_, status) = await call('GET', '/api/status');
    expect((status! as Map)['password'], isFalse);
    expect((status as Map)['guests'], isEmpty);

    final (_, log) = await call('GET', '/api/log?lines=5');
    expect(((log! as Map)['lines'] as List).last, endsWith('hello log'));

    final (setStatus, _) = await call(
      'POST',
      '/api/password',
      body: {'password': 'join-me'},
    );
    expect(setStatus, 200);
    expect(server.password, 'join-me');
    await call('POST', '/api/password', body: {'password': ''});
    expect(server.password, isNull);
  });

  test('an empty admin password is refused', () {
    expect(
      () => AdminServer.start(
        address: InternetAddress.loopbackIPv4,
        port: 0,
        password: '',
        server: server,
        logs: logs,
      ),
      throwsArgumentError,
    );
  });
}
