import 'dart:convert';
import 'dart:typed_data';

import 'package:potato_core/potato_core.dart';

/// The version of what goes over the wire: session messages and the game
/// state they carry. Builds that share it (and the game data, by its hash)
/// play together, whatever their build numbers (2026-10-30, 사용자: builds
/// that only changed screens kept turning friends away).
///
/// Bump it whenever a message, or the JSON of anything a message carries
/// (runs, farms, items), changes. `test/protocol_test.dart` fails until it
/// is bumped and its fingerprint updated.
const int sessionProtocol = 2;

/// Why a guest could not join a host's session.
enum SessionJoinRejection {
  /// [sessionProtocol] or catalog hash differs from the host's:
  /// "업데이트가 필요합니다".
  versionMismatch,

  /// The party already has four members, or the run already started.
  sessionFull,
}

/// Quick messages (단축 메시지): the party's in a run, and greetings on a
/// multi farm (2026-10-22, 사용자). Only the id travels; each app words it
/// and picks which set to show where, so the list can grow without
/// breaking older builds (an unknown id is dropped).
enum QuickChat {
  no,
  gather,
  go,
  ok,
  follow,
  help,
  hi,
  welcome,
  bye,
  thanks,
  come,

  /// Words the player typed, in the message's text (2026-10-23). An app
  /// may leave typing out (a store review); older builds drop it.
  custom,
}

/// The longest typed quick message, in characters.
const int quickChatTextMax = 40;

/// [text] as a typed quick message goes out: one line, trimmed, at most
/// [quickChatTextMax] characters; null when nothing is left.
String? quickChatText(String? text) {
  if (text == null) return null;
  final line = text.replaceAll(RegExp(r'\s+'), ' ').trim();
  if (line.isEmpty) return null;
  final chars = line.runes.toList();
  return chars.length <= quickChatTextMax
      ? line
      : String.fromCharCodes(chars.take(quickChatTextMax));
}

/// A quick message on screen: who sent it (their member index in a run,
/// their place in the lobby on the farm; either is also their party
/// colour), what, and the words of a [QuickChat.custom] one.
typedef QuickChatLine = ({int from, QuickChat chat, String? text});

/// Where a player's character stands on a multi farm and which way it
/// faces, in tile coordinates (2026-10-22, 사용자). Walking there is only
/// for show: it changes nothing on the farm, so each player moves their
/// own and the host passes it on.
final class FarmWalk {
  const FarmWalk({
    required this.at,
    this.facing = const Vec2(0, 1),
    this.moving = false,
  });

  factory FarmWalk.fromJson(Map<String, dynamic> json) => FarmWalk(
    at: Vec2.fromJson(json['at'] as List<Object?>),
    facing: Vec2.fromJson(json['face'] as List<Object?>),
    moving: json['moving'] as bool? ?? false,
  );

  final Vec2 at;
  final Vec2 facing;
  final bool moving;

  Map<String, dynamic> toJson() => {
    'at': at.toJson(),
    'face': facing.toJson(),
    if (moving) 'moving': true,
  };
}

/// Who is in the room, sent to each guest whenever it changes: [names] in
/// the order they came (the host first in host mode; on a dedicated server
/// the first is the leader), [ready] whether each is ready to set out for
/// the zone the host picked (the host always is), and which is [you].
/// Everyone in the room goes together (2026-10-22, 사용자).
typedef SessionLobby = ({
  List<String> names,
  List<bool> ready,
  int you,

  /// Each place's account id in host mode (empty when not known, and on a
  /// dedicated server), so a player can report or block another
  /// (2026-10-23, 사용자).
  List<String> accounts,
});

/// Why the host turned down a truck bed move (2026-10-28).
enum BedRefusal {
  /// The bed is locked and not the player's own.
  locked,

  /// Someone else took it first: "이미 가져갔어요".
  gone,

  /// The bed has no room for it.
  full,
}

/// One truck bed in the host's room as everyone sees it: its slots and
/// whether anyone may put in and take out (2026-10-28, 사용자: locked at
/// first, then only its owner).
typedef TruckBedView = ({List<ItemStack?> slots, bool open});

