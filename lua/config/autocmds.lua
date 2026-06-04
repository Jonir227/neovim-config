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
