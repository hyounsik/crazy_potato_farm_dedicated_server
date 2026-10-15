import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/raid/raid_simulation.dart';

/// The farm potatoes [potatoIds] as companions for a run, in that order.
/// Ids that are not on the farm are skipped.
List<CompanionStart> companionsFor(FarmSimulation farm, List<int> potatoIds) =>
    [
      for (final id in potatoIds)
        if (farm.potatoById(id) case final potato?)
          CompanionStart(
            potatoId: potato.id,
            type: potato.type,
            grade: potato.grade,
          ),
    ];

extension RaidHomecoming on RaidResult {
  /// The farm command that brings this run home: food, seeds and materials
  /// from the bag, and every companion back to the farm, knocked down or not
  /// (they recover at the farm). A lost danger run brings nothing and the
  /// companions are gone.
  FarmCommand homecoming(Catalog catalog) {
    if (lost) {
      return FarmCommand.returnHome(
        food: 0,
        lostPotatoIds: [for (final c in companions) c.potatoId],
      );
    }
    var food = 0;
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
      potatoIds: [for (final c in companions) c.potatoId],
      score: outcome.succeeded ? score : null,
    );
  }
}