List<ItemStack?> _slotsFromJson(Object? json) => [
  for (final s in json as List<Object?>? ?? const [])
    s == null ? null : ItemStack.fromJson(s as Map<String, dynamic>),
];

List<Map<String, dynamic>?> _slotsToJson(List<ItemStack?> slots) => [
  for (final s in slots) s?.toJson(),
];

/// Deterministic fingerprint of [catalog] so host and guest can check they run
/// on the same game data before starting (`realtime-session.md`).
String computeCatalogHash(Catalog catalog) {
  final parts = <String>[
    'step:${catalog.rules.raid.stepMillis}',
    'hp:${catalog.rules.raid.player.maxHp}',
    'spd:${catalog.rules.raid.player.speed}',
    for (final id in catalog.zones.keys.toList()..sort())
      'z:$id:${catalog.zones[id]!.score}:${catalog.zones[id]!.enemies.count}',
    for (final id in catalog.weapons.keys.toList()..sort())
      'w:$id:${catalog.weapons[id]!.damage}:${catalog.weapons[id]!.range}',
    for (final id in catalog.enemies.keys.toList()..sort())
      'e:$id:${catalog.enemies[id]!.maxHp}:${catalog.enemies[id]!.damage}',
    for (final id in catalog.items.keys.toList()..sort())
      'i:$id:${catalog.items[id]!.stack}',
    for (final id in catalog.abilities.keys.toList()..sort()) 'a:$id',
  ];
  // 32-bit FNV-1a over UTF-8 bytes.
  var hash = 0x811c9dc5;
  for (final byte in utf8.encode(parts.join('|'))) {
    hash ^= byte;
    hash = (hash * 0x01000193) & 0xffffffff;
  }
  return hash.toRadixString(16).padLeft(8, '0');
}

/// Dynamic state of a run at [tick], sent from the host to each guest several
/// times a second on the unreliable channel. The static map is sent once in
/// [RunStartedMessage] and left out here.
final class RaidSnapshot {
  const RaidSnapshot({
    required this.tick,
    required this.revealed,
    required this.members,
    required this.enemies,
    required this.bullets,
    required this.piles,
    required this.floorItems,
    required this.exits,
    required this.clones,
    this.clouds = const [],
  });

  factory RaidSnapshot.fromRun(RaidSimulation run) => RaidSnapshot(
    tick: run.tick,
    revealed: run.exitsRevealed,
    members: [for (final m in run.members) m.toJson()],
    // The screen's share of each enemy; bosses whole (2026-10-28).
    enemies: [
      for (final e in run.enemies)
        if (run.catalog.enemies[e.kind]?.boss != null)
          e.toJson()
        else
          e.toViewJson(),
    ],
    bullets: [for (final b in run.bullets) b.toJson()],
    piles: [for (final p in run.piles) p.toJson()],
    floorItems: [for (final f in run.floorItems) f.toJson()],
    exits: [for (final e in run.exits) e.toJson()],
    clones: [for (final c in run.clones) c.toJson()],
    clouds: [for (final c in run.clouds) c.toJson()],
  );

  factory RaidSnapshot.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> maps(String key) => [
      for (final e in json[key] as List<Object?>) e! as Map<String, dynamic>,
    ];
    return RaidSnapshot(
      tick: json['tick'] as int,
      revealed: json['revealed'] as bool,
      members: maps('members'),
      enemies: maps('enemies'),
      bullets: maps('bullets'),
      piles: maps('piles'),
      floorItems: maps('floor_items'),
      exits: maps('exits'),
      clones: maps('clones'),
      clouds: [
        for (final e in json['clouds'] as List<Object?>? ?? const [])
          e! as Map<String, dynamic>,
      ],
    );
  }

  final int tick;
  final bool revealed;
  final List<Map<String, dynamic>> members;
  final List<Map<String, dynamic>> enemies;
  final List<Map<String, dynamic>> bullets;
  final List<Map<String, dynamic>> piles;
  final List<Map<String, dynamic>> floorItems;
  final List<Map<String, dynamic>> exits;
  final List<Map<String, dynamic>> clones;

  /// Boss gas and spores (2026-10-23).
  final List<Map<String, dynamic>> clouds;

  Map<String, dynamic> toJson() => {
    'tick': tick,
    'revealed': revealed,
    'members': members,
    'enemies': enemies,
    'bullets': bullets,
    'piles': piles,
    'floor_items': floorItems,
    'exits': exits,
    'clones': clones,
    if (clouds.isNotEmpty) 'clouds': clouds,
  };
}

