import 'dart:convert';

import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';
import '../fixtures/seeds.dart';

/// The equipment box and what the farm wears.
void main() {
  late Catalog catalog;
  late FarmSimulation farm;

  const rareRapid = Gear(
    kind: GearKind.weapon,
    family: 'rapid',
    grade: Grade.rare,
    level: 3,
  );
  const bigBag = Gear(kind: GearKind.bag, grade: Grade.legendary, level: 3);

  setUp(() {
    catalog = sampleCatalog();
    farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 10000;
  });

  void bring(List<Gear> gear, {Map<String, int> materials = const {}}) => farm
      .apply(FarmCommand.returnHome(food: 0, gear: gear, materials: materials));

  test('a new farm wears the starting gear and has an empty box', () {
    expect(farm.equipped, catalog.rules.gear.start);
    expect(farm.gear, isEmpty);
  });

  test('wearing from the box swaps with what was worn', () {
    bring([rareRapid]);
    final old = farm.equipped.weapon;
    expect(farm.apply(const FarmCommand.equipGear(index: 0)), isNull);
    expect(farm.equipped.weapon, rareRapid);
    expect(farm.gear, [old]);
  });

  test('gear past progress plus the margin cannot be worn', () {
    final margin = catalog.rules.gear.useMargin;
    bring([rareRapid.copyWith(level: margin + 1)]);
    expect(
      farm.apply(const FarmCommand.equipGear(index: 0)),
      FarmRejection.cannotWear,
    );
    farm.progress = 1;
    expect(farm.apply(const FarmCommand.equipGear(index: 0)), isNull);
  });

  test('taking off needs room in the box, and leaves bare hands', () {
    expect(
      farm.apply(const FarmCommand.unequipGear(kind: GearKind.bag)),
      isNull,
    );
    expect(farm.equipped.bag, isNull);
    expect(farm.gear.single.kind, GearKind.bag);
    bring(List.filled(farm.gearSlots, bigBag));
    expect(
      farm.apply(const FarmCommand.unequipGear(kind: GearKind.weapon)),
      FarmRejection.boxFull,
    );
    expect(
      farm.apply(const FarmCommand.unequipGear(kind: GearKind.bag)),
      FarmRejection.noSuchGear,
    );
  });

  test(
    'breaking down gives materials by grade and back some workbench cost',
    () {
      bring([rareRapid.copyWith(enhance: 2)]);
      final bench = catalog.rules.workbench;
      final spent = bench.nextFrom(0).materials + bench.nextFrom(1).materials;
      final expected =
          catalog.rules.gear.disassemble[Grade.rare]! +
          spent * catalog.rules.gear.enhanceRefundPercent ~/ 100;
      expect(farm.apply(const FarmCommand.disassembleGear(index: 0)), isNull);
      expect(farm.gear, isEmpty);
      expect(farm.materials[bench.material], expected);
    },
  );

  test('the workbench raises a piece in the box too', () {
    bring([bigBag], materials: {'material': 100});
    expect(farm.apply(const FarmCommand.enhanceGear(index: 0)), isNull);
    expect(farm.gear.single.enhance, 1);
  });

  test('companions must fit the worn belt', () {
    final seed = plainSeed(PotatoType.food, Grade.normal);
    farm.seeds.add(seed, 2);
    for (final tile in const [TilePos(12, 9), TilePos(13, 9)]) {
      farm.apply(FarmCommand.plant(fieldId: 1, tile: tile, seed: seed));
    }
    farm.runSteps(catalog.potatoType(PotatoType.food).growSeconds);
    final ids = [for (final p in farm.field(1)!.potatoes.values) p.id];
    // The starting belt takes one food and one combat potato.
    expect(
      farm.apply(FarmCommand.depart(food: 0, potatoIds: ids)),
      FarmRejection.beltTooSmall,
    );
    expect(
      farm.apply(FarmCommand.depart(food: 0, potatoIds: [ids.first])),
      isNull,
    );
  });

  test('coming home puts gear in the box and wears what the run wore', () {
    farm.apply(
      FarmCommand.returnHome(
        food: 0,
        gear: const [bigBag],
        equipped: const Equipped(weapon: rareRapid),
      ),
    );
    expect(farm.gear, [bigBag]);
    expect(farm.equipped, const Equipped(weapon: rareRapid));

    final json = jsonDecode(
      jsonEncode(FarmDocument.of(farm).toJson()),
    ) as Map<String, dynamic>;
    final saved = FarmDocument.decode(json).toSimulation(catalog);
    expect(saved.gear, farm.gear);
    expect(saved.equipped, farm.equipped);
  });
}
