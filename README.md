# Neovim 설정

[LazyVim](https://github.com/LazyVim/LazyVim) starter 기반 개인 설정입니다.

## 활성화한 extras

`:LazyExtras`로 다음을 켰습니다. 웹 프론트엔드 작업이 주 용도입니다.

- AI: Copilot
- 언어: TypeScript, JSON
- 포맷/린트: Prettier, ESLint
- 유틸: GitHub CLI 연동

## 파일 동기화

`autoread`를 켜고 포커스 복귀·유휴 시점에 `checktime`을 실행합니다. AI 에이전트가 에디터 밖에서 파일을 수정해도 버퍼에 자동으로 반영되게 하려는 의도입니다.

## 진단 표시

Normal 모드에서 커서가 멈추면 그 위치의 diagnostics를 포커스를 빼앗지 않는 floating window로 띄웁니다. 단축키 없이 흐름을 끊지 않고 문제를 확인하기 위함입니다.

## 문서 작업

전역 spell check를 끄고, 산문 계열 파일에서도 spell만 끈 채 줄바꿈 동작은 유지합니다.

마크다운은 LazyVim에 `lang.markdown` extra가 있지만 markdownlint가 함께 묶여 있어, lint 없이 쓰고 싶어 extra 대신 직접 설정했습니다. `marksman` LSP와 `render-markdown.nvim`으로 편집 경험을 살리고, 저장 시 Prettier로만 정리합니다.

## 파일 탐색

snacks picker와 explorer 모두 숨김·gitignore 파일까지 노출하고(`node_modules`만 제외) gitignore된 작업 디렉터리도 탐색할 수 있게 합니다. explorer는 사이드바로 고정하고 `Esc`로 실수로 닫히지 않게 합니다.

## 자동완성과 린트/포맷

`blink.cmp`는 `super-tab` 프리셋으로 Tab 중심 흐름을 따릅니다. 저장 시 ESLint는 자동 수정 가능한 규칙을 고치고, 포매팅은 Prettier가 맡도록 역할을 나눕니다.
