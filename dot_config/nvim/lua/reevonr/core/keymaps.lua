vim.g.mapleader = " "

setnl("nh", ":nohl<CR>", { desc = "Clear search highlights" })

setnl("wsv", "<C-w>v", { desc = "Split window vertically" })
setnl("wsh", "<C-w>s", { desc = "Split window horizontally" })
setnl("wse", "<C-w>=", { desc = "Make splits equal size" })
setnl("px", ":close<CR>", { desc = "Close current split" })

setnl("to", ":tabnew<CR>", { desc = "Open new tab" })
setnl("tx", ":tabclose<CR>", { desc = "Close current tab" })
setnl("tn", ":tabn<CR>", { desc = "Go to next tab" })
setnl("tp", ":tabp<CR>", { desc = "Go to prev tab" })
