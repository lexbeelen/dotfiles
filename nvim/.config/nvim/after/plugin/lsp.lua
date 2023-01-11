local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp = require('lsp-zero')
lsp.preset('recommended')

local null_ls = require('null-ls')

local null_opts = lsp.build_options('null-ls', {
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
 vim.lsp.buf.format()
                end,
            })
        end
    end,
})

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua'
})

null_ls.setup({
    on_attach = null_opts.on_attach,
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
    }
})

lsp.setup()
