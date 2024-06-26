if not require("reevonr.config").server_start.lua then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    ft = { "lua", "luau" },
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" }) end,
  },
  {
    "williamboman/mason.nvim",
    ft = "lua",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "stylua" }) end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = { "lua", "luau" },
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "lua", "luau" },
    dependencies = {
      "folke/neodev.nvim",
      opts = {},
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              diagnostics = {
                globals = { "vim" },
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
