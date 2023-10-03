return {
  { "nvim-lua/plenary.nvim", lazy = false }, -- lua functions that many plugins use
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" }, -- tmux & split window navigation
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+Tab" },
      },
    },
    config = function()
      local Remap = require("reevonr.core.keymaps")
      local setnl = Remap.nlnoremap
      setnl("to", ":tabnew<CR>", { desc = "Open new tab" })
      setnl("tx", ":tabclose<CR>", { desc = "Close current tab" })
      setnl("tn", ":tabn<CR>", { desc = "Go to next tab" })
      setnl("tp", ":tabp<CR>", { desc = "Go to prev tab" })
    end,
  },
}
