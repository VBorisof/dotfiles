local base = require("nvchad.configs.lspconfig")
base.defaults()

local servers = {
  "html",
  "cssls",
  "clangd",
  "codelldb",
  "gopls",
  "omnisharp",
  "tsserver"
}

local on_attach = base.on_attach
local capabilities = base.capabilities

vim.lsp.config(
  '*', {
    on_attach = on_attach,
    capabilities = capabilities,
    root_markers = { '.git' }
  }
)

--vim.lsp.config.tsserver = {
--  cmd = {
--    'typescript-language-server',
--    '--stdio'
--  }
--}
vim.lsp.config.clangd = {
  on_attach = function(client, bufnr)
    -- client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
}
--vim.lsp.config(
--  'omnisharp', {
--    on_attach = on_attach,
--    capabilities = capabilities
--  }
--)
--vim.lsp.config(
--  'tsserver', {
--    on_attach = on_attach,
--    capabilities = capabilities
--  }
--)
vim.lsp.enable(servers)