/// Every message exchanged between [HostSession] and [ClientSession].
sealed class SessionMessage {
  const SessionMessage();

  factory SessionMessage.fromJson(
    Map<String, dynamic> json,
  ) => switch (json['type'] as String) {
    'hello' => HelloMessage(
      // Builds from before the protocol send none.
      protocol: json['protocol'] as int? ?? 0,
      buildNumber: json['build'] as int,
      catalogHash: json['catalog_hash'] as String,
      start: RaidMemberStart.fromJson(json['start'] as Map<String, dynamic>),
      playerId: json['player_id'] as String? ?? '',
      accountId: json['account_id'] as String? ?? '',
      bed: _slotsFromJson(json['bed']),
    ),
    'party_state' => PartyStateMessage(
      json['zone'] as String?,
      left: Duration(milliseconds: json['left'] as int? ?? 0),
    ),
    'ready' => ReadyMessage(
      ready: json['ready'] as bool,
      start: switch (json['start']) {
        final Map<String, dynamic> start => RaidMemberStart.fromJson(start),
        _ => null,
      },
    ),
    'run_over' => const RunOverMessage(),
    'back_to_farm' => const BackToFarmMessage(),
    'catalog_request' => const CatalogRequestMessage(),
    'catalog' => CatalogMessage(json['files'] as Map<String, dynamic>),
    'lobby' => LobbyMessage((
      names: [for (final n in json['names'] as List<Object?>) n! as String],
      ready: [
        for (final r in json['ready'] as List<Object?>? ?? const []) r! as bool,
      ],
      you: json['you'] as int,
      accounts: [
        for (final a in json['accounts'] as List<Object?>? ?? const [])
          a! as String,
      ],
    )),
    'start_run' => StartRunMessage(json['zone'] as String),
    'farm_view' => FarmViewMessage(json['farm'] as Map<String, dynamic>),
    'farm_command' => FarmCommandMessage(
      FarmCommand.fromJson(json['command'] as Map<String, dynamic>),
    ),
    'farm_reply' => FarmReplyMessage(
      refused: json['refused'] as bool? ?? false,
      rejection: switch (json['rejection']) {
        final String r => FarmRejection.values.asNameMap()[r],
        _ => null,
      },
    ),
    'kit' => KitMessage(json['kit'] as Map<String, dynamic>),
    'farm_walk' => FarmWalkMessage(
      FarmWalk.fromJson(json['walk'] as Map<String, dynamic>),
      seq: json['seq'] as int? ?? 0,
      from: json['from'] as int? ?? -1,
    ),
    'quick_chat' => QuickChatMessage(
      QuickChat.values.byName(json['chat'] as String),
      from: json['from'] as int? ?? -1,
      text: json['text'] as String?,
    ),
    'welcome' => WelcomeMessage(
      accepted: json['accepted'] as bool,
      rejection: switch (json['rejection']) {
        final String r => SessionJoinRejection.values.byName(r),
        _ => null,
      },
    ),
    'run_started' => RunStartedMessage(
      memberIndex: json['member_index'] as int,
      runJson: json['run'] as Map<String, dynamic>,
    ),
    'move' => MoveMessage(
      direction: Vec2.fromJson(json['dir'] as List<Object?>),
      seq: json['seq'] as int? ?? 0,
    ),
    'command' => CommandMessage(
      RaidCommand.fromJson(json['command'] as Map<String, dynamic>),
    ),
    'command_rejected' => CommandRejectedMessage(
      RaidRejection.values.byName(json['rejection'] as String),
    ),
    'snapshot' => SnapshotMessage(
      RaidSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    ),
    'events' => EventsMessage(
      tick: json['tick'] as int,
      events: [
        for (final e in json['events'] as List<Object?>)
          RaidEvent.fromJson(e! as Map<String, dynamic>),
      ],
    ),
    'member_result' => MemberResultMessage(
      memberIndex: json['member_index'] as int,
      result: RaidResult.fromJson(json['result'] as Map<String, dynamic>),
    ),
    'beds' => BedsMessage([
      for (final b
          in (json['beds'] as List<Object?>).cast<Map<String, dynamic>>())
        (slots: _slotsFromJson(b['slots']), open: b['open'] as bool? ?? false),
    ]),
    'bed_put' => BedPutMessage(
      owner: json['owner'] as int,
      stack: ItemStack.fromJson(json['stack'] as Map<String, dynamic>),
    ),
    'bed_take' => BedTakeMessage(
      owner: json['owner'] as int,
      slot: json['slot'] as int,
      item: json['item'] as String,
      into: json['into'] as int?,
      count: json['count'] as int?,
    ),
    'bed_lock' => BedLockMessage(open: json['open'] as bool),
    'bed_give' => BedGiveMessage(
      stack: switch (json['stack']) {
        final Map<String, dynamic> s => ItemStack.fromJson(s),
        _ => null,
      },
      refusal: switch (json['refusal']) {
        final String r => BedRefusal.values.byName(r),
        _ => null,
      },
    ),
    final other => throw FormatException('Unknown SessionMessage $other'),
  };

