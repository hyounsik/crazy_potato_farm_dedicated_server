import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/common/tile.dart';
import 'package:potato_core/src/potatoes/seed.dart';

import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';

part 'farm_command.freezed.dart';
part 'farm_command.g.dart';

/// Something the player asks the farm to do. See `FarmSimulation.apply`.
@freezed
sealed class FarmCommand with _$FarmCommand {
  /// Plants one [seed] from the pouch on an empty [tile] of a field.
  const factory FarmCommand.plant({
    required int fieldId,
    required TilePos tile,
    required Seed seed,
  }) = PlantSeed;

  /// Takes the baby potatoes stored on the potato at [tile].
  const factory FarmCommand.harvest({
    required int fieldId,
    required TilePos tile,
  }) = HarvestPotato;

  /// Takes the baby potatoes stored on every potato in a field.
  const factory FarmCommand.harvestField({required int fieldId}) = HarvestField;

  /// Strengthens one piece of gear a level at the workbench, for baby
  /// potatoes and materials: the worn piece of [worn], or box piece
  /// [index]. It may not take; what was spent is gone either way.
  const factory FarmCommand.enhanceGear({GearKind? worn, int? index}) =
      EnhanceGear;

  /// Wears box piece [index], putting what was worn there in its place.
  const factory FarmCommand.equipGear({required int index}) = EquipGear;

  /// Takes off the worn piece of [kind] into the box.
  const factory FarmCommand.unequipGear({required GearKind kind}) = UnequipGear;

  /// Breaks box piece [index] into materials at the workbench.
  const factory FarmCommand.disassembleGear({required int index}) =
      DisassembleGear;

  /// Breaks the gear in bag slot [slot] into materials, as at the workbench
  /// (the sorting window, 2026-10-28, 사용자).
  const factory FarmCommand.disassembleBagGear({required int slot}) =
      DisassembleBagGear;

  /// Lights totem [buildingId] for baby potatoes.
  const factory FarmCommand.lightTotem({required int buildingId}) = LightTotem;

  /// Lets one more totem stand on the farm, for baby potatoes.
  const factory FarmCommand.raiseTotemLimit() = RaiseTotemLimit;

  /// Widens the seed pouch by one step, for baby potatoes.
  const factory FarmCommand.widenPouch() = WidenPouch;

  /// Widens the equipment box by one step, for baby potatoes.
  const factory FarmCommand.widenGearBox() = WidenGearBox;

  /// Turns one [seed] from the pouch into baby potatoes.
  const factory FarmCommand.sellSeed({required Seed seed}) = SellSeed;

  /// Moves one waiting [seed] that did not fit into the pouch, if there is
  /// room now.
  const factory FarmCommand.takeOverflow({required Seed seed}) = TakeOverflow;

  /// Turns every waiting seed that did not fit into the pouch into baby
  /// potatoes at once, as if their time were up.
  const factory FarmCommand.sellOverflow() = SellOverflow;

  /// Marks letter [mailId] read.
  const factory FarmCommand.readMail({required int mailId}) = ReadMail;

  /// Takes what letter [mailId] brings.
  const factory FarmCommand.claimMail({required int mailId}) = ClaimMail;

  /// Opens the locked [block] (in block units) next to open land, paying
  /// more the more blocks have been opened.
  const factory FarmCommand.openBlock({required TilePos block}) = OpenBlock;

  /// Makes a new empty field covering [rect], paying the 1x1 cost plus the
  /// tile cost for every tile past the first.
  const factory FarmCommand.makeField({required TileRect rect}) = MakeField;

  /// Changes field [fieldId] to cover [rect]: every potato must stay inside,
  /// and each tile added costs the tile price. Shrinking gives nothing back.
  const factory FarmCommand.resizeField({
    required int fieldId,
    required TileRect rect,
  }) = ResizeField;

  /// Moves field [fieldId], with its potatoes and pest, so its top-left tile
  /// is [origin].
  const factory FarmCommand.moveField({
    required int fieldId,
    required TilePos origin,
  }) = MoveField;

