import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _food = plainSeed(PotatoType.food, Grade.normal);
final _combat = plainSeed(PotatoType.combat, Grade.normal);
final _breeding = plainSeed(PotatoType.breeding, Grade.normal);
final _buff = plainSeed(PotatoType.buff, Grade.normal);

/// The sample field is 2×2 at (12, 9); the open area is 8×8 at (8, 8).
const _a = TilePos(12, 9);
const _b = TilePos(13, 9);
const _c = TilePos(12, 10);

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  void open(Catalog with_) {
    catalog = with_;
    farm = FarmSimulation.newFarm(catalog, seed: 3);
    farm.food = 10000;
    for (final seed in [_food, _combat, _breeding, _buff]) {
      farm.seeds.add(seed, 10);
    }
  }

  setUp(() => open(quietSampleCatalog()));

  int build(String kind, TilePos origin) {
    expect(farm.apply(FarmCommand.build(kind: kind, origin: origin)), isNull);
    return farm.buildings.last.id;
  }

  int growGuard(int buildingId) {
    expect(
      farm.apply(FarmCommand.train(buildingId: buildingId, seed: _combat)),
      isNull,
    );
    final id = farm.guards.last.potato.id;
    farm.runSteps(catalog.potatoType(PotatoType.combat).growSeconds);
    return id;
  }

  group('the house', () {
    Catalog withHouse() {
      final files = sampleCatalogFiles();
      final newFarm =
          (files['rules']! as Map<String, dynamic>)['new_farm']
              as Map<String, dynamic>;
      newFarm['buildings'] = [
        {
          'kind': 'house',
          'origin': {'x': 8, 'y': 13},
        },
      ];
      return Catalog.load(files).catalog!;
    }

    test('comes with a new farm, moves, but cannot be built or removed', () {
      final catalog = withHouse();
      final farm = FarmSimulation.newFarm(catalog, seed: 1);
      final house = farm.buildings.single;
      expect(house.kind, 'house');
      expect(house.origin, const TilePos(8, 13));
      farm.food = 1000;
      expect(
        farm.apply(
          FarmCommand.build(kind: 'house', origin: const TilePos(8, 8)),
        ),
        FarmRejection.noSuchBuilding,
      );
      expect(
        farm.apply(FarmCommand.demolish(buildingId: house.id)),
        FarmRejection.cannotRemove,
      );
      expect(
        farm.apply(
          FarmCommand.moveBuilding(
            buildingId: house.id,
            origin: const TilePos(8, 8),
          ),
        ),
        isNull,
      );
    });

    test('is put back on a farm saved before it existed', () {
      final catalog = withHouse();
      final farm = FarmSimulation.newFarm(catalog, seed: 1);
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      json['buildings'] = <Object?>[];
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.buildings.single.kind, 'house');
      expect(loaded.buildings.single.origin, const TilePos(8, 13));
    });
  });

  group('buildings', () {
    test('building costs its first level and is reported', () {
      farm.takeEvents();
      final id = build('training_ground', const TilePos(8, 8));
      expect(farm.food, 10000 - 100);
      expect(farm.building(id)!.rect.area, 4);
      expect(farm.takeEvents(), [
        FarmEvent.built(
          buildingId: id,
          kind: 'training_ground',
          origin: const TilePos(8, 8),
        ),
        // A letter with a seed comes for every building.
        FarmEvent.mailArrived(mailId: farm.mail.last.id),
      ]);
    });

    test('buildings keep one free tile from fields and each other', () {
      FarmRejection? at(int x, int y) =>
          farm.apply(FarmCommand.build(kind: 'statue', origin: TilePos(x, y)));
      expect(at(11, 9), FarmRejection.blocked, reason: 'next to the field');
      expect(at(11, 8), FarmRejection.blocked, reason: 'corner to corner');
      expect(at(10, 9), isNull, reason: 'one tile between');
      expect(at(9, 10), FarmRejection.blocked, reason: 'corner to statue');
      expect(at(7, 8), FarmRejection.blocked, reason: 'outside open land');
      expect(at(15, 14), isNull, reason: 'the open edge needs no gap');
      expect(at(13, 15), FarmRejection.blocked, reason: 'bottom on the fence');
      expect(
        farm.apply(FarmCommand.build(kind: 'castle', origin: TilePos(8, 8))),
        FarmRejection.noSuchBuilding,
      );
    });

    test('building and upgrading need the baby potatoes', () {
      farm.food = 99;
      expect(
        farm.apply(
          FarmCommand.build(kind: 'training_ground', origin: TilePos(8, 8)),
        ),
        FarmRejection.notEnoughFood,
      );
      expect(farm.buildings.map((b) => b.kind), ['potato_cellar']);
      expect(farm.nextId, FarmSimulation.newFarm(catalog, seed: 3).nextId);

      farm.food = 1000;
      final id = build('training_ground', const TilePos(8, 8));
      expect(farm.capacityOf(PotatoType.combat), 2);
      expect(farm.apply(FarmCommand.upgrade(buildingId: id)), isNull);
      expect(farm.food, 1000 - 100 - 150);
      expect(farm.capacityOf(PotatoType.combat), 4);
      expect(
        farm.apply(FarmCommand.upgrade(buildingId: id)),
        FarmRejection.maxLevel,
      );
    });
  });

  group('capacity', () {
    test('field types need their building and stay within its limit', () {
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _buff)),
        FarmRejection.typeLocked,
      );
      build('statue', const TilePos(8, 8));
      for (final tile in [_a, _b]) {
        expect(
          farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: _buff)),
          isNull,
        );
      }
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _c, seed: _buff)),
        FarmRejection.atCapacity,
      );
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _c, seed: _food)),
        isNull,
        reason: 'food potatoes have no limit',
      );
    });

    test('breeding seeds go into fields, within the compost yards\' limit', () {
      final yard = build('compost_yard', const TilePos(8, 8));
      expect(
        farm.apply(FarmCommand.train(buildingId: yard, seed: _breeding)),
        FarmRejection.wrongPlace,
      );
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _breeding)),
        isNull,
      );
      expect(farm.countOf(PotatoType.breeding), 1);
    });

    test('limits add up over buildings, and outlive a demolition', () {
      final first = build('statue', const TilePos(8, 8));
      build('statue', const TilePos(10, 8));
      expect(farm.capacityOf(PotatoType.buff), 4);
      for (final tile in [_a, _b, _c]) {
        farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: _buff));
      }
      expect(farm.apply(FarmCommand.demolish(buildingId: first)), isNull);
      expect(farm.countOf(PotatoType.buff), 3, reason: 'they stay');
      expect(
        farm.apply(
          FarmCommand.plant(fieldId: 1, tile: TilePos(13, 10), seed: _buff),
        ),
        FarmRejection.atCapacity,
      );
    });

    test('combat seeds grow in training grounds, not fields', () {
      final ground = build('training_ground', const TilePos(8, 8));
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _combat)),
        FarmRejection.wrongPlace,
      );
      final statue = build('statue', const TilePos(8, 11));
      expect(
        farm.apply(FarmCommand.train(buildingId: statue, seed: _combat)),
        FarmRejection.wrongPlace,
      );
      expect(
        farm.apply(FarmCommand.train(buildingId: ground, seed: _food)),
        FarmRejection.wrongPlace,
      );
      growGuard(ground);
      growGuard(ground);
      expect(
        farm.apply(FarmCommand.train(buildingId: ground, seed: _combat)),
        FarmRejection.atCapacity,
      );
    });
  });

  group('guards', () {
    test('a guard with nothing to do patrols open ground', () {
      final ground = build('training_ground', const TilePos(8, 8));
      growGuard(ground);
      final guard = farm.guards.single;
      final open = catalog.rules.farm.openArea;
      final stood = <TilePos>{guard.at};
      for (var i = 0; i < 120; i++) {
        farm.step();
        final at = guard.at;
        stood.add(at);
        expect(open.contains(at), isTrue);
        expect(farm.fields.any((f) => f.rect.contains(at)), isFalse);
        expect(farm.buildings.any((b) => b.rect.contains(at)), isFalse);
      }
      expect(stood.length, greaterThan(3), reason: 'it walks about');
    });

    test('a guard saved mid-walk loads walking the same way', () {
      final ground = build('training_ground', const TilePos(8, 8));
      growGuard(ground);
      while (farm.guards.single.walkMillis == 0) {
        farm.step();
      }
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      final a = farm.guards.single;
      final b = loaded.guards.single;
      expect(b.walkTo, a.walkTo);
      expect(b.walkMillis, a.walkMillis);
      expect(b.walkTotalMillis, a.walkTotalMillis);
      farm.runSteps(30);
      loaded.runSteps(30);
      expect(loaded.guards.single.at, farm.guards.single.at);
    });

    test('a trained combat potato grows, then starts guarding', () {
      final ground = build('training_ground', const TilePos(8, 8));
      farm.takeEvents();
      final id = growGuard(ground);
      final events = farm.takeEvents();
      expect(events.first, isA<SeedTrained>());
      expect(events, contains(FarmEvent.grown(potatoId: id)));
      expect(farm.guards.single.at, const TilePos(8, 10));
    });

    test('demolishing a training ground sends growing potatoes away', () {
      final first = build('training_ground', const TilePos(8, 8));
      final second = build('training_ground', const TilePos(8, 11));
      farm.apply(FarmCommand.train(buildingId: first, seed: _combat));
      final moved = farm.guards.last.potato.id;
      farm.apply(FarmCommand.demolish(buildingId: first));
      expect(farm.guards.single.buildingId, second);

      farm.apply(FarmCommand.demolish(buildingId: second));
      expect(farm.guards, isEmpty);
      expect(farm.fridge.single.id, moved);
    });
  });

  test('the top bar rates: food grown potatoes make, upkeep all pay, by '
      'the hour (2026-10-27)', () {
    // With upkeep, which the quiet catalog leaves out.
    open(sampleCatalog());
    expect(farm.foodPerHour, 0);
    expect(farm.upkeepPerHour, 0);
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
    final food = catalog.potatoType(PotatoType.food);
    expect(farm.foodPerHour, 0, reason: 'still growing');
    farm.runSteps(food.growSeconds);
    expect(farm.foodPerHour, 3600 / food.production!.everySeconds);
    // Breeding potatoes need a compost yard to be planted.
    build('compost_yard', const TilePos(8, 8));
    final tile = _a + const TilePos(1, 0);
    expect(
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: _breeding)),
      isNull,
    );
    final breeder = farm.field(1)!.potatoAt(tile)!;
    expect(farm.upkeepOf(breeder), greaterThan(0));
    expect(
      farm.upkeepPerHour,
      farm.upkeepOf(breeder) * 3600 / catalog.rules.potatoes.upkeepEverySeconds,
      reason: 'food potatoes pay none',
    );
  });

  group('pests', () {
    setUp(
      () => open(
        quietSampleCatalog((files) {
          final pests = rulesOf(files)['pests'] as Map;
          (pests['blight'] as Map)['chance'] = 1.0;
        }),
      ),
    );

    int checkSteps() => catalog.rules.pests.checkEverySeconds;

    test('blight comes to planted fields only, and ages potatoes', () {
      farm.runSteps(checkSteps());
      expect(farm.field(1)!.pest, isNull, reason: 'nothing planted');

      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      final potato = farm.field(1)!.potatoAt(_a)!;
      farm.runSteps(checkSteps());
      expect(farm.field(1)!.pest?.kind, PestKind.blight);
      expect(farm.totals.pestsAppeared, 1);

      final lived = potato.livedMillis;
      farm.runSteps(10);
      // Growing, so life only moves from the blight: double speed.
      expect(potato.livedMillis - lived, 10 * 1000);
      expect(farm.totals.lifeLostToBlightMillis, potato.livedMillis);
    });

    test('blight goes once no potato is left (2026-10-30)', () {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      farm.runSteps(checkSteps());
      final field = farm.field(1)!;
      expect(field.pest?.kind, PestKind.blight);
      final food = catalog.potatoType(PotatoType.food);
      farm.runSteps(food.growSeconds + food.lifespanSeconds);
      expect(field.potatoAt(_a), isNull, reason: 'died');
      farm.step();
      expect(field.pest, isNull);
    });

    group('bugs (2026-10-26: as many as the store feeds, no limit on it)', () {
      setUp(
        () => open(
          quietSampleCatalog((files) {
            final pests = rulesOf(files)['pests'] as Map;
            (pests['bug'] as Map)
              ..['stored_per_bug'] = 5
              // One bug eats slower than one potato makes, so the store
              // can grow past it.
              ..['eat_every_seconds'] = 90;
            (pests['blight'] as Map)['chance'] = 0.0;
          }),
        ),
      );

      int perBug() => catalog.rules.pests.bug.storedPerBug;

      /// Steps until [done], failing after an hour of game time.
      void stepUntil(bool Function() done) {
        for (var i = 0; i < 3600 && !done(); i++) {
          farm.step();
        }
        expect(done(), isTrue);
      }

      test('come once enough is stored, more the more is stored, and eat '
          'from it', () {
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
        final field = farm.field(1)!;
        stepUntil(() => field.pest != null);
        expect(field.pest!.kind, PestKind.bug);
        expect(field.stored, perBug());
        expect(farm.bugsOn(field), 1);
        expect(farm.totals.pestsAppeared, 1);
        // Food keeps coming (no store limit) faster than one bug eats.
        stepUntil(() => field.stored >= perBug() * 3);
        expect(farm.bugsOn(field), 3);
        expect(farm.totals.foodEatenByBugs, greaterThan(0));
      });

      test('block harvesting until cleared (2026-10-30), leave when the '
          'store falls short, and stay away a while once cleared', () {
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
        final field = farm.field(1)!;
        stepUntil(() => field.pest != null);
        expect(
          farm.apply(const FarmCommand.harvestField(fieldId: 1)),
          FarmRejection.pestInTheWay,
        );
        expect(
          farm.apply(const FarmCommand.harvest(fieldId: 1, tile: _a)),
          FarmRejection.pestInTheWay,
        );
        field.potatoAt(_a)!.stored = 0;
        farm.step();
        expect(field.pest, isNull, reason: 'nothing left to eat');

        stepUntil(() => field.pest != null);
        expect(farm.apply(FarmCommand.clearPest(fieldId: 1)), isNull);
        final quiet = catalog.rules.pests.bug.quietSeconds;
        farm.runSteps(quiet - 1);
        expect(field.stored, greaterThanOrEqualTo(perBug()));
        expect(field.pest, isNull, reason: 'still quiet');
        farm.runSteps(1);
        expect(field.pest?.kind, PestKind.bug);
      });

      test('what a dead potato stored stays in the field: harvested with it, '
          'eaten by bugs till then', () {
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
        final field = farm.field(1)!;
        final food = catalog.potatoType(PotatoType.food);
        farm.runSteps(food.growSeconds + food.lifespanSeconds);
        expect(field.potatoAt(_a), isNull, reason: 'died');
        expect(field.leftover, greaterThan(0));
        expect(field.pest?.kind, PestKind.bug);
        final left = field.leftover;
        farm.runSteps(catalog.rules.pests.bug.eatEverySeconds);
        expect(field.leftover, lessThan(left), reason: 'bugs eat the pile');

        expect(
          farm.apply(const FarmCommand.harvestField(fieldId: 1)),
          FarmRejection.pestInTheWay,
        );
        expect(farm.apply(const FarmCommand.clearPest(fieldId: 1)), isNull);
        final before = farm.food;
        final pile = field.leftover;
        expect(farm.apply(const FarmCommand.harvestField(fieldId: 1)), isNull);
        expect(farm.food, before + pile);
        expect(field.leftover, 0);
      });
    });

    test('tapping clears a pest, with no reward (2026-10-30)', () {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      farm.runSteps(checkSteps());
      farm.takeEvents();
      final before = farm.food;

      expect(farm.apply(FarmCommand.clearPest(fieldId: 1)), isNull);
      expect(farm.field(1)!.pest, isNull);
      final cleared = farm.takeEvents().single as PestCleared;
      expect(cleared.byTap, isTrue);
      expect(farm.food, before);
      expect(
        farm.apply(FarmCommand.clearPest(fieldId: 1)),
        FarmRejection.noPest,
      );
    });

    test('guards walk to a pest and clear it over time', () {
      final ground = build('training_ground', const TilePos(8, 8));
      growGuard(ground);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      // Run to the next check so the blight appears.
      while (farm.field(1)!.pest == null) {
        farm.step();
      }
      farm.takeEvents();
      final guard = farm.guards.single;
      expect(guard.targetFieldId, isNull, reason: 'sent on the next step');
      farm.step();
      expect(guard.targetFieldId, 1);
      // From wherever its patrol had got to, to the nearest tile beside the
      // field, at the walking pace.
      final beside = guard.walkTo ?? guard.at;
      expect(farm.field(1)!.rect.contains(beside), isFalse);
      final tiles = guard.at.manhattanDistanceTo(beside);
      final walkMillis =
          tiles * catalog.rules.potatoes.guards.walkMillisPerTile;
      expect(guard.walkMillis, walkMillis);
      final walkSteps = (walkMillis / 1000).ceil();

      farm.runSteps(walkSteps);
      expect(guard.at, beside);
      expect(guard.working, isTrue);

      final clearSteps = catalog.rules.pests.blight.clearSeconds;
      farm.runSteps(clearSteps - 1);
      expect(farm.field(1)!.pest, isNotNull);
      farm.step();
      expect(farm.field(1)!.pest, isNull);
      expect(farm.totals.pestsClearedByGuards, 1);
      expect(guard.targetFieldId, isNull);
    });

    test('a field\'s pest is tougher by its potatoes\' average level '
        '(2026-10-30)', () {
      final high = plainSeed(PotatoType.food, Grade.normal).copyWith(level: 20);
      farm.seeds.add(high);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: high));
      farm.runSteps(checkSteps());
      final field = farm.field(1)!;
      expect(field.pest?.kind, PestKind.blight);
      final base = catalog.rules.pests.blight.clearSeconds * 1000;
      expect(
        farm.clearMillisOf(field),
        (base * levelGrowth(catalog.rules.pests.levelPermille, 20)).round(),
      );
    });
  });

  group('upkeep', () {
    setUp(
      () => open(
        sampleCatalogWith((files) {
          final pests = rulesOf(files)['pests'] as Map;
          (pests['bug'] as Map)['chance_max'] = 0.0;
          (pests['blight'] as Map)['chance'] = 0.0;
        }),
      ),
    );

    int upkeepSteps() => catalog.rules.potatoes.upkeepEverySeconds;

    test('other potatoes eat from the farm; food potatoes do not', () {
      build('statue', const TilePos(8, 8));
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _buff));
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _b, seed: _food));
      final before = farm.food;
      farm.runSteps(upkeepSteps());
      expect(farm.food, before - 2);
      expect(farm.totals.upkeepPaid, 2);
    });

    test('unpaid potatoes turn weak and recover once paid', () {
      build('statue', const TilePos(8, 8));
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _buff));
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _b, seed: _buff));
      final [first, second] = [
        for (final p in farm.field(1)!.potatoes.values) p,
      ];
      farm.food = 3;
      farm.takeEvents();

      farm.runSteps(upkeepSteps());
      expect(farm.food, 1, reason: 'the older one is paid for first');
      expect(first.weak, isFalse);
      expect(second.weak, isTrue);
      expect(farm.takeEvents(), [
        FarmEvent.weakened(potatoIds: [second.id]),
      ]);

      farm.food = 10;
      farm.runSteps(upkeepSteps());
      expect(second.weak, isFalse);
      expect(farm.takeEvents(), [
        FarmEvent.recovered(potatoIds: [second.id]),
      ]);
    });

    test('a weak guard walks at the weak pace', () {
      final ground = build('training_ground', const TilePos(8, 8));
      final id = growGuard(ground);
      farm.food = 0;
      farm.runSteps(upkeepSteps());
      final guard = farm.guards.single;
      expect(guard.potato.id, id);
      expect(guard.potato.weak, isTrue);
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      farm.field(1)!.pest = Pest(kind: PestKind.blight);
      farm.step();
      final pace = catalog.rules.potatoes.guards.walkMillisPerTile;
      final percent = catalog.rules.potatoes.weakPercent;
      // Assigned this step, from where it stood, at the weak pace.
      final tiles = guard.at.manhattanDistanceTo(guard.walkTo!);
      expect(guard.walkMillis, tiles * pace * 100 ~/ percent);
    });
  });

  group('breeding in a field', () {
    Potato grownBreeder() {
      farm.pouchSlots = 1000;
      build('compost_yard', const TilePos(8, 8));
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _breeding)),
        isNull,
      );
      farm.runSteps(catalog.potatoType(PotatoType.breeding).growSeconds);
      return farm.field(1)!.potatoAt(_a)!;
    }

    test('a grown breeder makes seeds that pile up on it to the limit', () {
      open(
        quietSampleCatalog(
          (files) =>
              (rulesOf(files)['potatoes'] as Map)['breeding_grade_up_chance'] =
                  1.0,
        ),
      );
      final breeder = grownBreeder();
      farm.runSteps(catalog.rules.breeding.seedEverySeconds * 10);
      expect(breeder.seeds, hasLength(catalog.rules.breeding.storeMax));
      for (final seed in breeder.seeds) {
        expect(seed.grade, Grade.rare, reason: 'a normal breeder, always up');
        expect(seed.level, breeder.level);
        expect(catalog.abilities[seed.ability]!.pool, seed.type.name);
      }
      expect(farm.takeEvents().whereType<SeedMade>(), isNotEmpty);
    });

    test('harvesting takes the seeds in with the baby potatoes', () {
      final breeder = grownBreeder();
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _b, seed: _food)),
        isNull,
      );
      farm.runSteps(
        catalog.potatoType(PotatoType.food).growSeconds +
            catalog.rules.breeding.seedEverySeconds * 2,
      );
      final made = breeder.seeds.length;
      expect(made, greaterThan(0));
      final before = farm.seeds.total;
      farm.takeEvents();
      expect(farm.apply(const FarmCommand.harvestField(fieldId: 1)), isNull);
      final harvested = farm.takeEvents().whereType<FoodHarvested>().single;
      expect(harvested.food, greaterThan(0));
      expect(harvested.seeds, hasLength(made));
      expect(breeder.seeds, isEmpty);
      expect(farm.seeds.total, greaterThanOrEqualTo(before + made));
    });

    test('a breeder alone can be harvested for its seeds', () {
      final breeder = grownBreeder();
      expect(
        farm.apply(FarmCommand.harvest(fieldId: 1, tile: _a)),
        FarmRejection.nothingToHarvest,
      );
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      expect(breeder.seeds, hasLength(1));
      expect(farm.apply(FarmCommand.harvest(fieldId: 1, tile: _a)), isNull);
      expect(breeder.seeds, isEmpty);
    });

    test('seed speed makes seeds sooner, apart from food yield', () {
      open(
        quietSampleCatalog((files) {
          (files['potato_abilities']! as Map)['abilities'] = [
            ...((files['potato_abilities']! as Map)['abilities'] as List),
            {
              'id': 'buff.sow',
              'pool': 'buff',
              'effects': [
                {
                  'context': 'farm',
                  'target': 'field',
                  'kind': 'stat',
                  'stat': 'breeding.seed_speed',
                  'op': 'mul',
                  'value': 2.0,
                },
              ],
              'rarity': 'very_low',
            },
          ];
        }),
      );
      final breeder = grownBreeder();
      build('statue', const TilePos(8, 12));
      final sow = Seed(
        type: PotatoType.buff,
        grade: Grade.normal,
        level: 0,
        ability: 'buff.sow',
      );
      farm.seeds.add(sow);
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _b, seed: sow)),
        isNull,
      );
      expect(farm.effectsOn(breeder)[FarmStat.foodYield], isNull);
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      expect(breeder.seeds, hasLength(2), reason: 'twice as fast');
    });

    test('an uprooted or dead breeder hands its seeds to the pouch', () {
      final breeder = grownBreeder();
      farm.runSteps(catalog.rules.breeding.seedEverySeconds * 2);
      final made = breeder.seeds.length;
      final before = farm.seeds.total;
      expect(farm.apply(FarmCommand.uproot(potatoId: breeder.id)), isNull);
      expect(farm.seeds.total, before + made);
      expect(breeder.seeds, isEmpty);

      expect(
        farm.apply(
          FarmCommand.replant(potatoId: breeder.id, fieldId: 1, tile: _a),
        ),
        isNull,
        reason: 'breeders go back into fields',
      );
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      final left = breeder.seeds.length;
      final kept = farm.seeds.total;
      farm.runSteps(
        catalog.potatoType(PotatoType.breeding).lifespanSeconds * 2,
      );
      expect(farm.field(1)!.potatoAt(_a), isNull);
      expect(farm.seeds.total, greaterThanOrEqualTo(kept + left));
    });

    test('breeders keep their seeds through a save', () {
      final breeder = grownBreeder();
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.field(1)!.potatoAt(_a)!.seeds, breeder.seeds);
    });

    test('a version 6 farm moves yard breeders to the fridge and their '
        'seeds to the pouch', () {
      farm.pouchSlots = 1000;
      final yard = build('compost_yard', const TilePos(8, 8));
      final breeder = Potato(
        id: 900,
        type: PotatoType.breeding,
        grade: Grade.normal,
        level: 0,
        abilities: [_breeding.ability],
      )..grownMillis = 1000;
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      json['format_version'] = 6;
      json.remove('returned_seeds');
      json['breeders'] = [
        {'potato': PotatoDocument.of(breeder).toJson(), 'building_id': yard},
      ];
      final stored = [_food.toJson(), _buff.toJson()];
      for (final building in json['buildings'] as List) {
        if ((building as Map)['id'] == yard) building['stored_seeds'] = stored;
      }
      final before = farm.seeds.total;
      final loaded = FarmDocument.decode(
        jsonDecode(jsonEncode(json)) as Map<String, dynamic>,
      ).toSimulation(catalog);
      expect(loaded.fridge.map((p) => p.id), contains(900));
      expect(loaded.seeds.total, before + 2);
      expect(FarmDocument.of(loaded).returnedSeeds, isEmpty);
    });
  });

  group('fridge', () {
    test('uprooted potatoes keep what they had and age slowly', () {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      farm.runSteps(catalog.potatoType(PotatoType.food).growSeconds + 40);
      final potato = farm.field(1)!.potatoAt(_a)!;
      final stored = potato.stored;
      final lived = potato.livedMillis;

      expect(farm.apply(FarmCommand.uproot(potatoId: potato.id)), isNull);
      expect(farm.field(1)!.potatoAt(_a), isNull);
      expect(farm.fridge.single, same(potato));

      farm.runSteps(100);
      final percent = catalog.rules.potatoes.fridge.agingPercent;
      expect(potato.livedMillis, lived + 100 * 1000 * percent ~/ 100);
      expect(potato.stored, stored, reason: 'no work in the fridge');

      expect(
        farm.apply(
          FarmCommand.replant(potatoId: potato.id, fieldId: 1, tile: _b),
        ),
        isNull,
      );
      expect(farm.field(1)!.potatoAt(_b), same(potato));
      expect(farm.fridge, isEmpty);
    });

    test('growing potatoes cannot go in', () {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      final potato = farm.field(1)!.potatoAt(_a)!;
      expect(
        farm.apply(FarmCommand.uproot(potatoId: potato.id)),
        FarmRejection.stillGrowing,
      );
      expect(farm.fridge, isEmpty);
    });

    test('a growing potato that lands in the fridge stops growing', () {
      // The one way in: its training ground is demolished with no other.
      final ground = build('training_ground', const TilePos(8, 8));
      farm.apply(FarmCommand.train(buildingId: ground, seed: _combat));
      farm.runSteps(10);
      farm.apply(FarmCommand.demolish(buildingId: ground));
      final potato = farm.fridge.single;
      farm.runSteps(500);
      expect(potato.grownMillis, 10 * 1000);
      expect(potato.livedMillis, 0);
    });

    /// Plants a food potato on the field's first tile, grows it, and puts
    /// it into the fridge; returns what uprooting said.
    FarmRejection? uprootOne() {
      final tile = farm.field(1)!.rect.origin;
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: _food));
      farm.runSteps(catalog.potatoType(PotatoType.food).growSeconds);
      final id = farm.field(1)!.potatoAt(tile)!.id;
      final rejection = farm.apply(FarmCommand.uproot(potatoId: id));
      if (rejection != null) farm.apply(FarmCommand.harvestField(fieldId: 1));
      return rejection;
    }

    FarmBuilding cellar() =>
        farm.buildings.singleWhere((b) => b.kind == 'potato_cellar');

    test('the potato cellar comes with the farm and sets the fridge size', () {
      final size = cellar().stores;
      expect(size, greaterThan(0));
      expect(farm.fridgeSize, size);
      for (var i = 0; i <= size; i++) {
        expect(uprootOne(), i < size ? isNull : FarmRejection.fridgeFull);
      }
      expect(farm.apply(FarmCommand.upgrade(buildingId: cellar().id)), isNull);
      expect(farm.fridgeSize, greaterThan(size));
      expect(uprootOne(), isNull);
    });

    test('the potato cellar comes down only when empty, and once a farm', () {
      final id = cellar().id;
      expect(
        farm.apply(
          FarmCommand.build(kind: 'potato_cellar', origin: TilePos(8, 8)),
        ),
        FarmRejection.onlyOne,
      );
      expect(uprootOne(), isNull);
      expect(
        farm.apply(FarmCommand.demolish(buildingId: id)),
        FarmRejection.cellarNotEmpty,
      );
      final potato = farm.fridge.single;
      expect(
        farm.apply(
          FarmCommand.replant(
            potatoId: potato.id,
            fieldId: 1,
            tile: farm.field(1)!.rect.origin,
          ),
        ),
        isNull,
      );
      expect(farm.apply(FarmCommand.demolish(buildingId: id)), isNull);
      expect(farm.fridgeSize, 0);
      expect(
        farm.apply(
          FarmCommand.build(kind: 'potato_cellar', origin: TilePos(8, 8)),
        ),
        isNull,
      );
      expect(farm.fridgeSize, greaterThan(0));
    });

    test('guards go into the fridge and back to a training ground', () {
      final ground = build('training_ground', const TilePos(8, 8));
      final id = growGuard(ground);
      expect(farm.apply(FarmCommand.uproot(potatoId: id)), isNull);
      expect(farm.guards, isEmpty);
      expect(
        farm.apply(FarmCommand.replant(potatoId: id, fieldId: 1, tile: _a)),
        FarmRejection.wrongPlace,
      );
      expect(
        farm.apply(FarmCommand.retrain(potatoId: id, buildingId: ground)),
        isNull,
      );
      expect(farm.guards.single.potato.id, id);
      expect(
        farm.apply(FarmCommand.retrain(potatoId: id, buildingId: ground)),
        FarmRejection.notInFridge,
      );
    });

    test('a cellar potato can be let go: gone, no seed, no grave', () {
      final ground = build('training_ground', const TilePos(8, 8));
      final id = growGuard(ground);
      expect(
        farm.apply(FarmCommand.release(potatoId: id)),
        FarmRejection.notInFridge,
        reason: 'only from the cellar',
      );
      expect(farm.apply(FarmCommand.uproot(potatoId: id)), isNull);
      final seeds = farm.seeds.total;
      expect(farm.apply(FarmCommand.release(potatoId: id)), isNull);
      expect(farm.fridge, isEmpty);
      expect(farm.potatoById(id), isNull);
      expect(farm.seeds.total, seeds);
    });
  });

  test('guards can go exploring and come back to guard', () {
    final ground = build('training_ground', const TilePos(8, 8));
    final id = growGuard(ground);
    expect(
      farm.apply(
        FarmCommand.depart(zone: 'sample_zone', food: 0, potatoIds: [id]),
      ),
      isNull,
    );
    expect(farm.guards, isEmpty);
    expect(farm.countOf(PotatoType.combat), 0);

    farm.apply(FarmCommand.returnHome(food: 0, potatoIds: [id]));
    expect(farm.guards.single.potato.id, id);
    expect(farm.guards.single.at, const TilePos(8, 10));
  });

  test('a busy farm saves and loads to the same state', () {
    open(sampleCatalogWith((_) {}));
    final ground = build('training_ground', const TilePos(8, 8));
    build('compost_yard', const TilePos(8, 11));
    growGuard(ground);
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _breeding));
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _b, seed: _food));
    farm.apply(FarmCommand.plant(fieldId: 1, tile: _c, seed: _food));
    farm.apply(FarmCommand.uproot(potatoId: farm.field(1)!.potatoAt(_c)!.id));
    farm.runSteps(1000);

    FarmSimulation reload(FarmSimulation farm) {
      final text = jsonEncode(FarmDocument.of(farm).toJson());
      return FarmDocument.decode(jsonDecode(text) as Map<String, dynamic>)
          .toSimulation(catalog);
    }

    final loaded = reload(farm);
    expect(FarmDocument.of(loaded), FarmDocument.of(farm));
    farm.runSteps(3000);
    loaded.runSteps(3000);
    expect(FarmDocument.of(loaded), FarmDocument.of(farm));
  });
}
