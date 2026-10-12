import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';

part 'seed.freezed.dart';
part 'seed.g.dart';

/// What a seed is. Seeds with equal values stack in the pouch.
@freezed
abstract class Seed with _$Seed {
  const factory Seed({required PotatoType type, required Grade grade}) = _Seed;

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);
}

/// The seeds a farm owns, counted by kind.
final class SeedPouch {
  final Map<Seed, int> _counts = {};

  /// Counts by seed, in the order each seed was first added.
  Map<Seed, int> get counts => UnmodifiableMapView(_counts);

  int count(Seed seed) => _counts[seed] ?? 0;

  void add(Seed seed, [int count = 1]) {
    if (count < 0) throw ArgumentError.value(count, 'count');
    if (count == 0) return;
    _counts[seed] = this.count(seed) + count;
  }

  /// Removes one [seed]; false when there is none.
  bool take(Seed seed) {
    final count = this.count(seed);
    if (count == 0) return false;
    if (count == 1) {
      _counts.remove(seed);
    } else {
      _counts[seed] = count - 1;
    }
    return true;
  }
}
