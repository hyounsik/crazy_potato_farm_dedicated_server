import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/potatoes/potato.dart';

/// A combat potato on the farm: it grows inside a training ground, then
/// walks the farm clearing pests.
///
/// Walking is counted in time, not positions: a guard sent to a field
/// arrives after the distance times the walking pace, and screens draw the
/// walk in between. That keeps catching up after the app was closed as cheap
/// as running live, with the same result.
final class Guard {
  Guard({
    required this.potato,
    required this.buildingId,
    required this.at,
    this.targetFieldId,
    this.walkMillis = 0,
  });

  final Potato potato;

  /// The training ground it grows in, and comes back to after exploring.
  int buildingId;

  /// The tile it last stood on.
  TilePos at;

  /// The field whose pest it is walking to or clearing.
  int? targetFieldId;

  /// Walking time left before it reaches [targetFieldId].
  int walkMillis;

  /// Standing next to its target field and working on the pest.
  bool get working => targetFieldId != null && walkMillis == 0;
}

/// A potato out exploring, and where it came from.
final class AwayPotato {
  AwayPotato({required this.potato, this.fieldId, this.tile, this.buildingId});

  final Potato potato;

  /// The field tile it was planted on, for potatoes that left a field.
  final int? fieldId;
  final TilePos? tile;

  /// The training ground of a guard that left.
  final int? buildingId;
}
