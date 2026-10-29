import 'dart:async';

import 'package:potato_core/potato_core.dart';
import 'package:potato_session/src/session_message.dart';
import 'package:potato_session/src/transport.dart';
import 'package:potato_session/src/truck_bed.dart';

/// A player's truck bed and bag where a dedicated server keeps them.
typedef KitBags = ({Bag bed, Bag bag});

/// A guest who passed the version check and is in the host's party.
final class HostedGuest {
  HostedGuest({
    required this.peerId,
    required this.start,
    this.playerId = '',
    this.accountId = '',
    this.memberIndex,
    this.connected = true,
    this.bed,
  });

  /// The guest's link now; a guest who comes back mid-run gets a new one.
  String peerId;

  /// What the guest brings; replaced when they get ready again
  /// ([ReadyMessage.start]).
  RaidMemberStart start;

  /// The guest's installation id from [HelloMessage.playerId].
  final String playerId;

  /// The guest's account id from [HelloMessage.accountId] (empty without).
  final String accountId;

  /// Index in `RaidSimulation.members` once the run starts: 1..3 when the
  /// host plays, 0..3 on a dedicated server.
  int? memberIndex;
  bool connected;

  /// Ready to set out for the zone the host picked (2026-10-22, 사용자).
  /// Everyone in the room goes together, so the host waits for all.
  bool ready = false;

  /// Where they walk on the host's farm, the latest heard (null: not yet).
  FarmWalk? walk;

  /// Their truck bed while they are in the room: brought from their farm,
  /// or their kit's on a dedicated server with a farm (null without one).
  final TruckBed? bed;

  /// Their kit's bed on a dedicated server, made the first time the kit is
  /// there (the farm may still be on its way when they come in).
  TruckBed? _kitBed;
  int _lastMoveSeq = -1;
  int _lastWalkSeq = -1;
  bool _resultSent = false;

  String get name => start.name;
}

/// Runs a party exploration session on the host device (or dedicated server).
///
/// Before [startRun], accepts up to [maxGuests] guests whose build number and
/// catalog hash match the host's. Once [startRun] is called, drives the
/// authoritative [RaidSimulation], applies guest inputs, broadcasts events and
/// results on the reliable channel, and sends snapshots on the unreliable
/// channel every [snapshotEvery] (`realtime-session.md`).
///
/// With [hostPlays] false (a dedicated server) nobody plays on the host:
/// guests are members 0..N, each guest gets [LobbyMessage] when the waiting
/// room changes, and any guest may ask to set out with [StartRunMessage],
/// which arrives on [startRequests] (2026-10-29, 사용자: no leader).
///
/// A run may take only some of the guests ([startRun]'s `goers`); the rest
/// stay on the farm, and a dedicated server takes newcomers there while
/// the run goes on. Run messages go to those out on it, farm messages
/// (the farm, walks, the lobby, the party) to those on the farm.
final class HostSession {
  HostSession({
    required this.catalog,
    required this.transport,
    this.buildNumber = 0,
    this.codec = const JsonSessionCodec(),
    this.snapshotEvery = const Duration(milliseconds: 100),
    this.hostPlays = true,
    this.hostName = '',
    this.hostAccountId = '',
    int? maxGuests,
    this.kitOf,
  }) : catalogHash = computeCatalogHash(catalog),
       maxGuests = maxGuests ?? (hostPlays ? 3 : 4) {
    _packetSub = transport.packets.listen(_onPacket);
    _disconnectSub = transport.peerDisconnected.listen(_onPeerDisconnected);
  }

  final Catalog catalog;
  final String catalogHash;
  final HostTransport transport;
  final int buildNumber;
  final SessionCodec codec;
  final Duration snapshotEvery;
  final bool hostPlays;

  /// The host player's name, first in [LobbyMessage] when [hostPlays].
  final String hostName;

  /// The host's account id, first in [SessionLobby.accounts] when
  /// [hostPlays] (2026-10-23).
  final String hostAccountId;

  /// On a dedicated server with a farm, the truck bed and bag a player
  /// keeps there (their kit, by installation id, 2026-10-29, 사용자). Beds
  /// trade from and into these, never trusting what an app says it has.
  final KitBags? Function(String player)? kitOf;

  /// The zone the host picked to set out for, or null while friends only
  /// gather at the farm ([openParty]).
  String? get partyZone => _partyZone;
  String? _partyZone;

  /// When everyone sets out anyway, ready or not (2026-10-22, 사용자: 30 s);
  /// null without a countdown. The owner sets out when it passes.
  DateTime? get departsAt => _departsAt;
  DateTime? _departsAt;
  bool _overSent = false;
  final int maxGuests;

