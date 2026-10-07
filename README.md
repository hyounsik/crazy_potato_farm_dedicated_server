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
```

## License

[Apache 2.0](LICENSE)
