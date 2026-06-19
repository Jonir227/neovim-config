return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "obsidian",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian",
      },
    },
    picker = {
      name = "snacks.picker",
    },
    daily_notes = {
      enabled = true,
      folder = "02-Diary",
      template = "99-Template/일기 템플릿.md",
    },
  },
}
