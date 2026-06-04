# Neovim 설정

[LazyVim](https://github.com/LazyVim/LazyVim)을 기반으로 한 개인 Neovim 설정입니다.

## 활성화한 LazyVim 추가 기능

- `lazyvim.plugins.extras.ai.copilot`
- `lazyvim.plugins.extras.formatting.prettier`
- `lazyvim.plugins.extras.lang.json`
- `lazyvim.plugins.extras.lang.markdown`
- `lazyvim.plugins.extras.lang.typescript`
- `lazyvim.plugins.extras.linting.eslint`

## 자동완성

`blink.cmp`는 `super-tab` 프리셋을 사용합니다.

## 선택기와 탐색기

Snacks 선택기는 숨김 파일은 보여주되, gitignore된 파일은 기본적으로 제외하도록 설정했습니다.

- `files`: 숨김 파일을 보여주고, `node_modules`를 제외하며, gitignore된 파일 전체를 포함하지 않습니다.
- `explorer`: 숨김 파일을 보여주고, gitignore된 `plan/**` 디렉터리는 명시적으로 포함합니다.
- Snacks 탐색기의 input/list 창에서는 실수로 탐색기가 닫히지 않도록 `Esc`를 비활성화했습니다.

## 파일 다시 읽기

Neovim 밖에서 변경된 파일을 버퍼가 다시 읽을 수 있도록 `autoread`를 활성화했습니다.

Neovim이 포커스를 다시 얻거나, 버퍼에 진입하거나, 유휴 상태가 되면 `checktime`을 실행합니다. 설정을 다시 로드해도 autocmd가 중복 등록되지 않도록 `clear = true`인 그룹을 사용합니다.

## 진단

Normal 모드에서 커서가 코드 위에 머무르면 현재 커서 위치의 diagnostics를 포커스를 가져가지 않는 둥근 floating window로 보여줍니다.

## 마크다운

미리보기와 렌더링 지원을 위해 LazyVim의 마크다운 추가 기능을 활성화했습니다.

`markdownlint-cli2`는 Mason 자동 설치 대상에서 제외했습니다. 설치되어 있지 않은 환경에서는 마크다운 lint 진단과 fix가 실행되지 않습니다.

## ESLint 자동 수정

`eslint-lsp`가 버퍼에 연결되면 저장 전에 `LspEslintFixAll`을 자동으로 실행합니다.

이 동작은 Prettier formatting과 별도입니다.

- ESLint는 import 정리나 unused import 제거처럼 자동 수정 가능한 lint rule을 처리합니다.
- Prettier는 LazyVim의 기존 format-on-save 흐름을 통해 코드 formatting을 처리합니다.