  late final StreamSubscription<SessionPacket> _packetSub;
  late final StreamSubscription<String> _disconnectSub;

  final Map<String, HostedGuest> _guests = {};
  final List<HostedGuest> _guestOrder = [];
  final _guestsChanged = StreamController<List<HostedGuest>>.broadcast();
  // Sync, so a [ReadyMessage] right after the request finds the party open.
  final _startRequests = StreamController<String>.broadcast(sync: true);
  final _memberResults =
      StreamController<({HostedGuest guest, RaidResult result})>.broadcast(
        sync: true,
      );
  final List<RaidEvent> _hostEvents = [];
  final List<QuickChatLine> _chats = [];
  Map<String, dynamic>? _sharedFarm;
  int _walkSeq = 0;
  TruckBed? _hostBed;
  final _bedsChanged = StreamController<void>.broadcast();

  /// Quick messages kept for the host's screen until [takeChats]; a dedicated
  /// server never takes them, so only the latest few are kept.
  static const int _keptChats = 10;

  RaidSimulation? _run;
  FixedStepClock? _clock;
  Duration _sinceSnapshot = Duration.zero;
  bool _closed = false;

  /// Guests currently in the room (at the farm or in the run).
  List<HostedGuest> get guests => List.unmodifiable(_guestOrder);

  /// Whether [guest] is out on the run now, not on the farm.
  bool isOut(HostedGuest guest) => _run != null && guest.memberIndex != null;

  /// Whether every guest is ready to set out (2026-10-22, 사용자).
  bool get allReady => _guestOrder.every((g) => g.ready);

  /// Fires whenever the guest list or a guest's connection changes.
  Stream<List<HostedGuest>> get guestsChanged => _guestsChanged.stream;

  /// Zones a guest asked to set out to while no party is open and no run
  /// is going (only when not [hostPlays]). The zone is known to [catalog];
  /// the owner opens the party ([openParty]) and later calls [startRun].
  Stream<String> get startRequests => _startRequests.stream;

  /// Each guest's run result as it is sent to them, for whoever keeps the
  /// guest's things (a dedicated server's shared farm, 2026-10-28).
  Stream<({HostedGuest guest, RaidResult result})> get memberResults =>
      _memberResults.stream;

  /// The authoritative run once [startRun] has been called.
  RaidSimulation? get run => _run;

  /// Starts the party run with [hostStart] as member 0 and every guest in
  /// the room as members 1..N (nobody stays behind, 2026-10-22, 사용자), and
  /// sends [RunStartedMessage] to each guest.
  /// Without [hostPlays], [hostStart] is left out and guests are 0..N-1.
  /// With [goers], only those guests set out, in room order; the others
  /// stay on the farm (a dedicated server, 2026-10-29, 사용자).
  /// Each guest sets out with what they sent, or with what [startOf] gives
  /// for them (a dedicated server builds it from the guest's kit on its
  /// shared farm instead of trusting the app, 2026-10-28).
  RaidSimulation startRun({
    required String zone,
    required int seed,
    RaidMemberStart? hostStart,
    Map<String, MapChunk> chunks = const {},
    RaidMemberStart Function(HostedGuest guest)? startOf,
    Iterable<HostedGuest>? goers,
  }) {
    if (_run != null) throw StateError('Run already started');
    if (hostPlays != (hostStart != null)) {
      throw ArgumentError.value(hostStart, 'hostStart');
    }
    _guestOrder
      ..clear()
      ..addAll(_guests.values);
    final going = goers == null
        ? _guestOrder
        : [
            for (final g in _guestOrder)
              if (goers.contains(g)) g,
          ];
    // The farm's greetings stay on the farm.
    _chats.clear();
    final starts = <RaidMemberStart>[
      ?hostStart,
      for (final g in going) startOf?.call(g) ?? g.start,
    ];
    final sim = RaidSimulation.party(
      catalog: catalog,
      zone: zone,
      seed: seed,
      chunks: chunks,
      members: starts,
    );
    _run = sim;
    _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
    _sinceSnapshot = Duration.zero;
    _departsAt = null;
    _overSent = false;

    final initialJson = sim.toJson();
    for (var i = 0; i < going.length; i++) {
      final guest = going[i];
      final memberIndex = hostPlays ? i + 1 : i;
      guest.memberIndex = memberIndex;
      _send(
        guest.peerId,
        SessionChannel.reliable,
        RunStartedMessage(memberIndex: memberIndex, runJson: initialJson),
      );
    }
    // Those staying behind are on the farm with the party called off.
    if (going.length < _guestOrder.length) {
      _partyZone = null;
      for (final g in _guestOrder) {
        g.ready = false;
      }
      _toFarm(SessionChannel.reliable, const PartyStateMessage(null));
      _notifyGuests();
    }
    return sim;
  }

