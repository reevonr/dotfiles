return {
  { "nvim-lua/plenary.nvim", lazy = false }, -- lua functions that many plugins use
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" }, -- tmux & split window navigation
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+Tab" },
        { mode = { "n" }, ["<leader><F1>"] = { name = "+NvimTree" } },
        { mode = { "n" }, ["<leader><F2>"] = { name = "+Trouble" } },
        ["<leader>w"] = { name = "+Window" },
        ["<leader>h"] = { name = "+Harpoon" },
        ["<leader>f"] = { name = "+Telescope" },
        {
          mode = { "n", "v" },
          ["<leader>l"] = { name = "+Lsp" },
          { prefix = "<leader>" },
        },
        ["<leader>d"] = { name = "+DAP" },
        { mode = { "n", "v" }, ["<leader>lj"] = { name = "+Java" } },
      },
    },
    config = function(_, opts) require("which-key").register(opts.defaults) end,
  },
}
