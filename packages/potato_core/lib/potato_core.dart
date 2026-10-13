/// Game rules shared by the client, host mode, and the dedicated server.
///
/// Keep this package free of Flutter and I/O (`dart:io`, network, files) so
/// the same input gives the same result on every device that runs a session.
library;

export 'src/catalog/catalog.dart';
export 'src/catalog/grade.dart';
export 'src/catalog/item_data.dart';
export 'src/catalog/potato_type_data.dart';
export 'src/catalog/raid_data.dart';
export 'src/catalog/rules_data.dart';
export 'src/common/fixed_step_clock.dart';
export 'src/common/game_random.dart';
export 'src/common/tile.dart';
export 'src/common/vec2.dart';
export 'src/farm/farm_command.dart';
export 'src/farm/farm_event.dart';
export 'src/farm/farm_simulation.dart';
export 'src/items/bag.dart';
export 'src/map/map_chunk.dart';
export 'src/map/map_data.dart';
export 'src/map/map_generator.dart';
export 'src/map/map_physics.dart';
export 'src/map/map_recipe.dart';
export 'src/potatoes/potato.dart';
export 'src/raid/homecoming.dart';
export 'src/raid/raid_bodies.dart';
export 'src/raid/raid_command.dart';
export 'src/raid/raid_simulation.dart';
export 'src/potatoes/seed.dart';
export 'src/save/farm_document.dart';
export 'src/save/migration.dart' show farmFormatVersion, migrateFarmJson;