  /// Attaches an already-created (or restored) party [sim] and notifies
  /// connected guests.
  void attachRun(RaidSimulation sim) {
    _run = sim;
    _clock = FixedStepClock(Duration(milliseconds: sim.rules.stepMillis));
    _sinceSnapshot = Duration.zero;
  }

  /// The guests in the run, to save with it so a host whose app went down
  /// can take the party back ([resumeRun]).
  List<Map<String, dynamic>> get partyRoster => [
    for (final g in _guestOrder)
      if (g.memberIndex != null)
        {
          'member_index': g.memberIndex,
          'player_id': g.playerId,
          'account_id': g.accountId,
          'start': g.start.toJson(),
        },
  ];

  /// Takes back a run saved with [partyRoster] after the host's app went
  /// down (2026-10-23): every guest is away, standing still, until they
  /// connect again from the same installation and get the run as it is now.
  /// A guest without an installation id cannot be told apart and stays away.
  void resumeRun(RaidSimulation sim, List<Map<String, dynamic>> roster) {
    if (_run != null) throw StateError('Run already started');
    _guests.clear();
    _guestOrder.clear();
    _chats.clear();
    for (final entry in roster) {
      final index = (entry['member_index'] as num).toInt();
      final playerId = entry['player_id'] as String? ?? '';
      final guest = HostedGuest(
        peerId: 'away:$index',
        start: RaidMemberStart.fromJson(entry['start'] as Map<String, dynamic>),
        playerId: playerId,
        accountId: entry['account_id'] as String? ?? '',
        memberIndex: index,
        connected: false,
      );
      _guests[guest.peerId] = guest;
      _guestOrder.add(guest);
      if (index < sim.members.length) {
        sim.setMoveOf(sim.members[index], Vec2.zero);
      }
    }
    attachRun(sim);
    _departsAt = null;
    _overSent = false;
    _notifyGuests();
  }

  /// Advances the run by [elapsed] in fixed steps and sends snapshots every
  /// [snapshotEvery]. Returns the number of simulation steps taken.
  int advance(
    Duration elapsed, {
    Duration maxElapsed = const Duration(milliseconds: 250),
  }) {
    final sim = _run;
    final clock = _clock;
    if (sim == null || clock == null || _closed) return 0;
    final steps = clock.advance(elapsed, maxElapsed: maxElapsed);
    for (var i = 0; i < steps && !sim.isOver; i++) {
      stepOnce();
    }
    if (sim.isOver) _flushEventsAndResults(sim);
    _sinceSnapshot += elapsed;
    if (_sinceSnapshot >= snapshotEvery) {
      _sinceSnapshot = Duration.zero;
      broadcastSnapshot();
    }
    return steps;
  }

  /// Runs a single simulation step and dispatches any resulting events and
  /// member results to guests on the reliable channel.
  void stepOnce() {
    final sim = _run;
    if (sim == null) return;
    // Over already (the host's own last move ended it): only tell everyone.
    if (!sim.isOver) sim.step();
    _flushEventsAndResults(sim);
  }

  void _flushEventsAndResults(RaidSimulation sim) {
    _flushResults(sim);
    if (sim.isOver && !_overSent) {
      _overSent = true;
      _toRun(SessionChannel.reliable, const RunOverMessage());
    }
  }

  void _flushResults(RaidSimulation sim) {
    final events = sim.takeEvents();
    if (events.isNotEmpty) {
      _hostEvents.addAll(events);
      _toRun(
        SessionChannel.reliable,
        EventsMessage(tick: sim.tick, events: events),
      );
    }
    for (final guest in _guestOrder) {
      if (guest._resultSent) continue;
      final index = guest.memberIndex;
      if (index == null || index >= sim.members.length) continue;
      final member = sim.members[index];
      final result = sim.resultOf(member);
      if (result == null) continue;
      guest._resultSent = true;
      _send(
        guest.peerId,
        SessionChannel.reliable,
        MemberResultMessage(memberIndex: index, result: result),
      );
      if (!_memberResults.isClosed) {
        _memberResults.add((guest: guest, result: result));
      }
    }
  }

  /// Sends a state snapshot to every connected guest on the unreliable
  /// channel now.
  void broadcastSnapshot() {
    final sim = _run;
    if (sim == null || _closed) return;
    _toRun(
      SessionChannel.unreliable,
      SnapshotMessage(RaidSnapshot.fromRun(sim)),
    );
  }

