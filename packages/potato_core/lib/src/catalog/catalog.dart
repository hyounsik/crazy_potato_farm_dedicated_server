import 'package:json_annotation/json_annotation.dart';
import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/building_data.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/catalog/story_data.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/map/map_recipe.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// Read-only game data: numbers and content definitions loaded at startup.
///
/// This package does no file I/O. The client reads its assets and the server
/// reads files, then both pass the decoded JSON to [Catalog.load]. Sessions
/// take a catalog in their constructor instead of reading a global one, so
/// tests and servers can run different data side by side.
final class Catalog {
  Catalog._({
    required this.rules,
    required Map<PotatoType, PotatoTypeData> potatoTypes,
    required Map<String, BuildingData> buildings,
    required this.abilityRules,
    required Map<String, AbilityData> abilities,
    required Map<String, ItemData> items,
    required Map<String, LootTableData> lootTables,
    required Map<String, WeaponData> weapons,
    required Map<String, EnemyData> enemies,
    required Map<String, ZoneData> zones,
    required Map<String, DefaultCloneData> defaultClones,
    required this.story,
  }) : defaultClones = Map.unmodifiable(defaultClones),
       _potatoTypes = Map.unmodifiable(potatoTypes),
       buildings = Map.unmodifiable(buildings),
       abilities = Map.unmodifiable(abilities),
       items = Map.unmodifiable(items),
       lootTables = Map.unmodifiable(lootTables),
       weapons = Map.unmodifiable(weapons),
       enemies = Map.unmodifiable(enemies),
       zones = Map.unmodifiable(zones);

  /// The format version each data file must declare in its `version` field.
  ///
  /// Data ships with the app, so files are not migrated: a file with another
  /// version is an error.
  static const Map<String, int> fileVersions = {
    'rules': 5,
    'potato_types': 2,
    'buildings': 1,
    'potato_abilities': 1,
    'items': 1,
    'loot_tables': 1,
    'weapons': 1,
    'enemies': 1,
    'zones': 2,
    'default_clones': 1,
    'story': 1,
  };

  final RulesData rules;
  final Map<PotatoType, PotatoTypeData> _potatoTypes;
  final Map<String, BuildingData> buildings;
  final AbilityRulesData abilityRules;

  /// Every ability, in file order.
  final Map<String, AbilityData> abilities;

  /// The abilities of [pool] (`common`, or a type's name), in file order.
  Iterable<AbilityData> abilitiesIn(String pool) =>
      abilities.values.where((a) => a.pool == pool);
  final Map<String, ItemData> items;
  final Map<String, LootTableData> lootTables;
  final Map<String, WeaponData> weapons;
  final Map<String, EnemyData> enemies;
  final Map<String, ZoneData> zones;

  /// Clones shipped with the game, in file order.
  final Map<String, DefaultCloneData> defaultClones;

  /// The main story's events and the features they unlock.
  final StoryData story;

  PotatoTypeData potatoType(PotatoType type) => _potatoTypes[type]!;

  /// The building that unlocks [type], or null for a type that needs none.
  BuildingData? unlockBuildingOf(PotatoType type) =>
      switch (potatoType(type).unlockBuilding) {
        final id? => buildings[id],
        null => null,
      };

  /// How many of [item] fit in one bag slot.
  int stackOf(String item) => items[item]!.stack;

  /// The item id that carries [gear], if there is one.
  String? gearItemOf(Gear gear) {
    for (final item in items.values) {
      final kind = item.gear;
      if (kind != null &&
          kind.kind == gear.kind &&
          kind.grade == gear.grade &&
          (gear.kind != GearKind.weapon || kind.family == gear.family)) {
        return item.id;
      }
    }
    return null;
  }

  /// The item id of seeds of [type] at [grade], if there is one.
  String? seedItemOf(PotatoType type, Grade grade) {
    for (final item in items.values) {
      final seed = item.seed;
      if (seed != null && seed.type == type && seed.grade == grade) {
        return item.id;
      }
    }
    return null;
  }