  /// Removes empty field [fieldId]. What it cost is not given back.
  const factory FarmCommand.removeField({required int fieldId}) = RemoveField;

  /// Moves building [buildingId] so its top-left tile is [origin].
  const factory FarmCommand.moveBuilding({
    required int buildingId,
    required TilePos origin,
  }) = MoveBuilding;

  /// Puts up a new building of [kind] (a `buildings.json` id) with its
  /// top-left tile at [origin], paying its level 1 cost.
  const factory FarmCommand.build({
    required String kind,
    required TilePos origin,
  }) = BuildBuilding;

  /// Raises a building one level, paying that level's cost.
  const factory FarmCommand.upgrade({required int buildingId}) =
      UpgradeBuilding;

  /// Takes a building down. Nothing is paid back. Potatoes it looks after
  /// stay; ones growing inside move to another building of the kind, or to
  /// the fridge.
  const factory FarmCommand.demolish({required int buildingId}) =
      DemolishBuilding;

  /// Puts one combat [seed] from the pouch into a training ground to grow.
  const factory FarmCommand.train({
    required int buildingId,
    required Seed seed,
  }) = TrainSeed;

  /// The player tapped a field's pest the required number of times.
  const factory FarmCommand.clearPest({required int fieldId}) = ClearPest;

  /// Takes a grown planted potato or a grown guard into the fridge.
  const factory FarmCommand.uproot({required int potatoId}) = Uproot;

  /// Plants a potato from the fridge on an empty field tile.
  const factory FarmCommand.replant({
    required int potatoId,
    required int fieldId,
    required TilePos tile,
  }) = Replant;

  /// Sends a combat potato from the fridge back to a training ground.
  const factory FarmCommand.retrain({
    required int potatoId,
    required int buildingId,
  }) = Retrain;

  /// Turns dead potato [potatoId] in a graveyard into its seed.
  const factory FarmCommand.revive({required int potatoId}) = Revive;

  /// Sets out exploring zone [zone] with [food] baby potatoes and the
  /// potatoes [potatoIds] as companions. They leave the farm until
  /// [returnHome]. A zone the story keeps closed is refused, and so is one
  /// the catalog does not have (2026-10-18: required, so a command from
  /// another player cannot skip the lock).
  const factory FarmCommand.depart({
    required String zone,
    required int food,
    @Default(<int>[]) List<int> potatoIds,
  }) = Depart;

  /// Opens every feature and stops story events. A developer tool: only
  /// development builds send it.
  const factory FarmCommand.unlockAll() = UnlockAll;

  /// Comes back from exploring: [food] and [seeds] go into the farm, and
  /// the companions [potatoIds] go back to where they were, or to the fridge
  /// when that place is gone or taken. Companions [lostPotatoIds] were lost
  /// in a failed danger run and leave the farm for good. A successful run
  /// gives its zone [score], which raises the farm's progress.
  const factory FarmCommand.returnHome({
    required int food,
    @Default(<SeedCount>[]) List<SeedCount> seeds,

    /// Materials brought back, by item id.
    @Default(<String, int>{}) Map<String, int> materials,
    @Default(<int>[]) List<int> potatoIds,
    @Default(<int>[]) List<int> lostPotatoIds,
    int? score,

    /// Gear brought back in the bag, for the box.
    @Default(<Gear>[]) List<Gear> gear,

    /// What is worn at the end of the run; null keeps what the farm has.
    Equipped? equipped,

    /// The zone the run went to, counted for story goals when [score] is
    /// set (the run succeeded).
    String? zone,

    /// What comes back in the bag, to sort at home or carry on to the next
    /// run (2026-10-28, 사용자). Null puts [food], [seeds], [materials] and
    /// [gear] straight into storage; a list takes the bag's place instead.
    List<ItemStack>? bag,
  }) = ReturnHome;

  /// Moves [count] of [item] from storage onto the truck bed: baby
  /// potatoes, a [seed] from the pouch, a material, or box piece
  /// [gearIndex]. What does not fit stays in storage.
  const factory FarmCommand.loadBed({
    required String item,
    @Default(1) int count,
    Seed? seed,
    int? gearIndex,
  }) = LoadBed;

