local options = {
  autoindent = true,
  smartindent = true,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  showtabline = 0,
  showmatch = true,

  number = true,
  relativenumber = true,
  numberwidth = 4,
  incsearch = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  termguicolors = true,
  hidden = true,
  signcolumn = "yes",
  showmode = false,
  errorbells = false,
  wrap = false,
  cursorline = true,
  fileencoding = "utf-8",

  backup = false,
  writebackup = false,
  swapfile = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  colorcolumn = "80",
  updatetime = 20,
  scrolloff = 15,

  title = true,
  titlestring = "Nvim - %t",
  guifont = "MesloLGS NF:h18",
  backspace = "indent,eol,start",
  background = "dark",
}

local opt = vim.opt

opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")

vim.cmd([[set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case]])
vim.cmd([[set grepformat=%f:%l:%c:%m,%f:%l:%m]])

for option, value in pairs(options) do
  vim.opt[option] = value
end
