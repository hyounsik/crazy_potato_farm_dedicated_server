import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// The sample field is 2×2 at (12, 9).
const _a = TilePos(12, 9);
const _b = TilePos(13, 9);

/// A level 0 seed of [type] whose first ability is [ability].
Seed _seed(PotatoType type, String ability, {int level = 0, Grade? grade}) =>
    Seed(
      type: type,
      grade: grade ?? Grade.normal,
      level: level,
      ability: ability,
      style: type == PotatoType.combat ? CombatStyle.escort : null,
    );

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  void open(Catalog with_) {
    catalog = with_;
    farm = FarmSimulation.newFarm(catalog, seed: 7)..food = 10000;
  }

  setUp(() => open(quietSampleCatalog()));

  Potato plant(Seed seed, [TilePos tile = _a]) {
    farm.seeds.add(seed);
    expect(
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seed)),
      isNull,
    );
    return farm.field(1)!.potatoAt(tile)!;
  }

  void build(String kind, TilePos origin) =>
      expect(farm.apply(FarmCommand.build(kind: kind, origin: origin)), isNull);

  group('rolling', () {
    test('a seed gets its first ability from its own pool', () {
      final roller = AbilityRoller(catalog);
      final random = GameRandom(1);
      for (final type in PotatoType.values) {
        for (var i = 0; i < 20; i++) {
          final seed = roller.seed(
            type: type,
            grade: Grade.normal,
            level: 4,
            random: random,
          );
          expect(catalog.abilities[seed.ability]!.pool, type.name);
          expect(seed.level, 4);
          expect(seed.style == null, type != PotatoType.combat);
        }
      }
    });

    test('a potato gets one slot per grade step, never the same twice', () {
      final roller = AbilityRoller(catalog);
      final random = GameRandom(2);
      for (final (grade, slots) in [
        (Grade.normal, 1),
        (Grade.rare, 2),
        (Grade.legendary, 3),
      ]) {
        for (var i = 0; i < 20; i++) {
          final abilities = roller.slots(
            type: PotatoType.food,
            grade: grade,
            first: 'food.plain',
            random: random,
          );
          expect(abilities, hasLength(slots));
          expect(abilities.first, 'food.plain');
          expect(abilities.toSet(), hasLength(slots));
        }
      }
    });

    test('planting fills the slots from the seed', () {
      final potato = plant(plainSeed(PotatoType.food, Grade.legendary));
      expect(potato.abilities, hasLength(3));
      expect(potato.abilities.first, 'food.plain');
      expect(potato.level, 0);
    });
  });

  group('farm effects', () {
    test('an ability that speeds growth', () {
      // common.quick: growth ×1.25, so 120 s of growing takes 96 s.
      final quick = plant(_seed(PotatoType.food, 'common.quick'));
      final plain = plant(plainSeed(PotatoType.food), _b);
      farm.runSteps(96);
      expect(quick.isGrown(catalog.potatoType(PotatoType.food)), isTrue);
      expect(plain.isGrown(catalog.potatoType(PotatoType.food)), isFalse);
    });

    test('an ability that lengthens life', () {
      final sturdy = plant(_seed(PotatoType.food, 'common.sturdy'));
      final base = catalog.potatoType(PotatoType.food).lifespanSeconds * 1000;
      expect(sturdy.lifespanMillis, (base * 1.1).round());
    });

    test('a higher level makes more food', () {
      // Level 10 at +5% per level: 1.5× production speed.
      final high = plant(_seed(PotatoType.food, 'food.plain', level: 10));
      final low = plant(plainSeed(PotatoType.food), _b);
      farm.runSteps(120 + 60);
      expect(low.stored, 2);
      expect(high.stored, 3);
    });

    test('a buff potato reaches its whole field', () {
      build('statue', const TilePos(8, 8));
      // buff.calm (a stand-in value, 0.5): neighbours age at half speed.
      plant(_seed(PotatoType.buff, 'buff.calm'));
      final neighbour = plant(plainSeed(PotatoType.food), _b);
      farm.runSteps(120 + 100);
      expect(neighbour.livedMillis, 50 * 1000);
      expect(farm.effectsOn(neighbour)[FarmStat.agingRate]!.percent, -0.5);
    });

    test('the same buff twice counts once in full, then half', () {
      build('statue', const TilePos(8, 8));
      plant(_seed(PotatoType.buff, 'buff.ward'));
      final second = plant(_seed(PotatoType.buff, 'buff.ward'), _b);
      // ward: blight chance ×0.5 → −0.5, then −0.25 for the second.
      expect(farm.effectsOn(second)[FarmStat.blightChance]!.percent, -0.75);
    });

    test('a buff potato grows stronger with its level', () {
      build('statue', const TilePos(8, 8));
      plant(_seed(PotatoType.buff, 'buff.ward', level: 4));
      final neighbour = plant(plainSeed(PotatoType.food), _b);
      // Level 4 at +5% per level: −0.5 × 1.2.
      expect(
        farm.effectsOn(neighbour)[FarmStat.blightChance]!.percent,
        closeTo(-0.6, 1e-9),
      );
    });

    test('thrift lowers the upkeep of the field', () {
      open(sampleCatalog()..rules);
      farm.food = 10000;
      build('statue', const TilePos(8, 8));
      final buff = plant(plainSeed(PotatoType.buff));
      expect(farm.upkeepOf(buff), 2);
      plant(_seed(PotatoType.buff, 'buff.thrift'), _b);
      expect(farm.upkeepOf(buff), 1);
    });

    test('a better breeding eye raises the grade of bred seeds', () {
      open(
        quietSampleCatalog(
          (files) =>
              (rulesOf(files)['potatoes'] as Map)['breeding_grade_up_chance'] =
                  0.5,
        ),
      );
      farm.food = 10000;
      farm.pouchSlots = 1000;
      build('compost_yard', const TilePos(8, 8));
      // breeding.eye ×2 on a 0.5 chance: always.
      final breeder = plant(_seed(PotatoType.breeding, 'breeding.eye'));
      farm.runSteps(
        catalog.potatoType(PotatoType.breeding).growSeconds +
            catalog.rules.breeding.seedEverySeconds * 3,
      );
      expect(breeder.seeds, isNotEmpty);
      for (final bred in breeder.seeds) {
        expect(bred.grade, Grade.rare);
      }
    });

    test('a lucky field sometimes gives a seed at harvest', () {
      build('statue', const TilePos(8, 8));
      // buff.lucky adds 1.0 to the rare harvest chance: always.
      plant(_seed(PotatoType.buff, 'buff.lucky'));
      final food = plant(plainSeed(PotatoType.food), _b);
      farm.runSteps(120 + 30);
      expect(food.stored, greaterThan(0));
      farm.takeEvents();
      farm.apply(const FarmCommand.harvestField(fieldId: 1));
      final harvested = farm.takeEvents().whereType<FoodHarvested>().single;
      expect(harvested.seed?.grade, Grade.normal);
      expect(farm.seeds.count(harvested.seed!), greaterThanOrEqualTo(1));
    });
  });

  test('a harvesting guard brings in stored food', () {
    build('training_ground', const TilePos(8, 8));
    final seed = _seed(PotatoType.combat, 'combat.gatherer');
    farm.seeds.add(seed);
    final ground = farm.buildings.last.id;
    farm.apply(FarmCommand.train(buildingId: ground, seed: seed));
    final food = plant(plainSeed(PotatoType.food));
    final before = farm.food;
    farm.runSteps(600);
    // Every 60 s (stand-in) it takes up to 3 (stand-in) from the field,
    // and nothing else brings food in on this quiet farm.
    final harvested = farm.totals.foodHarvestedByGuards;
    expect(harvested, greaterThan(0));
    expect(farm.food, before + harvested);
    expect(
      food.stored,
      lessThan(catalog.potatoType(PotatoType.food).production!.storeMax),
    );
  });

  test('a harvesting guard walks to the field and takes from it evenly', () {
    build('training_ground', const TilePos(8, 8));
    final seed = _seed(PotatoType.combat, 'combat.gatherer');
    farm.seeds.add(seed);
    farm.apply(
      FarmCommand.train(buildingId: farm.buildings.last.id, seed: seed),
    );
    final field = farm.field(1)!;
    final potatoes = [
      for (final tile in field.rect.tiles.take(3))
        plant(plainSeed(PotatoType.food), tile),
    ];
    farm.runSteps(catalog.potatoType(PotatoType.combat).growSeconds);
    final guard = farm.guards.single;
    for (final potato in potatoes) {
      potato.stored = 10;
    }
    // Run until it sets off for the field.
    while (!guard.harvesting) {
      farm.step();
    }
    expect(guard.targetFieldId, field.id);
    final before = farm.totals.foodHarvestedByGuards;
    expect(potatoes.every((p) => p.stored == 10), isTrue, reason: 'not yet');
    while (guard.harvesting) {
      farm.step();
    }
    expect(field.rect.contains(guard.at), isFalse);
    // 3 (stand-in) taken one at a time from the fullest: one from each.
    expect(farm.totals.foodHarvestedByGuards - before, 3);
    expect(potatoes.map((p) => p.stored), everyElement(9));
  });

  test('guards walk at their style pace', () {
    final potato = Potato(
      id: 99,
      type: PotatoType.combat,
      grade: Grade.normal,
      level: 0,
      abilities: const ['combat.plain'],
      style: CombatStyle.melee,
    );
    final pace = catalog.rules.potatoes.guards.walkMillisPerTile;
    // Melee walks at 125%.
    expect(farm.walkMillisFor(potato, 5), 5 * pace * 100 ~/ 125);
  });

  test('a revived potato gives its own kind of seed', () {
    build('graveyard', const TilePos(8, 8));
    final potato = plant(_seed(PotatoType.food, 'food.plenty', level: 7));
    farm.runSteps(120 + potato.lifespanMillis ~/ 1000);
    farm.apply(FarmCommand.revive(potatoId: potato.id));
    final seed = farm.takeEvents().whereType<PotatoRevived>().single.seed;
    expect(seed.ability, 'food.plenty');
    expect(seed.level, 7);
  });

  test('seeds found exploring carry the zone score and their own ability', () {
    final zone = catalog.zones.values.first;
    final run = RaidSimulation.start(catalog: catalog, zone: zone.id, seed: 3);
    final seeds = [
      for (final pile in run.piles)
        for (final stack in pile.loot.items) ?stack.seed,
    ];
    expect(seeds, isNotEmpty);
    for (final seed in seeds) {
      expect(seed.level, zone.score);
      expect(catalog.abilities[seed.ability]!.pool, seed.type.name);
    }

    // A round trip through the run document keeps them.
    final again = RaidSimulation.fromJson(
      jsonDecode(jsonEncode(run.toJson())) as Map<String, dynamic>,
      catalog,
    );
    expect([
      for (final pile in again.piles)
        for (final stack in pile.loot.items) ?stack.seed,
    ], seeds);
  });

  test('a bag stacks only equal seeds', () {
    final bag = Bag(4, (_) => 10);
    final a = _seed(PotatoType.food, 'food.plain');
    final b = _seed(PotatoType.food, 'food.plenty');
    bag
      ..addFrom(ItemStack('seed_food_normal', 1, seed: a))
      ..addFrom(ItemStack('seed_food_normal', 1, seed: a))
      ..addFrom(ItemStack('seed_food_normal', 1, seed: b));
    expect(bag.slots.whereType<ItemStack>(), hasLength(2));
  });

  test('a farm with abilities saves and loads the same', () {
    open(sampleCatalog());
    farm.food = 10000;
    build('statue', const TilePos(8, 8));
    build('graveyard', const TilePos(8, 10));
    plant(_seed(PotatoType.buff, 'buff.calm'));
    plant(plainSeed(PotatoType.food, Grade.legendary), _b);
    // Run until someone lies in the graveyard (calm slows aging here).
    while (farm.graves.isEmpty && farm.tick < 20000) {
      farm.runSteps(100);
    }
    expect(farm.graves, isNotEmpty);
    final loaded = FarmDocument.decode(
      jsonDecode(jsonEncode(FarmDocument.of(farm).toJson()))
          as Map<String, dynamic>,
    ).toSimulation(catalog);
    expect(FarmDocument.of(loaded), FarmDocument.of(farm));
    farm.runSteps(2000);
    loaded.runSteps(2000);
    expect(FarmDocument.of(loaded), FarmDocument.of(farm));
  });

  test('every type needs abilities of its own', () {
    final files =
        jsonDecode(jsonEncode(sampleCatalogFiles())) as Map<String, dynamic>;
    final abilities = files['potato_abilities'] as Map<String, dynamic>;
    (abilities['abilities'] as List).removeWhere(
      (a) => (a as Map)['pool'] == 'breeding',
    );
    expect(
      Catalog.load(files).issues.map((i) => i.toString()),
      contains('potato_abilities: abilities: no ability in the breeding pool'),
    );
  });
}
