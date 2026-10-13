import 'dart:math' as math;

import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// A planted potato: grows from a seed, works through its lifespan, then dies
/// and leaves a seed.
///
/// Mutable on purpose: the simulation changes it every step, and saving turns
/// it into a document. Growth and life count up in whole milliseconds, so the
/// same steps give the same result on every platform.
final class Potato {
  Potato({
    required this.id,
    required this.type,
    required this.grade,
    required this.level,
    required this.abilities,
    this.style,
    this.grownMillis = 0,
    this.livedMillis = 0,
    this.productionMillis = 0,
    this.stored = 0,
    this.weak = false,
  });

  /// Unique within the farm, and never reused.
  final int id;
  final PotatoType type;
  final Grade grade;

  /// From its seed: the score of the region the seed came from.
  final int level;

  /// Ability ids, one per slot; the first came with the seed.
  final List<String> abilities;

  /// Combat potatoes only.
  final CombatStyle? style;

  /// Growth so far; fully grown at the type's grow time.
  int grownMillis;

  /// Life used since fully grown; dies at [lifespanMillis].
  int livedMillis;

  /// Working time toward the next production batch.
  int productionMillis;

  /// Baby potatoes made and waiting to be harvested.
  int stored;

  /// Its last upkeep went unpaid, so it works slower until the next one is
  /// paid. Food potatoes never are.
  bool weak;

  /// How long it lives once grown, after its abilities. The farm works it
  /// out when the potato joins (it never changes after).
  late final int lifespanMillis;

  /// The seed this potato leaves when it dies (before any grade change).
  Seed get seed => Seed(
    type: type,
    grade: grade,
    level: level,
    ability: abilities.first,
    style: style,
  );

  bool isGrown(PotatoTypeData data) => grownMillis >= data.growSeconds * 1000;

  bool get isDead => livedMillis >= lifespanMillis;

  /// Growth from 0 (just planted) to 1 (fully grown).
  double growthOf(PotatoTypeData data) =>
      math.min(1, grownMillis / (data.growSeconds * 1000));

  /// Life left from 1 (just grown) to 0 (about to die).
  double get lifeLeft => math.max(0, 1 - livedMillis / lifespanMillis);

  /// Advances this potato by [millis] of game time at [rates].
  ///
  /// Time past the end of growth in the same step already counts as working
  /// time, so a step size never changes when a potato starts producing.
  ({bool grew, bool died}) live(
    int millis,
    PotatoTypeData data,
    PotatoRates rates,
  ) {
    final growMillis = data.growSeconds * 1000;
    var working = millis;
    var grew = false;
    if (grownMillis < growMillis) {
      final step = (millis * rates.growth).floor();
      final grown = grownMillis + step;
      // The part of the step after growth ends, back in game time.
      working = grown <= growMillis
          ? 0
          : ((grown - growMillis) / rates.growth).floor();
      grownMillis = math.min(grown, growMillis);
      grew = grownMillis == growMillis;
    }
    if (working == 0) return (grew: grew, died: isDead);

    livedMillis += (working * rates.aging).floor();
    final production = data.production;
    if (production != null) {
      final everyMillis = production.everySeconds * 1000;
      productionMillis += (working * rates.foodYield).floor();
      final batches = productionMillis ~/ everyMillis;
      productionMillis -= batches * everyMillis;
      final made = batches * (production.amount[grade] ?? 0);
      stored = math.min(production.storeMax, stored + made);
    }
    return (grew: grew, died: isDead);
  }

  /// Empties the store and returns how much was in it.
  int takeStored() {
    final taken = stored;
    stored = 0;
    return taken;
  }
}

/// How fast a potato does things right now, from its level, its abilities
/// and the buff potatoes beside it. 1 is the base speed.
final class PotatoRates {
  const PotatoRates({this.growth = 1, this.aging = 1, this.foodYield = 1});

  static const PotatoRates base = PotatoRates();

  final double growth;
  final double aging;

  /// Production speed: more batches in the same time.
  final double foodYield;
}
