import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

/// 10×10 with a wall down x = 5, open only on the bottom row: a and b sit
/// either side of it, so a walk between them goes round by the gap.
MapData _map({bool closeGap = false}) {
  final tiles = [
    for (var y = 0; y < 10; y++)
      for (var x = 0; x < 10; x++)
        x == 5 && (y < 9 || closeGap) ? MapTile.terrain : MapTile.open,
  ];
  return MapData(
    size: 10,
    tiles: tiles,
    entry: const TilePos(1, 8),
    markers: const {
      'at:a': [TilePos(1, 1)],
      'at:b': [TilePos(8, 1)],
      'at:c': [TilePos(1, 8)],
      'at:d': [TilePos(3, 3)],
    },
  );
}

const _rat = EnemyData(
  id: 'rat',
  temper: EnemyTemper.aggressive,
  attack: EnemyAttack.melee,
  maxHp: 10,
  radius: 0.3,
  damage: 1,
  attackInterval: 1,
);

const _horsefly = EnemyData(
  id: 'horsefly',
  temper: EnemyTemper.aggressive,
  attack: EnemyAttack.melee,
  maxHp: 100,
  radius: 0.6,
  damage: 5,
  attackInterval: 1,
  boss: BossData(
    chargeSpeed: 6,
    clouds: [
      BossCloudData(
        everySeconds: 5,
        radius: 2,
        spreadSeconds: 1,
        damagePerSecond: 1,
      ),
    ],
  ),
);

const _cast = ScriptCast(
  enemies: {'rat': _rat},
  characters: {'john', 'ian'},
  boss: _horsefly,
);

List<String> _problems(String text, {MapData? map}) => [
  for (final p in MapScript.parse('t', text).check(map ?? _map(), _cast))
    '${p.line}: ${p.message}',
];

