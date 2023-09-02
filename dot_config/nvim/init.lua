local km = vim.keymap
function set(mode, key, call, desc)
	km.set(mode, key, call, desc)
end

function setn(key, call, desc)
	km.set("n", key, call, desc)
end

function setnl(key, call, desc)
	km.set("n", ("<leader>" .. key), call, desc)
end
require("reevonr.core")
require("reevonr.plugins-setup")
