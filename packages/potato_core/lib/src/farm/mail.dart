import 'package:potato_core/src/potatoes/seed.dart';

/// What a letter is about. The words are the app's; the rules only say
/// which kind it is and what it brings.
enum MailKind {
  /// The first letter on a new farm.
  start,

  /// Sent when a building goes up, with a seed. [Mail.building] says which.
  building,

  /// Sent when a story event is done, with its reward. [Mail.story] says
  /// which event.
  story,
}

/// A letter in the mailbox and what it brings.
final class Mail {
  Mail({
    required this.id,
    required this.kind,
    required this.tick,
    this.building,
    this.story,
    this.seeds = const [],
    this.food = 0,
    this.read = false,
    this.claimed = false,
  });

  final int id;
  final MailKind kind;

  /// The farm step it arrived on.
  final int tick;

  /// The `buildings.json` id a building letter is about.
  final String? building;

  /// The `story.json` event id a story letter is about.
  final String? story;
  final List<Seed> seeds;
  final int food;
  bool read;
  bool claimed;

  /// Whether it brings anything not yet taken.
  bool get hasGift => !claimed && (seeds.isNotEmpty || food > 0);
}

/// A seed that came when the pouch was full, waiting for room until
/// [expiresTick], when it turns into baby potatoes.
final class OverflowSeed {
  OverflowSeed({required this.seed, required this.expiresTick});

  final Seed seed;
  final int expiresTick;
}