  Map<String, dynamic> toJson() => switch (this) {
    HelloMessage(
      :final protocol,
      :final buildNumber,
      :final catalogHash,
      :final start,
      :final playerId,
      :final accountId,
      :final bed,
    ) =>
      {
        'type': 'hello',
        'protocol': protocol,
        'build': buildNumber,
        'catalog_hash': catalogHash,
        'start': start.toJson(),
        if (playerId.isNotEmpty) 'player_id': playerId,
        if (accountId.isNotEmpty) 'account_id': accountId,
        if (bed.any((s) => s != null)) 'bed': _slotsToJson(bed),
      },
    PartyStateMessage(:final zone, :final left) => {
      'type': 'party_state',
      'zone': zone,
      if (left > Duration.zero) 'left': left.inMilliseconds,
    },
    ReadyMessage(:final ready, :final start) => {
      'type': 'ready',
      'ready': ready,
      if (start != null) 'start': start.toJson(),
    },
    RunOverMessage() => {'type': 'run_over'},
    BackToFarmMessage() => {'type': 'back_to_farm'},
    CatalogRequestMessage() => {'type': 'catalog_request'},
    CatalogMessage(:final files) => {'type': 'catalog', 'files': files},
    LobbyMessage(:final lobby) => {
      'type': 'lobby',
      'names': lobby.names,
      'ready': lobby.ready,
      'you': lobby.you,
      if (lobby.accounts.any((a) => a.isNotEmpty)) 'accounts': lobby.accounts,
    },
    StartRunMessage(:final zone) => {'type': 'start_run', 'zone': zone},
    FarmViewMessage(:final farm) => {'type': 'farm_view', 'farm': farm},
    FarmCommandMessage(:final command) => {
      'type': 'farm_command',
      'command': command.toJson(),
    },
    FarmReplyMessage(:final refused, :final rejection) => {
      'type': 'farm_reply',
      if (refused) 'refused': true,
      'rejection': ?rejection?.name,
    },
    KitMessage(:final kit) => {'type': 'kit', 'kit': kit},
    FarmWalkMessage(:final walk, :final seq, :final from) => {
      'type': 'farm_walk',
      'walk': walk.toJson(),
      'seq': seq,
      if (from >= 0) 'from': from,
    },
    QuickChatMessage(:final chat, :final from, :final text) => {
      'type': 'quick_chat',
      'chat': chat.name,
      if (from >= 0) 'from': from,
      'text': ?text,
    },
    WelcomeMessage(:final accepted, :final rejection) => {
      'type': 'welcome',
      'accepted': accepted,
      if (rejection != null) 'rejection': rejection.name,
    },
    RunStartedMessage(:final memberIndex, :final runJson) => {
      'type': 'run_started',
      'member_index': memberIndex,
      'run': runJson,
    },
    MoveMessage(:final direction, :final seq) => {
      'type': 'move',
      'dir': direction.toJson(),
      'seq': seq,
    },
    CommandMessage(:final command) => {
      'type': 'command',
      'command': command.toJson(),
    },
    CommandRejectedMessage(:final rejection) => {
      'type': 'command_rejected',
      'rejection': rejection.name,
    },
    SnapshotMessage(:final snapshot) => {
      'type': 'snapshot',
      'snapshot': snapshot.toJson(),
    },
    EventsMessage(:final tick, :final events) => {
      'type': 'events',
      'tick': tick,
      'events': [for (final e in events) e.toJson()],
    },
    MemberResultMessage(:final memberIndex, :final result) => {
      'type': 'member_result',
      'member_index': memberIndex,
      'result': result.toJson(),
    },
    BedsMessage(:final beds) => {
      'type': 'beds',
      'beds': [
        for (final b in beds)
          {'slots': _slotsToJson(b.slots), if (b.open) 'open': true},
      ],
    },
    BedPutMessage(:final owner, :final stack) => {
      'type': 'bed_put',
      'owner': owner,
      'stack': stack.toJson(),
    },
    BedTakeMessage(
      :final owner,
      :final slot,
      :final item,
      :final into,
      :final count,
    ) =>
      {
        'type': 'bed_take',
        'owner': owner,
        'slot': slot,
        'item': item,
        'into': ?into,
        'count': ?count,
      },
    BedLockMessage(:final open) => {'type': 'bed_lock', 'open': open},
    BedGiveMessage(:final stack, :final refusal) => {
      'type': 'bed_give',
      if (stack != null) 'stack': stack.toJson(),
      if (refusal != null) 'refusal': refusal.name,
    },
  };
}

