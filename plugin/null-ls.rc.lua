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
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			extra_filetypes = { "astro", "svelte" },
		}),
		formatting.stylua,
		-- formatting.eslint_d,
		formatting.sql_formatter,
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.autopep8,
		formatting.google_java_format,
		formatting.clang_format.with({
			filetypes = { "c", "cpp", "objc", "objcpp" },
		}),
		formatting.prismaFmt,
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup_format,
			buffer = 0,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
})
