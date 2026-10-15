import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

void main() {
  late Catalog catalog;

  setUpAll(() {
    // The sample data plus an empty, unturned zone for exact situations.
    final files = sampleCatalogFiles();
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
    // The same open map as a danger zone with two exits, both open.
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
    final result = Catalog.load(files);
    expect(result.issues, isEmpty);
    catalog = result.catalog!;
  });

  RaidSimulation openRun({
    int food = 100,
    List<CompanionStart> team = const [],
  }) => RaidSimulation.start(
    catalog: catalog,
    zone: 'open',
    seed: 1,
    food: food,
    companions: team,
  );

  void runFor(RaidSimulation run, double seconds) {
    final steps = (seconds / run.stepSeconds).round();
    for (var i = 0; i < steps && run.outcome == null; i++) {
      run.step();
    }
  }

  RaidEnemy addEnemy(RaidSimulation run, String kind, Vec2 at) {
    final data = catalog.enemies[kind]!;
    final enemy = RaidEnemy(
      id: 1000 + run.enemies.length,
      position: at,
      radius: data.radius,
      maxHp: data.maxHp,
      kind: kind,
      home: at,
    );
    run.enemies.add(enemy);
    return enemy;
  }

  group('a new run', () {
    test('fills the zone the same way for the same seed', () {
      RaidSimulation start() => RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_zone',
        seed: 42,
        food: 50,
      );
      final run = start();
      expect(jsonEncode(run.toJson()), jsonEncode(start().toJson()));

      final zone = catalog.zones['sample_zone']!;
      expect(run.enemies.length, greaterThan(zone.enemies.count));
      expect(run.piles, isNotEmpty);
      expect(run.bag.countOf('food'), 50);
      final entry = Vec2(run.map.entry.x + 0.5, run.map.entry.y + 0.5);
      expect(run.player.position, entry);
      for (final enemy in run.enemies) {
        expect(
          enemy.position.distanceTo(entry),
          greaterThanOrEqualTo(zone.enemies.keepAway),
        );
        expect(run.map.overlapsCircle(enemy.position, 0.35), isFalse);
      }
    });

    test('rejects an unknown zone', () {
      expect(
        () => RaidSimulation.start(catalog: catalog, zone: 'nowhere', seed: 1),
        throwsArgumentError,
      );
    });
  });

  test('the stick moves the player at walking speed', () {
    final run = openRun()..setMove(const Vec2(1, 0));
    final start = run.player.position;
    runFor(run, 1);
    final speed = catalog.rules.raid.player.speed;
    expect(run.player.position.x - start.x, closeTo(speed, speed * 0.05));
    expect(run.player.position.y, start.y);
  });

  test('food is eaten as time passes', () {
    final run = openRun();
    runFor(run, 10);
    final perSecond = catalog.rules.raid.food.perSecond;
    expect(run.bag.countOf('food'), closeTo(100 - perSecond * 10, 1));
  });

  test('out of food too long, the player walks home', () {
    final run = openRun(food: 0)..setMove(const Vec2(1, 0));
    final rules = catalog.rules.raid.food;
    runFor(run, rules.hungryReturnSeconds - 1);
    expect(run.outcome, isNull);
    runFor(run, 2);
    expect(run.outcome, RaidOutcome.starved);
    expect(run.takeEvents().last, isA<RaidEnded>());
  });

  test('going home ends the run with the bag', () {
    final run = openRun(food: 30);
    expect(run.apply(const GoHome()), isNull);
    expect(run.outcome, RaidOutcome.wentHome);
    expect(run.result!.items.single.count, 30);
    expect(run.apply(const Dash()), RaidRejection.over);
    final tick = run.tick;
    run.step();
    expect(run.tick, tick, reason: 'a finished run does not move on');
  });

  test('auto-aim fights off an enemy that charges in', () {
    final run = openRun();
    final biter = addEnemy(
      run,
      'biter',
      run.player.position + const Vec2(2, 0),
    );
    runFor(run, 10);
    expect(run.enemies, isNot(contains(biter)));
    final events = run.takeEvents();
    expect(events.whereType<EnemyDefeated>().single.enemy, biter.id);
  });

  test('a passive enemy stays calm until it is hit', () {
    final run = openRun();
    // Inside the enemy's sight but outside the weapon's reach.
    final brute = addEnemy(
      run,
      'brute',
      run.player.position + const Vec2(2.6, 0),
    );
    runFor(run, 3);
    expect(brute.target, isNull);
    expect(run.player.hp, run.player.maxHp);
  });

  test('an aggressive enemy hurts the player in reach', () {
    final run = openRun();
    // Swap in a weapon too weak to win, so the hit lands.
    addEnemy(run, 'brute', run.player.position + const Vec2(0.6, 0)).target =
        run.player.id;
    runFor(run, 2);
    expect(run.player.hp, lessThan(run.player.maxHp));
  });

  test('a dash moves fast, is unhurtable, then cools down', () {
    final run = openRun()..setMove(const Vec2(0, 1));
    final start = run.player.position;
    expect(run.apply(const Dash()), isNull);
    expect(run.apply(const Dash()), RaidRejection.dashNotReady);
    final spec = catalog.rules.raid.player;
    runFor(run, spec.dashSeconds);
    expect(run.player.position.y - start.y, closeTo(spec.dashDistance, 0.15));
    runFor(run, spec.dashCooldownSeconds);
    expect(run.apply(const Dash()), isNull);
  });

  group('loot', () {
    RaidPile addPile(RaidSimulation run, Vec2 at, List<ItemStack> items) {
      final pile = RaidPile(
        id: 2000 + run.piles.length,
        position: at,
        kind: PileKind.bundle,
        loot: LootPile(items),
      );
      run.piles.add(pile);
      return pile;
    }

    test('a pile next to the player can be taken', () {
      final run = openRun(food: 10);
      final pile = addPile(run, run.player.position + const Vec2(0.3, 0), [
        ItemStack('seed_food_rare', 1),
        ItemStack('material', 5),
      ]);
      expect(run.pileNear(), pile);
      expect(run.apply(TakeAllLoot(pile.id)), isNull);
      expect(run.bag.countOf('seed_food_rare'), 1);
      expect(run.piles, isNot(contains(pile)), reason: 'empty bundles go');
    });

    test('far piles are refused; a full bag swaps', () {
      final run = openRun(food: 10);
      final far = addPile(run, run.player.position + const Vec2(3, 0), [
        ItemStack('material', 1),
      ]);
      expect(run.pileNear(), isNull);
      expect(run.apply(TakeLoot(far.id, 0)), RaidRejection.tooFar);

      for (var i = 0; i < run.bag.capacity; i++) {
        run.bag.slots[i] = ItemStack('seed_food_normal', 1);
      }
      final near = addPile(run, run.player.position, [
        ItemStack('seed_food_rare', 1),
      ]);
      expect(run.apply(TakeLoot(near.id, 0)), RaidRejection.bagFull);
      expect(run.apply(SwapLoot(near.id, 0, 3)), isNull);
      expect(run.bag.slots[3]!.item, 'seed_food_rare');
      expect(near.loot.items.single.item, 'seed_food_normal');
    });

    test('items on the floor are picked up by walking over them', () {
      final run = openRun(food: 10)..setMove(const Vec2(1, 0));
      run.floorItems.add(
        RaidFloorItem(
          id: 3000,
          position: run.player.position + const Vec2(1, 0),
          stack: ItemStack('material', 4),
        ),
      );
      runFor(run, 1);
      expect(run.floorItems, isEmpty);
      expect(run.bag.countOf('material'), 4);
      expect(run.takeEvents().whereType<ItemPicked>(), hasLength(1));
    });
  });

  test('a food potato tags along and makes food', () {
    const potato = CompanionStart(
      potatoId: 7,
      type: PotatoType.food,
      grade: Grade.normal,
    );
    final alone = openRun();
    final together = openRun(team: [potato])..setMove(const Vec2(1, 0));
    alone.setMove(const Vec2(1, 0));
    runFor(alone, 10);
    runFor(together, 10);

    final made = catalog.rules.raid.companion.producePerSecond * 10;
    expect(
      together.bag.countOf('food') - alone.bag.countOf('food'),
      closeTo(made, 1),
    );
    final companion = together.companions.single;
    expect(
      companion.position.distanceTo(together.player.position),
      lessThan(2),
    );
    together.apply(const GoHome());
    expect(together.result!.companions.single, (potatoId: 7, down: false));
  });

  test('saving mid-run and going on equals never stopping', () {
    RaidSimulation start() => RaidSimulation.start(
      catalog: catalog,
      zone: 'sample_zone',
      seed: 9,
      food: 80,
      companions: const [
        CompanionStart(potatoId: 3, type: PotatoType.food, grade: Grade.rare),
      ],
    );
    void drive(RaidSimulation run, int from, int to) {
      for (var i = from; i < to; i++) {
        run.setMove(Vec2(i % 120 < 60 ? 1 : -1, i % 90 < 45 ? 0.5 : -0.5));
        if (i % 100 == 0) run.apply(const Dash());
        run.step();
      }
    }

    final straight = start();
    drive(straight, 0, 900);

    final saved = start();
    drive(saved, 0, 400);
    final text = jsonEncode(saved.toJson());
    final restored = RaidSimulation.fromJson(
      jsonDecode(text) as Map<String, dynamic>,
      catalog,
    );
    drive(restored, 400, 900);

    expect(jsonEncode(restored.toJson()), jsonEncode(straight.toJson()));
  });

  test('a run from another format is refused', () {
    final json = openRun().toJson()..['format_version'] = 99;
    expect(() => RaidSimulation.fromJson(json, catalog), throwsFormatException);
  });

  group('a danger zone', () {
    RaidSimulation dangerRun({int food = 100}) => RaidSimulation.start(
      catalog: catalog,
      zone: 'danger_open',
      seed: 1,
      food: food,
    );

    /// Puts the player in the exit east of the entry.
    RaidExit standInEast(RaidSimulation run) {
      final exit = run.exits.firstWhere((e) => e.position.x > 10);
      run.player.position = exit.position;
      return exit;
    }

    test('opens some generated exit sites, the same for the same seed', () {
      RaidSimulation start() => RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_danger',
        seed: 7,
      );
      final run = start();
      final zone = catalog.zones['sample_danger']!;
      expect(run.map.exits, hasLength(zone.map.exitSites));
      expect(run.exits, hasLength(zone.danger!.openExits));
      expect(run.exits.every((e) => !e.found), isTrue);
      expect(jsonEncode(run.toJson()), jsonEncode(start().toJson()));
      final reached = run.map.reachableFrom(run.map.entry);
      expect(run.map.exits.every(reached.contains), isTrue);
    });

    test('makes enemies stronger', () {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_danger',
        seed: 7,
      );
      final enemy = run.enemies.first;
      final multiplier = catalog.zones['sample_danger']!.enemies.hpMultiplier;
      expect(enemy.maxHp, catalog.enemies[enemy.kind]!.maxHp * multiplier);
    });

    test('exits show once seen, and all once time is up', () {
      final run = dangerRun();
      expect(run.exits.any((e) => e.found), isFalse);
      final east = run.exits.firstWhere((e) => e.position.x > 10);
      run.player.position = east.position - const Vec2(2, 0);
      run.step();
      expect(east.found, isTrue);
      expect(run.takeEvents().whereType<ExitFound>().single.exit, east.id);
      expect(run.exits.where((e) => !e.found), hasLength(1));

      runFor(run, 60);
      expect(run.exitsRevealed, isTrue);
      expect(run.exits.every((e) => e.found), isTrue);
      expect(run.takeEvents().whereType<ExitsRevealed>(), hasLength(1));
    });

    test('there is no going home; a signal needs an open exit', () {
      final run = dangerRun();
      expect(run.apply(const GoHome()), RaidRejection.wrongZone);
      expect(run.apply(const Signal()), RaidRejection.notAtExit);
      expect(openRun().apply(const Signal()), RaidRejection.wrongZone);
    });

    test('standing in the exit when the count ends leaves with the bag', () {
      final run = dangerRun(food: 30);
      final exit = standInEast(run);
      expect(run.apply(const Signal()), isNull);
      expect(run.apply(const Signal()), RaidRejection.signalling);
      expect(run.takeEvents().whereType<SignalSent>().single.exit, exit.id);
      runFor(run, 4.9);
      expect(run.outcome, isNull);
      runFor(run, 0.2);
      expect(run.outcome, RaidOutcome.extracted);
      final result = run.result!;
      expect(result.lost, isFalse);
      expect(result.score, catalog.zones['danger_open']!.score);
      expect(result.items.single.item, 'food');
    });

    test('the count runs out outside the exit: the signal is lost', () {
      final run = dangerRun();
      final exit = standInEast(run);
      run.apply(const Signal());
      runFor(run, 2);
      // Wandering off is allowed; the count keeps going.
      run.player.position = exit.position - const Vec2(3, 0);
      runFor(run, 3.5);
      expect(run.outcome, isNull);
      expect(run.signal, isNull);
      expect(run.takeEvents().whereType<SignalLost>().single.exit, exit.id);
    });

    test('aggressive enemies see farther as the count runs down', () {
      final run = dangerRun();
      standInEast(run);
      final sight = run.enemySight;
      expect(run.aggressiveSight, sight);
      run.apply(const Signal());
      runFor(run, 2.5);
      expect(run.aggressiveSight, closeTo(sight * 1.5, sight * 0.02));
    });

    test('hunger wears health down until everything is lost', () {
      final run = dangerRun(food: 0);
      runFor(run, 5);
      expect(run.player.hp, closeTo(run.player.maxHp - 50, 1));
      runFor(run, 6);
      expect(run.outcome, RaidOutcome.fainted);
      expect(run.result!.lost, isTrue);
    });

    test('saving mid-count and going on equals never stopping', () {
      final straight = dangerRun();
      standInEast(straight);
      straight.apply(const Signal());
      runFor(straight, 2);
      final restored = RaidSimulation.fromJson(
        jsonDecode(jsonEncode(straight.toJson())) as Map<String, dynamic>,
        catalog,
      );
      runFor(straight, 4);
      runFor(restored, 4);
      expect(restored.outcome, RaidOutcome.extracted);
      expect(jsonEncode(restored.toJson()), jsonEncode(straight.toJson()));
    });
  });
}
