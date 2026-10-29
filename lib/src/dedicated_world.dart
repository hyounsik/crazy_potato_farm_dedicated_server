import 'dart:async';
import 'dart:math';

import 'package:potato_dedicated_server/src/world_store.dart';
import 'package:potato_session/potato_session.dart';

/// The one farm a dedicated server keeps, owned by the server itself (not
/// a player) and looked after by everyone who comes in
/// (`save-and-online.md`, 2026-10-28, 사용자).
///
/// The server ships without game data, so the world starts once a guest
/// has brought it; after that it is kept on disk with the farm, and time
/// goes on even with nobody connected (사용자). A guest on a newer build
/// brings newer game data, and the farm carries over onto it.
///
/// Saved soon after the farm changes, every [saveEvery], and on [close]:
/// more often than the app saves, since there is no backup elsewhere
/// *(제안: the intervals are for balancing later)*.
final class DedicatedWorld {
  DedicatedWorld({
    required this.store,
    this.tickEvery = const Duration(seconds: 1),
    this.saveAfter = const Duration(seconds: 2),
    this.saveEvery = const Duration(minutes: 1),
    this.log,
    Random? random,
  }) : _random = random ?? Random();

  final WorldStore store;

  /// How often the farm's time is moved on.
  final Duration tickEvery;

  /// How long after a change the world is saved.
  final Duration saveAfter;

  /// How often the world is saved anyway.
  final Duration saveEvery;

  final void Function(String message)? log;
  final Random _random;

  Catalog? _catalog;
  String? _catalogHash;
  int _buildNumber = 0;
  FarmRoom? _room;
  StreamSubscription<void>? _roomSub;
  Timer? _ticker;
  Timer? _saveSoon;
  Timer? _savePeriodic;
  final Stopwatch _sinceTick = Stopwatch();
  final StreamController<void> _changes = StreamController.broadcast(
    sync: true,
  );
  bool _closed = false;

  /// The game data the world runs on, or null before any guest brought it.
  Catalog? get catalog => _catalog;
  String? get catalogHash => _catalogHash;
  int get buildNumber => _buildNumber;

  /// The shared farm with everyone's kits, once there is game data.
  FarmRoom? get room => _room;

  /// Fires whenever the farm changes (a command took, time moved it on, or
  /// it was made or carried onto new game data).
  Stream<void> get changes => _changes.stream;

  /// Picks up what was saved, if anything, and starts the farm's clock.
  Future<void> open() async {
    final saved = await store.load();
    if (saved == null) return log?.call('No saved world yet');
    final catalog = Catalog.load(saved.catalogFiles).catalog;
    if (catalog == null) return log?.call('Saved game data does not load');
    _catalog = catalog;
    _catalogHash = saved.catalogHash;
    _buildNumber = saved.buildNumber;
    _setRoom(_restore(catalog, saved.room) ?? _newRoom(catalog));
    log?.call('World loaded (game data ${saved.catalogHash})');
  }

  /// Takes the game data a guest brought: kept on disk, and the farm moves
  /// onto it when it differs from what the world has.
  Future<void> adoptCatalog({
    required Catalog catalog,
    required Map<String, dynamic> files,
    required String hash,
    required int buildNumber,
  }) async {
    if (_closed || hash == _catalogHash) return;
    await store.saveCatalog(files: files, hash: hash, buildNumber: buildNumber);
    final old = _room;
    final room = old == null
        ? _newRoom(catalog)
        : _restore(catalog, old.toJson()) ?? old;
    if (identical(room, old)) {
      log?.call('The farm does not fit game data $hash; kept as it was');
      return;
    }
    _catalog = catalog;
    _catalogHash = hash;
    _buildNumber = buildNumber;
    _setRoom(room);
    log?.call(
      old == null
          ? 'New farm on game data $hash'
          : 'Farm carried onto game data $hash',
    );
    await save();
  }

  /// Player [playerId] sends [command] to the farm.
  FarmRoomReply? apply(String playerId, FarmCommand command) =>
      _room?.apply(playerId, command);

  /// Hands player [from]'s kit to [to] ([FarmRoom.moveKit]) and saves at
  /// once. False when there is no farm or nothing moved.
  Future<bool> moveKit(String from, String to) async {
    final room = _room;
    if (room == null || !room.moveKit(from, to)) return false;
    await save();
    return true;
  }

  /// Saves the farm and the kits now.
  Future<void> save() async {
    _saveSoon?.cancel();
    _saveSoon = null;
    final room = _room;
    if (room == null) return;
    await store.saveRoom(room.toJson());
  }

  FarmRoom _newRoom(Catalog catalog) => FarmRoom(
    farm: FarmSimulation.newFarm(catalog, seed: _random.nextInt(1 << 32)),
  );

  FarmRoom? _restore(Catalog catalog, Map<String, dynamic>? json) {
    if (json == null) return null;
    try {
      return FarmRoom.fromJson(catalog, json);
    } on Object catch (e) {
      log?.call('Saved farm does not load: $e');
      return null;
    }
  }

  void _setRoom(FarmRoom room) {
    final old = _room;
    unawaited(_roomSub?.cancel());
    if (old != null && !identical(old, room)) unawaited(old.close());
    _room = room;
    _roomSub = room.changes.listen((_) => _changed());
    _ticker ??= Timer.periodic(tickEvery, (_) => _tick());
    _savePeriodic ??= Timer.periodic(saveEvery, (_) => unawaited(save()));
    _sinceTick
      ..reset()
      ..start();
    _changed();
  }

  void _tick() {
    final elapsed = _sinceTick.elapsed;
    _sinceTick
      ..reset()
      ..start();
    _room?.advance(elapsed);
  }

  void _changed() {
    if (_closed) return;
    _saveSoon ??= Timer(saveAfter, () => unawaited(save()));
    _changes.add(null);
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    _ticker?.cancel();
    _savePeriodic?.cancel();
    await save();
    await _roomSub?.cancel();
    await _room?.close();
    await _changes.close();
  }
}
