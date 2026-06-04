-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Reload files changed outside of Neovim when returning to the editor or idling.
local checktime_group = vim.api.nvim_create_augroup("user_checktime", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = checktime_group,
  pattern = "*",
  callback = function()
    -- Avoid running :checktime while the command-line window/input is active.
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Show diagnostics for the code under the cursor after pausing in Normal mode.
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

-- Run ESLint's fix-all command before saving buffers where eslint-lsp is attached.
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
