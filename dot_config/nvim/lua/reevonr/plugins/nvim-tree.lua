return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

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
      filters = {
        custom = { ".DS_Store" },
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
    })

    SETNL("ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    SETNL("ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    SETNL("ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    SETNL("er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
