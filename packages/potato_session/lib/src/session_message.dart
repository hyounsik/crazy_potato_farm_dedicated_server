import 'dart:convert';
import 'dart:typed_data';

import 'package:potato_core/potato_core.dart';

/// Why a guest could not join a host's session.
enum SessionJoinRejection {
  /// App build number or catalog hash differs from the host's:
  /// "업데이트가 필요합니다".
  versionMismatch,

  /// The party already has four members, or the run already started.
  sessionFull,
}

/// The party's quick messages in a run (탐험 단축 메시지). Only the id
/// travels; each app words it, so the list can grow without breaking older
/// builds (an unknown id is dropped).
enum QuickChat { no, gather, go, ok, follow, help }

/// A quick message on screen: who sent it (their member index, which is
/// also their party colour) and what.
typedef QuickChatLine = ({int from, QuickChat chat});

/// Who is in the room, sent to each guest whenever it changes: [names] in
/// the order they came (the host first in host mode; on a dedicated server
/// the first is the leader), [party] whether each is in the party (a
/// visitor at the host's farm is not until they join), and which is [you].
typedef SessionLobby = ({List<String> names, List<bool> party, int you});

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
  });

  factory RaidSnapshot.fromRun(RaidSimulation run) => RaidSnapshot(
    tick: run.tick,
    revealed: run.exitsRevealed,
    members: [for (final m in run.members) m.toJson()],
    enemies: [for (final e in run.enemies) e.toJson()],
    bullets: [for (final b in run.bullets) b.toJson()],
    piles: [for (final p in run.piles) p.toJson()],
    floorItems: [for (final f in run.floorItems) f.toJson()],
    exits: [for (final e in run.exits) e.toJson()],
    clones: [for (final c in run.clones) c.toJson()],
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
  };
}

/// Every message exchanged between [HostSession] and [ClientSession].
sealed class SessionMessage {
  const SessionMessage();

  factory SessionMessage.fromJson(
    Map<String, dynamic> json,
  ) => switch (json['type'] as String) {
    'hello' => HelloMessage(
      buildNumber: json['build'] as int,
      catalogHash: json['catalog_hash'] as String,
      start: RaidMemberStart.fromJson(json['start'] as Map<String, dynamic>),
      playerId: json['player_id'] as String? ?? '',
      party: json['party'] as bool? ?? true,
    ),
    'party_state' => PartyStateMessage(json['zone'] as String?),
    'join_party' => const JoinPartyMessage(),
    'party_joined' => PartyJoinedMessage(accepted: json['accepted'] as bool),
    'visit_ended' => const VisitEndedMessage(),
    'catalog_request' => const CatalogRequestMessage(),
    'catalog' => CatalogMessage(json['files'] as Map<String, dynamic>),
    'lobby' => LobbyMessage((
      names: [for (final n in json['names'] as List<Object?>) n! as String],
      party: [
        for (final p in json['party'] as List<Object?>? ?? const []) p! as bool,
      ],
      you: json['you'] as int,
    )),
    'start_run' => StartRunMessage(json['zone'] as String),
    'farm_view' => FarmViewMessage(json['farm'] as Map<String, dynamic>),
    'quick_chat' => QuickChatMessage(
      QuickChat.values.byName(json['chat'] as String),
      from: json['from'] as int? ?? -1,
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
    final other => throw FormatException('Unknown SessionMessage $other'),
  };

  Map<String, dynamic> toJson() => switch (this) {
    HelloMessage(
      :final buildNumber,
      :final catalogHash,
      :final start,
      :final playerId,
      :final party,
    ) =>
      {
        'type': 'hello',
        'build': buildNumber,
        'catalog_hash': catalogHash,
        'start': start.toJson(),
        if (playerId.isNotEmpty) 'player_id': playerId,
        if (!party) 'party': false,
      },
    PartyStateMessage(:final zone) => {'type': 'party_state', 'zone': zone},
    JoinPartyMessage() => {'type': 'join_party'},
    PartyJoinedMessage(:final accepted) => {
      'type': 'party_joined',
      'accepted': accepted,
    },
    VisitEndedMessage() => {'type': 'visit_ended'},
    CatalogRequestMessage() => {'type': 'catalog_request'},
    CatalogMessage(:final files) => {'type': 'catalog', 'files': files},
    LobbyMessage(:final lobby) => {
      'type': 'lobby',
      'names': lobby.names,
      'party': lobby.party,
      'you': lobby.you,
    },
    StartRunMessage(:final zone) => {'type': 'start_run', 'zone': zone},
    FarmViewMessage(:final farm) => {'type': 'farm_view', 'farm': farm},
    QuickChatMessage(:final chat, :final from) => {
      'type': 'quick_chat',
      'chat': chat.name,
      if (from >= 0) 'from': from,
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
  };
}

/// Guest → host on reliable: version check and what the guest brings in.
final class HelloMessage extends SessionMessage {
  const HelloMessage({
    required this.buildNumber,
    required this.catalogHash,
    required this.start,
    this.playerId = '',
    this.party = true,
  });

  final int buildNumber;
  final String catalogHash;
  final RaidMemberStart start;

  /// Whether the guest comes for the party; false for a visitor who only
  /// looks around the host's farm until they [JoinPartyMessage].
  final bool party;

  /// This installation's id, so a dedicated server (no accounts) can tell
  /// the same player from another with the same nickname ([start] carries
  /// the nickname). Empty in host mode.
  final String playerId;
}

/// Host → guest on reliable: whether a party is gathering at the host's
/// farm, and for which [zone] (null: none). Visitors may then join it.
final class PartyStateMessage extends SessionMessage {
  const PartyStateMessage(this.zone);

  final String? zone;
}

/// Visitor → host on reliable: count me in the party.
final class JoinPartyMessage extends SessionMessage {
  const JoinPartyMessage();
}

/// Host → visitor on reliable: whether [JoinPartyMessage] was taken (no
/// party gathering, or the visitor's permission does not cover it).
final class PartyJoinedMessage extends SessionMessage {
  const PartyJoinedMessage({required this.accepted});

  final bool accepted;
}

/// Host → visitor on reliable: the host set out without them; the visit is
/// over.
final class VisitEndedMessage extends SessionMessage {
  const VisitEndedMessage();
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

/// A quick message in a run, on reliable. Guest → host without [from]; the
/// host relays it to everyone with [from] set to the sender's member index.
final class QuickChatMessage extends SessionMessage {
  const QuickChatMessage(this.chat, {this.from = -1});

  final QuickChat chat;
  final int from;
}

/// Host → guest on reliable while the party gathers at the host's farm: the
/// host's farm document (as saved) to show, sent when a guest joins and
/// again every few seconds (2026-10-21, 사용자). Guests only look.
final class FarmViewMessage extends SessionMessage {
  const FarmViewMessage(this.farm);

  final Map<String, dynamic> farm;
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
