import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

final _normal = plainSeed(PotatoType.food, Grade.normal);
const _tile = TilePos(12, 9);

void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  /// Plain normal food seeds in the pouch before the test. Rolled new-farm
  /// seeds can be plain too, so it is not always 8.
  late int start;

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1);
    farm.seeds
      ..add(_normal, 8)
      ..add(plainSeed(PotatoType.food, Grade.legendary));
    start = farm.seeds.count(_normal);
  });

  FarmRejection? plant([TilePos tile = _tile, Seed? seed]) => farm.apply(
    FarmCommand.plant(fieldId: 1, tile: tile, seed: seed ?? _normal),
  );

  test('a new farm follows new_farm in the catalog', () {
    final farm = FarmSimulation.newFarm(catalog, seed: 1);
    expect(farm.food, 200);
    expect(farm.fields.single.rect.area, 4);
    expect(countOf(farm.seeds, PotatoType.food, Grade.normal), 8);
    expect(countOf(farm.seeds, PotatoType.combat), 2);
    expect(farm.tick, 0);
  });

  test('new farm seeds get an ability of their type, and combat a style', () {
    final farm = FarmSimulation.newFarm(catalog, seed: 1);
    for (final seed in farm.seeds.counts.keys) {
      expect(catalog.abilities[seed.ability]!.pool, seed.type.name);
      expect(seed.style == null, seed.type != PotatoType.combat);
    }
    expect(
      FarmDocument.of(FarmSimulation.newFarm(catalog, seed: 1)),
      FarmDocument.of(farm),
      reason: 'the same farm seed rolls the same seeds',
    );
  });

  group('blocks', () {
    // The sample farm is 24x24 in 4x4 blocks; the middle 8x8 starts open.
    test('the middle blocks start open', () {
      expect(farm.openBlocks, unorderedEquals(catalog.rules.farm.startBlocks));
      expect(farm.isOpen(const TilePos(8, 8)), isTrue);
      expect(farm.isOpen(const TilePos(7, 8)), isFalse);
      expect(farm.isOpen(const TilePos(-1, 8)), isFalse);
    });

    test('block steps grow by group (2026-10-28)', () {
      final catalog = sampleCatalogWith((files) {
        final rules = rulesOf(files)['farm'] as Map<String, dynamic>;
        rules['block_food'] = 100;
        rules['block_steps'] = [40, 80, 200, 480];
      });
      final farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 1000000;
      final costs = <int>[];
      while (true) {
        final block = [
          for (var y = 0; y < 6; y++)
            for (var x = 0; x < 6; x++) TilePos(x, y),
        ].where(farm.canOpen).firstOrNull;
        if (block == null) break;
        costs.add(farm.blockCost);
        expect(farm.apply(FarmCommand.openBlock(block: block)), isNull);
      }
      expect(costs, hasLength(32));
      expect([costs[0], costs[7], costs[8], costs[15]], [100, 380, 460, 1020]);
      expect(
        [costs[16], costs[23], costs[24], costs[31]],
        [1220, 2620, 3100, 6460],
      );
      expect(costs.fold(0, (a, b) => a + b), 61440);
    });

    test('opening a block next to open land costs more each time', () {
      farm.food = 1000;
      expect(farm.blockCost, 50);
      expect(farm.canOpen(const TilePos(0, 0)), isFalse, reason: 'not next');
      expect(farm.canOpen(const TilePos(2, 2)), isFalse, reason: 'open');
      expect(farm.canOpen(const TilePos(6, 2)), isFalse, reason: 'off farm');

      expect(
        farm.apply(const FarmCommand.openBlock(block: TilePos(1, 2))),
        isNull,
      );
      expect(farm.food, 950);
      expect(farm.takeEvents().whereType<BlockOpened>().single.food, 50);
      expect(farm.isOpen(const TilePos(4, 8)), isTrue);
      expect(farm.blockCost, 75);
      // Now its neighbour further out can open too.
      expect(farm.canOpen(const TilePos(0, 2)), isTrue);
      expect(
        farm.apply(const FarmCommand.openBlock(block: TilePos(1, 2))),
        FarmRejection.cannotOpen,
      );
      farm.food = 74;
      expect(
        farm.apply(const FarmCommand.openBlock(block: TilePos(0, 2))),
        FarmRejection.notEnoughFood,
      );
    });

    test('fields and buildings go on opened land only', () {
      farm.food = 1000;
      const rect = TileRect(origin: TilePos(5, 9), width: 2, height: 2);
      expect(farm.canPlace(rect), isFalse);
      farm.apply(const FarmCommand.openBlock(block: TilePos(1, 2)));
      expect(farm.canPlace(rect), isTrue);
      expect(farm.apply(const FarmCommand.makeField(rect: rect)), isNull);
    });

    test('nothing goes on the entrance, which moves down as land opens', () {
      farm.food = 1000;
      final entrance = farm.entrance;
      expect(farm.isOpen(entrance), isTrue);
      expect(farm.isOpen(entrance + const TilePos(0, 1)), isFalse);
      expect(
        farm.canPlace(TileRect(origin: entrance, width: 1, height: 1)),
        isFalse,
      );
      final below = TilePos(entrance.x ~/ 4, entrance.y ~/ 4 + 1);
      expect(farm.apply(FarmCommand.openBlock(block: below)), isNull);
      expect(farm.entrance.y, entrance.y + 4);
    });

    test('every door is below the middle of the bottom side, the left '
        'middle on an even width', () {
      TilePos doorOf(int width, int height) => FarmBuilding(
        id: 1,
        data: catalog.buildings.values.first.copyWith(
          width: width,
          height: height,
        ),
        origin: const TilePos(4, 6),
      ).door;
      expect(doorOf(3, 2), const TilePos(5, 8));
      expect(doorOf(2, 2), const TilePos(4, 8));
      expect(doorOf(1, 1), const TilePos(4, 7));
      final field = farm.fields.first;
      expect(field.door, doorBelow(field.rect));
      expect(
        doorBelow(TileRect(origin: const TilePos(2, 3), width: 1, height: 1)),
        const TilePos(2, 4),
        reason: 'a 1x1 field: right below it',
      );
    });

    test('open blocks are saved; older saves keep the starting land', () {
      farm.food = 1000;
      farm.apply(const FarmCommand.openBlock(block: TilePos(1, 2)));
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.openBlocks, unorderedEquals(farm.openBlocks));
      expect(loaded.blockCost, 75);

      json.remove('open_blocks');
      final older = FarmDocument.decode(json).toSimulation(catalog);
      expect(older.openBlocks, unorderedEquals(catalog.rules.farm.startBlocks));
    });
  });

  group('make a field', () {
    const rect = TileRect(origin: TilePos(8, 13), width: 3, height: 2);

    test('pays for the first tile and each tile after it', () {
      farm.food = 1000;
      expect(farm.fieldCost(rect), 20 + 5 * 5);
      expect(farm.apply(const FarmCommand.makeField(rect: rect)), isNull);
      expect(farm.food, 1000 - 45);
      final made = farm.takeEvents().whereType<FieldMade>().single;
      expect(farm.field(made.fieldId)!.rect, rect);
      expect(farm.fields, hasLength(2));

      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.field(made.fieldId)!.rect, rect);
    });

    test('refuses a bad size, a crowded spot, or too little food', () {
      farm.food = 1000;
      expect(
        farm.apply(
          const FarmCommand.makeField(
            rect: TileRect(origin: TilePos(8, 13), width: 4, height: 1),
          ),
        ),
        FarmRejection.badSize,
      );
      // Next to the starting field at (12, 9) with no gap.
      expect(
        farm.apply(
          const FarmCommand.makeField(
            rect: TileRect(origin: TilePos(11, 9), width: 1, height: 1),
          ),
        ),
        FarmRejection.blocked,
      );
      farm.food = 44;
      expect(
        farm.apply(const FarmCommand.makeField(rect: rect)),
        FarmRejection.notEnoughFood,
      );
      expect(farm.fields, hasLength(1));
      expect(farm.food, 44);
    });
  });

  group('field room (2026-10-28)', () {
    // The house looks after 6 tiles here; the starting field takes 4.
    late FarmSimulation small;
    setUp(() {
      final catalog = sampleCatalogWith(
        (files) => (rulesOf(files)['farm'] as Map)['field_tiles'] = 6,
      );
      small = FarmSimulation.newFarm(catalog, seed: 1)..food = 10000;
    });
    const one = TileRect(origin: TilePos(8, 13), width: 1, height: 1);
    const two = TileRect(origin: TilePos(8, 13), width: 2, height: 1);
    const office = TilePos(8, 8);

    FarmRejection? build() => small.apply(
      const FarmCommand.build(kind: 'field_office', origin: office),
    );

    test('fields cover no more tiles than the house looks after', () {
      expect(small.fieldTiles, 4);
      expect(small.fieldRoom, 6);
      expect(
        small.apply(
          const FarmCommand.makeField(
            rect: TileRect(origin: TilePos(8, 13), width: 3, height: 1),
          ),
        ),
        FarmRejection.noFieldRoom,
      );
      expect(small.apply(const FarmCommand.makeField(rect: two)), isNull);
      expect(small.fieldTiles, 6);
    });

    test('a field grows only into room, but may always shrink', () {
      expect(small.apply(const FarmCommand.makeField(rect: one)), isNull);
      final id = small.fields.last.id;
      const three = TileRect(origin: TilePos(8, 13), width: 3, height: 1);
      expect(
        small.apply(FarmCommand.resizeField(fieldId: id, rect: three)),
        FarmRejection.noFieldRoom,
      );
      expect(
        small.apply(FarmCommand.resizeField(fieldId: id, rect: two)),
        isNull,
      );
      expect(
        small.apply(FarmCommand.resizeField(fieldId: id, rect: one)),
        isNull,
      );
    });

    test('each field office looks after more, and stays while needed', () {
      expect(build(), isNull);
      expect(small.fieldRoom, 6 + 24);
      final officeId = small.buildings.last.id;
      expect(
        small.apply(
          const FarmCommand.makeField(
            rect: TileRect(origin: TilePos(8, 13), width: 3, height: 1),
          ),
        ),
        isNull,
      );
      expect(
        small.apply(FarmCommand.demolish(buildingId: officeId)),
        FarmRejection.fieldsNeedIt,
      );
      small.apply(FarmCommand.removeField(fieldId: small.fields.last.id));
      expect(small.apply(FarmCommand.demolish(buildingId: officeId)), isNull);
      expect(small.fieldRoom, 6);
    });
  });

  group('change a field', () {
    // The starting field is 2x2 at (12, 9).
    test('grows for the added tiles, but not past its potatoes', () {
      farm.food = 1000;
      expect(plant(const TilePos(13, 10)), isNull);
      const bigger = TileRect(origin: TilePos(12, 9), width: 3, height: 3);
      expect(farm.resizeCost(farm.field(1)!, bigger), 5 * 5);
      expect(
        farm.apply(const FarmCommand.resizeField(fieldId: 1, rect: bigger)),
        isNull,
      );
      expect(farm.field(1)!.rect, bigger);
      expect(farm.food, 1000 - 25);

      const tooSmall = TileRect(origin: TilePos(12, 9), width: 1, height: 1);
      expect(
        farm.apply(const FarmCommand.resizeField(fieldId: 1, rect: tooSmall)),
        FarmRejection.fieldNotEmpty,
      );
      const smaller = TileRect(origin: TilePos(13, 10), width: 1, height: 1);
      expect(
        farm.apply(const FarmCommand.resizeField(fieldId: 1, rect: smaller)),
        isNull,
      );
      expect(farm.food, 1000 - 25, reason: 'shrinking gives nothing back');
    });

    test('moves with its potatoes', () {
      expect(plant(const TilePos(13, 10)), isNull);
      final potato = farm.field(1)!.potatoAt(const TilePos(13, 10))!;
      expect(
        farm.apply(
          const FarmCommand.moveField(fieldId: 1, origin: TilePos(9, 12)),
        ),
        isNull,
      );
      final field = farm.field(1)!;
      expect(field.rect.origin, const TilePos(9, 12));
      expect(field.potatoAt(const TilePos(10, 13)), same(potato));
      expect(
        farm.apply(
          const FarmCommand.moveField(fieldId: 1, origin: TilePos(2, 2)),
        ),
        FarmRejection.blocked,
        reason: 'locked land',
      );
    });

    test('is removed only when empty', () {
      expect(plant(), isNull);
      expect(
        farm.apply(const FarmCommand.removeField(fieldId: 1)),
        FarmRejection.fieldNotEmpty,
      );
      final fresh = FarmSimulation.newFarm(catalog, seed: 1);
      expect(fresh.apply(const FarmCommand.removeField(fieldId: 1)), isNull);
      expect(fresh.fields, isEmpty);
    });

    test('a moved field and building are saved where they went', () {
      farm.food = 1000;
      farm
        ..apply(const FarmCommand.moveField(fieldId: 1, origin: TilePos(9, 12)))
        ..apply(
          FarmCommand.build(kind: 'graveyard', origin: const TilePos(14, 8)),
        );
      final building = farm.buildings.singleWhere((b) => b.kind == 'graveyard');
      expect(
        farm.apply(
          FarmCommand.moveBuilding(
            buildingId: building.id,
            origin: const TilePos(9, 8),
          ),
        ),
        isNull,
      );
      expect(
        farm.apply(
          FarmCommand.moveBuilding(
            buildingId: building.id,
            origin: const TilePos(9, 11),
          ),
        ),
        FarmRejection.blocked,
        reason: 'touches the field',
      );
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      expect(loaded.field(1)!.rect.origin, const TilePos(9, 12));
      expect(loaded.building(building.id)!.origin, const TilePos(9, 8));
    });

    test('a building that no longer fits where it was saved moves to the '
        'nearest place it fits (kinds grew, 2026-10-25)', () {
      final building = farm.buildings.first;
      final json = jsonDecode(
        jsonEncode(FarmDocument.of(farm).toJson()),
      ) as Map<String, dynamic>;
      // Saved on the starting field, as a grown footprint would overlap it.
      for (final saved in json['buildings'] as List) {
        if ((saved as Map)['id'] == building.id) {
          saved['origin'] = {'x': 12, 'y': 9};
        }
      }
      final loaded = FarmDocument.decode(json).toSimulation(catalog);
      final moved = loaded.building(building.id)!;
      expect(moved.origin, isNot(const TilePos(12, 9)));
      expect(loaded.canPlace(moved.rect, ignoring: moved.id), isTrue);
      for (final other in loaded.buildings) {
        expect(
          loaded.canPlace(other.rect, ignoring: other.id),
          isTrue,
          reason: other.kind,
        );
      }
    });
  });

  group('plant', () {
    test('takes a seed and reports it', () {
      expect(plant(), isNull);
      expect(farm.seeds.count(_normal), start - 1);
      expect(farm.field(1)!.potatoAt(_tile)!.grade, Grade.normal);
      expect(farm.takeEvents(), [
        // Id 1 is the starting field, 2 the cellar and 3 the start letter.
        FarmEvent.planted(fieldId: 1, tile: _tile, potatoId: 4, seed: _normal),
      ]);
      expect(farm.takeEvents(), isEmpty);
    });

    test('refuses bad requests and keeps the seed', () {
      expect(
        farm.apply(FarmCommand.plant(fieldId: 9, tile: _tile, seed: _normal)),
        FarmRejection.noSuchField,
      );
      expect(plant(const TilePos(0, 0)), FarmRejection.outsideField);
      plant();
      expect(plant(), FarmRejection.tileTaken);
      expect(
        plant(const TilePos(13, 9), plainSeed(PotatoType.buff, Grade.normal)),
        FarmRejection.typeLocked,
      );
      expect(
        plant(
          const TilePos(13, 9),
          plainSeed(PotatoType.food, Grade.legendary),
        ),
        isNull,
      );
      expect(
        plant(
          const TilePos(12, 10),
          plainSeed(PotatoType.food, Grade.legendary),
        ),
        FarmRejection.noSeed,
      );
      expect(farm.seeds.count(_normal), start - 1);
    });
  });

  group('step', () {
    test('grows, makes food, and harvests', () {
      plant();
      farm.takeEvents();
      farm.runSteps(120);
      expect(farm.takeEvents(), [
        FarmEvent.grown(fieldId: 1, tile: _tile, potatoId: 4),
      ]);
      expect(
        farm.apply(FarmCommand.harvestField(fieldId: 1)),
        FarmRejection.nothingToHarvest,
      );

      farm.runSteps(60);
      expect(farm.apply(FarmCommand.harvest(fieldId: 1, tile: _tile)), isNull);
      expect(farm.food, 202);
      expect(farm.takeEvents(), [FarmEvent.harvested(fieldId: 1, food: 2)]);
      expect(farm.elapsed, const Duration(minutes: 3));
    });

    test('without a graveyard a dead potato is gone', () {
      plant();
      farm.takeEvents();
      final seeds = farm.seeds.counts.values.fold(0, (a, b) => a + b);
      farm.runSteps(120 + 1800);
      final died = farm.takeEvents().whereType<PotatoDied>().single;
      expect(died.buried, isFalse);
      expect(died.tile, _tile);
      expect(farm.field(1)!.potatoes, isEmpty);
      expect(farm.graves, isEmpty);
      expect(farm.seeds.counts.values.fold(0, (a, b) => a + b), seeds);
    });

    test('a graveyard keeps the dead until revived as a seed', () {
      farm.food = 1000;
      farm.apply(
        FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
      );
      plant();
      final id = farm.field(1)!.potatoAt(_tile)!.id;
      farm.runSteps(120 + 1800);
      final died = farm.takeEvents().whereType<PotatoDied>().single;
      expect(died.buried, isTrue);
      expect(farm.graves.single.id, id);

      final before = start - 1;
      final grave = farm.graves.single;
      expect(farm.reviveCost(grave), 10);
      farm.food = 9;
      expect(
        farm.apply(FarmCommand.revive(potatoId: id)),
        FarmRejection.notEnoughFood,
      );
      expect(farm.graves.single.id, id);
      farm.food = 25;
      expect(farm.apply(FarmCommand.revive(potatoId: id)), isNull);
      expect(farm.food, 15);
      final revived = farm.takeEvents().whereType<PotatoRevived>().single;
      expect(revived.from, Grade.normal);
      expect(revived.seed.ability, 'food.plain');
      expect(farm.seeds.count(_normal), before + 1);
      expect(farm.graves, isEmpty);
      expect(
        farm.apply(FarmCommand.revive(potatoId: id)),
        FarmRejection.noGrave,
      );
    });

    test('a full graveyard loses its oldest grave', () {
      farm.food = 1000;
      farm.apply(
        FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
      );
      farm.seeds.add(_normal, 4);
      final tiles = farm.field(1)!.rect.tiles.toList();
      final ids = <int>[];
      for (final tile in tiles) {
        plant(tile);
        ids.add(farm.field(1)!.potatoAt(tile)!.id);
      }
      farm.takeEvents();
      farm.runSteps(120 + 1800);
      // The sample graveyard keeps 3; four died.
      expect(farm.graves.map((p) => p.id), ids.skip(1));
      expect(
        farm.takeEvents().whereType<GraveLost>().single.potatoId,
        ids.first,
      );
    });

    test('grade drops follow the farm random sequence', () {
      // Plant the four tiles with legendary-free rare seeds, let them die,
      // and expect the same drops for the same farm seed.
      List<Grade> run(int seed) {
        final farm = FarmSimulation.newFarm(catalog, seed: seed);
        final rare = plainSeed(PotatoType.food, Grade.rare);
        farm.seeds.add(rare, 3);
        farm.food = 1000;
        farm.apply(
          FarmCommand.build(kind: 'graveyard', origin: const TilePos(8, 8)),
        );
        for (final tile in farm.field(1)!.rect.tiles.take(3)) {
          farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: rare));
        }
        farm.runSteps(120 + 1800);
        return [
          for (final grave in farm.graves.toList())
            if (farm.apply(FarmCommand.revive(potatoId: grave.id)) == null)
              farm.takeEvents().whereType<PotatoRevived>().last.seed.grade,
        ];
      }

      expect(run(5), run(5));
      expect(run(5), isNotEmpty);
    });
  });
}
