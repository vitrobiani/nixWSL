-- ~/.config/nvim/ftplugin/rust.lua

local M = {}

M.general = {
  n = {
    ['<F6>'] = { ":lua require'dapui'.toggle()<CR>" , "Open Dapui"},
    ['<F7>'] = { "<cmd> RustDebuggables <CR>" },
    ['<F10>'] = { ":lua require'dap'.step_over()<CR>" },
    ['<F11>'] = { ":lua require'dap'.step_into()<CR>" },
    ['<F12>'] = { ":lua require'dap'.step_out()<CR>" },
    ['<leader>bp'] = { ":lua require'dap'.toggle_breakpoint()<CR>" , "Toggle breakpoint" },
    ['<leader>dr'] = { ":lua require'dap'.repl.open()<CR>"},

    ["<C-E>"] = {"<cmd> RustLsp explainError cycle <CR>", "Explain Error"},
    ["<leader>ca"] = {"<cmd> RustLsp codeAction <CR>", "Code Actions"},
    ["<leader>ru"] = {"<cmd>RustLsp runnables<CR>", "Run"},
    ["<leader>oc"] = {"<cmd>RustLsp openCargo<CR>", "Open Cargo"},
    ["<leader>rc"] = {"function() require('crates').upgrade_all_crates() end", "update crates"},
  },
}

-- Apply the mappings
for mode, mappings in pairs(M.general) do
  for key, map in pairs(mappings) do
    vim.keymap.set(mode, key, map[1], { noremap = true, silent = true, desc = map[2] })
  end
end
