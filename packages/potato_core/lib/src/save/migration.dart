/// The farm document format this code writes.
const int farmFormatVersion = 5;

/// The oldest format this code reads. Older documents (before abilities and
/// levels) are not upgraded while the game is in development: the client
/// starts a new farm instead.
const int oldestFarmFormatVersion = 4;

/// A farm document from before [oldestFarmFormatVersion].
final class FarmTooOldException extends FormatException {
  FarmTooOldException(int version)
    : super(
        'Farm document version $version is older than '
        '$oldestFarmFormatVersion and is not upgraded',
      );
}

/// Upgrades from version `n` to `n + 1`, at index `n - oldest`.
///
/// When the format changes: bump [farmFormatVersion], add a step here that
/// rewrites the old JSON map, and keep every old step. Steps work on plain
/// maps because the old shape no longer has a model class.
final List<Map<String, dynamic> Function(Map<String, dynamic> json)>
_farmMigrations = [
  // 4 → 5: the potato cellar became a building that comes with the farm.
  // Older farms get one when they are read.
  (json) => json
    ..['missing_buildings'] = [
      ...?(json['missing_buildings'] as List?),
      'potato_cellar',
    ],
];

/// Brings a decoded farm document up to [farmFormatVersion].
///
/// Throws [FarmTooOldException] for a document older than
/// [oldestFarmFormatVersion], and [FormatException] when the version is
/// missing or newer than this code knows.
Map<String, dynamic> migrateFarmJson(Map<String, dynamic> json) {
  assert(_farmMigrations.length == farmFormatVersion - oldestFarmFormatVersion);
  final version = json['format_version'];
  if (version is! int || version < 1) {
    throw FormatException(
      'Farm document has no valid format_version: $version',
    );
  }
  if (version < oldestFarmFormatVersion) throw FarmTooOldException(version);
  if (version > farmFormatVersion) {
    throw FormatException(
      'Farm document version $version is newer than $farmFormatVersion',
    );
  }
  var upgraded = json;
  for (var from = version; from < farmFormatVersion; from++) {
    upgraded = _farmMigrations[from - oldestFarmFormatVersion](upgraded)
      ..['format_version'] = from + 1;
  }
  return upgraded;
}
