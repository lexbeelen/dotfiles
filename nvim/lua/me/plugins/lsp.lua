require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "tsserver", "intelephense", "tailwindcss", "eslint"},
    automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['tailwindcss'].setup{
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
}

require('lspconfig')['intelephense'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig')['jsonls'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})
