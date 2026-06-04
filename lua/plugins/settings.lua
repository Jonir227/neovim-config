return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = false,
            exclude = {
              "node_modules",
            },
          },
          -- Snacks Explorer
          explorer = {
            hidden = true,
            ignored = false,
            -- Plan Directory는 gitignore되어있지만, Explorer에서는 보이도록 설정
            include = {
              "plan/**",
            },
            -- Explorer가 Esc로 닫히지 않도록 설정
            win = {
              input = {
                keys = {
                  ["<esc>"] = { "", mode = "n" },
                },
              },
              list = {
                keys = {
                  ["<esc>"] = { "", mode = "n" },
                },
              },
            },
          },
        },
      },
    },
  },
}
