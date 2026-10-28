import 'dart:convert';
import 'dart:io';

import 'package:potato_session/potato_session.dart';
import 'package:test/test.dart';

Map<String, Object?> _loadCatalogFiles() {
  final candidates = [
    Directory('../potato_core/test/fixtures/catalog'),
    Directory('packages/potato_core/test/fixtures/catalog'),
    Directory(
      '../crazy_potato_farm_dedicated_server/packages/potato_core/test/fixtures/catalog',
    ),
  ];
  final dir = candidates.firstWhere(
    (d) => d.existsSync(),
    orElse: () =>
        throw StateError('Cannot find potato_core/test/fixtures/catalog'),
  );
  return {
    for (final file in dir.listSync())
      if (file is File && file.path.endsWith('.json'))
        file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
          file.readAsStringSync(),
        ),
  };
}

Catalog _testCatalog() {
  final files = _loadCatalogFiles();
  final zones =
      (files['zones']! as Map<String, dynamic>)['zones'] as List<Object?>;
  final open = jsonDecode(jsonEncode(zones.first)) as Map<String, dynamic>;
  open['id'] = 'open';
  open['map'] = {
    'size': 20,
    'entry': {'x': 10, 'y': 10},
    'clear_radius': 1,
    'rotate': false,
    'scatter': {'count': 0},
  };
  (open['enemies'] as Map)['count'] = 0;
  (open['enemies'] as Map)['packs'] = 0;
  (open['gathering'] as Map)['count'] = 0;
  zones.add(open);

  final danger = jsonDecode(jsonEncode(open)) as Map<String, dynamic>;
  danger['id'] = 'danger_open';
  (danger['map'] as Map)['exits'] = [
    {'x': 16, 'y': 10},
    {'x': 3, 'y': 10},
  ];
  danger['danger'] = {
    'open_exits': 2,
    'reveal_seconds': 60,
    'exit_radius': 0.9,
    'countdown_seconds': 5,
    'wait_sight_multiplier': 2,
    'hungry_damage_per_second': 10,
  };
  zones.add(danger);

  final res = Catalog.load(files);
  if (!res.isValid) throw StateError('Invalid catalog: ${res.issues}');
  return res.catalog!;
}

