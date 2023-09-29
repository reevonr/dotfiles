return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "smjonas/inc-rename.nvim",
      config = true,
    },
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- import typescript plugin
    local typescript = require("typescript")

    local keymap = vim.keymap -- for conciseness
    local Remap = require("reevonr.core.keymaps")
    local setnl = Remap.nlnoremap
    local setn = Remap.nnoremap
    local setn = Remap.vnoremap

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- set keybinds
      opts.desc = "Show LSP references"
      setn("gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      setn("gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      setn("gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      setn("gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      setn("gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      setnl("rn", ":IncRename ", opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      setnl("D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      setnl("d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      setn("[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      setn("]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      setn("K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      setnl("rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "tsserver" then
        opts.desc = "Rename file and update file imports"
        setnl("rf", ":TypescriptRenameFile<CR>") -- rename file and update imports

        opts.desc = "Rename file and update file imports"
        setnl("oi", ":TypescriptOrganizeImports<CR>", opts) -- organize imports (not in youtube nvim video)

        opts.desc = "Remove unused imports"
        setnl("ru", ":TypescriptRemoveUnused<CR>", opts) -- remove unused variables (not in youtube nvim video)
      end
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    typescript.setup({
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["terraformls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tflint"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["helm_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
