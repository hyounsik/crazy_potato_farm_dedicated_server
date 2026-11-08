import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/farm/farm_command.dart';
import 'package:potato_core/src/farm/farm_simulation.dart';
import 'package:potato_core/src/farm/player_kit.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/potatoes/seed.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';
import 'package:potato_core/src/raid/raid_member.dart';
import 'package:potato_core/src/raid/raid_simulation.dart';

/// Builds a [RaidMemberStart] from [farm] for a party member setting out with
/// [food] baby potatoes and [potatoIds] (combat ones in [modes]), wearing
/// and carrying [kit] (the farm's own player's by default).
RaidMemberStart memberStartFor(
  FarmSimulation farm, {
  String name = '',
  required int food,
  List<int> potatoIds = const [],
  Map<int, CompanionMode> modes = const {},
  PlayerKit? kit,
}) => RaidMemberStart(
  name: name,
  food: food,
  equipped: (kit ?? farm.kit).equipped,
  progress: farm.progress,
  companions: companionsFor(farm, potatoIds, modes: modes),
  bag: (kit ?? farm.kit).bagItems,
  seedLevels: farm.bestLevels,
  storedGearLevels: farm.bestStoredGearLevels,
  meals: mealsOf(farm, kit ?? farm.kit),
);

/// Starts a run from [farm]: its worn gear and progress, and the potatoes
/// [potatoIds] (combat ones in [modes]), at [score] when one was picked.
RaidSimulation startRun(
  FarmSimulation farm, {
  required String zone,
  required int seed,
  required int food,
  List<int> potatoIds = const [],
  Map<int, CompanionMode> modes = const {},
  int? score,
}) => RaidSimulation.start(
  catalog: farm.catalog,
  zone: zone,
  seed: seed,
  score: score,
  food: food,
  equipped: farm.equipped,
  progress: farm.progress,
  companions: companionsFor(farm, potatoIds, modes: modes),
  bag: farm.bagItems,
  seedLevels: farm.bestLevels,
  storedGearLevels: farm.bestStoredGearLevels,
  meals: mealsOf(farm, farm.kit),
);

/// [kit]'s dishes still lasting on [farm], to show on a run.
List<RaidMeal> mealsOf(FarmSimulation farm, PlayerKit kit) => [
  for (final m in farm.mealsLeft(kit))
    RaidMeal(dish: m.dish, seconds: m.seconds),
];

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
  /// (they recover at the farm). A lost danger run brings nothing, and the
  /// companions it lost by their rolls are gone (2026-11-05, 사용자); the
  /// rest come home. Gear in the
  /// bag goes to the box, and the farm wears what the run ended wearing
  /// (after a lost run, only the pieces not lost).
  ///
  /// With [toBag] the items stay in the bag instead, to sort at home or carry
  /// on to the next run (2026-10-28, 사용자); a lost run empties it.
  ///
  /// [asGuest] brings home a friend's party run: the haul and companions
  /// come back, but the run counts for nothing on this farm, no escape, no
  /// boss and so no region cleared (2026-11-08, 사용자: that was the host's
  /// world; to open a region a guest clears it on their own farm).
  FarmCommand homecoming(
    Catalog catalog, {
    bool toBag = false,
    bool asGuest = false,
  }) {
    final command = _homecoming(catalog, toBag: toBag);
    if (!asGuest) return command;
    return (command as ReturnHome).copyWith(
      score: null,
      zone: null,
      bossKilledIn: null,
    );
  }

  FarmCommand _homecoming(Catalog catalog, {required bool toBag}) {
    if (lost) {
      return FarmCommand.returnHome(
        food: 0,
        potatoIds: [
          for (final c in companions)
            if (!c.gone) c.potatoId,
        ],
        lostPotatoIds: [
          for (final c in companions)
            if (c.gone) c.potatoId,
        ],
        equipped: equipped,
        bag: toBag ? const [] : null,
        bossKilledIn: bossKilled ? zone : null,
      );
    }
    if (toBag) {
      return FarmCommand.returnHome(
        food: 0,
        potatoIds: [
          for (final c in companions)
            if (!c.gone) c.potatoId,
        ],
        lostPotatoIds: [
          for (final c in companions)
            if (c.gone) c.potatoId,
        ],
        score: outcome.succeeded ? score : null,
        zone: zone,
        equipped: equipped,
        bag: [for (final s in items) s.copyWithCount(s.count)],
        bossKilledIn: bossKilled ? zone : null,
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
      zone: zone,
      gear: gear,
      equipped: equipped,
      bossKilledIn: bossKilled ? zone : null,
    );
  }
}
