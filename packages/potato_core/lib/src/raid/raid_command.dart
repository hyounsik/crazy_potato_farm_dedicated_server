import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';

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

/// Sets combat companion [companion]'s mode.
final class SetCompanionMode extends RaidCommand {
  const SetCompanionMode(this.companion, this.mode);

  /// The companion's body id in the run.
  final int companion;
  final CompanionMode mode;
}

/// Wears the gear in bag slot [slot]; what was worn goes into that slot.
/// A smaller bag drops what no longer fits in a bundle at the player's
/// feet.
final class EquipFromBag extends RaidCommand {
  const EquipFromBag(this.slot);

  final int slot;
}

/// Takes off the worn piece of [kind] into the bag (bare hands then).
final class Unequip extends RaidCommand {
  const Unequip(this.kind);

  final GearKind kind;
}

/// Drops bag slot [slot] on the floor in a bundle (into a bundle within
/// reach, if there is one).
final class DropItem extends RaidCommand {
  const DropItem(this.slot);

  final int slot;
}

/// Puts bag slot [slot] into pile [pile].
final class PutInPile extends RaidCommand {
  const PutInPile(this.pile, this.slot);

  final int pile;
  final int slot;
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

  /// No standing combat companion with that id.
  noSuchCompanion,

  /// Not gear, or nothing worn there.
  noGear,

  /// Its level is past the farm's progress plus the margin.
  cannotWear,

  /// The companions would not fit that belt.
  beltTooSmall,

  /// Nothing in that bag slot.
  emptySlot,
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

/// Companion [companion] says [text] (a speech bubble).
final class CompanionSaid extends RaidEvent {
  const CompanionSaid(this.companion, this.text);

  final int companion;
  final String text;
}

/// Clone [clone] walked in. Screens say only that someone came in.
final class CloneEntered extends RaidEvent {
  const CloneEntered(this.clone);

  final int clone;
}

/// Clone [clone] signalled from exit [exit]; it leaves when the count ends.
final class CloneSignalled extends RaidEvent {
  const CloneSignalled(this.clone, this.exit);

  final int clone;
  final int exit;
}

/// Clone [clone] left with what it gathered.
final class CloneEscaped extends RaidEvent {
  const CloneEscaped(this.clone);

  final int clone;
}

/// Clone [clone] fell, dropping what it gathered.
final class CloneDown extends RaidEvent {
  const CloneDown(this.clone);

  final int clone;
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
