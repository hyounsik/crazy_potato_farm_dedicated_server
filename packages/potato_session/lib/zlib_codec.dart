/// A [SessionCodec] that deflates large messages (2026-10-28): a two-player
/// raid sent about 42 KB of JSON per snapshot, ten a second, about 5.5
/// times that of the deflated bytes.
///
/// Kept apart from `potato_session.dart` because it needs `dart:io` (the
/// platform's zlib); the app and the dedicated server pass it to their
/// sessions.
library;

import 'dart:io';
import 'dart:typed_data';

import 'package:potato_session/potato_session.dart';

/// JSON, deflated when it is at least [minBytes] long. Small messages (a
/// stick direction) gain nothing from it and go as plain JSON.
///
/// Decoding tells the two apart by the first byte, so plain JSON from an
/// older peer still reads: JSON objects begin with `{`, zlib streams never
/// do.
final class ZlibSessionCodec implements SessionCodec {
  const ZlibSessionCodec({this.minBytes = 256, this.level = 6});

  final int minBytes;

  /// 1 (fastest) to 9 (smallest).
  final int level;

  static const JsonSessionCodec _json = JsonSessionCodec();
  static const int _openBrace = 0x7B;

  @override
  Uint8List encode(SessionMessage message) {
    final plain = _json.encode(message);
    if (plain.length < minBytes) return plain;
    return Uint8List.fromList(ZLibEncoder(level: level).convert(plain));
  }

  @override
  SessionMessage decode(Uint8List bytes) {
    if (bytes.isEmpty || bytes.first == _openBrace) return _json.decode(bytes);
    return _json.decode(Uint8List.fromList(zlib.decode(bytes)));
  }
}
