local Remap = require("reevonr.core.keymaps")
local setnl = Remap.nlnoremap
local silent = { silent = true }
local tnoremap = Remap.tnoremap
local nnoremap = Remap.nnoremap

setnl("nh", ":nohl<CR>", { desc = "Clear search highlights" })

nnoremap("tt", "<Cmd>sp<CR> <Cmd>term<CR> <Cmd>resize 10N<CR> i", silent)
tnoremap("<C-c><C-c>", "<C-\\><C-n>", silent)
tnoremap("<D-v>", function()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>\"+pi", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, silent)

--Tab management
setnl("to", ":tabnew<CR>", { desc = "Open new tab" })
setnl("tx", ":tabclose<CR>", { desc = "Close current tab" })
setnl("tn", ":tabn<CR>", { desc = "Go to next tab" })
setnl("tp", ":tabp<CR>", { desc = "Go to prev tab" })

--Buffer management

--harpoon
-- setnl("hf", , { desc =  }) -- show harpoon marks
setnl("hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
setnl("hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
setnl("hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" })

--Auto-sessions

setnl("wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
setnl("ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- Trouble remaps
setnl("<F2>", "<cmd>TroubleToggle<cr>", { desc = "toggle trouble tree" })
setnl(
  "tw",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { desc = "workspace diagnostics from the builtin LSP client" }
)
setnl(
  "td",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  { desc = "document diagnostics from the builtin LSP client" }
)
setnl("tq", "<cmd>TroubleToggle quickfix<cr>", { desc = "quickfix items" })
setnl("tl", "<cmd>TroubleToggle loclist<cr>", { desc = "items from the window's location list" })
setnl(
  "tR",
  "<cmd>TroubleToggle lsp_references<cr>",
  { desc = "references of the word under the cursor from the builtin LSP client" }
)

-- Undo Tree
setnl("u", vim.cmd.UndotreeToggle)

--setnl("gc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
--keymap.set(
--"n",
--	"<leader>gfc",
--	"<cmd>Telescope git_bcommits<cr>",
--	{ desc = "Show git commits for current buffer" }
--) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- setnl("gb", "<cmd>Telescope git_branches<cr>",--[[   ]]{ desc = "Show git branches" }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- setnl("gs", "<cmd>Telescope git_status<cr>", { desc = "Show current git changes per file" }) -- list current changes per file with diff preview ["gs" for git status]
-- setnl("wsh", "<C-w>s", { desc = "Split window horizontally" })
-- setnl("wse", "<C-w>=", { desc = "Make splits equal size" })
-- setnl("px", ":close<CR>", { desc = "Close current split" })

-- setnl("wsv", "<C-w>v", { desc = "Split window vertically" })
