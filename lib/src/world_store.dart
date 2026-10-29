import 'dart:convert';
import 'dart:io';

/// What a dedicated server keeps on disk between runs (`save-and-online.md`,
/// 2026-10-28, 사용자: the server holds its one shared farm).
typedef SavedWorld = ({
  /// The game data files a guest brought, as `Catalog.load` takes them.
  Map<String, dynamic> catalogFiles,

  /// That game data's hash and the build that brought it, so a guest on
  /// the same build can come in without sending it again.
  String catalogHash,
  int buildNumber,

  /// The shared farm and every player's kit, as `FarmRoom.toJson`; null
  /// until a farm was made.
  Map<String, dynamic>? room,
});

/// Saves a [SavedWorld] in [directory]: `catalog.json` and `world.json`,
/// each written to a temporary file and moved into place so a crash never
/// leaves half a file. The last [backups] worlds stay as `world.json.1`
/// (newest) to `world.json.<backups>` *(제안)*.
///
/// The game data is unreleased content: it stays on the machine that runs
/// the server, never in this public repository.
final class WorldStore {
  WorldStore(this.directory, {this.backups = 3});

  final Directory directory;
  final int backups;

  File get _catalogFile => File('${directory.path}/catalog.json');
  File get _worldFile => File('${directory.path}/world.json');

  /// What was saved last, or null when nothing was (or it cannot be read).
  Future<SavedWorld?> load() async {
    final catalog = await _readJson(_catalogFile);
    if (catalog == null) return null;
    return (
      catalogFiles: catalog['files'] as Map<String, dynamic>,
      catalogHash: catalog['hash'] as String,
      buildNumber: catalog['build'] as int,
      room: await _readWorld(),
    );
  }

  /// Keeps the game data a guest brought.
  Future<void> saveCatalog({
    required Map<String, dynamic> files,
    required String hash,
    required int buildNumber,
  }) => _write(
    _catalogFile,
    jsonEncode({'hash': hash, 'build': buildNumber, 'files': files}),
  );

  /// Saves one at a time: two at once would move the same backups.
  Future<void> _saving = Future.value();

  /// Keeps the shared farm and the kits, moving older saves down the
  /// backups. A save asked for while one is being written waits for it.
  Future<void> saveRoom(Map<String, dynamic> room) {
    final next = _saving.then((_) => _saveRoom(room));
    _saving = next.then<void>((_) {}, onError: (Object _) {});
    return next;
  }

  Future<void> _saveRoom(Map<String, dynamic> room) async {
    await directory.create(recursive: true);
    if (await _worldFile.exists()) {
      for (var i = backups; i > 1; i--) {
        final older = File('${_worldFile.path}.${i - 1}');
        if (await older.exists()) await older.rename('${_worldFile.path}.$i');
      }
      if (backups > 0) await _worldFile.copy('${_worldFile.path}.1');
    }
    await _write(_worldFile, jsonEncode(room));
  }

  /// The newest world that reads, falling back to the backups.
  Future<Map<String, dynamic>?> _readWorld() async {
    for (final file in [
      _worldFile,
      for (var i = 1; i <= backups; i++) File('${_worldFile.path}.$i'),
    ]) {
      if (await _readJson(file) case final json?) return json;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> _readJson(File file) async {
    try {
      if (!await file.exists()) return null;
      return jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    } on Object {
      return null;
    }
  }

  Future<void> _write(File file, String text) async {
    await directory.create(recursive: true);
    final temp = File('${file.path}.tmp');
    await temp.writeAsString(text, flush: true);
    await temp.rename(file.path);
  }
}
