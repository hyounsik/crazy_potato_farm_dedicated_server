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
    // The same with one clone walking in (at the entry: there are no sites).
    final cloneZone = jsonDecode(jsonEncode(danger)) as Map<String, dynamic>;
    cloneZone['id'] = 'clone_open';
    (cloneZone['danger'] as Map)
      ..['clones_at_start'] = 1
      ..['clones_max'] = 1;
    zones.add(cloneZone);
    // Combat seeds, which a fallen combat potato leaves.
    ((files['items']! as Map<String, dynamic>)['items'] as List<Object?>).add({
      'id': 'seed_combat_normal',
      'kind': 'seed',
      'stack': 1,
      'seed': {'type': 'combat', 'grade': 'normal'},
    });
    // A gun that never reaches, so only companions fight.
    ((files['weapons']! as Map<String, dynamic>)['weapons'] as List<Object?>)
        .add({
          'id': 'blank',
          'range': 0.01,
          'interval': 1,
          'damage': 1,
          'bullet_speed': 1,
        });
    // A small map with one ring clearing (the boss area), no other enemies.
    final bossZone = jsonDecode(jsonEncode(open)) as Map<String, dynamic>;
    bossZone['id'] = 'boss_open';
    bossZone['map'] = {
      'size': 24,
      'entry': {'x': 2, 'y': 12},
      'clear_radius': 1,
      'rotate': false,
      'terrain': [
        {
          'type': 'ring',
          'center': {'x': 14, 'y': 12},
          'radius': 5,
          'thickness': 1,
          'facing': {'x': -1, 'y': 0},
          'gap': 3,
        },
      ],
      'scatter': {'count': 0},
    };
    zones.add(bossZone);
    // An open map with one plateau to the east, reached by one ramp.
    final hillZone = jsonDecode(jsonEncode(open)) as Map<String, dynamic>;
    hillZone['id'] = 'hill_open';
    hillZone['map'] = {
      'size': 20,
      'entry': {'x': 3, 'y': 10},
      'clear_radius': 1,
      'rotate': false,
      'terrain': [
        {
          'type': 'plateau',
          'center': {'x': 14, 'y': 10},
          'area': 60,
          'ramps': 1,
        },
      ],
      'scatter': {'count': 0},
    };
    zones.add(hillZone);
    // Run-only abilities for the companion tests.
    final abilities =
        (files['potato_abilities']! as Map<String, dynamic>)['abilities']
            as List<Object?>;
    Map<String, Object?> effect(
      String target,
      String kind,
      Map<String, Object?> rest,
    ) => {'context': 'explore', 'target': target, 'kind': kind, ...rest};
    abilities.addAll([
      {
        'id': 'combat.fury',
        'pool': 'combat',
        'rarity': 'very_low',
        'effects': [
          effect('self', 'stat', {
            'stat': 'unit.attack',
            'op': 'mul',
            'value': 1.5,
            'condition': {'type': 'hp_below', 'ratio': 0.5},
          }),
        ],
      },
      {
        'id': 'buff.rally',
        'pool': 'buff',
        'rarity': 'very_low',
        'effects': [
          effect('party', 'stat', {
            'stat': 'unit.attack',
            'op': 'mul',
            'value': 1.2,
          }),
          effect('party', 'periodic', {
            'interval_sec': 5,
            'action': 'heal_percent',
            'value': 10,
          }),
        ],
      },
      {
        'id': 'food.loud',
        'pool': 'food',
        'rarity': 'very_low',
        'effects': [
          effect('self', 'periodic', {
            'interval_sec': 5,
            'action': 'say',
            'text': 'eek',
          }),
          effect('self', 'periodic', {
            'interval_sec': 5,
            'action': 'aggro_pulse',
          }),
        ],
      },
    ]);
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
    expect(together.result!.companions.single, (
      potatoId: 7,
      down: false,
      gone: false,
    ));
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

  group('companions', () {
    CompanionStart fighter(
      CombatStyle style, {
      CompanionMode mode = CompanionMode.attack,
      int level = 0,
      List<String> abilities = const ['combat.plain'],
    }) => CompanionStart(
      potatoId: 1,
      type: PotatoType.combat,
      grade: Grade.normal,
      level: level,
      abilities: abilities,
      style: style,
      mode: mode,
    );

    /// A run with the player's gun swapped for one that cannot reach, so only
    /// companions fight.
    RaidSimulation unarmed(List<CompanionStart> team, {String zone = 'open'}) {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: zone,
        seed: 1,
        food: 100,
        companions: team,
      );
      run.player.weapon = 'blank';
      return run;
    }

    test('a combat potato gets its style\'s health, raised by level', () {
      final style = catalog.rules.raid.companion.styles[CombatStyle.melee]!;
      final low = unarmed([fighter(CombatStyle.melee)]).companions.single;
      final high = unarmed([fighter(CombatStyle.melee, level: 10)])
          .companions
          .single;
      // combat.plain: +5% health.
      expect(low.maxHp, closeTo(style.maxHp * 1.05, 1e-9));
      final perLevel = catalog.rules.raid.companion.levelHpPermille / 1000;
      expect(
        high.maxHp,
        closeTo(style.maxHp * (1 + 10 * perLevel) * 1.05, 1e-9),
      );
    });

    test('in attack mode a melee potato runs at a calm enemy and hits it', () {
      final run = unarmed([fighter(CombatStyle.melee)]);
      final brute = addEnemy(
        run,
        'brute',
        run.player.position + const Vec2(2, 0),
      );
      runFor(run, 3);
      expect(brute.hp, lessThan(brute.maxHp));
      expect(
        brute.target,
        run.companions.single.id,
        reason: 'it goes for whoever hit it',
      );
    });

    test('in defense mode it leaves calm enemies alone', () {
      final run = unarmed([
        fighter(CombatStyle.melee, mode: CompanionMode.defense),
      ]);
      final brute = addEnemy(
        run,
        'brute',
        run.player.position + const Vec2(1.5, 0),
      );
      runFor(run, 3);
      expect(brute.hp, brute.maxHp);
      expect(run.companions.single.target, isNull);
    });

    test('in defense mode it takes on what goes for the player', () {
      final run = unarmed([
        fighter(CombatStyle.melee, mode: CompanionMode.defense),
      ]);
      final brute = addEnemy(
        run,
        'brute',
        run.player.position + const Vec2(1.5, 0),
      )..target = run.player.id;
      runFor(run, 3);
      expect(brute.hp, lessThan(brute.maxHp));
    });

    test('a ranged potato shoots from a distance', () {
      final run = unarmed([fighter(CombatStyle.ranged)]);
      final brute = addEnemy(
        run,
        'brute',
        run.player.position + const Vec2(2.5, 0),
      );
      runFor(run, 2);
      expect(brute.hp, lessThan(brute.maxHp));
      final companion = run.companions.single;
      expect(companion.position.distanceTo(brute.position), greaterThan(1));
    });

    test('an escort stands between the player and the enemy', () {
      final run = unarmed([fighter(CombatStyle.escort)]);
      final brute = addEnemy(
        run,
        'brute',
        run.player.position + const Vec2(2, 0),
      )..target = run.player.id;
      runFor(run, 0.6);
      final companion = run.companions.single;
      expect(companion.position.x, greaterThan(run.player.position.x));
      expect(companion.position.x, lessThan(brute.position.x));
    });

    test(
      'the mode changes mid-run; only standing combat potatoes have one',
      () {
        final run = unarmed([
          fighter(CombatStyle.melee, mode: CompanionMode.defense),
          const CompanionStart(
            potatoId: 2,
            type: PotatoType.food,
            grade: Grade.normal,
          ),
        ]);
        final [combat, food] = run.companions;
        expect(
          run.apply(SetCompanionMode(combat.id, CompanionMode.attack)),
          isNull,
        );
        expect(combat.mode, CompanionMode.attack);
        expect(
          run.apply(SetCompanionMode(food.id, CompanionMode.attack)),
          RaidRejection.noSuchCompanion,
        );
      },
    );

    test('abilities with a condition count only while it holds', () {
      final run = unarmed([
        fighter(
          CombatStyle.melee,
          abilities: const ['combat.plain', 'combat.fury'],
        ),
      ]);
      final companion = run.companions.single;
      final full = run.companionDamage(companion);
      companion.hp = companion.maxHp * 0.4;
      expect(run.companionDamage(companion), closeTo(full * 1.5, 1e-9));
    });

    test('a buff potato strengthens and heals the whole party', () {
      const buff = CompanionStart(
        potatoId: 3,
        type: PotatoType.buff,
        grade: Grade.normal,
        abilities: ['buff.rally'],
      );
      final plain = unarmed([fighter(CombatStyle.melee)]);
      final run = unarmed([fighter(CombatStyle.melee), buff]);
      run.step();
      plain.step();
      expect(
        run.companionDamage(run.companions.first),
        closeTo(plain.companionDamage(plain.companions.first) * 1.2, 1e-9),
      );
      expect(run.playerShotDamage, closeTo(plain.playerShotDamage * 1.2, 1e-9));

      run.player
        ..hp = 50
        ..sinceHit = 0;
      runFor(run, 5);
      expect(
        run.player.hp,
        greaterThanOrEqualTo(50 + run.player.maxHp * 0.1 - 1e-9),
      );
    });

    test('a loud potato speaks and calls nearby enemies', () {
      final run = unarmed([
        const CompanionStart(
          potatoId: 4,
          type: PotatoType.food,
          grade: Grade.normal,
          abilities: ['food.loud'],
        ),
      ]);
      final potato = run.companions.single;
      final rat = addEnemy(run, 'brute', potato.position + const Vec2(0, 2.5));
      runFor(run, 5.05);
      final said = run.takeEvents().whereType<CompanionSaid>().single;
      expect((said.companion, said.text), (potato.id, 'eek'));
      expect(rat.target, potato.id);
    });

    test('fallen in a danger zone it leaves its seed and is gone', () {
      final run = unarmed([
        fighter(CombatStyle.melee, level: 4),
      ], zone: 'danger_open');
      final companion = run.companions.single;
      addEnemy(run, 'brute', companion.position + const Vec2(0.4, 0)).target =
          companion.id;
      companion.hp = 1;
      runFor(run, 2);
      expect(companion.isDown, isTrue);
      final pile = run.piles.single;
      final seed = pile.loot.items.single.seed!;
      expect(
        (seed.type, seed.level, seed.style),
        (PotatoType.combat, 4, CombatStyle.melee),
      );
      expect(pile.position, companion.position);

      final standIn = run.exits.first;
      run.player.position = standIn.position;
      run.apply(const Signal());
      runFor(run, 6);
      expect(run.outcome, RaidOutcome.extracted);
      expect(run.result!.companions.single.gone, isTrue);
    });

    test('fallen in a safe zone it only faints', () {
      final run = unarmed([fighter(CombatStyle.melee)]);
      final companion = run.companions.single;
      addEnemy(run, 'brute', companion.position + const Vec2(0.4, 0)).target =
          companion.id;
      companion.hp = 1;
      runFor(run, 2);
      expect(companion.isDown, isTrue);
      expect(run.piles, isEmpty);
      run.apply(const GoHome());
      expect(run.result!.companions.single.gone, isFalse);
    });

    test(
      'saving with fighting companions and going on equals never stopping',
      () {
        RaidSimulation start() => unarmed([
          fighter(CombatStyle.ranged),
          const CompanionStart(
            potatoId: 3,
            type: PotatoType.buff,
            grade: Grade.normal,
            abilities: ['buff.rally'],
          ),
        ], zone: 'sample_zone');
        final straight = start();
        runFor(straight, 20);
        final saved = start();
        runFor(saved, 8);
        final restored = RaidSimulation.fromJson(
          jsonDecode(jsonEncode(saved.toJson())) as Map<String, dynamic>,
          catalog,
        );
        runFor(restored, 12);
        expect(jsonEncode(restored.toJson()), jsonEncode(straight.toJson()));
      },
    );
  });

  group('clones', () {
    RaidSimulation cloneRun() {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'clone_open',
        seed: 1,
        food: 100,
      );
      run
        ..player.weapon = 'blank'
        ..step()
        ..takeEvents();
      return run;
    }

    /// Moves the clone away from the player, out of its sight.
    RaidClone farClone(RaidSimulation run, {Vec2 offset = const Vec2(-7, 6)}) {
      final clone = run.clones.single;
      clone.position = run.player.position + offset;
      for (final c in clone.companions) {
        c.position = clone.position;
      }
      return clone;
    }

    test('come in at entry sites out of sight, more as time passes', () {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_danger',
        seed: 7,
      );
      final danger = catalog.zones['sample_danger']!.danger!;
      expect(run.clones, isEmpty, reason: 'they walk in on the first step');
      run.step();
      expect(run.clones, hasLength(danger.clonesAtStart));
      final sites = run.map.markers[cloneEntryMarker]!;
      for (final clone in run.clones) {
        expect(clone.cloneId, 'sample_clone', reason: 'fits score 3');
        expect(clone.name, 'Sample');
        expect(
          sites.any(
            (t) => Vec2(t.x + 0.5, t.y + 0.5).distanceTo(clone.position) < 0.01,
          ),
          isTrue,
        );
        expect(clone.companions.single.team, clone.id);
      }
      expect(run.takeEvents().whereType<CloneEntered>(), hasLength(2));
      final before = run.clones.length;
      runFor(run, danger.cloneEverySeconds + 0.1);
      expect(
        run.clones.length +
            run.takeEvents().whereType<CloneEscaped>().length +
            run.takeEvents().whereType<CloneDown>().length,
        greaterThanOrEqualTo(before),
      );
    });

    test('gather from spots into their own bag', () {
      final run = cloneRun();
      final clone = farClone(run);
      final spot = RaidPile(
        id: 7000,
        position: clone.position + const Vec2(2, 0),
        kind: PileKind.spot,
        loot: LootPile([ItemStack('food', 10)]),
      );
      run.piles.add(spot);
      runFor(run, 3);
      expect(spot.loot.isEmpty, isTrue);
      expect(clone.bag.countOf('food'), 10);
      expect(run.bag.countOf('food'), lessThan(100), reason: 'not the player');
    });

    test('fight wild enemies in their sight', () {
      final run = cloneRun();
      final clone = farClone(run);
      final brute = addEnemy(run, 'brute', clone.position + const Vec2(1.5, 0));
      runFor(run, 2);
      expect(brute.hp, lessThan(brute.maxHp));
      expect(brute.target, clone.id, reason: 'it goes for whoever hit it');
    });

    test('shoot the player who comes into their sight', () {
      final run = cloneRun();
      final clone = farClone(run, offset: const Vec2(1.5, 0));
      runFor(run, 2);
      expect(clone.target, run.player.id);
      expect(run.player.hp, lessThan(run.player.maxHp));
    });

    test('see farther as the player\'s signal runs down', () {
      final run = cloneRun();
      final sight = run.cloneSight;
      final exit = run.exits.firstWhere((e) => e.position.x > 10);
      run.player.position = exit.position;
      farClone(run);
      run.apply(const Signal());
      runFor(run, 2.5);
      expect(run.cloneSight, closeTo(sight * 1.5, sight * 0.02));
    });

    test('leave through an exit when their stay runs out', () {
      final run = cloneRun();
      final clone = farClone(run)..stayLeft = 0;
      runFor(run, 20);
      final events = run.takeEvents();
      expect(events.whereType<CloneSignalled>().single.clone, clone.id);
      expect(events.whereType<CloneEscaped>().single.clone, clone.id);
      expect(run.clones, isEmpty);
    });

    test('fallen, they leave what they gathered in a purple bundle', () {
      final run = cloneRun();
      final clone = farClone(run);
      clone.bag.addFrom(ItemStack('food', 12));
      clone.hp = 0;
      run.step();
      expect(run.clones, isEmpty);
      final bundle = run.piles.singleWhere(
        (p) => p.kind == PileKind.cloneBundle,
      );
      expect(bundle.loot.items.single.count, 12);
      expect(run.takeEvents().whereType<CloneDown>().single.clone, clone.id);
    });

    test('saving with clones about and going on equals never stopping', () {
      RaidSimulation start() => RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_danger',
        seed: 11,
        food: 100,
      );
      void steps(RaidSimulation run, int n) {
        for (var i = 0; i < n; i++) {
          run.step();
        }
      }

      final straight = start();
      steps(straight, 1200);
      final saved = start();
      steps(saved, 450);
      final restored = RaidSimulation.fromJson(
        jsonDecode(jsonEncode(saved.toJson())) as Map<String, dynamic>,
        catalog,
      );
      steps(restored, 750);
      expect(jsonEncode(restored.toJson()), jsonEncode(straight.toJson()));
    });
  });

  group('the boss', () {
    RaidSimulation bossRun({List<CompanionStart> team = const []}) {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'boss_open',
        seed: 1,
        food: 100,
        companions: team,
      );
      run.player.weapon = 'blank';
      return run;
    }

    /// Inside the clearing, two tiles from the boss.
    const inside = Vec2(12.5, 12.5);

    test('stands in the clearing; other enemies keep out of it', () {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_zone',
        seed: 3,
      );
      final boss = run.boss!;
      expect(run.inBossArea(boss.position), isTrue);
      for (final enemy in run.enemies) {
        if (enemy == boss) continue;
        expect(run.inBossArea(enemy.position), isFalse);
      }
    });

    test('takes on only those in its area, and goes back when they leave', () {
      final run = bossRun();
      final boss = run.boss!;
      final home = boss.position;
      runFor(run, 2);
      expect(boss.target, isNull, reason: 'the player is outside');

      run.player.position = inside;
      run.step();
      expect(boss.target, run.player.id);

      run.player.position = const Vec2(2.5, 12.5);
      runFor(run, 6);
      expect(boss.target, isNull);
      expect(boss.position.distanceTo(home), lessThan(0.2));
    });

    test('shows a charge, then runs into the player', () {
      final run = bossRun();
      final boss = run.boss!..chargeCooldown = 0;
      run.player.position = inside;
      run.step();
      expect(boss.isTelegraphing, isTrue);
      final toward = boss.chargeDirection;
      expect(toward.x, lessThan(-0.9), reason: 'aimed at the player');
      final hp = run.player.hp;
      runFor(run, 1.5);
      final charge = catalog.enemies['sample_boss']!.boss!.chargeDamage;
      expect(run.player.hp, lessThanOrEqualTo(hp - charge + 1e-9));
    });

    test('a dash through the charge takes no harm from it', () {
      final run = bossRun();
      final boss = run.boss!..chargeCooldown = 0;
      run.player.position = inside;
      run.step();
      while (boss.isTelegraphing) {
        run.step();
      }
      final hp = run.player.hp;
      run
        ..player.dashLeft = 10
        ..step()
        ..step()
        ..step();
      expect(run.player.hp, hp);
    });

    test('sprays shots all around', () {
      final run = bossRun();
      final boss = run.boss!
        ..sprayCooldown = 0
        ..chargeCooldown = 100;
      run.player.position = inside;
      run.step();
      final spray = catalog.enemies['sample_boss']!.boss!.sprayBullets;
      expect(run.bullets.where((b) => b.owner == boss.id), hasLength(spray));
    });

    test('does not heal, and leaves a boss bundle when it falls', () {
      final run = bossRun();
      final boss = run.boss!..hp = 5;
      runFor(run, 10);
      expect(boss.hp, 5);
      boss.hp = 0;
      run.step();
      expect(run.boss, isNull);
      expect(
        run.piles.where((p) => p.kind == PileKind.bossBundle),
        hasLength(1),
      );
    });

    test('attack-mode potatoes stay out unless the player is inside', () {
      final run = bossRun(
        team: [
          const CompanionStart(
            potatoId: 1,
            type: PotatoType.combat,
            grade: Grade.normal,
            abilities: ['combat.plain'],
            style: CombatStyle.ranged,
            mode: CompanionMode.attack,
          ),
        ],
      );
      final boss = run.boss!..chargeCooldown = 100;
      // Just outside the opening, in attack range of the boss.
      run.player.position = const Vec2(7.5, 12.5);
      run.companions.single.position = run.player.position;
      runFor(run, 1);
      expect(run.companions.single.target, isNull);
      run.player.position = inside;
      // It catches up first (it was over three tiles away), then joins in.
      runFor(run, 2);
      expect(run.companions.single.target, boss.id);
    });

    test('clones go in and fight it', () {
      final run = RaidSimulation.start(
        catalog: catalog,
        zone: 'sample_danger',
        seed: 7,
      )..step();
      final boss = run.boss!..chargeCooldown = 100;
      final clone = run.clones.first;
      clone.position = boss.position + const Vec2(1, 0);
      runFor(run, 1);
      expect(boss.target, clone.id);
      expect(boss.hp, lessThan(boss.maxHp));
    });
  });

  group('high ground', () {
    late RaidSimulation run;

    /// A low tile and a high tile two apart, side by side.
    late Vec2 low;
    late Vec2 high;

    setUp(() {
      run = RaidSimulation.start(
        catalog: catalog,
        zone: 'hill_open',
        seed: 1,
        food: 100,
      );
      final map = run.map;
      for (var y = 1; y < 19; y++) {
        for (var x = 1; x < 17; x++) {
          if (map.heightAt(x, y) == MapHeight.low &&
              map.heightAt(x + 1, y) == MapHeight.low &&
              map.heightAt(x + 2, y) == MapHeight.high &&
              map.heightAt(x + 3, y) == MapHeight.high) {
            low = Vec2(x + 0.5, y + 0.5);
            high = Vec2(x + 3.5, y + 0.5);
            return;
          }
        }
      }
      fail('no cliff found');
    });

    test('enemies below do not notice the player above', () {
      run.player.position = high;
      final rat = addEnemy(run, 'biter', low);
      run.step();
      expect(rat.target, isNull);
      // Down on the same level, it does.
      run.player.position = low + const Vec2(0, 1);
      run.step();
      expect(rat.target, run.player.id);
    });

    test('auto-aim from below finds nothing above; from above it does', () {
      // A gun that reaches across the two tiles between.
      run.player
        ..weapon = 'charge'
        ..position = low + const Vec2(1, 0);
      final enemy = addEnemy(run, 'brute', high);
      expect(run.autoAimTarget(), isNull);
      run.player.position = high;
      enemy.position = low + const Vec2(1, 0);
      expect(run.autoAimTarget(), enemy);
    });

    test('shots from below stop at the cliff', () {
      final enemy = addEnemy(run, 'brute', high);
      run.bullets.add(
        RaidBullet(
          id: 9999,
          position: low,
          velocity: const Vec2(8, 0),
          damage: 50,
          owner: run.player.id,
          side: RaidSide.player,
          team: playerTeam,
          remaining: 5,
        ),
      );
      runFor(run, 1);
      expect(enemy.hp, enemy.maxHp);
      expect(run.bullets.where((b) => b.id == 9999), isEmpty);
    });
  });

  group('party', () {
    RaidSimulation makeParty({
      String zone = 'danger_open',
      List<RaidMemberStart>? members,
    }) => RaidSimulation.party(
      catalog: catalog,
      zone: zone,
      seed: 7,
      members:
          members ??
          const [RaidMemberStart(food: 50), RaidMemberStart(food: 50)],
    );

    test('members share a team, buff potatoes reach all, and both shoot the '
        'same enemy without hurting each other', () {
      final plain = makeParty();
      final run = makeParty(
        members: const [
          RaidMemberStart(
            food: 50,
            companions: [
              CompanionStart(
                potatoId: 1,
                type: PotatoType.buff,
                grade: Grade.normal,
                abilities: ['buff.rally'],
              ),
            ],
          ),
          RaidMemberStart(food: 50),
        ],
      );
      plain.step();
      run.step();
      expect(run.members, hasLength(2));
      final [host, guest] = run.members;
      expect(host.player.team, playerTeam);
      expect(guest.player.team, playerTeam);
      // Both got the buff potato's attack boost.
      expect(
        run.shotDamageOf(host),
        closeTo(plain.shotDamageOf(plain.members[0]) * 1.2, 1e-9),
      );
      expect(
        run.shotDamageOf(guest),
        closeTo(plain.shotDamageOf(plain.members[1]) * 1.2, 1e-9),
      );

      run.enemies.clear();
      run.clones.clear();
      // Standing side by side with no enemy: neither aims at the other.
      guest.player.position = host.player.position + const Vec2(1, 0);
      expect(run.aimOf(host), isNull);
      expect(run.aimOf(guest), isNull);

      final enemy = addEnemy(
        run,
        'brute',
        host.player.position + const Vec2(2, 0),
      )..attackCooldown = 10;
      expect(run.aimOf(host), enemy);
      expect(run.aimOf(guest), enemy);
      runFor(run, 1);
      expect(enemy.hp, lessThan(enemy.maxHp));
      expect(host.player.hp, host.player.maxHp);
      expect(guest.player.hp, guest.player.maxHp);
    });

    test('bags are separate and floor items go to whoever walks over them', () {
      final run = makeParty();
      run.enemies.clear();
      run.clones.clear();
      final [host, guest] = run.members;
      host.player.position = const Vec2(5.5, 5.5);
      guest.player.position = const Vec2(10.5, 10.5);
      run.floorItems.add(
        RaidFloorItem(
          id: 900,
          position: guest.player.position,
          stack: ItemStack('material', 3),
        ),
      );
      run.step();
      expect(host.bag.countOf('material'), 0);
      expect(guest.bag.countOf('material'), 3);
      final picked = run.takeEvents().whereType<ItemPicked>().single;
      expect(picked.player, guest.id);
    });

    test('when one member falls in a danger zone and nobody revives them the '
        'run goes on and their bag stays in a bundle for the survivor to '
        'extract with', () {
      final run = makeParty();
      run.enemies.clear();
      run.clones.clear();
      final [host, guest] = run.members;
      guest.bag.addFrom(ItemStack('seed_food_rare', 2));
      // Far from the host, so nobody revives them.
      guest.player.position = host.player.position + const Vec2(4, 0);

      // Knock the guest down; they wait, then fail.
      guest.player.hp = 0;
      run.step();
      expect(guest.isDowned, isTrue);
      expect(guest.outcome, isNull);
      runFor(run, run.rules.party.downSeconds + 0.1);
      expect(guest.outcome, RaidOutcome.fainted);
      expect(host.outcome, isNull);
      expect(run.isOver, isFalse);
      expect(run.resultOf(guest)!.lost, isTrue);
      expect(
        run.resultOf(guest)!.items.any((s) => s.item == 'seed_food_rare'),
        isTrue,
      );

      // A bundle with what the guest carried is on the floor; host takes it.
      host.player.position = guest.player.position;
      final bundle = run.pileNearOf(host);
      expect(bundle, isNotNull);
      expect(run.applyOf(host, TakeAllLoot(bundle!.id)), isNull);
      expect(host.bag.countOf('seed_food_rare'), 2);

      // Host signals at an open exit and extracts; now the run is over.
      final exit = run.exits.first;
      host.player.position = exit.position;
      expect(run.applyOf(host, const Signal()), isNull);
      runFor(run, run.zone.danger!.countdownSeconds + 0.2);
      expect(host.outcome, RaidOutcome.extracted);
      expect(run.isOver, isTrue);
      expect(run.resultOf(host)!.lost, isFalse);
      expect(
        run.resultOf(host)!.items.any((s) => s.item == 'seed_food_rare'),
        isTrue,
      );
    });

    test(
      'round-trips a party run, results, commands and events through JSON',
      () {
        final run = makeParty();
        final [host, guest] = run.members;
        run.setMoveOf(guest, const Vec2(1, 0));
        runFor(run, 0.5);
        guest
          ..downLeft = 12.5
          ..revive = 1.5;
        final restored = RaidSimulation.fromJson(run.toJson(), catalog);
        expect(restored.members, hasLength(2));
        expect(restored.members[1].downLeft, 12.5);
        expect(restored.members[1].revive, 1.5);
        guest
          ..downLeft = null
          ..revive = 0;
        expect(restored.members[1].player.position, guest.player.position);

        for (final cmd in const <RaidCommand>[
          Dash(),
          GoHome(),
          Signal(),
          SetCompanionMode(3, CompanionMode.attack),
          EquipFromBag(1),
          Unequip(GearKind.weapon),
          DropItem(0),
          PutInPile(4, 1),
          TakeLoot(4, 0),
          TakeAllLoot(4),
          SwapLoot(4, 0, 2),
        ]) {
          expect(RaidCommand.fromJson(cmd.toJson()).toJson(), cmd.toJson());
        }
        for (final ev in <RaidEvent>[
          const BodyHit(1, 12.5),
          const EnemyDefeated(2, 'biter'),
          const CompanionDown(3),
          const CompanionSaid(3, 'hi'),
          const CloneEntered(4),
          const CloneSignalled(4, 5),
          const CloneEscaped(4),
          const CloneDown(4),
          ItemPicked(ItemStack('material', 2), player: guest.id),
          const ExitFound(5),
          const ExitsRevealed(),
          SignalSent(5, player: host.id),
          SignalLost(5, player: host.id),
          RaidEnded(RaidOutcome.extracted, player: host.id),
          MemberDowned(player: guest.id),
          MemberRevived(player: guest.id),
        ]) {
          expect(RaidEvent.fromJson(ev.toJson()).toJson(), ev.toJson());
        }
      },
    );

    group('downed members (2026-10-21)', () {
      late RaidSimulation run;
      late RaidMember host;
      late RaidMember guest;
      PartyRulesData party() => run.rules.party;

      setUp(() {
        run = makeParty();
        run.enemies.clear();
        run.clones.clear();
        host = run.members[0];
        guest = run.members[1];
        guest.player.position = host.player.position + const Vec2(4, 0);
      });

      test('a teammate standing close revives them with some health', () {
        guest.player.hp = 0;
        run.step();
        expect(guest.isDowned, isTrue);
        expect(
          run.takeEvents().whereType<MemberDowned>().single.player,
          guest.id,
        );
        expect(run.applyOf(guest, const Dash()), RaidRejection.downed);

        host.player.position = guest.player.position + const Vec2(0.5, 0);
        runFor(run, party().reviveSeconds + 0.1);
        expect(guest.isDowned, isFalse);
        expect(guest.outcome, isNull);
        expect(
          guest.player.hp,
          closeTo(guest.player.maxHp * party().revivedHp, 1e-9),
        );
        expect(
          run.takeEvents().whereType<MemberRevived>().single.player,
          guest.id,
        );
      });

      test('revive drains slowly while nobody is close', () {
        guest.player.hp = 0;
        run.step();
        host.player.position = guest.player.position;
        runFor(run, party().reviveSeconds / 2);
        final built = guest.revive;
        expect(built, greaterThan(0));
        host.player.position = guest.player.position + const Vec2(5, 0);
        runFor(run, 1);
        expect(guest.revive, lessThan(built));
        expect(guest.revive, greaterThan(0));
      });

      test('works in a safe zone too', () {
        run = makeParty(zone: 'open');
        guest = run.members[1];
        guest.player.hp = 0;
        run.step();
        expect(guest.isDowned, isTrue);
      });

      test('alone, or with nobody left standing, they faint at once', () {
        final solo = RaidSimulation.party(
          catalog: catalog,
          zone: 'danger_open',
          seed: 7,
          members: const [RaidMemberStart(food: 50)],
        );
        solo.enemies.clear();
        solo.clones.clear();
        solo.player.hp = 0;
        solo.step();
        expect(solo.members.single.outcome, RaidOutcome.fainted);

        guest.player.hp = 0;
        run.step();
        expect(guest.isDowned, isTrue);
        host.player.hp = 0;
        run.step();
        expect(host.outcome, RaidOutcome.fainted);
        expect(guest.outcome, RaidOutcome.fainted);
        expect(run.isOver, isTrue);
      });

      test('everyone standing in the exit leaves together, not the downed', () {
        final three = RaidSimulation.party(
          catalog: catalog,
          zone: 'danger_open',
          seed: 7,
          members: const [
            RaidMemberStart(food: 50),
            RaidMemberStart(food: 50),
            RaidMemberStart(food: 50),
          ],
        );
        three.enemies.clear();
        three.clones.clear();
        final [a, b, c] = three.members;
        final exit = three.exits.first;
        a.player.position = exit.position;
        b.player.position = exit.position + const Vec2(0.3, 0);
        // The downed one lies in the exit, out of everyone's revive reach.
        c.player.position = exit.position + const Vec2(0, 0.6);
        expect(three.applyOf(a, const Signal()), isNull);
        c.player.hp = 0;
        three.step();
        expect(c.isDowned, isTrue);
        c.downLeft = 1000;
        final reach = three.rules.party.reviveRadius;
        expect(
          c.player.position.distanceTo(a.player.position),
          lessThan(reach),
        );
        // Hold the revive back so the countdown ends first.
        final countdown = three.zone.danger!.countdownSeconds;
        for (var t = 0.0; t < countdown + 0.2; t += three.stepSeconds) {
          c.revive = 0;
          three.step();
        }
        expect(a.outcome, RaidOutcome.extracted);
        expect(b.outcome, RaidOutcome.extracted);
        expect(c.outcome, isNot(RaidOutcome.extracted));
      });
    });
  });
}
