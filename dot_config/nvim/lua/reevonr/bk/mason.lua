return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-null-ls.nvim",
  },
  build = ":MasonUpdate",
  cmd = "Mason",
  config = function()
    -- import mason plugin safely
    local mason = require("mason")

    -- import mason-lspconfig plugin safely
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-null-ls plugin safely
    local mason_null_ls = require("mason-null-ls")

    -- enable mason
    mason.setup({})

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "terraformls",
        "tflint",
        "dockerls",
        "docker_compose_language_service",
        "helm_ls",
        "bashls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- ts/js formatter
        "eslint_d", -- ts/js linter
        "tfsec",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
