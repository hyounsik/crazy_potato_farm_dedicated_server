import 'package:potato_core/src/items/bag.dart';

/// Something the player asks a run to do. Stick movement is not a command:
/// it is continuous input set with `RaidSimulation.setMove`.
sealed class RaidCommand {
  const RaidCommand();
}

/// A short burst in the moving (or facing) direction, briefly unhurtable.
final class Dash extends RaidCommand {
  const Dash();
}

/// Ends the run and goes home with the bag. Always allowed in a safe zone.
final class GoHome extends RaidCommand {
  const GoHome();
}

/// Moves item [index] of pile [pile] into the bag as far as it fits.
final class TakeLoot extends RaidCommand {
  const TakeLoot(this.pile, this.index);

  final int pile;
  final int index;
}

/// Moves everything that fits from pile [pile] into the bag.
final class TakeAllLoot extends RaidCommand {
  const TakeAllLoot(this.pile);

  final int pile;
}

/// Swaps item [index] of pile [pile] with bag slot [slot]; what leaves the
/// bag stays in the pile.
final class SwapLoot extends RaidCommand {
  const SwapLoot(this.pile, this.index, this.slot);

  final int pile;
  final int index;
  final int slot;
}

enum RaidRejection {
  /// The run already ended.
  over,
  noSuchPile,

  /// The player is not standing next to the pile.
  tooFar,
  noSuchItem,
  noSuchSlot,

  /// Nothing of it fit in the bag.
  bagFull,

  /// Dashing, or the dash is not ready yet.
  dashNotReady,
}

/// What happened in a run, collected with `RaidSimulation.takeEvents`.
sealed class RaidEvent {
  const RaidEvent();
}

final class BodyHit extends RaidEvent {
  const BodyHit(this.target, this.damage);

  final int target;
  final double damage;
}

final class EnemyDefeated extends RaidEvent {
  const EnemyDefeated(this.enemy, this.kind);

  final int enemy;
  final String kind;
}

final class CompanionDown extends RaidEvent {
  const CompanionDown(this.companion);

  final int companion;
}

/// Something walked over was put in the bag.
final class ItemPicked extends RaidEvent {
  const ItemPicked(this.stack);

  final ItemStack stack;
}

/// The run is over; see `RaidSimulation.outcome`.
final class RaidEnded extends RaidEvent {
  const RaidEnded(this.outcome);

  final RaidOutcome outcome;
}

enum RaidOutcome {
  /// The player chose to go home.
  wentHome,

  /// Knocked down: carried home with what the bag holds.
  fainted,

  /// Out of food too long: walked home with the bag.
  starved,
}
