import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Puts a dedicated server on the game's public server list.
///
/// NOT WORKING YET: the list is not open to the public. Keys can't be had
/// in the released app, and the list service turns servers away until it
/// opens.
///
/// With an operator key (from the app's settings, one per account) the
/// server sends a heartbeat to the list service every few minutes and when
/// its player count changes. The service lists it while they keep coming
/// (players see servers heard from in the last ten minutes) and checks now
/// and then that the address answers on `/ping` with this server's [nonce],
/// so no one can list someone else's address. A listed server only lets in
/// players who sign in: they bring a one-use ticket for this server, which
/// [checkTicket] turns into the id this server knows them by.
///
/// A key that is revoked or a list that is closed stops the heartbeats (no
/// point calling again); other failures try again after a random wait.
class PublicListing {
  PublicListing({
    required this.serviceUrl,
    required this.key,
    required this.name,
    required this.port,
    required this.status,
    this.region = '',
    this.host = '',
    this.log,
    this.minGap = const Duration(seconds: 30),
    Random? random,
    HttpClient? client,
  }) : nonce = _newNonce(random ?? Random.secure()),
       _random = random ?? Random(),
       _client = client ?? HttpClient();

  /// The list service's base URL (its `/heartbeat` and `/ticket`).
  final Uri serviceUrl;

  /// The operator key.
  final String key;

  /// The name players see.
  final String name;

  /// The region players filter by, as the operator wrote it (e.g. `KR`).
  final String region;

  /// The domain players connect to; empty for the IP the service sees.
  final String host;

  /// The port players connect to.
  final int port;

  /// Who is on and which build, read at each heartbeat.
  final ListingStatus Function() status;

  final void Function(String message)? log;

  /// The least time between heartbeats sent for a player count change.
  final Duration minGap;

  /// What `/ping` answers, proving the listed address is this server.
  final String nonce;

  final Random _random;
  final HttpClient _client;

  Timer? _timer;
  DateTime _lastSent = DateTime.fromMillisecondsSinceEpoch(0);
  Duration _period = const Duration(minutes: 5);
  bool _stopped = false;
  bool _sending = false;

  /// A change came while a heartbeat was on its way: send again after it.
  bool _changedWhileSending = false;

  /// Whether heartbeats stopped for good (key revoked, list closed).
  bool get stopped => _stopped;

  /// Whether the list said it is not open: the server then runs as a
  /// private one, without tickets. A revoked key keeps them (2026-10-31,
  /// 사용자).
  bool get listClosed => _listClosed;
  bool _listClosed = false;

  /// The first heartbeat goes after a random wait of up to [firstWithin], so
  /// servers that restart together do not call all at once.
  void start({Duration firstWithin = const Duration(seconds: 30)}) {
    _schedule(_jitter(Duration.zero, firstWithin));
  }

  /// The player count changed: say so soon, but not more than every
  /// [minGap].
  void changed() {
    if (_stopped) return;
    // The reply would replace a timer set now with the next period.
    if (_sending) {
      _changedWhileSending = true;
      return;
    }
    final since = DateTime.now().difference(_lastSent);
    _schedule(since >= minGap ? Duration.zero : minGap - since);
  }

  void stop() {
    _stopped = true;
    _timer?.cancel();
  }

  Future<void> close() async {
    stop();
    _client.close(force: true);
  }

  void _schedule(Duration after) {
    if (_stopped) return;
    _timer?.cancel();
    _timer = Timer(after, () => unawaited(_beat()));
  }

  Duration _jitter(Duration min, Duration max) =>
      min +
      Duration(milliseconds: _random.nextInt((max - min).inMilliseconds + 1));

  Future<void> _beat() async {
    if (_stopped) return;
    if (_sending) {
      _changedWhileSending = true;
      return;
    }
    _sending = true;
    _lastSent = DateTime.now();
    final now = status();
    try {
      final (code, body) = await _post('heartbeat', {
        'key': key,
        'name': name,
        'region': region,
        'host': host,
        'port': port,
        'nonce': nonce,
        'protocol': now.protocol,
        'build': now.build,
        'players': now.players,
        'max_players': now.maxPlayers,
      });
      switch ((code, body['error'])) {
        case (200, _):
          final next = body['next_seconds'];
          if (next is int && next > 0) _period = Duration(seconds: next);
          _schedule(_jitter(_period * 0.9, _period * 1.1));
        case (_, 'bad-key'):
          log?.call('Public list: the key was refused; not listed any more');
          stop();
        case (_, 'closed'):
          log?.call('Public list: not open yet; running as a private server');
          _listClosed = true;
          stop();
        case (_, 'unreachable'):
          log?.call(
            'Public list: ${body['address']} did not answer from outside; '
            'open port $port (or check the domain)',
          );
          _retry();
        default:
          log?.call('Public list: heartbeat failed ($code)');
          _retry();
      }
    } on Object catch (error) {
      log?.call('Public list: heartbeat failed ($error)');
      _retry();
    } finally {
      _sending = false;
      if (_changedWhileSending) {
        _changedWhileSending = false;
        changed();
      }
    }
  }

  void _retry() => _schedule(
    _jitter(const Duration(seconds: 30), const Duration(seconds: 90)),
  );

  /// The id the player holding [ticket] has on this server, or null when
  /// the ticket is no good (used, expired, for another server).
  Future<String?> checkTicket(String ticket) async {
    try {
      final (code, body) = await _post('ticket', {
        'key': key,
        'ticket': ticket,
      });
      final id = body['player_id'];
      return code == 200 && id is String && id.isNotEmpty ? id : null;
    } on Object catch (error) {
      log?.call('Public list: ticket check failed ($error)');
      return null;
    }
  }

  Future<(int, Map<String, dynamic>)> _post(
    String path,
    Map<String, Object?> json,
  ) async {
    final request = await _client
        .postUrl(serviceUrl.resolve(path))
        .timeout(const Duration(seconds: 15));
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(json));
    final response = await request.close().timeout(const Duration(seconds: 15));
    final text = await response.transform(utf8.decoder).join();
    Map<String, dynamic> body;
    try {
      body = jsonDecode(text) as Map<String, dynamic>;
    } on Object {
      body = const {};
    }
    return (response.statusCode, body);
  }

  static String _newNonce(Random random) => base64Url
      .encode(List<int>.generate(18, (_) => random.nextInt(256)))
      .replaceAll('=', '');
}

/// What a heartbeat reports.
typedef ListingStatus = ({
  int protocol,
  int build,
  int players,
  int maxPlayers,
});
