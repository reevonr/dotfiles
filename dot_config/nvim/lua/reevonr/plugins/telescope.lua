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
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      mode = "n",
      desc = "Fuzzy find files in cwd",
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      mode = "n",
      desc = "Fuzzy find recent files",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      mode = "n",
      desc = "Find string in cwd",
    },
    {
      "<leader>fc",
      "<cmd>Telescope grep_string<cr>",
      mode = "n",
      desc = "Find string under cursor in cwd",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      mode = "n",
      desc = "Show open buffers",
    },
    {
      "<leader>fh",
      "<cmd>Telescope harpoon marks<cr>",
      mode = "n",
      desc = "Show harpoon marks",
    },
  },
  config = function()
    require("which-key").register({ mode = { "n" }, ["<leader>f"] = { name = "+Telescope" } })

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
        layout_strategy = "vertical",
        path_display = { "truncate" },
        layout_config = {
          height = 0.99,
          width = 0.99,
          vertical = {
            prompt_position = "top",
            mirror = true,
            preview_cutoff = 0,
          },
        },
        preview = true,
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
