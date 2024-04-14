local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "reevonr.plugins" },
    { import = "reevonr.lspdap" },
    { import = "reevonr.server" },
  },
  defaults = { lazy = true, version = nil },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    -- ★  runtime/plugin/editorconfig.lua 2.77ms
    --         ★  runtime/plugin/nvim.lua 2.79ms
    --         ★  runtime/plugin/rplugin.vim 2.19ms
    --         ★  runtime/plugin/shada.vim 1.67ms
    --         ★  runtime/plugin/spellfile.vim 1.46ms
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "netrwPlugin",
        "tutor",
        "man",
        "zipPlugin",
      },
    },
  },
})
