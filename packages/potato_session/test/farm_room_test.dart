import 'dart:convert';
import 'dart:io';

import 'package:potato_session/potato_session.dart';
import 'package:test/test.dart';

Catalog _catalog() {
  final dir = [
    Directory('../potato_core/test/fixtures/catalog'),
    Directory('packages/potato_core/test/fixtures/catalog'),
  ].firstWhere((d) => d.existsSync());
  final result = Catalog.load({
    for (final file in dir.listSync())
      if (file is File && file.path.endsWith('.json'))
        file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
          file.readAsStringSync(),
        ),
  });
  return result.catalog!;
}

/// One farm several players look after together (`save-and-online.md`,
/// 2026-10-28, 사용자).
void main() {
  late Catalog catalog;
  late FarmRoom room;

  setUpAll(() => catalog = _catalog());
  setUp(() {
    final farm = FarmSimulation.newFarm(catalog, seed: 1)..food = 100;
    room = FarmRoom(farm: farm);
  });
  tearDown(() => room.close());

  test('each player packs their own bag from the shared storage', () {
    expect(
      room
          .apply('a', const FarmCommand.loadBag(item: 'food', count: 30))
          .rejection,
      isNull,
    );
    expect(
      room
          .apply('b', const FarmCommand.loadBag(item: 'food', count: 50))
          .rejection,
      isNull,
    );
    expect(room.kitOf('a').bag.countOf('food'), 30);
    expect(room.kitOf('b').bag.countOf('food'), 50);
    expect(room.farm.food, 20);

    // The second asks for more than is left: the farm says no.
    expect(
      room
          .apply('a', const FarmCommand.loadBag(item: 'food', count: 30))
          .rejection,
      FarmRejection.notStored,
    );
    expect(room.players, ['a', 'b']);
  });

  test('a newcomer wears the starting gear', () {
    expect(room.kitOf('new').equipped, catalog.rules.gear.start);
  });

  test('the policy decides who may send what', () {
    final owned = FarmRoom(
      farm: FarmSimulation.newFarm(catalog, seed: 2),
      allow: (player, _) => player == 'owner',
    );
    addTearDown(owned.close);
    const command = FarmCommand.loadBag(item: 'food', count: 1);
    expect(owned.apply('guest', command).refused, isTrue);
    expect(owned.apply('owner', command), (refused: false, rejection: null));
  });

  test('time moves the farm on in whole steps', () {
    var changes = 0;
    room.changes.listen((_) => changes++);
    final step = catalog.rules.farm.step;
    expect(room.advance(step ~/ 2), 0);
    expect(room.advance(step), 1);
    expect(changes, 1);
  });

  test('the room saves the farm and every kit', () {
    room.apply('a', const FarmCommand.loadBag(item: 'food', count: 30));
    final back = FarmRoom.fromJson(
      catalog,
      jsonDecode(jsonEncode(room.toJson())) as Map<String, dynamic>,
    );
    addTearDown(back.close);
    expect(back.farm.food, 70);
    expect(back.kitOf('a').bag.countOf('food'), 30);
  });

  test('farm commands, replies and kits travel as messages', () {
    const codec = JsonSessionCodec();
    final command = codec.decode(
      codec.encode(
        const FarmCommandMessage(FarmCommand.loadBag(item: 'food', count: 3)),
      ),
    ) as FarmCommandMessage;
    expect(command.command, const FarmCommand.loadBag(item: 'food', count: 3));

    final reply = codec.decode(
      codec.encode(const FarmReplyMessage(rejection: FarmRejection.notStored)),
    ) as FarmReplyMessage;
    expect(reply.rejection, FarmRejection.notStored);
    expect(reply.refused, isFalse);

    final kit = codec.decode(
      codec.encode(KitMessage(room.kitOf('a').toJson())),
    ) as KitMessage;
    expect(
      PlayerKit.fromJson(catalog, kit.kit).equipped,
      catalog.rules.gear.start,
    );
  });
}