  /// Builds a catalog from decoded data files keyed by file name without the
  /// extension (`rules`, `potato_types`, ...).
  ///
  /// Returns every problem found rather than stopping at the first one; the
  /// catalog is null unless the list is empty.
  static CatalogLoadResult load(Map<String, Object?> files) {
    final issues = <CatalogIssue>[];

    final rules = _readFile(files, 'rules', issues, (check, json) {
      final rules = check.parse('', json, RulesData.fromJson);
      if (rules != null) _checkRules(check, rules);
      return rules;
    });

    final potatoTypes = _readFile(files, 'potato_types', issues, (check, json) {
      final byType = <PotatoType, PotatoTypeData>{};
      for (final (index, entry) in check.list(json).indexed) {
        final path = '${check.file}[$index]';
        final data = check.parse(path, entry, PotatoTypeData.fromJson);
        if (data == null) continue;
        if (byType.containsKey(data.type)) {
          check.issue('$path.type', 'duplicate ${data.type.name}');
        }
        byType[data.type] = data;
        _checkPotatoType(check, path, data);
      }
      for (final type in PotatoType.values) {
        if (!byType.containsKey(type)) {
          check.issue(check.file, 'missing ${type.name}');
        }
      }
      return byType;
    });

    final buildings = _readEntries(
      files,
      'buildings',
      issues,
      BuildingData.fromJson,
      (b) => b.id,
      _checkBuilding,
    );
    final abilityFile = _readFile(files, 'potato_abilities', issues, (
      check,
      json,
    ) {
      final rules = check.parse(
        'rules',
        json['rules'],
        AbilityRulesData.fromJson,
      );
      final pools = <String, AbilityPoolData>{};
      final rawPools = json['pools'];
      if (rawPools is! List<Object?>) {
        check.issue('pools', 'must be a list');
      } else {
        for (final (index, raw) in rawPools.indexed) {
          final pool = check.parse(
            'pools[$index]',
            raw,
            AbilityPoolData.fromJson,
          );
          if (pool != null) pools[pool.id] = pool;
        }
      }
      final abilities = <String, AbilityData>{};
      final rawAbilities = json['abilities'];
      if (rawAbilities is! List<Object?>) {
        check.issue('abilities', 'must be a list');
      } else {
        for (final (index, raw) in rawAbilities.indexed) {
          final path = 'abilities[$index]';
          final ability = check.parse(path, raw, AbilityData.fromJson);
          if (ability == null) continue;
          if (abilities.containsKey(ability.id)) {
            check.issue('$path.id', 'duplicate "${ability.id}"');
          }
          abilities[ability.id] = ability;
          _checkAbility(check, path, ability, pools);
        }
      }
      if (rules == null) return null;
      _checkAbilityRules(check, rules, pools, abilities);
      return (rules: rules, abilities: abilities);
    });
    final items = _readEntries(
      files,
      'items',
      issues,
      ItemData.fromJson,
      (i) => i.id,
      _checkItem,
    );
    final lootTables = _readEntries(
      files,
      'loot_tables',
      issues,
      LootTableData.fromJson,
      (t) => t.id,
      _checkLootTable,
    );
    final weapons = _readEntries(
      files,
      'weapons',
      issues,
      WeaponData.fromJson,
      (w) => w.id,
      _checkWeapon,
    );
    final enemies = _readEntries(
      files,
      'enemies',
      issues,
      EnemyData.fromJson,
      (e) => e.id,
      _checkEnemy,
    );
    final zones = _readEntries(
      files,
      'zones',
      issues,
      ZoneData.fromJson,
      (z) => z.id,
      _checkZone,
    );
    final defaultClones = _readEntries(
      files,
      'default_clones',
      issues,
      DefaultCloneData.fromJson,
      (c) => c.id,
      _checkDefaultClone,
    );
    final story = _readFile(
      files,
      'story',
      issues,
      (check, json) => check.parse('', json, StoryData.fromJson),
    );

    if (rules == null ||
        potatoTypes == null ||
        buildings == null ||
        abilityFile == null ||
        items == null ||
        lootTables == null ||
        weapons == null ||
        enemies == null ||
        zones == null ||
        defaultClones == null ||
        story == null) {
      return CatalogLoadResult._(null, List.unmodifiable(issues));
    }
    _checkReferences(
      issues,
      rules: rules,
      abilities: abilityFile.abilities,
      potatoTypes: potatoTypes,
      buildings: buildings,
      items: items,
      lootTables: lootTables,
      weapons: weapons,
      enemies: enemies,
      zones: zones,
      defaultClones: defaultClones,
    );
    _checkStory(_FileCheck('story', issues), story, buildings, zones);
    if (issues.isNotEmpty) {
      return CatalogLoadResult._(null, List.unmodifiable(issues));
    }
    return CatalogLoadResult._(
      Catalog._(
        rules: rules,
        potatoTypes: potatoTypes,
        buildings: buildings,
        abilityRules: abilityFile.rules,
        abilities: abilityFile.abilities,
        items: items,
        lootTables: lootTables,
        weapons: weapons,
        enemies: enemies,
        zones: zones,
        defaultClones: defaultClones,
        story: story,
      ),
      const [],
    );
  }

