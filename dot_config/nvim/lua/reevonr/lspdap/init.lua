return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "shfmt",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
      --[[ local handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
        ["jdtls"] = function() return end,
        ["lua_ls"] = function() return end,
      }
      require("mason-lspconfig").setup_handlers(handlers) ]]
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        config = true,
      },
    },
    opts = {
      servers = {},
      setup = {},
    },
    config = function(plugin, opts)
      local wk = require("which-key")
      local keys = { mode = { "n", "v" }, ["<leader>l"] = { name = "+Lsp" } }
      wk.register(keys)
      require("reevonr.lspdap.lsp.servers").setup(plugin, opts)
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.shfmt,
        },
      }
    end,
  },
}
