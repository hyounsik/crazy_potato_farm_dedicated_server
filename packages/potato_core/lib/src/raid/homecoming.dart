import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/raid/raid_simulation.dart';

/// The farm potatoes [potatoIds] as companions for a run, in that order.
/// Ids that are not on the farm are skipped.
List<CompanionStart> companionsFor(FarmSimulation farm, List<int> potatoIds) =>
    [
      for (final id in potatoIds)
        if (farm.potatoById(id)?.potato case final potato?)
          CompanionStart(
            potatoId: potato.id,
            type: potato.type,
            grade: potato.grade,
          ),
    ];

extension RaidHomecoming on RaidResult {
  /// The farm command that brings this run home: food and seeds from the
  /// bag, and every companion back to its tile, knocked down or not (they
  /// recover at the farm). Other items have nowhere to go yet and are left.
  FarmCommand homecoming(Catalog catalog) {
    var food = 0;
    final seeds = <Seed, int>{};
    for (final stack in items) {
      final item = catalog.items[stack.item];
      switch (item?.kind) {
        case ItemKind.food:
          food += stack.count;
        case ItemKind.seed:
          seeds.update(
            item!.seed!,
            (n) => n + stack.count,
            ifAbsent: () => stack.count,
          );
        case ItemKind.material || null:
          break;
      }
    }
    return FarmCommand.returnHome(
      food: food,
      seeds: [
        for (final MapEntry(key: seed, value: count) in seeds.entries)
          SeedStackData(type: seed.type, grade: seed.grade, count: count),
      ],
      potatoIds: [for (final c in companions) c.potatoId],
    );
  }
}