  static void _checkRules(_FileCheck check, RulesData rules) {
    final farm = rules.farm;
    check.positive('farm.step_millis', farm.stepMillis);
    check.positive('farm.offline_cap_minutes', farm.offlineCapMinutes);
    check.positive('farm.size', farm.size);
    check.positive('farm.field_max_size', farm.fieldMaxSize);
    check.atLeast('farm.field_food', farm.fieldFood, 0);
    check.atLeast('farm.field_tile_food', farm.fieldTileFood, 0);
    final open = farm.openArea;
    if (open.width < 1 ||
        open.height < 1 ||
        open.left < 0 ||
        open.top < 0 ||
        open.right > farm.size ||
        open.bottom > farm.size) {
      check.issue('farm.open_area', 'must lie inside the farm');
    }
    check.positive('farm.block_size', farm.blockSize);
    if (farm.blockSize > 0) {
      if (farm.size % farm.blockSize != 0) {
        check.issue('farm.block_size', 'must divide the farm size');
      }
      if (open.left % farm.blockSize != 0 ||
          open.top % farm.blockSize != 0 ||
          open.width % farm.blockSize != 0 ||
          open.height % farm.blockSize != 0) {
        check.issue('farm.open_area', 'must be whole blocks');
      }
    }
    check.atLeast('farm.block_food', farm.blockFood, 0);
    check.atLeast('farm.block_step_food', farm.blockStepFood, 0);

    final potatoes = rules.potatoes;
    check.probability('potatoes.grade_drop_chance', potatoes.gradeDropChance);
    for (final grade in Grade.values) {
      final food = potatoes.reviveFood[grade];
      if (food == null) {
        check.issue('potatoes.revive_food', 'missing ${grade.name}');
      } else {
        check.atLeast('potatoes.revive_food.${grade.name}', food, 0);
      }
    }
    check.everySteps(
      'potatoes.upkeep_every_seconds',
      potatoes.upkeepEverySeconds,
      farm.stepMillis,
    );
    if (potatoes.weakPercent < 1 || potatoes.weakPercent > 100) {
      check.issue(
        'potatoes.weak_percent',
        'must be 1 to 100, found ${potatoes.weakPercent}',
      );
    }
    check.probability(
      'potatoes.breeding_grade_up_chance',
      potatoes.breedingGradeUpChance,
    );
    check.positive(
      'potatoes.guards.walk_millis_per_tile',
      potatoes.guards.walkMillisPerTile,
    );
    check.probability(
      'potatoes.harvest_rare_chance',
      potatoes.harvestRareChance,
    );
    final level = potatoes.level;
    for (final (name, value) in [
      ('food_yield_permille', level.foodYieldPermille),
      ('grade_up_chance_permille', level.gradeUpChancePermille),
      ('upkeep_permille', level.upkeepPermille),
      ('buff_power_permille', level.buffPowerPermille),
    ]) {
      check.atLeast('potatoes.level.$name', value, 0);
    }
    for (final style in CombatStyle.values) {
      final data = potatoes.combatStyles[style];
      if (data == null) {
        check.issue('potatoes.combat_styles', 'missing ${style.name}');
      } else {
        check.positive(
          'potatoes.combat_styles.${style.name}.walk_percent',
          data.walkPercent,
        );
      }
    }
    check.percent(
      'potatoes.fridge.aging_percent',
      potatoes.fridge.agingPercent,
    );

    final pests = rules.pests;
    check.everySteps(
      'pests.check_every_seconds',
      pests.checkEverySeconds,
      farm.stepMillis,
    );
    check.probability('pests.bug.chance_per_stored', pests.bug.chancePerStored);
    check.probability('pests.bug.chance_max', pests.bug.chanceMax);
    check.everySteps(
      'pests.bug.eat_every_seconds',
      pests.bug.eatEverySeconds,
      farm.stepMillis,
    );
    check.atLeast('pests.bug.eat_amount', pests.bug.eatAmount, 0);
    check.positive('pests.bug.clear_seconds', pests.bug.clearSeconds);
    check.probability('pests.blight.chance', pests.blight.chance);
    check.atLeast(
      'pests.blight.extra_aging_percent',
      pests.blight.extraAgingPercent,
      0,
    );
    check.positive('pests.blight.clear_seconds', pests.blight.clearSeconds);
    check.positive('pests.taps', pests.taps);
    check.atLeast('pests.reward.food_min', pests.reward.foodMin, 0);
    if (pests.reward.foodMax < pests.reward.foodMin) {
      check.issue('pests.reward.food_max', 'must be at least food_min');
    }
    check.probability('pests.reward.seed_chance', pests.reward.seedChance);

    final storage = rules.storage;
    for (final (name, value) in [
      ('pouch_slots', storage.pouchSlots),
      ('pouch_step', storage.pouchStep),
      ('gear_slots', storage.gearSlots),
      ('gear_step', storage.gearStep),
      ('overflow_seconds', storage.overflowSeconds),
    ]) {
      check.positive('storage.$name', value);
    }
    check.atLeast('storage.pouch_step_food', storage.pouchStepFood, 0);
    check.atLeast('storage.gear_step_food', storage.gearStepFood, 0);
    check.atLeast('storage.pouch_max', storage.pouchMax, storage.pouchSlots);
    check.atLeast('storage.gear_max', storage.gearMax, storage.gearSlots);
    for (final grade in Grade.values) {
      final food = storage.seedFood[grade];
      if (food == null) {
        check.issue('storage.seed_food', 'missing ${grade.name}');
      } else {
        check.atLeast('storage.seed_food.${grade.name}', food, 0);
      }
    }
    check.positive('mail.keep', rules.mail.keep);
    final bench = rules.workbench;
    check.atLeast('workbench.max_level', bench.maxLevel, 0);
    check.atLeast('workbench.food', bench.food, 0);
    check.atLeast('workbench.materials', bench.materials, 0);
    check.probability('workbench.chance', bench.chance);
    check.probability('workbench.min_chance', bench.minChance);
    check.atLeastNumber('workbench.damage_percent', bench.damagePercent, 0);
    final breeding = rules.breeding;
    check.positive('breeding.seed_every_seconds', breeding.seedEverySeconds);
    check.positive('breeding.store_max', breeding.storeMax);
    if (breeding.typeWeights.values.fold(0, (a, b) => a + b) <= 0) {
      check.issue('breeding.type_weights', 'must add up to more than 0');
    }
    final totems = rules.totems;
    check.atLeast('totems.start_limit', totems.startLimit, 0);
    check.atLeast('totems.max_limit', totems.maxLimit, totems.startLimit);
    check.atLeast('totems.limit_step_food', totems.limitStepFood, 0);
    check.atLeast('mail.building_seed_level', rules.mail.buildingSeedLevel, 0);

    final newFarm = rules.newFarm;
    check.atLeast('new_farm.food', newFarm.food, 0);
    for (final (index, field) in newFarm.fields.indexed) {
      final path = 'new_farm.fields[$index]';
      final tooBig =
          field.width > farm.fieldMaxSize || field.height > farm.fieldMaxSize;
      if (field.width < 1 || field.height < 1 || tooBig) {
        check.issue(
          path,
          'size must be 1 to ${farm.fieldMaxSize}, '
          'found ${field.width}x${field.height}',
        );
      }
      if (field.left < 0 ||
          field.top < 0 ||
          field.right > farm.size ||
          field.bottom > farm.size) {
        check.issue(path, 'must lie inside the ${farm.size}x${farm.size} farm');
      }
      for (final (other, earlier) in newFarm.fields.take(index).indexed) {
        if (field.overlaps(earlier)) {
          check.issue(path, 'overlaps new_farm.fields[$other]');
        }
      }
    }
    for (final (index, stack) in newFarm.seeds.indexed) {
      check.positive('new_farm.seeds[$index].count', stack.count);
      check.atLeast('new_farm.seeds[$index].level', stack.level, 0);
      if (stack.style != null && stack.type != PotatoType.combat) {
        check.issue('new_farm.seeds[$index].style', 'combat seeds only');
      }
    }

    final raid = rules.raid;
    check.positive('raid.step_millis', raid.stepMillis);
    check.positiveNumber('raid.pickup_radius', raid.pickupRadius);
    check.atLeastNumber('raid.enemy_alert_seconds', raid.enemyAlertSeconds, 0);
    final player = raid.player;
    for (final (name, value) in [
      ('speed', player.speed),
      ('radius', player.radius),
      ('max_hp', player.maxHp),
      ('sight', player.sight),
      ('dash_distance', player.dashDistance),
      ('dash_seconds', player.dashSeconds),
    ]) {
      check.positiveNumber('raid.player.$name', value);
    }
    for (final (name, value) in [
      ('regen_delay_seconds', player.regenDelaySeconds),
      ('regen_per_second', player.regenPerSecond),
      ('dash_cooldown_seconds', player.dashCooldownSeconds),
    ]) {
      check.atLeastNumber('raid.player.$name', value, 0);
    }
    final food = raid.food;
    check.atLeastNumber('raid.food.per_second', food.perSecond, 0);
    check.atLeastNumber(
      'raid.food.regen_extra_per_second',
      food.regenExtraPerSecond,
      0,
    );
    check.probability(
      'raid.food.hungry_speed_multiplier',
      food.hungrySpeedMultiplier,
    );
    check.positiveNumber(
      'raid.food.hungry_return_seconds',
      food.hungryReturnSeconds,
    );
    final companion = raid.companion;
    check.positiveNumber('raid.companion.max_hp', companion.maxHp);
    check.positiveNumber('raid.companion.radius', companion.radius);
    check.positiveNumber(
      'raid.companion.speed_multiplier',
      companion.speedMultiplier,
    );
    check.positiveNumber(
      'raid.companion.catch_up_distance',
      companion.catchUpDistance,
    );
    check.positiveNumber('raid.companion.attack_range', companion.attackRange);
    check.positiveNumber(
      'raid.companion.defense_range',
      companion.defenseRange,
    );
    check.atLeast(
      'raid.companion.level_hp_permille',
      companion.levelHpPermille,
      0,
    );
    check.atLeast(
      'raid.companion.level_attack_permille',
      companion.levelAttackPermille,
      0,
    );
    for (final style in CombatStyle.values) {
      final data = companion.styles[style];
      final at = 'raid.companion.styles.${style.name}';
      if (data == null) {
        check.issue(at, 'is missing');
        continue;
      }
      check.positiveNumber('$at.max_hp', data.maxHp);
      check.positiveNumber('$at.damage', data.damage);
      check.positiveNumber('$at.interval', data.interval);
      check.positiveNumber('$at.speed_multiplier', data.speedMultiplier);
      if (style == CombatStyle.ranged) {
        check.positiveNumber('$at.range', data.range);
        check.positiveNumber('$at.bullet_speed', data.bulletSpeed);
      }
    }
  }

