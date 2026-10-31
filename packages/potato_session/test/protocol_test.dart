import 'dart:io';

import 'package:potato_session/potato_session.dart';
import 'package:test/test.dart';

/// The wire fingerprint each [sessionProtocol] was given. When this test
/// fails, the JSON on the wire changed: bump [sessionProtocol] and add its
/// new fingerprint here (keep the old lines as a record).
const Map<int, String> _fingerprints = {
  1: '27a2eda8',
  2: 'ced8d486',
  3: '32428bfd',
};

void main() {
  test('sessionProtocol is bumped whenever the wire format changes '
      '(2026-10-30)', () {
    final now = _fingerprint();
    expect(
      now,
      _fingerprints[sessionProtocol],
      reason:
          'The names on the wire changed. Bump sessionProtocol in '
          'session_message.dart and add `${sessionProtocol + 1}: '
          "'$now'` to _fingerprints.",
    );
  });
}

/// A hash of every name that can go over the wire: the lowercase string
/// literals in this package's sources (message types and keys) and in
/// potato_core's generated JSON code (what messages carry). It misses a
/// change of meaning under the same names, so think of those too.
String _fingerprint() {
  final names = <String>{};
  final literal = RegExp(r"'([a-z][a-z0-9_]*)'");
  void scan(String dir, bool Function(String path) take) {
    final files =
        Directory(dir)
            .listSync(recursive: true)
            .whereType<File>()
            .where((f) => take(f.path))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));
    for (final file in files) {
      for (final match in literal.allMatches(file.readAsStringSync())) {
        names.add(match.group(1)!);
      }
    }
  }

  scan('lib', (path) => path.endsWith('.dart'));
  scan('../potato_core/lib', (path) => path.endsWith('.g.dart'));
  // FNV-1a, 32 bits: stable everywhere, no package needed.
  var hash = 0x811c9dc5;
  for (final unit in (names.toList()..sort()).join('\n').codeUnits) {
    hash = ((hash ^ unit) * 0x01000193) & 0xffffffff;
  }
  return hash.toRadixString(16).padLeft(8, '0');
}
