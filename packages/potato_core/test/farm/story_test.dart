import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _normal = plainSeed(PotatoType.food, Grade.normal);
const _tile = TilePos(12, 9);

/// A short story: two fields open the safe zone, a safe escape opens the
/// graveyard and pests, then a wait opens the danger zone and expansion.
Map<String, dynamic> _story() => {
  'version': 1,
  'locked': [
    'zone:sample_zone',
    'zone:sample_danger',
    'building:graveyard',
    'pests',
    'farm_expansion',
  ],
  'events': [
    {
      'id': 'two_fields',
      'goals': [
        {'kind': 'fields', 'count': 2},
      ],
      'unlocks': ['zone:sample_zone'],
      'food': 30,
      'seeds': [
        {'type': 'food', 'grade': 'rare', 'count': 2, 'level': 1},
      ],
    },
    {
      'id': 'first_escape',
      'goals': [
        {'kind': 'escapes', 'danger': false},
      ],
      'unlocks': ['building:graveyard', 'pests'],
    },
    {
      'id': 'rest',
      'goals': [
        {'kind': 'wait', 'count': 60},
      ],
      'unlocks': ['zone:sample_danger', 'farm_expansion'],
    },
  ],
};

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalogWith((files) => files['story'] = _story());
    farm = FarmSimulation.newFarm(catalog, seed: 1);
  });

  /// A free spot for a 1×1 field next to the starting one.
  TileRect secondField() {
    for (var y = 0; y < catalog.rules.farm.size; y++) {
      for (var x = 0; x < catalog.rules.farm.size; x++) {
        final rect = TileRect(origin: TilePos(x, y), width: 1, height: 1);
        if (farm.canPlace(rect)) return rect;
      }
    }
    throw StateError('no room');
  }

  TilePos? openableBlock() {
    final blocks = catalog.rules.farm.size ~/ catalog.rules.farm.blockSize;
    for (var y = 0; y < blocks; y++) {
      for (var x = 0; x < blocks; x++) {
        if (farm.canOpen(TilePos(x, y))) return TilePos(x, y);
      }
    }
    return null;
  }

  void escape(String zone) => farm.apply(
    FarmCommand.returnHome(
      food: 0,
      score: catalog.zones[zone]!.score,
      zone: zone,
    ),
  );

  test('a locked feature is refused until its event is done', () {
    expect(farm.zoneOpen('sample_zone'), isFalse);
    expect(farm.canBuildKind('graveyard'), isFalse);
    expect(farm.canBuildKind('training_ground'), isTrue, reason: 'not listed');
    expect(
      farm.apply(FarmCommand.depart(food: 0, zone: 'sample_zone')),
      FarmRejection.locked,
    );
    expect(
      farm.apply(
        FarmCommand.build(kind: 'graveyard', origin: const TilePos(2, 2)),
      ),
      FarmRejection.locked,
    );
    final block = openableBlock();
    if (block != null) {
      expect(
        farm.apply(FarmCommand.openBlock(block: block)),
        FarmRejection.locked,
      );
    }
  });

  test('meeting the goals finishes the event, opens it and sends a letter', () {
    expect(farm.storyEventsOpen.map((e) => e.id), ['two_fields']);
    farm.takeEvents();

    expect(farm.apply(FarmCommand.makeField(rect: secondField())), isNull);
    expect(farm.storyDone.keys, ['two_fields']);
    expect(farm.zoneOpen('sample_zone'), isTrue);
    final events = farm.takeEvents();
    expect(
      events,
      contains(
        const FarmEvent.storyDone(
          event: 'two_fields',
          unlocks: ['zone:sample_zone'],
        ),
      ),
    );

    final letter = farm.mail.last;
    expect(letter.kind, MailKind.story);
    expect(letter.story, 'two_fields');
    expect(letter.food, 30);
    expect(letter.seeds, hasLength(2));
    expect(letter.seeds.every((s) => s.grade == Grade.rare), isTrue);
    final food = farm.food;
    expect(farm.apply(FarmCommand.claimMail(mailId: letter.id)), isNull);
    expect(farm.food, food + 30);

    expect(farm.storyEventsOpen.map((e) => e.id), ['first_escape']);
    expect(
      farm.apply(FarmCommand.depart(food: 0, zone: 'sample_zone')),
      isNull,
    );
  });

  test('later events wait for earlier ones; a wait counts from then', () {
    farm.apply(FarmCommand.makeField(rect: secondField()));
    escape('sample_zone');
    expect(farm.storyDone.keys, ['two_fields', 'first_escape']);
    expect(farm.canBuildKind('graveyard'), isTrue);

    farm.runSteps(59);
    expect(farm.storyDone.containsKey('rest'), isFalse);
    farm.step();
    expect(farm.storyDone.keys.last, 'rest');
    expect(farm.zoneOpen('sample_danger'), isTrue);
    expect(farm.isUnlocked(StoryUnlock.farmExpansion), isTrue);
    expect(farm.storyEventsOpen, isEmpty);
  });

  test('a failed run and a run to a danger zone do not count as safe', () {
    farm.apply(FarmCommand.makeField(rect: secondField()));
    farm.apply(const FarmCommand.returnHome(food: 0, zone: 'sample_zone'));
    expect(farm.storyDone.containsKey('first_escape'), isFalse);
    escape('sample_danger');
    expect(farm.storyDone.containsKey('first_escape'), isFalse);
    expect(farm.totals.escapes, {'sample_danger': 1});
    escape('sample_zone');
    expect(farm.storyDone.containsKey('first_escape'), isTrue);
  });

  test('no pests appear before the story opens them', () {
    final sure = sampleCatalogWith((files) {
      files['story'] = _story();
      ((rulesOf(files)['pests'] as Map)['blight'] as Map)['chance'] = 1.0;
    });
    final farm = FarmSimulation.newFarm(sure, seed: 1)..seeds.add(_normal, 1);
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _tile, seed: _normal));
    final check = sure.rules.pests.checkEverySeconds;
    farm.runSteps(check * 3);
    expect(farm.totals.pestsAppeared, 0);

    farm.apply(const FarmCommand.unlockAll());
    farm.runSteps(check);
    expect(farm.totals.pestsAppeared, 1, reason: 'certain once open');
  });

  test('done events and their unlocks survive a save', () {
    farm.apply(FarmCommand.makeField(rect: secondField()));
    final json = FarmDocument.of(farm).toJson();
    final loaded = FarmDocument.decode(json).toSimulation(catalog);
    expect(loaded.storyDone, farm.storyDone);
    expect(loaded.zoneOpen('sample_zone'), isTrue);
    expect(loaded.canBuildKind('graveyard'), isFalse);
    expect(loaded.mail.last.story, 'two_fields');
  });

  test('a farm saved before the story keeps everything open', () {
    final json = FarmDocument.of(farm).toJson()
      ..['format_version'] = 5
      ..remove('story_skipped');
    final loaded = FarmDocument.decode(json).toSimulation(catalog);
    expect(loaded.storySkipped, isTrue);
    expect(loaded.zoneOpen('sample_danger'), isTrue);
    expect(loaded.canBuildKind('graveyard'), isTrue);
    loaded.apply(FarmCommand.makeField(rect: secondField()));
    expect(loaded.storyDone, isEmpty, reason: 'no story events');
  });

  test('unlock all opens everything and stops the story', () {
    expect(farm.apply(const FarmCommand.unlockAll()), isNull);
    expect(farm.zoneOpen('sample_danger'), isTrue);
    expect(farm.storyEventsOpen, isEmpty);
    expect(
      farm.apply(const FarmCommand.unlockAll()),
      FarmRejection.nothingToClaim,
    );
  });

  test('goals already met finish a chain of events at once', () {
    final quick = sampleCatalogWith((files) {
      files['story'] = {
        'version': 1,
        'locked': ['pests'],
        'events': [
          {'id': 'a'},
          {
            'id': 'b',
            'goals': [
              {'kind': 'buildings', 'building': 'potato_cellar'},
            ],
            'unlocks': ['pests'],
          },
        ],
      };
    });
    final fresh = FarmSimulation.newFarm(quick, seed: 1)..step();
    expect(fresh.storyDone.keys, ['a', 'b']);
    expect(fresh.isUnlocked(StoryUnlock.pests), isTrue);
  });

  group('story data checks', () {
    List<String> issuesWith(Map<String, dynamic> story) {
      final files = sampleCatalogFiles()..['story'] = story;
      return [
        for (final issue in Catalog.load(files).issues)
          '${issue.path}: ${issue.message}',
      ];
    }

    test('a locked key no event opens', () {
      expect(
        issuesWith({
          'version': 1,
          'locked': ['pests'],
        }),
        ['locked[0]: no event unlocks "pests"'],
      );
    });

    test('unknown keys, buildings and zones', () {
      expect(
        issuesWith({
          'version': 1,
          'events': [
            {
              'id': 'a',
              'unlocks': ['flying', 'building:castle', 'zone:moon'],
            },
          ],
        }),
        [
          'events[0].unlocks[0]: unknown unlock "flying"',
          'events[0].unlocks[1]: no building "castle"',
          'events[0].unlocks[2]: no zone "moon"',
        ],
      );
    });

    test('an event may only follow earlier ones', () {
      expect(
        issuesWith({
          'version': 1,
          'events': [
            {
              'id': 'a',
              'after': ['b'],
            },
            {'id': 'b'},
            {'id': 'b'},
          ],
        }),
        [
          'events[0].after[0]: no earlier event "b"',
          'events[2].id: duplicate "b"',
        ],
      );
    });
  });
}
