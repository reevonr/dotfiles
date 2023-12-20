return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "zbirenbaum/copilot-cmp",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local compare = require("cmp.config.compare")
      require("copilot_cmp").setup()
      local source_names = {
        nvim_lsp = "(LSP)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        path = "(Path)",
      }
      local duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      }
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        completion = {
          completeopt = "menuone,noinsert,preview,noselect",
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.score,
            compare.recently_used,
            compare.offset,
            compare.exact,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-3),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-a>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping({
            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
            c = function(fallback)
              if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
          }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          --   if cmp.visible() then
          --     local entry = cmp.get_selected_entry()
          --     if not entry then
          --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --     else
          --       cmp.confirm()
          --     end
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s", "c" }),
        }),
        sources = cmp.config.sources({
          { name = "copilot", group_index = 1, max_item_count = 10 },
          { name = "nvim_lsp", group_index = 1, max_item_count = 10 },
          { name = "luasnip", group_index = 1, max_item_count = 10 },
          { name = "buffer", group_index = 2, max_item_count = 10 },
          { name = "path", group_index = 2, max_item_count = 10 },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = require("lspkind").cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            symbol_map = { Copilot = "" },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, item)
              local duplicates_default = 0
              item.menu = source_names[entry.source.name]
              item.dup = duplicates[entry.source.name] or duplicates_default
              return item
            end,
          }),
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
      },
    },
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<C-j>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
        end,
        expr = true, remap = true, silent = true, mode = "i",
      },
      { "<C-j>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    config = function(_, opts) require("luasnip").setup(opts) end,
  },
}
