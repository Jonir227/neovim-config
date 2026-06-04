local function remove_item(items, item)
  return vim.tbl_filter(function(value)
    return value ~= item
  end, items or {})
end

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
          -- Snacks 탐색기 설정
          explorer = {
            hidden = true,
            ignored = false,
            -- plan 디렉터리는 gitignore되어 있지만 탐색기에서는 보이도록 설정합니다.
            include = {
              "plan/**",
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
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- LazyVim 마크다운 추가 기능을 활성화해도 markdownlint는 자동 설치하지 않습니다.
      opts.ensure_installed = remove_item(opts.ensure_installed, "markdownlint-cli2")
    end,
  },
}
