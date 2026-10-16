import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';
import 'package:potato_core/src/raid/raid_simulation.dart';

/// Starts a run from [farm]: its worn gear and progress, and the potatoes
/// [potatoIds] (combat ones in [modes]).
RaidSimulation startRun(
  FarmSimulation farm, {
  required String zone,
  required int seed,
  required int food,
  List<int> potatoIds = const [],
  Map<int, CompanionMode> modes = const {},
}) => RaidSimulation.start(
  catalog: farm.catalog,
  zone: zone,
  seed: seed,
  food: food,
  equipped: farm.equipped,
  progress: farm.progress,
  companions: companionsFor(farm, potatoIds, modes: modes),
);

/// The farm potatoes [potatoIds] as companions for a run, in that order,
/// with their level, abilities and style. Combat potatoes take their mode
/// from [modes], defense by default. Ids that are not on the farm are
/// skipped.
List<CompanionStart> companionsFor(
  FarmSimulation farm,
  List<int> potatoIds, {
  Map<int, CompanionMode> modes = const {},
}) => [
  for (final id in potatoIds)
    if (farm.potatoById(id) case final potato?)
      CompanionStart(
        potatoId: potato.id,
        type: potato.type,
        grade: potato.grade,
        level: potato.level,
        abilities: potato.abilities,
        style: potato.style,
        mode: modes[potato.id] ?? CompanionMode.defense,
        lifeLeft: potato.lifeLeft,
      ),
];

extension RaidHomecoming on RaidResult {
  /// The farm command that brings this run home: food, seeds and materials
  /// from the bag, and every companion back to the farm, knocked down or not
  /// (they recover at the farm). A lost danger run brings nothing and the
  /// companions are gone; so are companions that fell in a danger zone
  /// (their seed came home in the bag instead, if picked up). Gear in the
  /// bag goes to the box, and the farm wears what the run ended wearing
  /// (after a lost run, only the pieces not lost).
  FarmCommand homecoming(Catalog catalog) {
    if (lost) {
      return FarmCommand.returnHome(
        food: 0,
        lostPotatoIds: [for (final c in companions) c.potatoId],
        equipped: equipped,
      );
    }
    var food = 0;
    final gear = <Gear>[];
    final seeds = <Seed, int>{};
    final materials = <String, int>{};
    for (final stack in items) {
      final item = catalog.items[stack.item];
      final seed = stack.seed;
      switch (item?.kind) {
        case ItemKind.food:
          food += stack.count;
        case ItemKind.seed when seed != null:
          seeds.update(
            seed,
            (n) => n + stack.count,
            ifAbsent: () => stack.count,
          );
        case ItemKind.material:
          materials.update(
            stack.item,
            (n) => n + stack.count,
            ifAbsent: () => stack.count,
          );
        case ItemKind.gear:
          if (stack.gear case final piece?) gear.add(piece);
        case ItemKind.seed || null:
          break;
      }
    }
    return FarmCommand.returnHome(
      food: food,
      seeds: [
        for (final MapEntry(key: seed, value: count) in seeds.entries)
          SeedCount(seed: seed, count: count),
      ],
      materials: materials,
      potatoIds: [
        for (final c in companions)
          if (!c.gone) c.potatoId,
      ],
      lostPotatoIds: [
        for (final c in companions)
          if (c.gone) c.potatoId,
      ],
      score: outcome.succeeded ? score : null,
      gear: gear,
      equipped: equipped,
    );
  }
}
