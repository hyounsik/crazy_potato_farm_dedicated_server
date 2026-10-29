import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:potato_dedicated_server/src/dedicated_server.dart';
import 'package:potato_session/potato_session.dart';

/// The last lines a server logged, for the admin page's log tail.
final class LogBuffer {
  LogBuffer({this.keep = 500});

  /// How many lines are kept.
  final int keep;
  final List<String> _lines = [];

  /// Adds [message] with the time it came.
  void add(String message) {
    _lines.add('${DateTime.now().toIso8601String()} $message');
    if (_lines.length > keep) _lines.removeRange(0, _lines.length - keep);
  }

  /// The last [count] lines, oldest first.
  List<String> tail([int count = 200]) =>
      _lines.sublist(_lines.length > count ? _lines.length - count : 0);
}

/// The server's admin page, on a port of its own (2026-10-28, 사용자): what
/// the server is doing, the log's tail, who is connected (and kicking
/// them), the password guests join with, and everyone's kit, which can be
/// moved to a new installation id when someone reinstalled the app
/// (2026-10-29, 사용자). It manages the server, not
/// the game: in the game everyone who comes in may do the same.
///
/// Every request but the page itself needs the admin password, set when the
/// server starts, as `Authorization: Bearer <password>`; it is separate from
/// the password guests join with *(제안)*. The page is plain HTTP: put it
/// behind TLS (a reverse proxy) or keep its port off the internet.
final class AdminServer {
  AdminServer._(this._http, this._password, this.server, this.logs) {
    _http.listen((request) => unawaited(_handle(request)));
  }

  final HttpServer _http;
  final String _password;

  /// The dedicated server it manages.
  final DedicatedServer server;
  final LogBuffer logs;
  final DateTime _startedAt = DateTime.now();

  int get port => _http.port;

  /// Binds to [address]:[port]. [password] must not be empty.
  static Future<AdminServer> start({
    required InternetAddress address,
    required int port,
    required String password,
    required DedicatedServer server,
    required LogBuffer logs,
  }) async {
    if (password.isEmpty) {
      throw ArgumentError.value(password, 'password', 'must not be empty');
    }
    return AdminServer._(
      await HttpServer.bind(address, port),
      password,
      server,
      logs,
    );
  }

  Future<void> stop() => _http.close(force: true);

  /// What the server is doing now, as the page shows it.
  Map<String, dynamic> status() {
    final room = server.room;
    final session = room.session;
    final run = session?.run;
    final world = server.world;
    final farm = world?.room?.farm;
    return {
      'uptime_seconds': DateTime.now().difference(_startedAt).inSeconds,
      'password': server.password != null,
      'game_data': world?.catalogHash,
      'build': world?.buildNumber,
      'run': run == null
          ? null
          : {'zone': run.zone.id, 'members': run.members.length},
      'farm': farm == null
          ? null
          : {
              'food': farm.food,
              'progress': farm.progress,
              'tick': farm.tick,
              'players': world!.room!.players.length,
            },
      'guests': [
        for (final g in session?.guests ?? const [])
          {
            'peer': g.peerId,
            'name': g.start.name,
            'player': g.playerId,
            'connected': g.connected,
            'ready': g.ready,
          },
      ],
      'connections': server.transport.peers.toList(),
      'kits': [
        if (world?.room case final room?)
          for (final player in room.players)
            {'player': player, ..._kitSummary(room.kitOf(player))},
      ],
    };
  }

  /// What a kit holds, in words for the page.
  static Map<String, dynamic> _kitSummary(PlayerKit kit) {
    List<String> stacks(Bag bag) => [
      for (final s in bag.slots)
        if (s != null)
          s.gear == null ? '${s.item} x${s.count}' : _gear(s.gear!),
    ];
    return {
      'wears': [for (final g in kit.equipped.all) _gear(g)],
      'bag': stacks(kit.bag),
      'bed': stacks(kit.bed),
    };
  }

  static String _gear(Gear g) => [
    g.family.isEmpty ? g.kind.name : g.family,
    g.grade.name,
    'Lv${g.level}',
    if (g.enhance > 0) '+${g.enhance}',
  ].join(' ');

