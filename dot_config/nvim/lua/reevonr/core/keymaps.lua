vim.g.mapleader = " "

SETNL("nh", ":nohl<CR>", { desc = "Clear search highlights" })

SETNL("wsv", "<C-w>v", { desc = "Split window vertically" })
SETNL("wsh", "<C-w>s", { desc = "Split window horizontally" })
SETNL("wse", "<C-w>=", { desc = "Make splits equal size" })
SETNL("px", ":close<CR>", { desc = "Close current split" })

SETNL("to", ":tabnew<CR>", { desc = "Open new tab" })
SETNL("tx", ":tabclose<CR>", { desc = "Close current tab" })
SETNL("tn", ":tabn<CR>", { desc = "Go to next tab" })
SETNL("tp", ":tabp<CR>", { desc = "Go to prev tab" })
