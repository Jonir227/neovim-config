local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim을 추가하고 기본 플러그인을 가져옵니다.
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- 사용자 플러그인을 가져오거나 기본 설정을 덮어씁니다.
    { import = "plugins" },
  },
  defaults = {
    -- 기본적으로 LazyVim 플러그인만 lazy-load됩니다. 사용자 플러그인은 시작 시 로드됩니다.
    -- 모든 사용자 플러그인도 기본적으로 lazy-load하고 싶다면 `true`로 설정합니다.
    lazy = false,
    -- 버전 태그를 지원하는 플러그인 중 오래된 릴리스가 있는 경우가 있어 false를 권장합니다.
    -- 오래된 릴리스는 Neovim 설정을 깨뜨릴 수 있습니다.
    version = false, -- 항상 최신 git commit을 사용합니다.
    -- version = "*", -- semver를 지원하는 플러그인은 최신 stable 버전을 설치하도록 시도합니다.
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- 플러그인 업데이트를 주기적으로 확인합니다.
    notify = false, -- 업데이트 알림은 표시하지 않습니다.
  }, -- 플러그인 업데이트를 자동으로 확인합니다.
  performance = {
    rtp = {
      -- 일부 rtp 플러그인을 비활성화합니다.
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
