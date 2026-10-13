/// The farm document format this code writes.
const int farmFormatVersion = 2;

/// Upgrades from version `n` to `n + 1`, at index `n - 1`.
///
/// When the format changes: bump [farmFormatVersion], add a step here that
/// rewrites the old JSON map, and keep every old step. Steps work on plain
/// maps because the old shape no longer has a model class.
final List<Map<String, dynamic> Function(Map<String, dynamic> json)>
_farmMigrations = [
  // 1 → 2: potatoes can be out exploring.
  (json) {
    for (final field in json['fields'] as List<Object?>) {
      for (final potato in (field! as Map)['potatoes'] as List<Object?>) {
        (potato! as Map)['away'] = false;
      }
    }
    return json;
  },
];

/// Brings a decoded farm document up to [farmFormatVersion].
///
/// Throws [FormatException] when the version is missing or newer than this
/// code knows.
Map<String, dynamic> migrateFarmJson(Map<String, dynamic> json) {
  assert(_farmMigrations.length == farmFormatVersion - 1);
  final version = json['format_version'];
  if (version is! int || version < 1) {
    throw FormatException(
      'Farm document has no valid format_version: $version',
    );
  }
  if (version > farmFormatVersion) {
    throw FormatException(
      'Farm document version $version is newer than $farmFormatVersion',
    );
  }
  var upgraded = json;
  for (var from = version; from < farmFormatVersion; from++) {
    upgraded = _farmMigrations[from - 1](upgraded)
      ..['format_version'] = from + 1;
  }
  return upgraded;
}
