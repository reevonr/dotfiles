local Remap = require("reevonr.core.keymaps")
local setnl = Remap.nlnoremap
local silent = { silent = true }
local tnoremap = Remap.tnoremap
local nnoremap = Remap.nnoremap

setnl("nh", ":nohl<CR>", { desc = "Clear search highlights" })

--nnoremap("tt", "<Cmd>sp<CR> <Cmd>term<CR> <Cmd>resize 10N<CR> i", silent)
--tnoremap("<C-c><C-c>", "<C-\\><C-n>", silent)
--tnoremap("<D-v>", function()
 -- local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>\"+pi", true, false, true)
 -- vim.api.nvim_feedkeys(keys, "n", false)
--end, silent)

--Tab management
setnl("to", ":tabnew<CR>", { desc = "Open new tab" })
setnl("tx", ":tabclose<CR>", { desc = "Close current tab" })
setnl("tn", ":tabn<CR>", { desc = "Go to next tab" })
setnl("tp", ":tabp<CR>", { desc = "Go to prev tab" })

--Buffer management

--harpoon
setnl("hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
setnl("hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
setnl("hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" })

-- window management
setnl("w-", "<C-w>s", { desc = "Split window horizontally" })
setnl("w|", "<C-w>v", { desc = "Split window vertically" })
setnl("we", "<C-w>=", { desc = "Make splits equal size" })
setnl("px", ":close<CR>", { desc = "Close current split" })
