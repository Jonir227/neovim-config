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
        layout = {
          preset = "default",
          layout = {
            width = 0.9,
            height = 0.9,
          },
        },
        sources = {
          files = {
            layout = {
              preset = "default",
              layout = {
                width = 0.9,
                height = 0.9,
              },
            },
            hidden = true,
            ignored = true,
            exclude = {
              "node_modules",
            },
          },
          -- Snacks 탐색기 설정
          explorer = {
            layout = {
              layout = {
                preset = "sidebar",
                preview = false,
                width = 40,
                minWidth = 40,
              },
            },
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
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 라인 끝에 표시
        delay = 1000,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },
}