  static void _checkPotatoType(
    _FileCheck check,
    String path,
    PotatoTypeData data,
  ) {
    check.positive('$path.grow_seconds', data.growSeconds);
    check.positive('$path.lifespan_seconds', data.lifespanSeconds);

    final production = data.production;
    final makesFood = data.type == PotatoType.food;
    check.atLeast('$path.upkeep', data.upkeep, 0);
    if (makesFood && data.upkeep != 0) {
      check.issue('$path.upkeep', 'food potatoes eat nothing');
    }
    if (makesFood && production == null) {
      check.issue('$path.production', 'food potatoes need production');
    } else if (!makesFood && production != null) {
      check.issue('$path.production', 'only food potatoes make food');
    }
    if (production == null) return;
    check.positive('$path.production.every_seconds', production.everySeconds);
    check.positive('$path.production.store_max', production.storeMax);
    for (final grade in Grade.values) {
      final amount = production.amount[grade];
      if (amount == null) {
        check.issue('$path.production.amount', 'missing ${grade.name}');
      } else {
        check.atLeast('$path.production.amount.${grade.name}', amount, 0);
      }
    }
  }

  static void _checkBuilding(
    _FileCheck check,
    String path,
    BuildingData building,
  ) {
    check.positive('$path.width', building.width);
    check.positive('$path.height', building.height);
    if (building.totem case final totem?) {
      if (totem.stats.isEmpty) {
        check.issue('$path.totem.stats', 'must not be empty');
      }
      check.positive('$path.totem.seconds', totem.seconds);
      check.atLeast('$path.totem.cooldown_seconds', totem.cooldownSeconds, 0);
      check.atLeast('$path.totem.food', totem.food, 0);
    }
    if (building.levels.isEmpty) {
      check.issue('$path.levels', 'must not be empty');
    }
    var capacity = 0;
    for (final (index, level) in building.levels.indexed) {
      final at = '$path.levels[$index]';
      check.atLeast('$at.cost', level.cost, 0);
      check.atLeast('$at.graves', level.graves, 0);
      if (level.capacity < capacity) {
        check.issue('$at.capacity', 'must not drop below the level before');
      }
      capacity = level.capacity;
      if (building.houses == null && level.capacity != 0) {
        check.issue('$at.capacity', 'only buildings that house potatoes');
      }
    }
  }

