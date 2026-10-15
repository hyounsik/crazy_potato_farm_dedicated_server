# Dedicated server image. Rough first version: not yet built or run in CI.
#
#   docker build -t potato-server .
#   docker run --rm -p 8080:8080 potato-server
#   curl localhost:8080/health

FROM dart:stable AS build
WORKDIR /app

# Resolve the whole pub workspace first so this layer caches between edits.
COPY pubspec.yaml pubspec.lock ./
COPY packages/potato_core/pubspec.yaml packages/potato_core/
COPY packages/potato_session/pubspec.yaml packages/potato_session/
RUN dart pub get

COPY . .
RUN dart pub get --offline && dart compile exe bin/server.dart -o /app/server

# The compiled server only needs the Dart runtime libraries.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/server /app/server

ENV PORT=8080
EXPOSE 8080
# The server shuts down cleanly on SIGINT.
STOPSIGNAL SIGINT
ENTRYPOINT ["/app/server"]
