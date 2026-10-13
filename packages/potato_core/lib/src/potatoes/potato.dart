import 'dart:math' as math;

import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// A planted potato: grows from a seed, works through its lifespan, then dies
/// and leaves a seed.
///
/// Mutable on purpose: the simulation changes it every step, and saving turns
/// it into a document. Growth and life count up in whole milliseconds, so the
/// same steps give the same result on every platform, and later effects (a
/// pest that slows growth or eats life) can bend them.
final class Potato {
  Potato({
    required this.id,
    required this.type,
    required this.grade,
    this.grownMillis = 0,
    this.livedMillis = 0,
    this.productionMillis = 0,
    this.stored = 0,
    this.away = false,
  });

  /// Unique within the farm, and never reused.
  final int id;
  final PotatoType type;
  final Grade grade;

  /// Growth so far; fully grown at the type's grow time.
  int grownMillis;

  /// Life used since fully grown; dies at the type's lifespan.
  int livedMillis;

  /// Working time toward the next production batch.
  int productionMillis;

  /// Baby potatoes made and waiting to be harvested.
  int stored;

  /// Out exploring. Its tile stays taken, and the farm does not advance it:
  /// the run looks after it until it comes home.
  bool away;

  /// The seed this potato grew from, and the kind it leaves when it dies
  /// (before any grade drop).
  Seed get seed => Seed(type: type, grade: grade);

  bool isGrown(PotatoTypeData data) => grownMillis >= data.growSeconds * 1000;

  /// Growth from 0 (just planted) to 1 (fully grown).
  double growthOf(PotatoTypeData data) =>
      math.min(1, grownMillis / (data.growSeconds * 1000));

  /// Life left from 1 (just grown) to 0 (about to die).
  double lifeLeftOf(PotatoTypeData data) =>
      math.max(0, 1 - livedMillis / (data.lifespanSeconds * 1000));

  /// Advances this potato by [millis] of game time.
  ///
  /// Time past the end of growth in the same step already counts as working
  /// time, so a step size never changes when a potato starts producing.
  ({bool grew, bool died}) live(int millis, PotatoTypeData data) {
    final growMillis = data.growSeconds * 1000;
    var working = millis;
    var grew = false;
    if (grownMillis < growMillis) {
      final grown = grownMillis + millis;
      working = math.max(0, grown - growMillis);
      grownMillis = math.min(grown, growMillis);
      grew = grownMillis == growMillis;
    }
    if (working == 0) return (grew: grew, died: false);

    livedMillis += working;
    final production = data.production;
    if (production != null) {
      final everyMillis = production.everySeconds * 1000;
      productionMillis += working;
      final batches = productionMillis ~/ everyMillis;
      productionMillis -= batches * everyMillis;
      final made = batches * (production.amount[grade] ?? 0);
      stored = math.min(production.storeMax, stored + made);
    }
    return (grew: grew, died: livedMillis >= data.lifespanSeconds * 1000);
  }

  /// Empties the store and returns how much was in it.
  int takeStored() {
    final taken = stored;
    stored = 0;
    return taken;
  }
}