  static void _checkAbility(
    _FileCheck check,
    String path,
    AbilityData ability,
    Map<String, AbilityPoolData> pools,
  ) {
    if (!pools.containsKey(ability.pool)) {
      check.issue('$path.pool', 'no pool "${ability.pool}"');
    }
    final weight = ability.weight;
    if (weight != null) check.positive('$path.weight', weight);
    for (final (index, effect) in ability.effects.indexed) {
      final at = '$path.effects[$index]';
      switch (effect.kind) {
        case EffectKind.stat:
          if (effect.stat == null || effect.op == null) {
            check.issue(at, 'stat effects need stat and op');
          }
        case EffectKind.periodic:
          if (effect.action == null) {
            check.issue('$at.action', 'periodic effects need an action');
          }
          final interval = effect.intervalInUse;
          if (interval != null) check.positive('$at.interval_sec', interval);
      }
      if (ability.pool != PotatoType.buff.name &&
          effect.target == EffectTarget.party) {
        check.issue('$at.target', 'only buff abilities reach the party');
      }
    }
  }

  static void _checkAbilityRules(
    _FileCheck check,
    AbilityRulesData rules,
    Map<String, AbilityPoolData> pools,
    Map<String, AbilityData> abilities,
  ) {
    for (final grade in Grade.values) {
      final slots = rules.slotsByGrade[grade];
      if (slots == null) {
        check.issue('rules.slots_by_grade', 'missing ${grade.name}');
      } else {
        check.positive('rules.slots_by_grade.${grade.name}', slots);
      }
    }
    for (final rarity in Rarity.values) {
      final weight = rules.rarityWeights[rarity];
      if (weight == null) {
        check.issue('rules.rarity_weights', 'missing ${rarity.name}');
      } else {
        check.positive('rules.rarity_weights.${rarity.name}', weight);
      }
    }
    check.atLeast(
      'rules.extra_slot_pool_weight.common',
      rules.extraSlotPoolWeight.common,
      0,
    );
    check.atLeast(
      'rules.extra_slot_pool_weight.unique',
      rules.extraSlotPoolWeight.unique,
      0,
    );
    if (!pools.containsKey(commonPool)) {
      check.issue('pools', 'missing "$commonPool"');
    }
    for (final type in PotatoType.values) {
      // A type's own pool fills every seed's first slot.
      if (!abilities.values.any((a) => a.pool == type.name)) {
        check.issue('abilities', 'no ability in the ${type.name} pool');
      }
    }
  }

  /// The pool every type shares.
  static const String commonPool = 'common';

  static void _checkItem(_FileCheck check, String path, ItemData item) {
    check.positive('$path.stack', item.stack);
    final isSeed = item.kind == ItemKind.seed;
    if (isSeed && item.seed == null) {
      check.issue('$path.seed', 'seed items need a seed');
    } else if (!isSeed && item.seed != null) {
      check.issue('$path.seed', 'only seed items have a seed');
    }
    final isGear = item.kind == ItemKind.gear;
    if (isGear && item.gear == null) {
      check.issue('$path.gear', 'gear items need a gear kind');
    } else if (!isGear && item.gear != null) {
      check.issue('$path.gear', 'only gear items have a gear kind');
    }
    if (item.gear case final gear? when gear.kind == GearKind.weapon) {
      if (gear.family.isEmpty) check.issue('$path.gear.family', 'is empty');
    }
  }

  static void _checkLootTable(
    _FileCheck check,
    String path,
    LootTableData table,
  ) {
    check.atLeast('$path.rolls_min', table.rollsMin, 0);
    if (table.rollsMax < table.rollsMin) {
      check.issue('$path.rolls_max', 'must be at least rolls_min');
    }
    if (table.entries.isEmpty) {
      check.issue('$path.entries', 'must not be empty');
    }
    for (final (index, entry) in table.entries.indexed) {
      final at = '$path.entries[$index]';
      check.positive('$at.weight', entry.weight);
      check.positive('$at.min', entry.min);
      if (entry.max < entry.min) check.issue('$at.max', 'must be at least min');
    }
  }

  static void _checkWeapon(_FileCheck check, String path, WeaponData weapon) {
    check.positiveNumber('$path.range', weapon.range);
    check.positiveNumber('$path.interval', weapon.interval);
    check.positiveNumber('$path.damage', weapon.damage);
    check.positiveNumber('$path.bullet_speed', weapon.bulletSpeed);
    check.positive('$path.pellets', weapon.pellets);
    check.atLeastNumber('$path.spread_degrees', weapon.spreadDegrees, 0);
    check.atLeastNumber('$path.aim_seconds', weapon.aimSeconds, 0);
  }

  static void _checkEnemy(_FileCheck check, String path, EnemyData enemy) {
    check.positiveNumber('$path.max_hp', enemy.maxHp);
    check.positiveNumber('$path.radius', enemy.radius);
    check.positiveNumber('$path.damage', enemy.damage);
    check.positiveNumber('$path.attack_interval', enemy.attackInterval);
    if (enemy.attack == EnemyAttack.ranged) {
      check.positiveNumber('$path.range', enemy.range);
      check.positiveNumber('$path.bullet_speed', enemy.bulletSpeed);
    }
    if (enemy.boss case final boss?) {
      final at = '$path.boss';
      check.positiveNumber('$at.charge_every_seconds', boss.chargeEverySeconds);
      check.atLeastNumber(
        '$at.charge_telegraph_seconds',
        boss.chargeTelegraphSeconds,
        0,
      );
      check.positiveNumber('$at.charge_speed', boss.chargeSpeed);
      check.positiveNumber('$at.charge_distance', boss.chargeDistance);
      check.atLeastNumber('$at.charge_damage', boss.chargeDamage, 0);
      check.positiveNumber('$at.spray_every_seconds', boss.sprayEverySeconds);
      check.atLeast('$at.spray_bullets', boss.sprayBullets, 0);
      check.atLeastNumber('$at.spray_damage', boss.sprayDamage, 0);
      check.positiveNumber('$at.spray_speed', boss.spraySpeed);
      check.positiveNumber('$at.spray_range', boss.sprayRange);
    }
  }

