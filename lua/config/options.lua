-- 옵션은 lazy.nvim 시작 전에 자동으로 로드됩니다.
-- 항상 설정되는 기본 옵션: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- 추가 옵션은 여기에 작성합니다.

-- 스펠체크를 비활성화합니다.
vim.opt.spell = false

-- Neovim 밖에서 파일이 변경되면 버퍼가 다시 읽을 수 있게 합니다.
-- checktime을 실행하는 트리거는 config/autocmds.lua에 있습니다.
vim.opt.autoread = true
