local km = vim.keymap
local function set(mode, key, call, desc)
	km.set(mode, key, call, desc)
end

local function setn(key, call, desc)
	km.set("n", key, call, desc)
end

function _G.SETNL(key, call, desc)
	setn(("<leader>" .. key), call, desc)
end

vim.g.SETNL = _G.SETNL

require("reevonr.core")
require("reevonr.plugins-setup")
