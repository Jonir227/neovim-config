-- autocmd는 VeryLazy 이벤트에서 자동으로 로드됩니다.
-- 항상 설정되는 기본 autocmd: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- 추가 autocmd는 `vim.api.nvim_create_autocmd`로 여기에 작성합니다.
--
-- 기존 autocmd는 그룹 이름으로 제거할 수 있습니다. LazyVim 기본 그룹은 `lazyvim_` 접두사를 사용합니다.
-- 예: vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 에디터로 돌아오거나 유휴 상태가 되면 Neovim 밖에서 변경된 파일을 다시 확인합니다.
local checktime_group = vim.api.nvim_create_augroup("user_checktime", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = checktime_group,
  pattern = "*",
  callback = function()
    -- 명령줄 입력이 활성화된 동안에는 :checktime을 실행하지 않습니다.
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- 문서형 파일에서 LazyVim의 줄바꿈은 유지하고 스펠체크만 비활성화합니다.
local prose_spell_group = vim.api.nvim_create_augroup("user_prose_no_spell", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = prose_spell_group,
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Normal 모드에서 커서가 멈춘 위치의 진단을 보여줍니다.
local diagnostic_float_group = vim.api.nvim_create_augroup("user_diagnostic_float", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic_float_group,
  callback = function()
    if vim.fn.mode() == "n" then
      vim.diagnostic.open_float({
        border = "rounded",
        focusable = false,
        scope = "cursor",
        source = "if_many",
      })
    end
  end,
})

-- eslint-lsp가 연결된 버퍼는 저장 전에 ESLint fix-all 명령을 실행합니다.
local eslint_fix_group = vim.api.nvim_create_augroup("user_eslint_fix_all", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = eslint_fix_group,
  callback = function(args)
    local client = args.data and vim.lsp.get_client_by_id(args.data.client_id) or nil
    if not client or client.name ~= "eslint" then
      return
    end

    vim.api.nvim_clear_autocmds({ group = eslint_fix_group, buffer = args.buf })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = eslint_fix_group,
      buffer = args.buf,
      callback = function()
        vim.cmd.LspEslintFixAll()
      end,
    })
  end,
})