  Future<void> _handle(HttpRequest request) async {
    final response = request.response;
    try {
      final path = request.uri.path;
      if (request.method == 'GET' && path == '/') {
        response.headers.contentType = ContentType.html;
        response.write(_page);
      } else if (!_authorized(request)) {
        response.statusCode = HttpStatus.unauthorized;
      } else if (request.method == 'GET' && path == '/api/status') {
        _json(response, status());
      } else if (request.method == 'GET' && path == '/api/log') {
        final lines = int.tryParse(request.uri.queryParameters['lines'] ?? '');
        _json(response, {'lines': logs.tail(lines ?? 200)});
      } else if (request.method == 'POST' && path == '/api/kick') {
        final peer = (await _body(request))['peer'];
        if (peer is! String) {
          response.statusCode = HttpStatus.badRequest;
        } else {
          logs.add('Admin kicked $peer');
          await server.transport.kick(peer);
          _json(response, {'ok': true});
        }
      } else if (request.method == 'POST' && path == '/api/kits/move') {
        final body = await _body(request);
        final (from, to) = (body['from'], body['to']);
        if (from is! String || to is! String || to.isEmpty) {
          response.statusCode = HttpStatus.badRequest;
        } else {
          final refusal = await server.room.moveKit(from, to);
          if (refusal == null) logs.add('Admin moved the kit of $from to $to');
          response.statusCode = refusal == null
              ? HttpStatus.ok
              : HttpStatus.conflict;
          _json(response, {'ok': refusal == null, 'reason': refusal?.name});
        }
      } else if (request.method == 'POST' && path == '/api/password') {
        final password = (await _body(request))['password'];
        if (password is! String) {
          response.statusCode = HttpStatus.badRequest;
        } else {
          server.password = password;
          logs.add(
            password.isEmpty
                ? 'Admin removed the join password'
                : 'Admin changed the join password',
          );
          _json(response, {'ok': true, 'password': server.password != null});
        }
      } else {
        response.statusCode = HttpStatus.notFound;
      }
    } on Object catch (e) {
      response.statusCode = HttpStatus.internalServerError;
      logs.add('Admin request failed: $e');
    }
    await response.close();
  }

  bool _authorized(HttpRequest request) {
    final header = request.headers.value(HttpHeaders.authorizationHeader);
    if (header == null || !header.startsWith('Bearer ')) return false;
    return _sameText(header.substring(7), _password);
  }

  /// Compares in time that does not depend on where they differ.
  static bool _sameText(String a, String b) {
    final x = utf8.encode(a);
    final y = utf8.encode(b);
    var diff = x.length ^ y.length;
    for (var i = 0; i < x.length && i < y.length; i++) {
      diff |= x[i] ^ y[i];
    }
    return diff == 0;
  }

  static Future<Map<String, dynamic>> _body(HttpRequest request) async {
    final text = await utf8.decodeStream(request);
    return text.isEmpty ? {} : jsonDecode(text) as Map<String, dynamic>;
  }

  static void _json(HttpResponse response, Object body) {
    response.headers.contentType = ContentType.json;
    response.write(jsonEncode(body));
  }
}