  /// Collects events for the host's own screen since the last call.
  List<RaidEvent> takeHostEvents() {
    final out = List<RaidEvent>.of(_hostEvents);
    _hostEvents.clear();
    return out;
  }

  /// Collects quick messages for the host's screen since the last call,
  /// the host's own included.
  List<QuickChatLine> takeChats() {
    final out = List<QuickChatLine>.of(_chats);
    _chats.clear();
    return out;
  }

  /// Picks [zone] to set out for: everyone at the farm gets ready for it
  /// ([ReadyMessage]); readiness starts over. With a [countdown], everyone
  /// sets out when it ends, ready or not ([departsAt]).
  void openParty(String zone, {Duration countdown = Duration.zero}) {
    if (_run != null || _closed) return;
    _partyZone = zone;
    _departsAt = countdown > Duration.zero
        ? DateTime.now().add(countdown)
        : null;
    _setAllReady(false);
    _broadcast(SessionChannel.reliable, _partyState());
    _notifyGuests();
  }

  PartyStateMessage _partyState() {
    final at = _departsAt;
    final left = at == null ? Duration.zero : at.difference(DateTime.now());
    return PartyStateMessage(
      _partyZone,
      left: left.isNegative ? Duration.zero : left,
    );
  }

  /// Back at the farm after everyone's run ended, the room still open
  /// (2026-10-22, 사용자): guests gather again for the next run. Those
  /// whose link dropped in the run leave the room.
  void returnToFarm() {
    if (_run == null || _closed) return;
    // Only those out on it come back; the others never left the farm.
    _toRun(SessionChannel.reliable, const BackToFarmMessage());
    _run = null;
    _clock = null;
    _partyZone = null;
    _departsAt = null;
    _overSent = false;
    _hostEvents.clear();
    _chats.clear();
    for (final g in _guestOrder.where((g) => !g.connected).toList()) {
      _guests.remove(g.peerId);
      _guestOrder.remove(g);
    }
    for (final g in _guestOrder) {
      g
        ..memberIndex = null
        ..ready = false
        ..walk = null
        .._resultSent = false
        .._lastMoveSeq = -1
        .._lastWalkSeq = -1;
    }
    if (_sharedFarm case final farm?) {
      _broadcast(SessionChannel.reliable, FarmViewMessage(farm));
    }
    _notifyGuests();
  }

  /// Takes the pick back: nobody is getting ready.
  void closeParty() {
    if (_run != null || _closed) return;
    _partyZone = null;
    _departsAt = null;
    _setAllReady(false);
    _broadcast(SessionChannel.reliable, const PartyStateMessage(null));
    _notifyGuests();
  }

  void _setAllReady(bool ready) {
    for (final g in _guestOrder) {
      g.ready = ready;
    }
  }

  /// Shows the host's farm document [farm] to the guests on the farm (not
  /// out on a run); a guest who joins later gets the latest one.
  void shareFarm(Map<String, dynamic> farm) {
    if (_closed || (hostPlays && _run != null)) return;
    _sharedFarm = farm;
    _toFarm(SessionChannel.reliable, FarmViewMessage(farm));
  }

  /// The host player (member 0, first in the lobby) sends [chat] to the
  /// party in a run, or to the visitors on the farm.
  void sendChat(QuickChat chat, {String? text}) {
    if (!hostPlays || _closed) return;
    _relayChat(0, chat, text);
  }

  /// The host player walks on their farm: everyone there sees it
  /// (2026-10-22, 사용자).
  void sendWalk(FarmWalk walk) {
    if (!hostPlays || _run != null || _closed) return;
    _broadcast(
      SessionChannel.unreliable,
      FarmWalkMessage(walk, seq: ++_walkSeq, from: 0),
    );
  }

  /// Brings the host's own truck bed into the room, locked, from the host's
  /// save (2026-10-28). Until then there are no beds to share.
  void setHostBed(List<ItemStack?> slots) {
    if (!hostPlays || _closed) return;
    _hostBed = TruckBed(catalog, slots);
    _broadcastBeds();
  }

  /// Every truck bed in the room by place in the lobby, the host's first;
  /// empty before [setHostBed] (and on a dedicated server without a farm).
  List<TruckBedView> get beds {
    final host = _hostBed;
    if (hostPlays && host == null) return const [];
    if (!hostPlays && kitOf == null) return const [];
    return [
      ?host?.view,
      for (final g in _guestOrder)
        _bedOf(g)?.view ?? (slots: const <ItemStack?>[], open: false),
    ];
  }

