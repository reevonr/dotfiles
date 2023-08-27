local km = vim.keymap
function set(mode,key,call)
  km.set(mode,key,call)  
end

function setn(key,call)
  km.set("n",key,call)  
end

function setnl(key,call)
  km.set("n",("<leader>"..key),call)  
end
require("reevonr.core.options")
require("reevonr.core.keymaps")
require("reevonr.core.colorscheme")
require("reevonr.plugins-setup")