Future<void> _pumpMicrotasks([int turns = 4]) async {
  for (var i = 0; i < turns; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  late Catalog catalog;

  setUpAll(() {
    catalog = _testCatalog();
  });

  /// The host and guests [ids] at the host's farm, the host bringing
  /// [hostBed] and each guest the bed in [guestBeds].
  Future<(HostSession, List<ClientSession>)> room(
    List<String> ids, {
    List<ItemStack?> hostBed = const [],
    Map<String, List<ItemStack?>> guestBeds = const {},
  }) async {
    final net = InMemorySessionNetwork();
    final host = HostSession(
      catalog: catalog,
      transport: net.host,
      hostName: 'Host',
    )..setHostBed(hostBed);
    final guests = [
      for (final id in ids)
        ClientSession(
          catalog: catalog,
          transport: net.connectClient(id),
          start: RaidMemberStart(name: id),
          bed: guestBeds[id] ?? const [],
        ),
    ];
    await _pumpMicrotasks();
    return (host, guests);
  }

  Future<void> closeAll(HostSession host, List<ClientSession> guests) async {
    for (final g in guests) {
      await g.close();
    }
    await host.close();
  }

  test('everyone sees every bed by place, all locked at first', () async {
    final (host, [a]) = await room(
      ['a'],
      hostBed: [ItemStack('food', 5)],
      guestBeds: {
        'a': [null, ItemStack('material', 3)],
      },
    );
    expect(a.beds, hasLength(2));
    expect(a.beds[0].slots.first?.count, 5);
    expect(a.beds[1].slots[1]?.item, 'material');
    expect(a.beds[1].slots, hasLength(catalog.rules.storage.bedSlots));
    expect(a.beds.every((b) => !b.open), isTrue);
    expect(host.beds, hasLength(2));
    await closeAll(host, [a]);
  });

  test(
    'a locked bed only lets its owner in, the farm owner included',
    () async {
      final (host, [a, b]) = await room(
        ['a', 'b'],
        guestBeds: {
          'a': [ItemStack('material', 3)],
        },
      );
      final gifts = <({ItemStack? stack, BedRefusal? refusal})>[];
      b.bedGifts.listen(gifts.add);

      expect(host.takeFromBed(1, 0, 'material').refusal, BedRefusal.locked);
      b.takeFromBed(1, 0, 'material');
      await _pumpMicrotasks();
      expect(gifts.single.refusal, BedRefusal.locked);

      // Its owner takes from it locked or not.
      final own = <({ItemStack? stack, BedRefusal? refusal})>[];
      a.bedGifts.listen(own.add);
      a.takeFromBed(1, 0, 'material');
      await _pumpMicrotasks();
      expect(own.single.stack?.count, 3);
      expect(a.beds[1].slots.first, isNull);
      await closeAll(host, [a, b]);
    },
  );

  test('an open bed trades with anyone, guests among themselves too', () async {
    final (host, [a, b]) = await room(['a', 'b']);
    a.setBedOpen(true);
    await _pumpMicrotasks();
    expect(b.beds[1].open, isTrue);

    // b gives a something: putting on a's bed.
    b.putInBed(1, ItemStack('material', 4));
    await _pumpMicrotasks();
    expect(a.beds[1].slots.first?.count, 4);

    // The host takes it out of a's open bed.
    final taken = host.takeFromBed(1, 0, 'material');
    expect(taken.stack?.count, 4);
    await _pumpMicrotasks();
    expect(a.beds[1].slots.first, isNull);

    // The host puts on their own bed while it is locked.
    expect(host.putInBed(0, ItemStack('food', 2)), isNull);
    expect(host.hostBedSlots.first?.count, 2);
    await closeAll(host, [a, b]);
  });

  test('part of a stack can be taken or moved (2026-10-28)', () async {
    final (host, [a]) = await room(['a'], hostBed: [ItemStack('material', 10)]);
    host.setBedOpen(true);
    await _pumpMicrotasks();
    final got = <({ItemStack? stack, BedRefusal? refusal})>[];
    a.bedGifts.listen(got.add);
    a.takeFromBed(0, 0, 'material', count: 3);
    await _pumpMicrotasks();
    expect(got.single.stack?.count, 3);
    expect(host.hostBedSlots.first?.count, 7);

    a.takeFromBed(0, 0, 'material', into: 1, count: 2);
    await _pumpMicrotasks();
    expect(host.hostBedSlots.first?.count, 5);
    expect(a.beds[1].slots.first?.count, 2);

    expect(host.takeFromBed(0, 0, 'material', count: 4).stack?.count, 4);
    expect(host.hostBedSlots.first?.count, 1);
    await closeAll(host, [a]);
  });

  test('two reaching for the same stack: the first gets it', () async {
    final (host, [a, b]) = await room(
      ['a', 'b'],
      hostBed: [ItemStack('material', 3)],
    );
    host.setBedOpen(true);
    await _pumpMicrotasks();
    final gotA = <({ItemStack? stack, BedRefusal? refusal})>[];
    final gotB = <({ItemStack? stack, BedRefusal? refusal})>[];
    a.bedGifts.listen(gotA.add);
    b.bedGifts.listen(gotB.add);
    a.takeFromBed(0, 0, 'material');
    b.takeFromBed(0, 0, 'material');
    await _pumpMicrotasks();
    expect(gotA.single.stack?.count, 3);
    expect(gotB.single.refusal, BedRefusal.gone);
    await closeAll(host, [a, b]);
  });

  test('what does not fit comes back', () async {
    final size = catalog.rules.storage.bedSlots;
    final stack = catalog.stackOf('material');
    final (host, [a]) = await room(
      ['a'],
      hostBed: [for (var i = 0; i < size; i++) ItemStack('material', stack)],
    );
    host.setBedOpen(true);
    await _pumpMicrotasks();
    final gifts = <({ItemStack? stack, BedRefusal? refusal})>[];
    a.bedGifts.listen(gifts.add);
    a.putInBed(0, ItemStack('food', 7));
    await _pumpMicrotasks();
    expect(gifts.single.refusal, BedRefusal.full);
    expect(gifts.single.stack?.count, 7);
    await closeAll(host, [a]);
  });

  test('a guest who leaves takes their bed; places move up', () async {
    final net = InMemorySessionNetwork();
    final host = HostSession(
      catalog: catalog,
      transport: net.host,
      hostName: 'Host',
    )..setHostBed(const []);
    final a = ClientSession(
      catalog: catalog,
      transport: net.connectClient('a'),
      start: const RaidMemberStart(name: 'a'),
    );
    final b = ClientSession(
      catalog: catalog,
      transport: net.connectClient('b'),
      start: const RaidMemberStart(name: 'b'),
      bed: [ItemStack('food', 9)],
    );
    await _pumpMicrotasks();
    var changes = 0;
    host.bedsChanged.listen((_) => changes++);
    net.disconnectClient('a');
    await a.close();
    await _pumpMicrotasks();
    expect(host.beds, hasLength(2));
    expect(b.beds[1].slots.first?.count, 9, reason: "b's bed is now second");
    expect(changes, greaterThan(0));
    await closeAll(host, [b]);
  });

  test('a guest moves from their own bed straight onto an open one', () async {
    final (host, [a]) = await room(
      ['a'],
      guestBeds: {
        'a': [ItemStack('material', 3)],
      },
    );
    final gifts = <({ItemStack? stack, BedRefusal? refusal})>[];
    a.bedGifts.listen(gifts.add);
    a.takeFromBed(1, 0, 'material', into: 0);
    await _pumpMicrotasks();
    expect(gifts.single.refusal, BedRefusal.locked);
    expect(a.beds[1].slots.first?.count, 3, reason: 'nothing moved');

    host.setBedOpen(true);
    await _pumpMicrotasks();
    a.takeFromBed(1, 0, 'material', into: 0);
    await _pumpMicrotasks();
    expect(a.beds[0].slots.first?.count, 3);
    expect(a.beds[1].slots.first, isNull);
    expect(host.hostBedSlots.first?.count, 3);
    await closeAll(host, [a]);
  });

  test('the bed travels in the hello message', () {
    final msg = HelloMessage(
      buildNumber: 1,
      catalogHash: 'x',
      start: const RaidMemberStart(),
      bed: [null, ItemStack('food', 2)],
    );
    final back = SessionMessage.fromJson(
      jsonDecode(jsonEncode(msg.toJson())) as Map<String, dynamic>,
    );
    expect((back as HelloMessage).bed[1]?.count, 2);
  });
}
