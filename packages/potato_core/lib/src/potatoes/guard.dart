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
    this.harvesting = false,
    this.walkTo,
    this.walkMillis = 0,
    this.walkTotalMillis = 0,
  });

  final Potato potato;

  /// The training ground it grows in, and comes back to after exploring.
  int buildingId;

  /// The tile it last stood on.
  TilePos at;

  /// The field it is walking to or working at: its pest, or its baby
  /// potatoes when [harvesting].
  int? targetFieldId;

  /// Walking to [targetFieldId] to bring in its baby potatoes, not for a
  /// pest.
  bool harvesting;

  /// The tile it is walking to from [at]: beside its target field, or a
  /// patrol stop on open ground when it has no target.
  TilePos? walkTo;

  /// Walking time left before it reaches [walkTo].
  int walkMillis;

  /// The whole walk's time, for drawing how far along it is.
  int walkTotalMillis;

  /// Standing next to its target field and working on the pest.
  bool get working => targetFieldId != null && !harvesting && walkMillis == 0;

  /// Where it is along its walk, in tile units (tile centres at +0.5).
  ({double x, double y}) get position {
    final to = walkTo;
    if (to == null || walkMillis == 0 || walkTotalMillis == 0) {
      final stand = to != null && walkMillis == 0 ? to : at;
      return (x: stand.x + 0.5, y: stand.y + 0.5);
    }
    final done = 1 - walkMillis / walkTotalMillis;
    return (
      x: at.x + (to.x - at.x) * done + 0.5,
      y: at.y + (to.y - at.y) * done + 0.5,
    );
  }

  /// Sends it walking to [to] over [millis]; arriving at once when 0.
  void walk(TilePos to, int millis) {
    walkTo = to;
    walkMillis = millis;
    walkTotalMillis = millis;
    if (millis == 0) {
      at = to;
      walkTo = null;
    }
  }

  /// Stops where it is along its walk, on the nearest tile.
  void stop() {
    final here = position;
    at = TilePos(here.x.floor(), here.y.floor());
    walkTo = null;
    walkMillis = 0;
    walkTotalMillis = 0;
    targetFieldId = null;
    harvesting = false;
  }
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
