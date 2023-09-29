return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
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
        dotfiles = true,
        git_clean = false,
        no_buffer = false,
        custom = { ".DS_Store" },
        exclude = {},
      },
    })
  end,
}
