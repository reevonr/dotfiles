return {
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Toggle undotree" } },
  },
  {
    "folke/trouble.nvim",
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
    config = function() end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, _) require("Comment").setup() end,
  },
}
