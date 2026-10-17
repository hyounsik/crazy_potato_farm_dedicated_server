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
      expect(at(15, 15), isNull, reason: 'the open edge needs no gap');
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

    test('breeding seeds go into compost yards, not fields', () {
      final yard = build('compost_yard', const TilePos(8, 8));
      expect(
        farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _breeding)),
        FarmRejection.wrongPlace,
      );
      expect(
        farm.apply(FarmCommand.train(buildingId: yard, seed: _breeding)),
        isNull,
      );
      expect(farm.breeders.single.buildingId, yard);
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

    test('bugs come where food is stored and eat it', () {
      open(
        quietSampleCatalog((files) {
          final bug = (rulesOf(files)['pests'] as Map)['bug'] as Map;
          bug['chance_max'] = 1.0;
          bug['chance_per_stored'] = 1.0;
        }),
      );
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      final potato = farm.field(1)!.potatoAt(_a)!;
      final food = catalog.potatoType(PotatoType.food);
      // Grown, plus long enough to store some, ending on a pest check.
      farm.runSteps(checkSteps() * 4);
      expect(farm.field(1)!.pest?.kind, PestKind.bug);

      final stored = potato.stored;
      final eatSteps = catalog.rules.pests.bug.eatEverySeconds;
      farm.runSteps(eatSteps);
      final made = eatSteps ~/ food.production!.everySeconds;
      expect(potato.stored, stored + made - catalog.rules.pests.bug.eatAmount);
      expect(farm.totals.foodEatenByBugs, greaterThan(0));
    });

    test('tapping clears a pest and pays a reward', () {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: _a, seed: _food));
      farm.runSteps(checkSteps());
      farm.takeEvents();
      final before = farm.food;

      expect(farm.apply(FarmCommand.clearPest(fieldId: 1)), isNull);
      expect(farm.field(1)!.pest, isNull);
      final cleared = farm.takeEvents().single as PestCleared;
      expect(cleared.byTap, isTrue);
      expect(farm.food, before + cleared.food);
      expect(cleared.food, inInclusiveRange(1, 3));
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

  group('compost yard', () {
    int yardWithBreeder() {
      farm.pouchSlots = 1000;
      final yard = build('compost_yard', const TilePos(8, 8));
      farm.apply(FarmCommand.train(buildingId: yard, seed: _breeding));
      farm.runSteps(catalog.potatoType(PotatoType.breeding).growSeconds);
      return yard;
    }

    test('a grown breeder makes seeds that pile up to the limit', () {
      open(
        quietSampleCatalog(
          (files) =>
              (rulesOf(files)['potatoes'] as Map)['breeding_grade_up_chance'] =
                  1.0,
        ),
      );
      final id = yardWithBreeder();
      final yard = farm.building(id)!;
      final every = catalog.rules.breeding.seedEverySeconds;
      farm.runSteps(every * 10);
      expect(yard.storedSeeds, hasLength(catalog.rules.breeding.storeMax));
      final breeder = farm.breeders.single.potato;
      for (final seed in yard.storedSeeds) {
        expect(seed.grade, Grade.rare, reason: 'a normal breeder, always up');
        expect(seed.level, breeder.level);
        expect(catalog.abilities[seed.ability]!.pool, seed.type.name);
      }
      expect(farm.takeEvents().whereType<SeedMade>(), isNotEmpty);

      final before = farm.seeds.total;
      expect(farm.apply(FarmCommand.collectSeeds(buildingId: id)), isNull);
      expect(farm.seeds.total, before + catalog.rules.breeding.storeMax);
      expect(yard.storedSeeds, isEmpty);
      expect(
        farm.apply(FarmCommand.collectSeeds(buildingId: id)),
        FarmRejection.nothingStored,
      );
    });

    test('a demolished yard sends its breeders to the fridge', () {
      final id = yardWithBreeder();
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      final waiting = farm.building(id)!.storedSeeds.length;
      final before = farm.seeds.total;
      final breeder = farm.breeders.single.potato.id;
      expect(farm.apply(FarmCommand.demolish(buildingId: id)), isNull);
      expect(farm.breeders, isEmpty);
      expect(farm.fridge.single.id, breeder);
      expect(farm.seeds.total, before + waiting, reason: 'seeds are kept');
    });

    test('breeders and their seeds are saved', () {
      final id = yardWithBreeder();
      farm.runSteps(catalog.rules.breeding.seedEverySeconds);
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.breeders.single.potato.id, farm.breeders.single.potato.id);
      expect(loaded.building(id)!.storedSeeds, farm.building(id)!.storedSeeds);
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
  });

  test('guards can go exploring and come back to guard', () {
    final ground = build('training_ground', const TilePos(8, 8));
    final id = growGuard(ground);
    expect(farm.apply(FarmCommand.depart(food: 0, potatoIds: [id])), isNull);
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
