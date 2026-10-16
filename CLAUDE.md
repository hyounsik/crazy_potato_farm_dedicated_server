# crazy_potato_farm_dedicated_server

감자 농장 게임의 전용 서버(dedicated server)와, 클라이언트와 공유하는 게임 코드. 누구나 직접 띄울 수 있도록 공개하는 저장소다 (Apache 2.0).

- 리모트: `git@github.com:hyounsik/crazy_potato_farm_dedicated_server.git` (SSH)
- 한국어로 대화하고, 문서도 한국어로 쓴다. 코드 주석과 커밋 메시지는 영어.

## 공개 저장소 주의

이 저장소는 **공개**다. 게임 클라이언트와 기획 문서는 별도의 비공개 저장소에 있다.
- 비공개 내용(클라이언트 코드, 기획 문서, 과금 설계, 출시 전 콘텐츠)을 코드·주석·문서·커밋 메시지에 넣지 않는다.
- 옆 폴더 `../crazy_potato_farm`이 있으면 그 저장소의 `CLAUDE.md`를 먼저 읽는다. 기획과 진행 현황은 그쪽이 기준이다. 그 내용을 이 저장소로 옮겨 적지 않는다.

## 구조

Dart [pub workspace](https://dart.dev/tools/pub/workspaces)다. 루트에서 `dart pub get` 한 번으로 모든 패키지가 준비된다.

| 경로 | 내용 | 규칙 |
|---|---|---|
| `packages/potato_core` | 게임 규칙 | 순수 Dart. Flutter와 I/O(`dart:io`, 네트워크, 파일) 금지 |
| `packages/potato_session` | 세션 호스팅. 클라이언트의 호스트 모드와 전용 서버가 함께 쓴다 | Flutter 금지. `potato_core`를 re-export한다 |
| 루트 (`bin/`, `lib/`) | 전용 서버 실행 파일 (`potato_dedicated_server`) | 서버에서만 쓰는 코드는 여기에 둔다 |

## 클라이언트가 이 저장소를 쓰는 방식

클라이언트는 `potato_session` **하나만** git 의존성으로 가져온다. `potato_core`는 `potato_session`을 통해 함께 들어온다.
- 같은 저장소를 git 의존성 두 개로 가져오면 pub이 서로 다른 출처로 보고 충돌한다. 그래서 `potato_session`이 `potato_core`를 re-export한다.
- 패키지끼리는 상대 경로(`path: ../potato_core`)로 의존한다. `any`로 적으면 workspace 밖에서 pub.dev를 찾다가 실패한다.
- 클라이언트는 태그(`ref: vX.Y.Z`)로 고정한다. 클라이언트가 쓸 변경을 마치면 태그를 올린다.

## 문서

- 코드 가이드는 `docs/guides/<domain>-code-guide.md`(kebab-case)에 둔다. 작성 형식은 클라이언트 저장소의 형식 문서를 따른다 (옆 폴더에 클라이언트 저장소가 있을 때 `docs/guides/domain-code-guide-format.md`).
- 공개 문서이므로 기획 근거 대신 기술적 결정만 적고, 비공개 저장소 문서로 링크하지 않는다.

## 코드 규칙

- lint: `lints/recommended` + `avoid_print`, `prefer_single_quotes`, `always_use_package_imports`.
- 서버 실행 파일의 로그는 `stdout`/`stderr`로 쓴다 (컨테이너·서비스 로그에 남도록).
- 코드를 바꾸면 루트에서 `dart format .` → `dart analyze` → `dart test`. 패키지 테스트는 그 패키지 폴더에서 `dart test`.
- 모델(데이터 카탈로그, 세이브 문서, 명령·이벤트)은 Freezed + json_serializable이다. 키는 snake_case, `checked: true`(`packages/potato_core/build.yaml`). 모델을 고치면 패키지 폴더에서 `dart run build_runner build`.
- **생성 파일(`*.freezed.dart`, `*.g.dart`)은 커밋한다.** 클라이언트가 git 의존성으로 받을 때는 코드 생성이 돌지 않기 때문이다.
- `potato_core`는 웹에서도 같은 결과를 내야 한다. 정수 연산은 32비트 안에서 하고(웹 정수는 53비트까지만 정확), 무작위는 `dart:math` `Random` 대신 `GameRandom`을 쓴다. 확인: `dart test -p node test/common`.
- 서버 실행: `dart run bin/server.dart` (포트는 `PORT` 환경 변수, 기본 8080). 상태 확인: `GET /health`.

## 규칙 문서는 두 벌

- `CLAUDE.md`와 `GEMINI.md`는 같은 규칙을 담는다. 한쪽을 고치면 다른 쪽도 같은 커밋에서 함께 고친다.

## Git

- 커밋·push는 사용자가 요청할 때만 한다.
- 커밋 메시지는 영어, 제목 한 줄 + 변경 요약 목록.
