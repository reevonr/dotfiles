local locations = { "/Users/reevonr/.config", "/Users/reevonr/Documents/projects/nano" }

local function is_in_locations(cwd)
  for _, location in ipairs(locations) do
    if cwd:find(location) then
      return true
    end
  end
  return false
end

if not is_in_locations(vim.fn.getcwd()) then
  print("codeium disabled")
  return {}
end
return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = "VeryLazy",
  config = function() require("codeium").setup({ enable_chat = true }) end,
}