void main() {
  group('reading', () {
    test('commands, comments, blank lines and & together', () {
      final script = MapScript.parse('meet', '''
# John walks to the table
actor helm john at a
move helm a -> b 2s   # slowly
& mark meet at c

wait reach meet
''');
      expect(script.problems, isEmpty);
      expect(script.commands.map((c) => c.runtimeType), [
        ActorCommand,
        MoveCommand,
        MarkCommand,
        WaitReachCommand,
      ]);
      expect(script.commands.map((c) => c.line), [2, 3, 4, 6]);
      expect(script.commands[2].together, isTrue);
      expect((script.commands[1] as MoveCommand).seconds, 2);
    });

    test('a line it cannot read says how it is written', () {
      final script = MapScript.parse('t', 'move helm a b 2s\nwait 0s\njump\n');
      expect([for (final p in script.problems) p.line], [1, 2, 3]);
      expect(script.problems.first.message, contains('move <who>'));
      expect(script.problems[1].message, contains('1.5s'));
      expect(script.problems[2].message, contains('unknown command'));
    });

    test('hooks: marks reached, enemies defeated and cues', () {
      final script = MapScript.parse('t', '''
actor r rat at a
mark m at b
wait reach m
wait defeated r
cue boss_seen
''');
      expect(script.hooks('ch1'), [
        'map:ch1/reach:m',
        'map:ch1/defeated:r',
        'map:ch1/cue:boss_seen',
      ]);
    });
  });

  group('checking', () {
    test('a script that fits finds nothing', () {
      expect(
        _problems('''
actor r rat at d
attack r melee at farmer
attack boss charge at r
attack boss cloud:1 at a
farmer shoot at r 1s
farmer dash to c
farmer skill 1
face boss farmer
move farmer c -> b 3s
wait defeated r
'''),
        isEmpty,
      );
    });

    test('unknown places, names, kinds and attacks', () {
      expect(
        _problems('''
actor r rat at nowhere
actor h ghost at a
attack r spray at farmer
attack boss cloud:2 at a
attack farmer melee at r
wait reach m
face x farmer
'''),
        [
          '1: no place "nowhere" (marker at:nowhere)',
          '2: no kind "ghost"',
          '3: "r" has no attack "spray" (melee)',
          '4: "boss" has no attack "cloud:2" (melee, charge, cloud:1)',
          '5: "farmer" is not an enemy',
          '6: no mark "m" yet',
          '7: no body "x" yet',
        ],
      );
    });

    test('a walk between places that do not connect', () {
      expect(_problems('move farmer a -> b 2s', map: _map(closeGap: true)), [
        '1: cannot walk from "a" to "b"',
      ]);
      expect(_problems('move farmer a -> b 2s'), isEmpty);
    });

    test('a name is used once', () {
      expect(_problems('actor boss rat at a\nactor r rat at a\nmark r at b'), [
        '1: "boss" is always there',
        '3: "r" is a body',
      ]);
    });
  });

  group('running', () {
    ScriptRun run(String text, {Vec2 farmer = const Vec2(1.5, 8.5)}) {
      final script = MapScript.parse('t', text);
      expect(script.check(_map(), _cast), isEmpty);
      return ScriptRun(
        script,
        _map(),
        farmer: farmer,
        boss: const Vec2(8.5, 8.5),
      );
    }

    test('a move walks round the wall in its time, then the next starts', () {
      final r = run('actor h john at a\nmove h a -> b 4s\nwait 1s');
      final h = r.bodies['h']!;
      expect(h.position.distanceTo(const Vec2(1.5, 1.5)), lessThan(1e-9));
      r.advance(2);
      expect(h.walking, isTrue);
      // Halfway along the way round, it is down by the gap, not at the wall.
      expect(h.position.y, greaterThan(5));
      r.advance(2);
      expect(h.position.distanceTo(const Vec2(8.5, 1.5)), lessThan(1e-9));
      expect(h.walking, isFalse);
      expect(r.running.single, isA<WaitCommand>());
      r.advance(1);
      expect(r.done, isTrue);
    });

    test('& starts with the one before; the step ends when both do', () {
      final r = run('mark m at a\nmove m a -> d 1s\n& wait 3s\ncue after');
      r.advance(1);
      expect(r.marks['m']!.distanceTo(const Vec2(3.5, 3.5)), lessThan(1e-9));
      expect(r.takeActions(), isEmpty);
      r.advance(2);
      expect(r.takeActions().single, isA<ScriptCue>());
      expect(r.done, isTrue);
    });

    test('waits for the farmer on the mark, then takes the mark away', () {
      final r = run('mark m at d\nwait reach m\ncue there');
      r.advance(1);
      expect(r.waitingReach, ['m']);
      r.farmerAt(const Vec2(3.4, 3.6));
      r.advance(0.1);
      expect(r.marks, isEmpty);
      // A moment ends the frame: a scene on it plays before the next line.
      expect(r.takeActions(), isEmpty);
      r.advance(0.1);
      expect((r.takeActions().single as ScriptCue).name, 'there');
    });

    test('a scripted walk holds the farmer; the player cannot move it', () {
      final r = run('move farmer c -> a 2s');
      r.advance(1);
      expect(r.holdsFarmer, isTrue);
      final at = r.bodies[scriptFarmer]!.position;
      r.farmerAt(const Vec2(9, 9));
      expect(r.bodies[scriptFarmer]!.position, at);
      r.advance(1);
      expect(r.done, isTrue);
      expect(r.holdsFarmer, isFalse);
    });

    test(
      'attacks and the farmer\'s moves are handed out, aimed as they stand',
      () {
        final r = run('''
actor r rat at d
attack boss charge at r
farmer shoot at boss 1s
farmer dash to b
farmer skill 2
wait defeated r
cue done
''');
        final first = r.takeActions();
        expect(first.length, 2);
        final charge = first[0] as ScriptAttack;
        expect(
          (charge.who, charge.attack, charge.aim.body),
          ('boss', 'charge', 'r'),
        );
        expect(charge.aim.point, const Vec2(3.5, 3.5));
        expect((first[1] as ScriptShoot).aim.body, 'boss');
        expect(r.bodies[scriptBoss]!.facing.x, lessThan(0));
        r.advance(1);
        final next = r.takeActions();
        expect((next[0] as ScriptDash).to, const Vec2(8.5, 1.5));
        expect((next[1] as ScriptSkill).companion, 2);
        expect(r.waitingDefeated, ['r']);
        r.defeated('r');
        r.advance(0.1);
        expect(r.takeActions(), isEmpty);
        r.advance(0.1);
        expect(r.takeActions().single, isA<ScriptCue>());
        expect(r.done, isTrue);
      },
    );
  });
}
