if not require("reevonr.config").server_start.python then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "python" }) end,
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts) local nls = require("null-ls") end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "pyright" }) end,
  },
}
