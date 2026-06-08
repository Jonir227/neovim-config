return {
  -- blink.cmp supertab 설정
  -- https://main.cmp.saghen.dev/configuration/keymap.html#super-tab
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
    },
  },
  -- snacks
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "node_modules",
            },
          },
          -- Snacks 탐색기 설정
          explorer = {
            hidden = true,
            ignored = true,
            -- plan 디렉터리는 gitignore되어 있지만 탐색기에서는 보이도록 설정합니다.
            exclude = {
              "node_modules",
            },
            -- 탐색기가 Esc로 닫히지 않도록 설정합니다.
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