  static void _checkZone(_FileCheck check, String path, ZoneData zone) {
    check.atLeast('$path.score', zone.score, 0);
    final map = zone.map;
    check.positive('$path.map.size', map.size);
    bool inside(int x, int y) =>
        x >= 0 && y >= 0 && x < map.size && y < map.size;
    if (!inside(map.entry.x, map.entry.y)) {
      check.issue('$path.map.entry', 'must lie inside the map');
    }
    for (final (index, exit) in map.exits.indexed) {
      if (!inside(exit.x, exit.y)) {
        check.issue('$path.map.exits[$index]', 'must lie inside the map');
      }
    }
    for (final (index, piece) in map.terrain.indexed) {
      final at = '$path.map.terrain[$index]';
      switch (piece) {
        case BlobPiece(:final area):
          check.positive('$at.area', area);
        case WallPiece(:final thickness, :final gap):
          check.positive('$at.thickness', thickness);
          check.atLeast('$at.gap', gap, 0);
        case RingPiece(:final radius, :final thickness, :final gap):
          check.positive('$at.radius', radius);
          check.positive('$at.thickness', thickness);
          check.positive('$at.gap', gap);
        case PlateauPiece(:final area, :final ramps):
          check.positive('$at.area', area);
          check.positive('$at.ramps', ramps);
        case ChunkPiece():
          break;
      }
    }
    check.atLeast('$path.map.exit_sites', map.exitSites, 0);
    check.atLeast('$path.map.exit_spacing', map.exitSpacing, 0);
    check.atLeast('$path.map.scatter.count', map.scatter.count, 0);
    check.probability('$path.map.scatter.big_chance', map.scatter.bigChance);

    final enemies = zone.enemies;
    check.atLeast('$path.enemies.count', enemies.count, 0);
    if (enemies.count > 0 && enemies.kinds.isEmpty) {
      check.issue('$path.enemies.kinds', 'must not be empty');
    }
    for (final (index, kind) in enemies.kinds.indexed) {
      check.positive('$path.enemies.kinds[$index].weight', kind.weight);
    }
    if (enemies.packs > 0) {
      check.positive('$path.enemies.pack_size_min', enemies.packSizeMin);
      if (enemies.packSizeMax < enemies.packSizeMin) {
        check.issue('$path.enemies.pack_size_max', 'must be at least min');
      }
      if (enemies.packKinds.isEmpty) {
        check.issue('$path.enemies.pack_kinds', 'must not be empty');
      }
    }
    check.positiveNumber(
      '$path.enemies.sight_multiplier',
      enemies.sightMultiplier,
    );
    check.positiveNumber(
      '$path.enemies.speed_multiplier',
      enemies.speedMultiplier,
    );
    check.positiveNumber('$path.enemies.hp_multiplier', enemies.hpMultiplier);
    check.positiveNumber(
      '$path.enemies.damage_multiplier',
      enemies.damageMultiplier,
    );
    if (zone.danger case final danger?) {
      final at = '$path.danger';
      check.positive('$at.open_exits', danger.openExits);
      if (map.exits.length + map.exitSites < danger.openExits) {
        check.issue('$at.open_exits', 'must not exceed the map\'s exits');
      }
      check.atLeastNumber('$at.reveal_seconds', danger.revealSeconds, 0);
      check.positiveNumber('$at.exit_radius', danger.exitRadius);
      check.positiveNumber('$at.countdown_seconds', danger.countdownSeconds);
      check.positiveNumber(
        '$at.wait_sight_multiplier',
        danger.waitSightMultiplier,
      );
      check.atLeastNumber(
        '$at.hungry_damage_per_second',
        danger.hungryDamagePerSecond,
        0,
      );
    }
    check.atLeast('$path.gathering.count', zone.gathering.count, 0);
    check.probability('$path.drops.bundle_chance', zone.drops.bundleChance);
    check.probability('$path.drops.item_chance', zone.drops.itemChance);
  }

  /// Ids one file uses must exist in another.
  /// (Ability ids are checked where seeds are made.)
  /// Event ids are unique and only follow earlier events (so there are no
  /// loops), keys name real buildings and zones, and every locked key is
  /// opened by some event.
  static void _checkStory(
    _FileCheck check,
    StoryData story,
    Map<String, BuildingData> buildings,
    Map<String, ZoneData> zones,
  ) {
    void checkKey(String path, String key) {
      if (key == StoryUnlock.pests || key == StoryUnlock.farmExpansion) return;
      if (StoryUnlock.buildingOf(key) case final id?) {
        if (!buildings.containsKey(id)) check.issue(path, 'no building "$id"');
        return;
      }
      if (StoryUnlock.zoneOf(key) case final id?) {
        if (!zones.containsKey(id)) check.issue(path, 'no zone "$id"');
        return;
      }
      check.issue(path, 'unknown unlock "$key"');
    }

    for (final (index, key) in story.locked.indexed) {
      checkKey('locked[$index]', key);
    }
    final seen = <String>{};
    final opened = <String>{};
    for (final (index, event) in story.events.indexed) {
      final path = 'events[$index]';
      if (!seen.add(event.id)) {
        check.issue('$path.id', 'duplicate "${event.id}"');
      }
      for (final (i, id) in (event.after ?? const <String>[]).indexed) {
        if (!seen.contains(id) || id == event.id) {
          check.issue('$path.after[$i]', 'no earlier event "$id"');
        }
      }
      for (final (i, key) in event.unlocks.indexed) {
        checkKey('$path.unlocks[$i]', key);
        opened.add(key);
      }
      check.atLeast('$path.food', event.food, 0);
      for (final (i, stack) in event.seeds.indexed) {
        check.positive('$path.seeds[$i].count', stack.count);
        check.atLeast('$path.seeds[$i].level', stack.level, 1);
      }
      for (final (i, goal) in event.goals.indexed) {
        final at = '$path.goals[$i]';
        check.atLeast('$at.count', goal.count, 0);
        if (goal.building case final id? when !buildings.containsKey(id)) {
          check.issue('$at.building', 'no building "$id"');
        }
        if (goal.zone case final id? when !zones.containsKey(id)) {
          check.issue('$at.zone', 'no zone "$id"');
        }
      }
    }
    for (final (index, key) in story.locked.indexed) {
      if (!opened.contains(key)) {
        check.issue('locked[$index]', 'no event unlocks "$key"');
      }
    }
  }

