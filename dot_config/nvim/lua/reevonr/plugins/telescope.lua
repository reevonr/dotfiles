return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
    "ThePrimeagen/harpoon",
  },
  lazy = false,
  config = function()
    -- import telescope plugin safely
    local telescope = require("telescope")

    -- import telescope actions safely
    local actions = require("telescope.actions")

    -- import telescope-ui-select safely
    local trouble = require("trouble.providers.telescope")

    -- configure telescope
    telescope.setup({
      -- configure custom mappings
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            ["<C-d>"] = trouble.open_with_trouble,
          },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("harpoon")
    telescope.load_extension("noice")
  end,
}