/// The page: a password box, then status, people (with kick), the join
/// password, the kits (with moving one) and the log tail, refreshed every few seconds. Plain HTML so it
/// needs nothing from outside.
const _page = r'''<!doctype html>
<html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Potato server admin</title>
<style>
body{font-family:system-ui,sans-serif;margin:0;padding:16px;background:#f6f1e7;color:#3a2a1c}
h1{font-size:20px} h2{font-size:16px;margin:20px 0 8px}
section{background:#fffaf0;border:1px solid #d9c9ad;border-radius:6px;padding:12px;margin-bottom:12px}
table{border-collapse:collapse;width:100%} td,th{text-align:left;padding:4px 6px;border-bottom:1px solid #eee2cc}
button{background:#8a5a32;color:#fff;border:0;border-radius:4px;padding:6px 10px;cursor:pointer}
input{padding:6px;border:1px solid #c9b48f;border-radius:4px}
pre{white-space:pre-wrap;font-size:12px;max-height:360px;overflow:auto;background:#2b241d;color:#efe6d4;padding:8px;border-radius:4px}
.dim{color:#8a7a66}
</style></head><body>
<h1>Potato server admin</h1>
<section id="login"><input id="pw" type="password" placeholder="Admin password">
<button onclick="login()">Open</button> <span id="err" class="dim"></span></section>
<div id="main" hidden>
<section><h2>Status</h2><table id="status"></table></section>
<section><h2>People</h2><table id="people"></table></section>
<section><h2>Join password</h2><span id="pwstate" class="dim"></span><br><br>
<input id="newpw" type="text" placeholder="New join password (empty: none)">
<button onclick="setPw()">Set</button></section>
<section><h2>Kits</h2><table id="kits"></table><br>
<span class="dim">Someone reinstalled the app? Move their old kit to the id they have now.
Nobody may be setting out, and neither id in the room.</span><br><br>
<select id="kitfrom"></select> &rarr; <input id="kitto" type="text" placeholder="New player id">
<button onclick="moveKit()">Move</button> <span id="kiterr" class="dim"></span></section>
<section><h2>Log</h2><pre id="log"></pre></section>
</div>
<script>
let key = sessionStorage.getItem('key') || '';
const esc = s => String(s ?? '').replace(/[&<>"]/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]));
async function api(path, body) {
  const r = await fetch(path, {method: body ? 'POST' : 'GET',
    headers: {'Authorization': 'Bearer ' + key, 'Content-Type': 'application/json'},
    body: body ? JSON.stringify(body) : undefined});
  if (r.status === 401) throw new Error('Wrong password');
  return r.json();
}
function login() { key = document.getElementById('pw').value; sessionStorage.setItem('key', key); refresh(); }
async function kick(peer) { await api('/api/kick', {peer}); refresh(); }
let kits = [];
const kitText = k => [...k.wears, ...k.bag.map(s => 'bag: ' + s), ...k.bed.map(s => 'bed: ' + s)].join(', ') || 'empty';
const reasons = {noFarm: 'No farm yet.', unknownPlayer: 'That kit is not here.',
  runGoing: 'A run is going; wait until everyone is home.', inRoom: 'One of them is in the room; kick them first.'};
async function moveKit() {
  const from = document.getElementById('kitfrom').value, to = document.getElementById('kitto').value.trim();
  const err = document.getElementById('kiterr');
  if (!from || !to) { err.textContent = 'Pick a kit and type the new id.'; return; }
  const old = kits.find(k => k.player === to);
  const ask = `Move the kit of ${from} to ${to}? ${from} is left with nothing.` +
    (old ? `\n${to}'s own kit is replaced: ${kitText(old)}` : '');
  if (!confirm(ask)) return;
  const r = await api('/api/kits/move', {from, to});
  err.textContent = r.ok ? 'Moved.' : (reasons[r.reason] || r.reason);
  if (r.ok) document.getElementById('kitto').value = '';
  refresh();
}
async function setPw() { await api('/api/password', {password: document.getElementById('newpw').value}); refresh(); }
async function refresh() {
  try {
    const s = await api('/api/status');
    const log = await api('/api/log?lines=200');
    document.getElementById('login').hidden = true;
    document.getElementById('main').hidden = false;
    const farm = s.farm ? `food ${s.farm.food} · progress ${s.farm.progress} · ${s.farm.players} players kept` : 'none yet';
    const run = s.run ? `${s.run.zone} (${s.run.members})` : 'none';
    document.getElementById('status').innerHTML =
      `<tr><td>Up</td><td>${Math.floor(s.uptime_seconds/60)} min</td></tr>` +
      `<tr><td>Game data</td><td>${esc(s.game_data ?? 'none yet')} (build ${esc(s.build ?? '-')})</td></tr>` +
      `<tr><td>Farm</td><td>${esc(farm)}</td></tr><tr><td>Run</td><td>${esc(run)}</td></tr>` +
      `<tr><td>Connections</td><td>${s.connections.length}</td></tr>`;
    document.getElementById('people').innerHTML = s.guests.length === 0 ? '<tr><td class="dim">Nobody here</td></tr>' :
      '<tr><th>Name</th><th>Player</th><th>State</th><th></th></tr>' + s.guests.map(g =>
        `<tr><td>${esc(g.name)}</td><td class="dim">${esc(g.player)}</td><td>${g.connected ? (g.ready ? 'ready' : 'here') : 'away'}</td>` +
        `<td>${g.connected ? `<button onclick="kick('${esc(g.peer)}')">Kick</button>` : ''}</td></tr>`).join('');
    kits = s.kits;
    document.getElementById('kits').innerHTML = kits.length === 0 ? '<tr><td class="dim">None yet</td></tr>' :
      '<tr><th>Player</th><th>Kit</th></tr>' + kits.map(k =>
        `<tr><td class="dim">${esc(k.player)}</td><td>${esc(kitText(k))}</td></tr>`).join('');
    const sel = document.getElementById('kitfrom'), picked = sel.value;
    sel.innerHTML = '<option value="">Old id</option>' + kits.map(k =>
      `<option value="${esc(k.player)}">${esc(k.player)}</option>`).join('');
    sel.value = kits.some(k => k.player === picked) ? picked : '';
    document.getElementById('pwstate').textContent = s.password ? 'Guests need a password.' : 'Anyone can join.';
    const pre = document.getElementById('log');
    pre.textContent = log.lines.join('\n');
    pre.scrollTop = pre.scrollHeight;
  } catch (e) {
    document.getElementById('err').textContent = e.message;
    document.getElementById('login').hidden = false;
    document.getElementById('main').hidden = true;
  }
}
if (key) refresh();
setInterval(() => { if (key && document.getElementById('login').hidden) refresh(); }, 3000);
</script></body></html>
''';