  static void _checkReferences(
    List<CatalogIssue> issues, {
    required RulesData rules,
    required Map<String, AbilityData> abilities,
    required Map<PotatoType, PotatoTypeData> potatoTypes,
    required Map<String, BuildingData> buildings,
    required Map<String, ItemData> items,
    required Map<String, LootTableData> lootTables,
    required Map<String, WeaponData> weapons,
    required Map<String, EnemyData> enemies,
    required Map<String, ZoneData> zones,
    required Map<String, DefaultCloneData> defaultClones,
  }) {
    void missing(String file, String path, String what, String id) =>
        issues.add(CatalogIssue(file, path, 'no $what "$id"'));

    for (final (index, start) in rules.newFarm.buildings.indexed) {
      if (!buildings.containsKey(start.kind)) {
        missing(
          'rules',
          'new_farm.buildings[$index].kind',
          'building',
          start.kind,
        );
      }
    }
    for (final (index, stack) in rules.newFarm.seeds.indexed) {
      final id = stack.ability;
      if (id == null) continue;
      final path = 'new_farm.seeds[$index].ability';
      final ability = abilities[id];
      if (ability == null) {
        missing('rules', path, 'ability', id);
      } else if (ability.pool != stack.type.name) {
        issues.add(
          CatalogIssue(
            'rules',
            path,
            '"$id" is not a ${stack.type.name} ability',
          ),
        );
      }
    }

    for (final (index, type) in PotatoType.values.indexed) {
      final id = potatoTypes[type]?.unlockBuilding;
      if (id == null) continue;
      final path = 'potato_types[$index].unlock_building';
      final building = buildings[id];
      if (building == null) {
        missing('potato_types', path, 'building', id);
      } else if (building.houses != type) {
        issues.add(
          CatalogIssue(
            'potato_types',
            path,
            '"$id" does not house ${type.name}',
          ),
        );
      }
    }
    final food = rules.raid.food.item;
    final foodItem = items[food];
    if (foodItem == null) {
      missing('rules', 'raid.food.item', 'item', food);
    } else if (foodItem.kind != ItemKind.food) {
      issues.add(
        CatalogIssue('rules', 'raid.food.item', '"$food" is not a food item'),
      );
    }
    final gear = rules.gear;
    if (!weapons.containsKey(gear.bareWeapon)) {
      missing('rules', 'gear.bare_weapon', 'weapon', gear.bareWeapon);
    }
    for (final piece in gear.start.all) {
      if (piece.kind == GearKind.weapon && !weapons.containsKey(piece.family)) {
        missing('rules', 'gear.start.weapon.family', 'weapon', piece.family);
      }
    }
    for (final item in items.values) {
      final kind = item.gear;
      if (kind == null || kind.kind != GearKind.weapon) continue;
      if (!weapons.containsKey(kind.family)) {
        missing('items', '${item.id}.gear.family', 'weapon', kind.family);
      }
    }
    for (final table in lootTables.values) {
      for (final (index, entry) in table.entries.indexed) {
        if (!items.containsKey(entry.item)) {
          missing(
            'loot_tables',
            '${table.id}.entries[$index].item',
            'item',
            entry.item,
          );
        }
      }
    }
    for (final zone in zones.values) {
      final at = zone.id;
      for (final (index, kind) in zone.enemies.kinds.indexed) {
        if (!enemies.containsKey(kind.enemy)) {
          missing(
            'zones',
            '$at.enemies.kinds[$index].enemy',
            'enemy',
            kind.enemy,
          );
        }
      }
      for (final (index, kind) in zone.enemies.packKinds.indexed) {
        if (!enemies.containsKey(kind)) {
          missing('zones', '$at.enemies.pack_kinds[$index]', 'enemy', kind);
        }
      }
      for (final (path, table) in [
        ('gathering.loot', zone.gathering.loot),
        ('drops.bundle', zone.drops.bundle),
        ('drops.item', zone.drops.item),
      ]) {
        if (!lootTables.containsKey(table)) {
          missing('zones', '$at.$path', 'loot table', table);
        }
      }
    }
    for (final zone in zones.values) {
      final boss = zone.boss;
      if (boss == null) continue;
      final enemy = enemies[boss.enemy];
      if (enemy == null) {
        missing('zones', '${zone.id}.boss.enemy', 'enemy', boss.enemy);
      } else if (enemy.boss == null) {
        issues.add(
          CatalogIssue(
            'zones',
            '${zone.id}.boss.enemy',
            '"${boss.enemy}" is not a boss',
          ),
        );
      }
      if (!lootTables.containsKey(boss.loot)) {
        missing('zones', '${zone.id}.boss.loot', 'loot table', boss.loot);
      }
    }
    for (final clone in defaultClones.values) {
      final at = clone.id;
      if (!weapons.containsKey(clone.weapon)) {
        missing('default_clones', '$at.weapon', 'weapon', clone.weapon);
      }
      for (final (i, potato) in clone.companions.indexed) {
        for (final (j, ability) in potato.abilities.indexed) {
          if (!abilities.containsKey(ability)) {
            missing(
              'default_clones',
              '$at.companions[$i].abilities[$j]',
              'ability',
              ability,
            );
          }
        }
      }
    }
  }