  /// A guest's truck bed: brought along, or their kit's on a dedicated
  /// server, whose bag is looked up on every move.
  TruckBed? _bedOf(HostedGuest guest) {
    if (guest.bed case final bed?) return bed;
    final kitOf = this.kitOf;
    final player = guest.playerId.isEmpty ? guest.peerId : guest.playerId;
    if (kitOf == null || kitOf(player) == null) return null;
    return guest._kitBed ??= TruckBed.over(catalog, () => kitOf(player)!.bed);
  }

  /// Says the beds again after something else moved what is on them (a
  /// dedicated server's farm commands on a kit's bed).
  void refreshBeds() => _broadcastBeds();

  /// The host's own bed slots as they are now, to keep in the host's save.
  List<ItemStack?> get hostBedSlots => _hostBed?.slots ?? const [];

  /// Fires whenever a bed's contents or lock change, or beds come and go.
  Stream<void> get bedsChanged => _bedsChanged.stream;

  /// The host player puts [stack] on the bed at [owner] (a place in the
  /// lobby). Lowers `stack.count` by what went on; why not all of it did.
  BedRefusal? putInBed(int owner, ItemStack stack) => _put(0, owner, stack);

  /// The host player takes the stack of [item] in [owner]'s bed slot [slot],
  /// or only [count] of it.
  ({ItemStack? stack, BedRefusal? refusal}) takeFromBed(
    int owner,
    int slot,
    String item, {
    int? count,
  }) => _take(0, owner, slot, item, count);

  /// The host player moves the stack of [item] in [owner]'s bed slot [slot],
  /// or only [count] of it, onto bed [into]; what does not go on stays
  /// where it was.
  BedRefusal? moveInBeds(
    int owner,
    int slot,
    String item,
    int into, {
    int? count,
  }) => _move(0, owner, slot, item, into, count);

  BedRefusal? _move(
    int from,
    int owner,
    int slot,
    String item,
    int into, [
    int? count,
  ]) {
    if (into == owner) return null;
    final target = _bedsOpen ? _bedAt(into) : null;
    if (target == null) return BedRefusal.gone;
    if (into != from && !target.open) return BedRefusal.locked;
    final taken = _take(from, owner, slot, item, count);
    final stack = taken.stack;
    if (stack == null) return taken.refusal;
    final refusal = _put(from, into, stack);
    if (stack.count > 0) _bedAt(owner)!.put(stack, byOwner: true);
    _broadcastBeds();
    return refusal;
  }

  /// The host opens their own bed to everyone, or locks it again.
  void setBedOpen(bool open) => _lock(0, open);

  TruckBed? _bedAt(int place) {
    if (hostPlays && place == 0) return _hostBed;
    final index = place - (hostPlays ? 1 : 0);
    if (index < 0 || index >= _guestOrder.length) return null;
    return _bedOf(_guestOrder[index]);
  }

  /// Beds trade at a host's farm while nobody is out, and on a dedicated
  /// server's farm among those on it.
  bool get _bedsOpen => !_closed && (hostPlays ? _run == null : kitOf != null);

  BedRefusal? _put(int from, int owner, ItemStack stack) {
    final bed = _bedsOpen ? _bedAt(owner) : null;
    if (bed == null) return BedRefusal.gone;
    final before = stack.count;
    final refusal = bed.put(stack, byOwner: from == owner);
    if (stack.count != before) _broadcastBeds();
    return refusal;
  }

  ({ItemStack? stack, BedRefusal? refusal}) _take(
    int from,
    int owner,
    int slot,
    String item, [
    int? count,
  ]) {
    final bed = _bedsOpen ? _bedAt(owner) : null;
    if (bed == null) return (stack: null, refusal: BedRefusal.gone);
    final taken = bed.take(slot, item, byOwner: from == owner, count: count);
    if (taken.stack != null) _broadcastBeds();
    return taken;
  }

  void _lock(int place, bool open) {
    final bed = _bedsOpen ? _bedAt(place) : null;
    if (bed == null || bed.open == open) return;
    bed.open = open;
    _broadcastBeds();
  }

  void _broadcastBeds() {
    if (!_bedsOpen || (hostPlays && _hostBed == null)) return;
    _toFarm(SessionChannel.reliable, BedsMessage(beds));
    if (!_bedsChanged.isClosed) _bedsChanged.add(null);
  }

  void _onBedPut(String peerId, int owner, ItemStack stack) {
    final from = _placeOf(peerId);
    if (from == null) return;
    if (_kitBagOf(peerId) case final bag?) {
      return _send(
        peerId,
        SessionChannel.reliable,
        BedGiveMessage(refusal: _putFromKit(from, owner, bag, stack)),
      );
    }
    final refusal = _put(from, owner, stack);
    if (refusal == null && stack.count == 0) return;
    _send(
      peerId,
      SessionChannel.reliable,
      BedGiveMessage(stack: stack.count > 0 ? stack : null, refusal: refusal),
    );
  }