/// Guest → host on reliable: version check and what the guest brings in.
final class HelloMessage extends SessionMessage {
  const HelloMessage({
    this.protocol = sessionProtocol,
    required this.buildNumber,
    required this.catalogHash,
    required this.start,
    this.playerId = '',
    this.accountId = '',
    this.bed = const [],
  });

  /// The guest's [sessionProtocol]; what the host checks.
  final int protocol;

  /// The guest's app build, for the record.
  final int buildNumber;
  final String catalogHash;
  final RaidMemberStart start;

  /// The player's account id in host mode, so others in the room can
  /// report or block them (2026-10-23, 사용자). Empty without one.
  final String accountId;

  /// This installation's id, so a dedicated server (no accounts) can tell
  /// the same player from another with the same nickname ([start] carries
  /// the nickname). Empty in host mode.
  final String playerId;

  /// The guest's truck bed as they bring it, empty slots as null
  /// (2026-10-28). The host keeps it while they are in the room.
  final List<ItemStack?> bed;
}

/// Host → guest on reliable: the [zone] the host picked to set out for
/// (null: none yet), and how long until everyone sets out anyway ([left];
/// zero: no countdown). Everyone's readiness starts over when it changes.
final class PartyStateMessage extends SessionMessage {
  const PartyStateMessage(this.zone, {this.left = Duration.zero});

  final String? zone;
  final Duration left;
}

/// Guest → host on reliable: ready to set out for the zone the host picked,
/// or not any more (2026-10-22, 사용자). The host sets out once everyone is,
/// or when the countdown ends. [start] is what the guest brings now (their
/// farm changed since they came, e.g. after a run); the host keeps it.
final class ReadyMessage extends SessionMessage {
  const ReadyMessage({required this.ready, this.start});

  final bool ready;
  final RaidMemberStart? start;
}

