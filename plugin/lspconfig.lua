--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.csharp_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.ts_ls.setup({
	on_attach = on_attach,
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	cmd = {
		"typescript-language-server",
		"--stdio",
	},
	commands = {
		-- OrganizeImports = {
		-- 	organize_imports,
		-- 	description = "Organize Imports",
		-- },
	},
	capabilities = capabilities,
})

nvim_lsp.graphql.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "graphql", "typescriptreact", "javascriptreact" },
	cmd = { "graphql-lsp", "server", "-m", "stream" },
})

nvim_lsp.sqls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- nvim_lsp.angularls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"jsx",
		"tsx",
		"javascriptreact",
		"typescriptreact",
	},
})

nvim_lsp.sourcekit.setup({
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.solidity.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "solidity" },
})

nvim_lsp.jedi_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.svelte.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.vuels.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.prismals.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

capabilities.offsetEncoding = { "utf-16" }

nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = " ", Warn = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
