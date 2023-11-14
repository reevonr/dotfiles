return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>u"] = { name = "Undotree" },
      },
    },
  },
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Toggle undotree" } },
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    keys = {
      { "<leader><F2>t", "<cmd>TroubleToggle<cr>", { desc = "toggle trouble tree" } },
      {
        "<leader><F2>w",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { desc = "workspace diagnostics from the builtin LSP client" },
      },
      {
        "<leader><F2>d",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        { desc = "document diagnostics from the builtin LSP client" },
      },
      { "<leader><F2>q", "<cmd>TroubleToggle quickfix<cr>", { desc = "quickfix items" } },
      { "<leader><F2>l", "<cmd>TroubleToggle loclist<cr>", { desc = "items from the window's location list" } },
      {
        "<leader><F2>R",
        "<cmd>TroubleToggle lsp_references<cr>",
        { desc = "references of the word under the cursor from the builtin LSP client" },
      },
    },
    config = function() require("which-key").register({ mode = { "n" }, ["<leader><F2>"] = { name = "+Trouble" } }) end,
  },
  {
    "Shatur/neovim-session-manager",
    opts = {},
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
    config = function(_, _)
      local opts = {
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
      require("Comment").setup(opts)
    end,
  },
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    config = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
  },
}