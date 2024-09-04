dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
end

-- disable semantic tokens
M.on_init = function(client, _)
  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_init = M.on_init,
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

require("lspconfig").clangd.setup {
  on_attach = function()
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = M.capabilities,
}

require("lspconfig").nixd.setup {}

require'lspconfig'.bashls.setup{}

require'lspconfig'.marksman.setup{}

local dap = require('dap')

-- LLDB configuration
 dap.adapters.lldb = {
     type = 'executable',
     command = '/home/nixos/.nix-profile/bin/lldb-dap', -- Adjust this path if needed
     name = "lldb"
 }

 dap.configurations.cpp = {
     {
         name = "Launch",
         type = "lldb",
         request = "launch",
         program = function()
             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/')
         end,
         cwd = '${workspaceFolder}',
         stopOnEntry = false,
         args = {},
         runInTerminal = false,
     },
 }

 -- Same configuration for C
 dap.configurations.c = dap.configurations.cpp

-- Setup dap-ui to auto-open and close with debugging sessions
require("dapui").setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    require("dapui").open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    require("dapui").close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    require("dapui").close()
end

return M
