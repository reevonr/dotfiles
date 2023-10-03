return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "DaikyXendo/nvim-material-icon" },
  opts = {
    view = {
      width = 30,
    },
    -- change folder arrow icons
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
      highlight_opened_files = "all",
      highlight_modified = "all",
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    git = {
      ignore = false,
    },
    select_prompts = true,
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
    modified = {
      enable = true,
    },
    filters = {
      git_ignored = true,
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      custom = { ".DS_Store" },
      exclude = {},
    },
  },
  keys = {
    {
      "<leader><F1>t",
      "<cmd>NvimTreeToggle<CR>",
      mode = "n",
      desc = "Toggle file explorer",
    },
    {
      "<leader><F1>e",
      "<cmd>NvimTreeFindFileToggle<CR>",
      mode = "n",
      desc = "Toggle file explorer on current file",
    },
    {
      "<leader><F1>c",
      "<cmd>NvimTreeCollapse<CR>",
      mode = "n",
      desc = "Collapse file explorer",
    },
    {
      "<leader><F1>r",
      "<cmd>NvimTreeRefresh<CR>",
      mode = "n",
      desc = "Refresh file explorer",
    },
  },
  config = function(_, opts)
    require("which-key").register({ mode = { "n" }, ["<leader><F1>"] = { name = "+NvimTree" } })

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    require("nvim-tree").setup(opts)
  end,
}
