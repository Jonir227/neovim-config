-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable SpellCheck
vim.opt.spell = false

-- Allow buffers to reload after external file changes.
-- The checktime trigger itself lives in config/autocmds.lua.
vim.opt.autoread = true
