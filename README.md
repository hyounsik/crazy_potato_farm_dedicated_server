# crazy_potato_farm_dedicated_server

Dedicated server for Crazy Potato Farm, plus the game code shared with the client.

## Packages

| Path | Purpose |
|---|---|
| `packages/potato_core` | Game rules (pure Dart, no I/O) |
| `packages/potato_session` | Session hosting, shared by host mode and the dedicated server |
| `bin/`, `lib/` | Dedicated server executable |

## Run

Requires Dart SDK 3.13 or later.

```sh
dart pub get
dart run bin/server.dart        # listens on PORT (default 8080)
curl localhost:8080/health      # -> ok
PASSWORD=secret dart run bin/server.dart   # players must send the password
```

Players connect over WebSocket at `ws://<host>:<port>/session` (put a TLS proxy in
front for `wss://`). The password, when set, goes in the `x-potato-password` header;
a wrong one is refused with HTTP 401. Each binary message is one session packet:
the first byte is the channel (0 reliable, 1 unreliable), the rest the payload
(`WebSocketFrame` in `potato_session`). Clients use `WebSocketClientTransport`
from `package:potato_session/websocket_client.dart`.

### What the server hosts

One exploration party at a time (`DedicatedRoom`):

- The server ships **without game data**. The first player to connect is asked
  for it and sends the data files their app was built with; the server accepts
  them when they load and match that player's catalog hash. That player's app
  build becomes the server's: later players must be on the same build and
  catalog, or they are turned away. When everyone has left, the server forgets
  the data, so an updated app can bring its own.
- Nobody plays on the server. The first player in the waiting room leads and
  picks where to go; the server picks the seed and runs the game at a fixed
  step, sending snapshots to everyone. Up to four players.
- When every player still connected is out of the run, a new waiting room opens.
- Players are told apart by nickname plus an installation id; there are no
  accounts.

The server logs what happens to stdout (connections, data received, runs
starting and ending).

With Docker (first draft, not yet tested):

```sh
docker build -t potato-server .
docker run --rm -p 8080:8080 potato-server
```

## License

[Apache 2.0](LICENSE)