  void _onBedTake(
    String peerId,
    int owner,
    int slot,
    String item,
    int? into,
    int? count,
  ) {
    final from = _placeOf(peerId);
    if (from == null) return;
    if (into != null) {
      final refusal = _move(from, owner, slot, item, into, count);
      if (refusal != null) {
        _send(
          peerId,
          SessionChannel.reliable,
          BedGiveMessage(refusal: refusal),
        );
      }
      return;
    }
    final taken = _take(from, owner, slot, item, count);
    if (_kitBagOf(peerId) case final bag?) {
      // Into the kit's bag; what does not fit goes back where it was.
      var refusal = taken.refusal;
      if (taken.stack case final stack?) {
        bag.addFrom(stack);
        if (stack.count > 0) {
          _bedAt(owner)?.put(stack, byOwner: true);
          refusal ??= BedRefusal.full;
        }
        _broadcastBeds();
      }
      if (refusal != null) {
        _send(
          peerId,
          SessionChannel.reliable,
          BedGiveMessage(refusal: refusal),
        );
      }
      return;
    }
    _send(
      peerId,
      SessionChannel.reliable,
      BedGiveMessage(stack: taken.stack, refusal: taken.refusal),
    );
  }

  /// The kit bag of the guest on [peerId] on a dedicated server, or null.
  Bag? _kitBagOf(String peerId) {
    final guest = _guests[peerId];
    final kitOf = this.kitOf;
    if (guest == null || kitOf == null) return null;
    return kitOf(guest.playerId.isEmpty ? peerId : guest.playerId)?.bag;
  }

  /// Puts what [bag] really has of [stack] on bed [owner], taken out of
  /// [bag]; what does not go on goes back into it.
  BedRefusal? _putFromKit(int from, int owner, Bag bag, ItemStack stack) {
    final slots = bag.slots;
    final at = slots.indexWhere((s) => s != null && s.sameAs(stack));
    if (at < 0 || stack.count <= 0) return BedRefusal.gone;
    final there = slots[at]!;
    final ItemStack moving;
    if (stack.count < there.count) {
      there.count -= stack.count;
      moving = there.copyWithCount(stack.count);
    } else {
      moving = bag.replace(at, null)!;
    }
    final refusal = _put(from, owner, moving);
    if (moving.count > 0) bag.addFrom(moving);
    return refusal;
  }

  /// A guest's place in the lobby, or null when they are not in the room
  /// (or out on a run).
  int? _placeOf(String peerId) {
    final guest = _guests[peerId];
    if (guest == null || isOut(guest)) return null;
    final index = _guestOrder.indexOf(guest);
    return index < 0 ? null : _lobbySlot(index);
  }

  /// Where the guests walk on the host's farm, by their place in the lobby
  /// (their party colour).
  Map<int, FarmWalk> get walkers => {
    for (final (i, g) in _guestOrder.indexed) _lobbySlot(i): ?g.walk,
  };

  /// A guest's place in the lobby: after the host when the host plays.
  int _lobbySlot(int guestIndex) => (hostPlays ? 1 : 0) + guestIndex;

  /// The host words a typed message the same for everyone: one line, cut
  /// to [quickChatTextMax], or nothing when empty.
  /// [onFarm]: said on the farm or out on the run, when some are on each.
  void _relayChat(int from, QuickChat chat, [String? text, bool? onFarm]) {
    final words = chat == QuickChat.custom ? quickChatText(text) : null;
    if (chat == QuickChat.custom && words == null) return;
    _chats.add((from: from, chat: chat, text: words));
    if (_chats.length > _keptChats) _chats.removeAt(0);
    final message = QuickChatMessage(chat, from: from, text: words);
    if (onFarm == null) return _broadcast(SessionChannel.reliable, message);
    onFarm
        ? _toFarm(SessionChannel.reliable, message)
        : _toRun(SessionChannel.reliable, message);
  }

