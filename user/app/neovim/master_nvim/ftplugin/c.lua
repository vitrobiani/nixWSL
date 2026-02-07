-- ~/.config/nvim/ftplugin/c.lua

local M = {}

M.general = {
  n = {
    ["K"] = {"<cmd> Man <CR>", "Show Man"},
  },
}

-- Apply the mappings
for mode, mappings in pairs(M.general) do
  for key, map in pairs(mappings) do
    vim.keymap.set(mode, key, map[1], { noremap = true, silent = true, desc = map[2] })
  end
end
