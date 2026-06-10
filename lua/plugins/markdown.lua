return {
  -- 마크다운 LSP 설정
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  -- 마크다운 렌더링 플러그인
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    cmd = { "RenderMarkdown" },
    opts = {
      render_modes = { "n", "c", "t" },
      code = {
        enabled = true,
        sign = false,
        style = "full",
        position = "left",
        language_pad = 1,
        disable_background = { "diff" },
      },
      heading = {},
    },
  },
  -- 마크다운 포매터 설정
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      },
    },
  },
}
