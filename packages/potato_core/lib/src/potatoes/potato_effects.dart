import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/potatoes/potato.dart';

/// Ability effects on one stat, added up: percentages (`mul` 1.1 counts as
/// +0.1) and plain additions. A value is `base × (1 + percent) + add`, so
/// several +10% effects give +20%, not +21%.
///
/// Plain `double` arithmetic is exact to the same bits on every platform,
/// so results stay the same in the app, on the web and on a server.
final class StatSum {
  double percent = 0;
  double add = 0;

  double apply(double base) => base * (1 + percent) + add;

  void addEffect(AbilityEffectData effect, double scale) {
    final value = effect.valueInUse;
    if (value == null) return;
    switch (effect.op) {
      case EffectOp.mul:
        percent += (value - 1) * scale;
      case EffectOp.add:
        add += value * scale;
      case null:
        break;
    }
  }
}

/// Farm stats by id (see [FarmStat]).
typedef StatSums = Map<String, StatSum>;

extension StatSumsRead on StatSums {
  double apply(String stat, double base) => this[stat]?.apply(base) ?? base;

  void addAll(StatSums other) {
    for (final MapEntry(key: stat, value: sum) in other.entries) {
      final mine = putIfAbsent(stat, StatSum.new);
      mine
        ..percent += sum.percent
        ..add += sum.add;
    }
  }
}

/// Works out what a potato's level and abilities do on the farm.
final class PotatoEffects {
  const PotatoEffects(this.catalog);

  final Catalog catalog;

  /// How much stronger a buff potato's abilities are at its level.
  double _power(Potato potato) => potato.type == PotatoType.buff
      ? 1 + potato.level * catalog.rules.potatoes.level.buffPowerPermille / 1000
      : 1;

  /// Farm effects of [potato]'s abilities on itself.
  StatSums own(Potato potato) {
    final sums = <String, StatSum>{};
    final power = _power(potato);
    for (final effect in _farmEffects(potato, EffectTarget.self)) {
      final stat = effect.stat;
      if (effect.kind != EffectKind.stat || stat == null) continue;
      sums.putIfAbsent(stat, StatSum.new).addEffect(effect, power);
    }
    return sums;
  }

  /// Effects that reach every potato in a field (and the field itself) from
  /// [potatoes] planted there. The same ability from several potatoes counts
  /// in full once, then half, then a quarter, and so on, in planting order.
  StatSums field(Iterable<Potato> potatoes) {
    final sums = <String, StatSum>{};
    final copies = <String, int>{};
    for (final potato in potatoes) {
      final power = _power(potato);
      for (final id in potato.abilities) {
        final ability = catalog.abilities[id];
        if (ability == null) continue;
        final effects = [
          for (final effect in ability.effects)
            if (_isFarmStat(effect, EffectTarget.field)) effect,
        ];
        if (effects.isEmpty) continue;
        final copy = copies[id] = (copies[id] ?? 0) + 1;
        final scale = power / (1 << (copy - 1));
        for (final effect in effects) {
          sums.putIfAbsent(effect.stat!, StatSum.new).addEffect(effect, scale);
        }
      }
    }
    return sums;
  }

  /// [potato]'s rates for growing, aging and making food, given what
  /// reaches it ([sums] = its own effects plus its field's).
  PotatoRates ratesOf(Potato potato, StatSums sums) {
    final level = catalog.rules.potatoes.level;
    final yieldBase = potato.type == PotatoType.food
        ? 1 + potato.level * level.foodYieldPermille / 1000
        : 1.0;
    return PotatoRates(
      growth: _positive(sums.apply(FarmStat.growthSpeed, 1)),
      aging: _positive(sums.apply(FarmStat.agingRate, 1)),
      foodYield: _positive(sums.apply(FarmStat.foodYield, yieldBase)),
    );
  }

  /// How long [potato] lives once grown.
  int lifespanMillisOf(Potato potato) {
    final base = catalog.potatoType(potato.type).lifespanSeconds * 1000;
    return _positive(own(potato).apply(FarmStat.lifespan, base.toDouble()))
        .round();
  }

  /// Baby potatoes [potato] eats per upkeep payment.
  int upkeepOf(Potato potato, StatSums sums) {
    final base = catalog.potatoType(potato.type).upkeep;
    if (base == 0) return 0;
    final levelled =
        base *
        (1 + potato.level * catalog.rules.potatoes.level.upkeepPermille / 1000);
    final cost = sums.apply(FarmStat.upkeep, levelled).round();
    return cost < 0 ? 0 : cost;
  }

  /// Chance that a seed planted beside breeding potato [breeder] comes up
  /// a grade higher.
  double gradeUpChanceOf(Potato breeder, StatSums sums) {
    final base =
        catalog.rules.potatoes.breedingGradeUpChance *
        (1 +
            breeder.level *
                catalog.rules.potatoes.level.gradeUpChancePermille /
                1000);
    return _chance(sums.apply(FarmStat.gradeUpChance, base));
  }

  /// The first farm periodic [action] in [potato]'s abilities, if any.
  AbilityEffectData? periodic(Potato potato, String action) {
    for (final effect in _farmEffects(potato, EffectTarget.self)) {
      if (effect.kind == EffectKind.periodic && effect.action == action) {
        return effect;
      }
    }
    return null;
  }

  Iterable<AbilityEffectData> _farmEffects(
    Potato potato,
    EffectTarget target,
  ) sync* {
    for (final id in potato.abilities) {
      final ability = catalog.abilities[id];
      if (ability == null) continue;
      for (final effect in ability.effects) {
        if (!effect.onFarm || effect.target != target) continue;
        if (effect.kind == EffectKind.periodic || effect.stat != null) {
          yield effect;
        }
      }
    }
  }

  static bool _isFarmStat(AbilityEffectData effect, EffectTarget target) =>
      effect.onFarm &&
      effect.target == target &&
      effect.kind == EffectKind.stat &&
      effect.stat != null;

  static double _positive(double value) => value < 0.05 ? 0.05 : value;

  static double _chance(double value) => value.clamp(0, 1).toDouble();
}
