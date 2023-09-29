local g = vim.g

g.python3_host_prog = "/opt/homebrew/bin/python3"
g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

require("reevonr.core")
require("reevonr.plugins-setup")