  void _onPacket(SessionPacket packet) {
    if (_closed) return;
    final SessionMessage msg;
    try {
      msg = codec.decode(packet.bytes);
    } on Object {
      return;
    }
    switch (msg) {
      case HelloMessage():
        _onHello(packet.peerId, msg);
      case MoveMessage():
        _onMove(packet.peerId, msg);
      case CommandMessage():
        _onCommand(packet.peerId, msg);
      case StartRunMessage(:final zone):
        _onStartRun(packet.peerId, zone);
      case ReadyMessage(:final ready, :final start):
        _onReady(packet.peerId, ready, start);
      case QuickChatMessage(:final chat, :final text):
        final guest = _guests[packet.peerId];
        if (guest == null) break;
        // In a run by member index; on the farm by place in the lobby.
        final out = isOut(guest);
        final index = out
            ? guest.memberIndex
            : _lobbySlot(_guestOrder.indexOf(guest));
        if (index != null) {
          _relayChat(index, chat, text, _run == null ? null : !out);
        }
      case FarmWalkMessage(:final walk, :final seq):
        _onWalk(packet.peerId, walk, seq);
      case BedPutMessage(:final owner, :final stack):
        _onBedPut(packet.peerId, owner, stack);
      case BedTakeMessage(
        :final owner,
        :final slot,
        :final item,
        :final into,
        :final count,
      ):
        _onBedTake(packet.peerId, owner, slot, item, into, count);
      case BedLockMessage(:final open):
        if (_placeOf(packet.peerId) case final place?) _lock(place, open);
      default:
        break;
    }
  }

  void _onHello(String peerId, HelloMessage msg) {
    if (msg.buildNumber != buildNumber || msg.catalogHash != catalogHash) {
      _send(
        peerId,
        SessionChannel.reliable,
        const WelcomeMessage(
          accepted: false,
          rejection: SessionJoinRejection.versionMismatch,
        ),
      );
      return;
    }
    // Back mid-run (the link dropped, the app stayed up): the same member
    // again, with the run as it is now (2026-10-22, 사용자).
    if (_run != null) {
      final back = _guestOrder
          .where(
            (g) =>
                g.memberIndex != null &&
                (g.peerId == peerId ||
                    (msg.playerId.isNotEmpty && g.playerId == msg.playerId)),
          )
          .firstOrNull;
      if (back != null) return _rejoin(back, peerId);
    }
    // The same installation again on the farm: it replaces the stale
    // connection it left behind.
    if (msg.playerId.isNotEmpty) {
      final stale = _guestOrder
          .where(
            (g) =>
                g.peerId != peerId && g.playerId == msg.playerId && !isOut(g),
          )
          .map((g) => g.peerId)
          .toList();
      for (final id in stale) {
        _guests.remove(id);
        _guestOrder.removeWhere((g) => g.peerId == id);
      }
    }
    // A host out on the run has no farm to come to; a dedicated server's
    // farm stays open to newcomers while some are out.
    if ((_run != null && hostPlays) ||
        (!_guests.containsKey(peerId) && _guests.length >= maxGuests)) {
      _send(
        peerId,
        SessionChannel.reliable,
        const WelcomeMessage(
          accepted: false,
          rejection: SessionJoinRejection.sessionFull,
        ),
      );
      return;
    }
    final guest = HostedGuest(
      peerId: peerId,
      start: msg.start,
      playerId: msg.playerId,
      accountId: msg.accountId,
      bed: hostPlays ? TruckBed(catalog, msg.bed) : null,
    );
    _guests[peerId] = guest;
    final existing = _guestOrder.indexWhere((g) => g.peerId == peerId);
    if (existing >= 0) {
      _guestOrder[existing] = guest;
    } else {
      _guestOrder.add(guest);
    }
    _send(
      peerId,
      SessionChannel.reliable,
      const WelcomeMessage(accepted: true),
    );
    if (_sharedFarm case final farm?) {
      _send(peerId, SessionChannel.reliable, FarmViewMessage(farm));
    }
    if (_partyZone != null) {
      _send(peerId, SessionChannel.reliable, _partyState());
    }
    _notifyGuests();
  }

  void _rejoin(HostedGuest guest, String peerId) {
    final sim = _run!;
    final index = guest.memberIndex!;
    _guests.remove(guest.peerId);
    guest
      ..peerId = peerId
      ..connected = true
      .._lastMoveSeq = -1
      .._resultSent = false;
    _guests[peerId] = guest;
    _send(
      peerId,
      SessionChannel.reliable,
      const WelcomeMessage(accepted: true),
    );
    _send(
      peerId,
      SessionChannel.reliable,
      RunStartedMessage(memberIndex: index, runJson: sim.toJson()),
    );
    // A member whose run ended while away gets their result again, and
    // the end of everyone's run if it came.
    _flushEventsAndResults(sim);
    if (_overSent) {
      _send(peerId, SessionChannel.reliable, const RunOverMessage());
    }
    _notifyGuests();
  }

  void _onMove(String peerId, MoveMessage msg) {
    final sim = _run;
    final guest = _guests[peerId];
    if (sim == null || guest == null) return;
    if (msg.seq < guest._lastMoveSeq) return;
    guest._lastMoveSeq = msg.seq;
    final index = guest.memberIndex;
    if (index == null || index >= sim.members.length) return;
    sim.setMoveOf(sim.members[index], msg.direction);
  }

