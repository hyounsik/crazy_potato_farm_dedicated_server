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
ADMIN_PASSWORD=admin dart run bin/server.dart   # admin page on ADMIN_PORT (default 8081)
```

| Variable | Default | What it does |
|---|---|---|
| `PORT` | `8080` | Where players connect |
| `PASSWORD` | none | What players must send to join (the admin page can change it) |
| `DATA_DIR` | `data` | Where the shared farm and the game data are kept |
| `ADMIN_PASSWORD` | none | Turns the admin page on; without it there is none |
| `ADMIN_PORT` | `8081` | The admin page's port |

Players connect over WebSocket at `ws://<host>:<port>/session` (put a TLS proxy in
front for `wss://`). The password, when set, goes in the `x-potato-password` header;
a wrong one is refused with HTTP 401. Each binary message is one session packet:
the first byte is the channel (0 reliable, 1 unreliable), the rest the payload
(`WebSocketFrame` in `potato_session`). Clients use `WebSocketClientTransport`
from `package:potato_session/websocket_client.dart`.

### What the server hosts

One shared farm (`DedicatedWorld`) and one exploration party at a time
(`DedicatedRoom`):

- **The farm belongs to the server**, not to a player, and everyone who comes
  in looks after it together: planting, harvesting, building and setting out.
  Each player keeps their own kit (worn gear, bag, truck bed) by installation
  id; storage, baby potatoes, potatoes and buildings are shared. Time goes on
  with nobody connected. Players send farm commands (`FarmCommandMessage`) and
  get the farm (`FarmViewMessage`) and their own kit (`KitMessage`) back.
- **Kept in `DATA_DIR`**: `world.json` (the farm in the app's save format plus
  every kit) and `catalog.json` (the game data a player brought). Saved soon
  after a change, every minute and on shutdown; each save is written to a
  temporary file and moved into place, and the last three stay as
  `world.json.1`..`.3` and stand in if the newest does not read. The game data
  is unreleased content: it stays on your machine, never in this repository.

- The server ships **without game data**. The first player to connect is asked
  for it and sends the data files their app was built with; the server accepts
  them when they load and match that player's catalog hash. That player's app
  build becomes the server's: later players must be on the same build and
  catalog, or they are turned away. The data is kept with the farm, so the
  next player on the same data need not send it. When everyone has left, a
  player on a newer app can bring newer data, and the farm carries over onto
  it.
- Nobody plays on the server. The first player in the waiting room leads and
  picks where to go; the server picks the seed and runs the game at a fixed
  step, sending snapshots to everyone. Up to four players.
- When every player still connected is out of the run, a new waiting room opens.
- Players are told apart by nickname plus an installation id; there are no
  accounts.

The server logs what happens to stdout (connections, data received, runs
starting and ending).

### Admin page

With `ADMIN_PASSWORD` set, `http://<host>:<ADMIN_PORT>/` shows what the server
is doing (game data, farm, run, connections), who is here (with a kick
button), the join password (set or remove it) and the last lines of the log.
It manages the server, not the game. Every request but the page itself needs
`Authorization: Bearer <ADMIN_PASSWORD>` (`/api/status`, `/api/log?lines=N`,
`POST /api/kick {"peer"}`, `POST /api/password {"password"}`). It is plain
HTTP: keep its port off the internet or put it behind TLS.

With Docker (first draft, not yet tested):

```sh
docker build -t potato-server .
docker run --rm -p 8080:8080 -p 8081:8081 -e ADMIN_PASSWORD=admin \
  -v potato-data:/data -e DATA_DIR=/data potato-server
```

## License

[Apache 2.0](LICENSE)
