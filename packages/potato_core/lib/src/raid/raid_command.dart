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

/// Sends the leaving signal from the open exit the player stands in. Danger
/// zones only.
final class Signal extends RaidCommand {
  const Signal();
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

  /// Not here: going home is for safe zones, signals for danger zones.
  wrongZone,

  /// The player is not standing in an open exit.
  notAtExit,

  /// A signal is already counting down.
  signalling,
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

/// The player first saw open exit [exit].
final class ExitFound extends RaidEvent {
  const ExitFound(this.exit);

  final int exit;
}

/// Time is up: every open exit now shows.
final class ExitsRevealed extends RaidEvent {
  const ExitsRevealed();
}

/// A signal went up from exit [exit]; the countdown started.
final class SignalSent extends RaidEvent {
  const SignalSent(this.exit);

  final int exit;
}

/// The countdown reached zero with the player outside exit [exit]; the
/// signal is gone and must be sent again.
final class SignalLost extends RaidEvent {
  const SignalLost(this.exit);

  final int exit;
}

/// The run is over; see `RaidSimulation.outcome`.
final class RaidEnded extends RaidEvent {
  const RaidEnded(this.outcome);

  final RaidOutcome outcome;
}

enum RaidOutcome {
  /// The player chose to go home.
  wentHome,

  /// Knocked down. In a safe zone the player is carried home with the bag;
  /// in a danger zone everything brought is lost.
  fainted,

  /// Out of food too long in a safe zone: walked home with the bag.
  starved,

  /// Left a danger zone through an exit, with everything carried.
  extracted;

  /// Whether the run counts as a success: it raises the farm's progress.
  bool get succeeded => this == wentHome || this == extracted;
}