/// Host → guest on reliable: everyone's run is over (2026-10-22, 사용자:
/// whoever is out first watches until then). Results follow as before.
final class RunOverMessage extends SessionMessage {
  const RunOverMessage();
}

/// Host → guest on reliable: the host is back at the farm with the room
/// still open; everyone gathers there again (2026-10-22, 사용자). The lobby
/// and the farm follow.
final class BackToFarmMessage extends SessionMessage {
  const BackToFarmMessage();
}

/// Dedicated server → guest on reliable: the server has no game data yet,
/// so send it ([CatalogMessage]). The data is unreleased content and is
/// never kept in the public server repository (`realtime-session.md`).
final class CatalogRequestMessage extends SessionMessage {
  const CatalogRequestMessage();
}

/// Guest → dedicated server on reliable: the guest's catalog data files,
/// keyed as `Catalog.load` reads them. The server keeps them while anyone
/// is connected; later guests must match its catalog hash.
final class CatalogMessage extends SessionMessage {
  const CatalogMessage(this.files);

  final Map<String, dynamic> files;
}

/// Dedicated server → guest on reliable: the waiting room changed.
final class LobbyMessage extends SessionMessage {
  const LobbyMessage(this.lobby);

  final SessionLobby lobby;
}

/// A quick message, on reliable. Guest → host without [from]; the host
/// relays it to everyone with [from] set to the sender's member index in a
/// run, or their place in the lobby on the farm. A [QuickChat.custom] one
/// carries its words in [text].
final class QuickChatMessage extends SessionMessage {
  const QuickChatMessage(this.chat, {this.from = -1, this.text});

  final QuickChat chat;
  final int from;
  final String? text;
}

/// Where a player walks on the host's multi farm, on unreliable, a few
/// times a second while moving and now and then standing. Guest → host
/// without [from]; the host passes it on with [from] set to the sender's
/// place in the lobby, and sends its own as 0. [seq] grows per sender, so
/// a late packet is dropped.
final class FarmWalkMessage extends SessionMessage {
  const FarmWalkMessage(this.walk, {this.seq = 0, this.from = -1});

  final FarmWalk walk;
  final int seq;
  final int from;
}

/// Host → guest on reliable while the party gathers at the host's farm: the
/// host's farm document (as saved) to show, sent when a guest joins and
/// again every few seconds (2026-10-21, 사용자). Guests only look.
final class FarmViewMessage extends SessionMessage {
  const FarmViewMessage(this.farm);

  final Map<String, dynamic> farm;
}

/// Guest → host on reliable: do [command] on the farm everyone shares, with
/// the guest's own kit (a dedicated server's world, 2026-10-28, 사용자).
/// Answered with a [FarmReplyMessage].
final class FarmCommandMessage extends SessionMessage {
  const FarmCommandMessage(this.command);

  final FarmCommand command;
}

/// Host → guest on reliable: how a [FarmCommandMessage] went: [refused] when
/// the guest may not send it there, else the farm's [rejection] (null: it
/// took).
final class FarmReplyMessage extends SessionMessage {
  const FarmReplyMessage({this.refused = false, this.rejection});

  final bool refused;
  final FarmRejection? rejection;
}

/// Host → guest on reliable: the guest's own kit on the shared farm (worn
/// gear, bag, truck bed, as `PlayerKit.toJson`), sent when they come in and
/// whenever it changes.
final class KitMessage extends SessionMessage {
  const KitMessage(this.kit);

  final Map<String, dynamic> kit;
}

/// Leader guest → dedicated server on reliable: set out to [zone] now.
final class StartRunMessage extends SessionMessage {
  const StartRunMessage(this.zone);

  final String zone;
}

/// Host → guest on reliable: whether [HelloMessage] was accepted.
final class WelcomeMessage extends SessionMessage {
  const WelcomeMessage({required this.accepted, this.rejection});

  final bool accepted;
  final SessionJoinRejection? rejection;
}

/// Host → guest on reliable when the party sets out: the guest's index in
/// `RaidSimulation.members` and the initial run state (map included).
final class RunStartedMessage extends SessionMessage {
  const RunStartedMessage({required this.memberIndex, required this.runJson});

