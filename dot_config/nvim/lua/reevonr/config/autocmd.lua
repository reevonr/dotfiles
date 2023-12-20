local config_group = vim.api.nvim_create_augroup("reevonr", {}) -- A global group for all your config autocommand
-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  group = config_group,
  pattern = {
    "OverseerForm",
    "OverseerList",
    "checkhealth",
    "floggraph",
    "git",
    "gitcommit",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
    "neoai-input",
    "neoai-output",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- tree will be toggled on after session load
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function() require("nvim-tree.api").tree.toggle(false, true) end,
})

-- Important: This will close anything non-buffer,
-- including notifications, neotree, aerial...
-- So if you need to keep them open, use 'VimLeavePre'.
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  group = config_group,
  callback = function()
    if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" and not vim.bo.filetype ~= "gitrebase" then
      require("session_manager").save_current_session()
    end
  end,
})

-- terraformls tfvars file gives error, so we need to set the filetype to terraform
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tfvars" },
  group = config_group,
  callback = function() vim.cmd("set filetype=terraform") end,
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = config_group,
  pattern = "*",
  callback = function() vim.highlight.on_yank({ timeout = 500 }) end,
})