  static void _checkDefaultClone(
    _FileCheck check,
    String path,
    DefaultCloneData clone,
  ) {
    check.atLeast('$path.weapon_level', clone.weaponLevel, 0);
    check.positive('$path.bag_slots', clone.bagSlots);
    check.atLeast('$path.score_min', clone.scoreMin, 0);
    if (clone.scoreMax < clone.scoreMin) {
      check.issue('$path.score_max', 'must be at least score_min');
    }
    for (final (i, potato) in clone.companions.indexed) {
      final at = '$path.companions[$i]';
      if (potato.abilities.isEmpty) check.issue('$at.abilities', 'is empty');
      if (potato.type == PotatoType.breeding) {
        check.issue('$at.type', 'breeding potatoes do not come along');
      }
      if ((potato.type == PotatoType.combat) != (potato.style != null)) {
        check.issue('$at.style', 'combat potatoes only, and they need one');
      }
    }
  }

  /// Reads a list file whose entries have unique string ids.
  static Map<String, T>? _readEntries<T>(
    Map<String, Object?> files,
    String file,
    List<CatalogIssue> issues,
    T Function(Map<String, dynamic> json) fromJson,
    String Function(T entry) idOf,
    void Function(_FileCheck check, String path, T entry) checkEntry,
  ) => _readFile(files, file, issues, (check, json) {
    final byId = <String, T>{};
    for (final (index, raw) in check.list(json).indexed) {
      final path = '$file[$index]';
      final entry = check.parse(path, raw, fromJson);
      if (entry == null) continue;
      final id = idOf(entry);
      if (byId.containsKey(id)) check.issue('$path.id', 'duplicate "$id"');
      byId[id] = entry;
      checkEntry(check, path, entry);
    }
    return byId;
  });

  /// Checks the file exists and has the expected `version`, then reads it.
  static T? _readFile<T>(
    Map<String, Object?> files,
    String file,
    List<CatalogIssue> issues,
    T? Function(_FileCheck check, Map<String, dynamic> json) read,
  ) {
    final check = _FileCheck(file, issues);
    final json = files[file];
    if (json is! Map<String, dynamic>) {
      check.issue('', json == null ? 'file is missing' : 'must be an object');
      return null;
    }
    final expected = fileVersions[file];
    if (json['version'] != expected) {
      check.issue('version', 'expected $expected, found ${json['version']}');
      return null;
    }
    return read(check, json);
  }
}

/// Collects issues for one data file.
final class _FileCheck {
  _FileCheck(this.file, this._issues);

  final String file;
  final List<CatalogIssue> _issues;

  void issue(String path, String message) =>
      _issues.add(CatalogIssue(file, path, message));

  /// The entry list stored under the file's own name, e.g. `potato_types`.
  List<Object?> list(Map<String, dynamic> json) {
    final list = json[file];
    if (list is List<Object?>) return list;
    issue(file, 'must be a list');
    return const [];
  }

  T? parse<T>(
    String path,
    Object? json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    if (json is! Map<String, dynamic>) {
      issue(path, 'must be an object');
      return null;
    }
    try {
      return fromJson(json);
    } on CheckedFromJsonException catch (e) {
      final key = e.key;
      final at = key == null ? path : (path.isEmpty ? key : '$path.$key');
      issue(at, e.message ?? '${e.innerError}');
      return null;
    }
  }

  void positive(String path, int value) {
    if (value <= 0) issue(path, 'must be positive, found $value');
  }

  void atLeast(String path, int value, int min) {
    if (value < min) issue(path, 'must be at least $min, found $value');
  }

  void positiveNumber(String path, double value) {
    if (value <= 0) issue(path, 'must be positive, found $value');
  }

  void atLeastNumber(String path, double value, double min) {
    if (value < min) issue(path, 'must be at least $min, found $value');
  }

  void probability(String path, double value) {
    if (value < 0 || value > 1) issue(path, 'must be 0 to 1, found $value');
  }

  void percent(String path, int value) {
    if (value < 0 || value > 100) issue(path, 'must be 0 to 100, found $value');
  }

  /// A positive interval in seconds that a whole number of steps covers.
  void everySteps(String path, int seconds, int stepMillis) {
    if (seconds <= 0) {
      issue(path, 'must be positive, found $seconds');
    } else if (seconds * 1000 % stepMillis != 0) {
      issue(path, 'must be a multiple of the step ($stepMillis ms)');
    }
  }
}

/// The outcome of [Catalog.load].
final class CatalogLoadResult {
  CatalogLoadResult._(this.catalog, this.issues);

  /// The loaded catalog, or null when [issues] is not empty.
  final Catalog? catalog;
  final List<CatalogIssue> issues;

  bool get isValid => catalog != null;
}

/// One problem in the data files, e.g. a missing field or a duplicate entry.
final class CatalogIssue {
  const CatalogIssue(this.file, this.path, this.message);

  /// The data file name without the extension.
  final String file;

  /// Where in the file, like `potato_types[2].grow_seconds`.
  final String path;
  final String message;

  @override
  String toString() =>
      path.isEmpty ? '$file: $message' : '$file: $path: $message';
}
