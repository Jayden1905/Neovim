local status, cmp = pcall(require, "cmp")
if not status then
	return
end

-- local lspkind = require("lspkind")
local icons = require("jayden.icons")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
-- 	return
-- end

local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("typescript", { "typescriptreact" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- elseif luasnip.expand_or_jumpable() then
			-- 	luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
				-- elseif luasnip.jumpable(-1) then
				-- 	luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "copilot", group_index = 2 },
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
		{ name = "buffer", group_index = 2 },
	}),
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = lspkind.cmp_format({
	-- 		mode = "symbol",
	-- 		max_width = 50,
	-- 		symbol_map = { Copilot = "" },
	-- 	}),
	-- },
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = icons.kind[vim_item.kind] .. " " .. vim_item.kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
				copilot = "[Copilot]",
			})[entry.source.name]
			if entry.source.name == "copilot" then
				vim_item.kind = icons.git.Octoface
				vim_item.kind_hl_group = "CmpItemKindCopilot"
			end
			return vim_item
		end,
	},
	{
		name = "nvim_lsp",
		filter = function(entry, ctx)
			local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
			if kind == "Snippet" and ctx.prev_context.filetype == "java" then
				return true
			end

			if kind == "Text" then
				return true
			end
		end,
		group_index = 2,
	},
})
