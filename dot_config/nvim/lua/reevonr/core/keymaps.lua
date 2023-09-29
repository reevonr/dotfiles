local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end
local function bindvnl()
  return function(lhs, rhs, opts) M.nnoremap("<leader>" .. lhs, rhs, opts) end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.nlnoremap = bindvnl()
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")

local km = vim.keymap

local function setn(key, call, desc) km.set("n", key, call, desc) end

return M
