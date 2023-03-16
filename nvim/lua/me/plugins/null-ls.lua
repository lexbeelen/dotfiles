local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
 on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr})
                end,
            })
        end
    end,
	sources = {
		require("null-ls").builtins.code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),
		require("null-ls").builtins.code_actions.gitsigns,
		require("null-ls").builtins.code_actions.proselint,
		require("null-ls").builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),
		require("null-ls").builtins.diagnostics.proselint,
		require("null-ls").builtins.diagnostics.gitlint,
		require("null-ls").builtins.diagnostics.solhint,
		require("null-ls").builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
		require("null-ls").builtins.formatting.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js" })
			end,
		}),
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.pint,
		require("null-ls").builtins.formatting.phpcsfixer,
		require("null-ls").builtins.formatting.jq,
		require("null-ls").builtins.formatting.rustywind,
		require("null-ls").builtins.formatting.stylua,
	},
})
