if not require("reevonr.config").server_start.iac then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "terraform", "dockerfile" }) end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "terraform-ls", "helm-ls" }) end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- table.insert(opts.sources, nls.builtins.diagnostics.terraform_validate)
      table.insert(opts.sources, nls.builtins.diagnostics.hadolint)
    end,
  },
}
