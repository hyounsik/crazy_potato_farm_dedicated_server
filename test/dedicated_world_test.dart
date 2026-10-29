import 'dart:convert';
import 'dart:io';

import 'package:potato_dedicated_server/potato_dedicated_server.dart';
import 'package:potato_session/potato_session.dart';
import 'package:test/test.dart';

Map<String, dynamic> _catalogFiles() {
  final dir = Directory('packages/potato_core/test/fixtures/catalog');
  return {
    for (final file in dir.listSync())
      if (file is File && file.path.endsWith('.json'))
        file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
          file.readAsStringSync(),
        ),
  };
}

/// The one farm a dedicated server keeps on disk (`save-and-online.md`,
/// 2026-10-28, 사용자).
void main() {
  late Directory dir;
  late Map<String, dynamic> files;
  late Catalog catalog;

  setUpAll(() {
    files = _catalogFiles();
    catalog = Catalog.load(files).catalog!;
  });
  setUp(() => dir = Directory.systemTemp.createTempSync('world_test'));
  tearDown(() => dir.deleteSync(recursive: true));

  DedicatedWorld world() => DedicatedWorld(
    store: WorldStore(dir),
    tickEvery: const Duration(milliseconds: 20),
    saveAfter: const Duration(milliseconds: 20),
  );

  Future<void> adopt(DedicatedWorld w, {String hash = 'h1'}) => w.adoptCatalog(
    catalog: catalog,
    files: files,
    hash: hash,
    buildNumber: 7,
  );

  test('the first game data makes a new farm, kept with the kits', () async {
    final w = world();
    await w.open();
    expect(w.room, isNull, reason: 'nothing saved, no game data yet');
    await adopt(w);
    expect(w.room, isNotNull);
    final food = w.room!.farm.food;
    w.apply('a', const FarmCommand.loadBag(item: 'food', count: 10));
    await w.close();

    final again = world();
    await again.open();
    expect(again.catalogHash, 'h1');
    expect(again.room!.farm.food, food - 10);
    expect(again.room!.kitOf('a').bag.countOf('food'), 10);
    await again.close();
  });

  test('time goes on with nobody there', () async {
    final w = world();
    await w.open();
    await adopt(w);
    final tick = w.room!.farm.tick;
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    expect(w.room!.farm.tick, greaterThan(tick));
    await w.close();
  });

  test('newer game data carries the farm over', () async {
    final w = world();
    await w.open();
    await adopt(w);
    w.apply('a', const FarmCommand.loadBag(item: 'food', count: 5));
    await adopt(w, hash: 'h2');
    expect(w.catalogHash, 'h2');
    expect(w.room!.kitOf('a').bag.countOf('food'), 5);
    await w.close();
  });

  test('older saves stay as backups and stand in for a broken one', () async {
    final store = WorldStore(dir, backups: 2);
    await store.saveCatalog(files: files, hash: 'h', buildNumber: 1);
    await store.saveRoom({'n': 1});
    await store.saveRoom({'n': 2});
    await store.saveRoom({'n': 3});
    expect(File('${dir.path}/world.json.1').existsSync(), isTrue);
    expect(File('${dir.path}/world.json.2').existsSync(), isTrue);
    File('${dir.path}/world.json').writeAsStringSync('{broken');
    expect((await store.load())!.room, {'n': 2});
  });
}
