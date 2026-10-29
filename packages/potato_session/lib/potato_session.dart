/// Game session hosting shared by host mode and the dedicated server.
///
/// Host mode runs this inside the Flutter client; the dedicated server runs
/// it from `bin/server.dart`. Keep Flutter out of this package.
///
/// Re-exports `potato_core` so the client needs a single git dependency: pub
/// treats two git dependencies on the same repository as conflicting sources.
library;

export 'package:potato_core/potato_core.dart';
export 'package:potato_session/src/client_session.dart';
export 'package:potato_session/src/farm_room.dart';
export 'package:potato_session/src/host_session.dart';
export 'package:potato_session/src/session_message.dart';
export 'package:potato_session/src/transport.dart';
export 'package:potato_session/src/truck_bed.dart';
export 'package:potato_session/src/websocket_frame.dart';