  void _onWalk(String peerId, FarmWalk walk, int seq) {
    final guest = _guests[peerId];
    if (guest == null || isOut(guest) || seq <= guest._lastWalkSeq) return;
    if (hostPlays && _run != null) return;
    guest
      ..walk = walk
      .._lastWalkSeq = seq;
    _toFarm(
      SessionChannel.unreliable,
      FarmWalkMessage(
        walk,
        seq: seq,
        from: _lobbySlot(_guestOrder.indexOf(guest)),
      ),
    );
  }

  void _onCommand(String peerId, CommandMessage msg) {
    final sim = _run;
    final guest = _guests[peerId];
    if (sim == null || guest == null) return;
    final index = guest.memberIndex;
    if (index == null || index >= sim.members.length) return;
    final rejection = sim.applyOf(sim.members[index], msg.command);
    if (rejection != null) {
      _send(peerId, SessionChannel.reliable, CommandRejectedMessage(rejection));
      return;
    }
    _flushEventsAndResults(sim);
  }

  void _onReady(String peerId, bool ready, RaidMemberStart? start) {
    final guest = _guests[peerId];
    if (guest == null || _run != null) return;
    if (start != null) guest.start = start;
    final next = ready && _partyZone != null;
    if (guest.ready == next) return;
    guest.ready = next;
    _notifyGuests();
  }

  void _onStartRun(String peerId, String zone) {
    if (hostPlays || _run != null || _partyZone != null) return;
    if (!_guests.containsKey(peerId)) return;
    if (!catalog.zones.containsKey(zone)) return;
    _startRequests.add(zone);
  }

  void _onPeerDisconnected(String peerId) {
    final guest = _guests[peerId];
    if (guest == null) return;
    final sim = _run;
    if (sim == null || guest.memberIndex == null) {
      // On the farm: remove them from the room.
      _guests.remove(peerId);
      _guestOrder.removeWhere((g) => g.peerId == peerId);
      _notifyGuests();
      return;
    }
    // In a run: their character stays in the world defenseless (no stick
    // input), companions keep fighting (`multiplayer.md`).
    guest.connected = false;
    final index = guest.memberIndex;
    if (index != null && index < sim.members.length) {
      sim.setMoveOf(sim.members[index], Vec2.zero);
    }
    _notifyGuests();
  }

  void _notifyGuests() {
    if (!_guestsChanged.isClosed) {
      _guestsChanged.add(List.unmodifiable(_guestOrder));
    }
    if (hostPlays && _run != null) return;
    // With the host playing, they come first and guests follow.
    final first = hostPlays ? 1 : 0;
    final names = [
      if (hostPlays) hostName,
      for (final g in _guestOrder) g.name,
    ];
    final ready = [if (hostPlays) true, for (final g in _guestOrder) g.ready];
    final accounts = [
      if (hostPlays) hostAccountId,
      for (final g in _guestOrder) g.accountId,
    ];
    for (final (i, g) in _guestOrder.indexed) {
      if (isOut(g)) continue;
      _send(
        g.peerId,
        SessionChannel.reliable,
        LobbyMessage((
          names: names,
          ready: ready,
          you: first + i,
          accounts: accounts,
        )),
      );
    }
    // Places move when someone comes or goes; so do their beds.
    _broadcastBeds();
  }

  void _send(String peerId, SessionChannel channel, SessionMessage message) {
    transport.send(peerId, channel, codec.encode(message));
  }

  void _broadcast(SessionChannel channel, SessionMessage message) {
    transport.broadcast(channel, codec.encode(message));
  }

  /// To everyone out on the run; everyone when it takes all of them.
  void _toRun(SessionChannel channel, SessionMessage message) {
    if (_guestOrder.every((g) => g.memberIndex != null)) {
      return _broadcast(channel, message);
    }
    final bytes = codec.encode(message);
    for (final g in _guestOrder) {
      if (g.memberIndex != null) transport.send(g.peerId, channel, bytes);
    }
  }

  /// To everyone on the farm, not out on a run.
  void _toFarm(SessionChannel channel, SessionMessage message) {
    if (_run == null) return _broadcast(channel, message);
    final bytes = codec.encode(message);
    for (final g in _guestOrder) {
      if (!isOut(g)) transport.send(g.peerId, channel, bytes);
    }
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    await _packetSub.cancel();
    await _disconnectSub.cancel();
    await _guestsChanged.close();
    await _startRequests.close();
    await _memberResults.close();
    await _bedsChanged.close();
  }
}