  final int memberIndex;
  final Map<String, dynamic> runJson;
}

/// Guest → host on unreliable: stick direction.
final class MoveMessage extends SessionMessage {
  const MoveMessage({required this.direction, this.seq = 0});

  final Vec2 direction;
  final int seq;
}

/// Guest → host on reliable: a discrete action (dash, signal, loot, gear).
final class CommandMessage extends SessionMessage {
  const CommandMessage(this.command);

  final RaidCommand command;
}

/// Host → guest on reliable: why the last command could not be carried out.
final class CommandRejectedMessage extends SessionMessage {
  const CommandRejectedMessage(this.rejection);

  final RaidRejection rejection;
}

/// Host → guest on unreliable: periodic state snapshot.
final class SnapshotMessage extends SessionMessage {
  const SnapshotMessage(this.snapshot);

  final RaidSnapshot snapshot;
}

/// Host → guest on reliable: events that happened on [tick].
final class EventsMessage extends SessionMessage {
  const EventsMessage({required this.tick, required this.events});

  final int tick;
  final List<RaidEvent> events;
}

/// Host → guest on reliable: the guest's final [RaidResult] once their run
/// ends (extracted, fainted, went home, starved).
final class MemberResultMessage extends SessionMessage {
  const MemberResultMessage({required this.memberIndex, required this.result});

  final int memberIndex;
  final RaidResult result;
}

/// Host → everyone on reliable while at the host's farm: every truck bed in
/// the room, by place in the lobby (the host is 0), sent whenever one
/// changes and when someone comes or goes (2026-10-28, 사용자). Each player
/// keeps their own bed in their save as it is here.
final class BedsMessage extends SessionMessage {
  const BedsMessage(this.beds);

  final List<TruckBedView> beds;
}

/// Guest → host on reliable: put [stack] on [owner]'s bed. The guest has
/// already taken it out of their own side; whatever does not go on comes
/// back in [BedGiveMessage] with the refusal.
final class BedPutMessage extends SessionMessage {
  const BedPutMessage({required this.owner, required this.stack});

  final int owner;
  final ItemStack stack;
}

/// Guest → host on reliable: take the stack of [item] in [owner]'s bed slot
/// [slot]. The host gives it in [BedGiveMessage], or says why not. With
/// [into] the host moves it straight onto that bed instead, and what does
/// not go on stays where it was.
final class BedTakeMessage extends SessionMessage {
  const BedTakeMessage({
    required this.owner,
    required this.slot,
    required this.item,
    this.into,
    this.count,
  });

  final int owner;
  final int slot;
  final String item;
  final int? into;

  /// Only this many of the stack; null for all of it (2026-10-28, 사용자).
  final int? count;
}

/// Guest → host on reliable: open the guest's own bed to everyone, or lock
/// it again.
final class BedLockMessage extends SessionMessage {
  const BedLockMessage({required this.open});

  final bool open;
}

/// Host → guest on reliable: a stack for the guest's side, taken from a
/// bed or not let on one, and why not ([refusal]) when a move failed.
final class BedGiveMessage extends SessionMessage {
  const BedGiveMessage({this.stack, this.refusal});

  final ItemStack? stack;
  final BedRefusal? refusal;
}

/// Turns [SessionMessage]s into bytes and back, kept separate from the
/// transport so snapshots can switch to binary later without touching
/// sessions or transports (`realtime-session.md`).
abstract interface class SessionCodec {
  Uint8List encode(SessionMessage message);
  SessionMessage decode(Uint8List bytes);
}

/// UTF-8 JSON codec used first for easy debugging.
final class JsonSessionCodec implements SessionCodec {
  const JsonSessionCodec();

  @override
  Uint8List encode(SessionMessage message) =>
      Uint8List.fromList(utf8.encode(jsonEncode(message.toJson())));

  @override
  SessionMessage decode(Uint8List bytes) => SessionMessage.fromJson(
    jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>,
  );
}
