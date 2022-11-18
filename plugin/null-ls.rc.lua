local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.fish,
		formatting.prettier.with({
			extra_filetypes = { "svelte" },
		}),
		formatting.stylua,
		formatting.sql_formatter,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.autopep8,
	},

	on_attach = function(client, bufnr)
		vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup_format,
			buffer = 0,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end,
})