  /// Packs [count] of [item] from storage into the bag, to take along on
  /// the next run or to a friend's farm (2026-10-28, 사용자: the farm has a
  /// bag too). What does not fit stays in storage.
  const factory FarmCommand.loadBag({
    required String item,
    @Default(1) int count,
    Seed? seed,
    int? gearIndex,
  }) = LoadBag;

  /// Moves the stack on bed slot [slot] into storage, as much as fits.
  const factory FarmCommand.unloadBed({required int slot}) = UnloadBed;

  /// Moves the stack in bag slot [slot] into storage, as much as fits.
  const factory FarmCommand.unloadBag({required int slot}) = UnloadBag;

  /// Moves what fits of the bag into storage: closing the sorting window at
  /// home (2026-10-28, 사용자). Gear past a full box and seeds past a full
  /// pouch stay in the bag.
  const factory FarmCommand.unpackBag() = UnpackBag;

  factory FarmCommand.fromJson(Map<String, dynamic> json) =>
      _$FarmCommandFromJson(json);
}

/// Why the farm refused a command. The screen turns these into messages.
enum FarmRejection {
  /// The story has not opened this yet.
  locked,
  noSuchField,
  outsideField,
  tileTaken,
  noSeed,

  /// The farm lacks the building that unlocks this potato type.
  typeLocked,

  /// The type's buildings already look after as many potatoes as they can.
  atCapacity,

  /// Combat seeds grow in training grounds, other seeds in fields.
  wrongPlace,
  noSuchBuilding,

  /// The spot is outside the open land, or too close to another building
  /// (buildings keep one free tile between them, corners included).
  blocked,

  /// A field side shorter than 1 or longer than the largest field.
  badSize,

  /// The block is already open, outside the farm, or not next to open land.
  cannotOpen,

  /// A field cannot shrink past its potatoes, nor be removed with any.
  fieldNotEmpty,

  /// The fields would cover more tiles than the house and the field
  /// offices look after (2026-10-28).
  noFieldRoom,

  /// Without this field office the fields would cover more tiles than the
  /// rest look after.
  fieldsNeedIt,

  /// The building comes with the farm and stays (the house).
  cannotRemove,

  /// The potato cellar still keeps potatoes.
  cellarNotEmpty,

  /// The farm already has one, and may have only one (the potato cellar).
  onlyOne,

  /// The pouch or box is as large as it can get.
  atMost,

  /// The pouch has no free slot.
  pouchFull,

  /// No such waiting seed, or no such letter.
  notWaiting,
  noMail,

  /// The letter's gift was already taken, or it brings nothing.
  nothingToClaim,

  /// Not enough materials.
  notEnoughMaterials,

  /// As many totems stand as the farm allows.
  totemLimit,

  /// Not a totem, or a totem already lit or still waiting.
  cannotLight,
  maxLevel,
  noPest,
  fridgeFull,

  /// Only grown potatoes go into the fridge.
  stillGrowing,

  /// The potato is not in the fridge.
  notInFridge,

  /// No dead potato with that id in the graveyards.
  noGrave,
  noPotato,
  nothingToHarvest,

  /// Taking more baby potatoes than the farm has.
  notEnoughFood,

  /// A companion that is missing, still growing, already out, in the
  /// fridge, or of a type that never leaves the farm.
  cannotGo,

  /// A run to a zone the catalog does not have.
  unknownZone,

  /// The companions do not fit the worn belt's slots.
  beltTooSmall,
  noSuchGear,

  /// The equipment box has no free slot.
  boxFull,

  /// The gear's level is past the farm's progress plus the margin.
  cannotWear,

  /// Storage does not have that much of the item.
  notStored,

  /// The truck bed has no room for it.
  bedFull,

  /// Nothing in that bed or bag slot.
  emptySlot,

  /// The bag has no room for it.
  bagFull,

  /// What is in the bag would not fit that smaller bag.
  bagTooSmall,
}
