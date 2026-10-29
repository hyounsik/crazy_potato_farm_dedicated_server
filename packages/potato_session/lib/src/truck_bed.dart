import 'package:potato_core/potato_core.dart';
import 'package:potato_session/src/session_message.dart';

/// One player's truck bed in the host's room, and who may move what
/// (`multiplayer.md`, 2026-10-28, 사용자): an open bed takes and gives to
/// anyone there, a locked one only to its owner (not even the farm's
/// owner). A bed is locked when its owner comes in.
///
/// The host judges every move in the order they come, so two players
/// reaching for the same stack cannot both get it.
final class TruckBed {
  TruckBed(Catalog catalog, List<ItemStack?> slots)
    : this.over(
        catalog,
        _filled(
          Bag.restore([
            for (final s in slots) s?.copyWithCount(s.count),
            for (var i = slots.length; i < catalog.rules.storage.bedSlots; i++)
              null,
          ], catalog.stackOf),
        ),
      );

  /// A bed that is the owner's own truck bed, found again each time
  /// (a dedicated server's kit, 2026-10-29, 사용자): what moves here moves
  /// there, with no copy to fall out of step.
  TruckBed.over(Catalog catalog, Bag Function() bed)
    : _bed = bed,
      _catalog = catalog;

  static Bag Function() _filled(Bag bag) =>
      () => bag;

  final Catalog _catalog;
  final Bag Function() _bed;
  Bag get _bag => _bed();

  /// Whether anyone may put in and take out, not only the owner.
  bool open = false;

  /// The bed as everyone sees it.
  TruckBedView get view => (slots: slots, open: open);

  /// Copies of the slots, to keep in the owner's save.
  List<ItemStack?> get slots => [
    for (final s in _bag.slots) s?.copyWithCount(s.count),
  ];

  /// Puts [stack] on the bed for its owner ([byOwner]) or someone else.
  /// Lowers `stack.count` by what went on; why not all of it did, or null.
  BedRefusal? put(ItemStack stack, {required bool byOwner}) {
    if (!byOwner && !open) return BedRefusal.locked;
    if (_catalog.items[stack.item] == null) return BedRefusal.full;
    _bag.addFrom(stack);
    return stack.count > 0 ? BedRefusal.full : null;
  }

  /// Takes the stack of [item] in slot [slot], or only [count] of it, for
  /// its owner ([byOwner]) or someone else.
  ({ItemStack? stack, BedRefusal? refusal}) take(
    int slot,
    String item, {
    required bool byOwner,
    int? count,
  }) {
    if (!byOwner && !open) return (stack: null, refusal: BedRefusal.locked);
    if (slot < 0 || slot >= _bag.capacity) {
      return (stack: null, refusal: BedRefusal.gone);
    }
    final there = _bag.slots[slot];
    if (there == null || there.item != item) {
      return (stack: null, refusal: BedRefusal.gone);
    }
    if (count != null && count < there.count) {
      if (count <= 0) return (stack: null, refusal: BedRefusal.gone);
      there.count -= count;
      return (stack: there.copyWithCount(count), refusal: null);
    }
    return (stack: _bag.replace(slot, null), refusal: null);
  }
}
