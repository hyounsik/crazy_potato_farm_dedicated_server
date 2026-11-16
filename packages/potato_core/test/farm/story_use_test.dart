import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _normal = plainSeed(PotatoType.food, Grade.normal);

/// Chapter 1's shape (2026-11-16, 사용자): what stands on the farm is
/// locked until the story opens it, scene by scene, on things the player
/// does.
Map<String, dynamic> _story() => {
  'version': 1,
  'locked': [
    'use:field',
    'field_build',
    'use:truck',
    'use:potato_cellar',
    'zone:sample_zone',
  ],
  'events': [
    {
      'id': 'out_of_house',
      'goals': [
        {'kind': 'action', 'action': 'leave_house'},
      ],
      'unlocks': ['use:field'],
    },
    {
      'id': 'planted',
      'goals': [
        {'kind': 'action', 'action': 'plant', 'count': 2},
      ],
      'unlocks': [
        'field_build',
        'use:truck',
        'use:potato_cellar',
        'zone:sample_zone',
      ],
    },
  ],
};

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  setUp(() {
    catalog = sampleCatalogWith((files) => files['story'] = _story());
    farm = FarmSimulation.newFarm(catalog, seed: 1);
    farm.seeds.add(_normal, 8);
  });

  FarmRejection? plant(int x) => farm.apply(
    FarmCommand.plant(
      fieldId: farm.fields.first.id,
      tile: farm.fields.first.rect.origin + TilePos(x, 0),
      seed: _normal,
    ),
  );

  test('standing fields, the truck and the cellar wait for the story', () {
    expect(plant(0), FarmRejection.locked);
    expect(
      farm.apply(const FarmCommand.depart(zone: 'sample_zone', food: 0)),
      FarmRejection.locked,
    );
    expect(
      farm.apply(const FarmCommand.loadBed(item: 'x')),
      FarmRejection.locked,
    );

    expect(
      farm.apply(const FarmCommand.storyAction(action: 'leave_house')),
      isNull,
    );
    expect(farm.storyDone.keys, ['out_of_house']);
    expect(farm.isUnlocked('use:field'), isTrue);
    expect(farm.isUnlocked('use:truck'), isFalse);

    expect(plant(0), isNull);
    expect(farm.storyDone, hasLength(1));
    expect(plant(1), isNull);
    expect(farm.storyDone.keys, ['out_of_house', 'planted']);
    expect(farm.isUnlocked('use:truck'), isTrue);
    expect(farm.totals.actions, {'leave_house': 1, 'plant': 2});
  });

  test('a nameless action is refused', () {
    expect(farm.apply(const FarmCommand.storyAction(action: '')), isNotNull);
    expect(farm.totals.actions, isEmpty);
  });

  test('a farm from before chapter 1 keeps everything open', () {
    final json = FarmDocument.of(farm).toJson()
      ..['format_version'] = 7
      ..remove('story_skipped');
    final loaded = FarmDocument.decode(json).toSimulation(catalog);
    expect(loaded.isUnlocked('use:field'), isTrue);
  });

  test('actions survive a save', () {
    farm.apply(const FarmCommand.storyAction(action: 'leave_house'));
    plant(0);
    final back = FarmDocument.decode(FarmDocument.of(farm).toJson())
        .toSimulation(catalog);
    expect(back.totals.actions, {'leave_house': 1, 'plant': 1});
  });

  test('an action goal must name its action', () {
    final files = sampleCatalogFiles()
      ..['story'] = {
        'version': 1,
        'events': [
          {
            'id': 'a',
            'goals': [
              {'kind': 'action'},
            ],
          },
        ],
      };
    expect(
      [for (final i in Catalog.load(files).issues) '${i.path}: ${i.message}'],
      ['events[0].goals[0].action: an action goal names its action'],
    );
  });
}
