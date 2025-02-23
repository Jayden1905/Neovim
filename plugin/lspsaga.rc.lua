require("lspsaga").setup({
	server_filetype_map = {
		typescript = "typescript",
	},
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = false,
	},
	implementation = {
		enable = true,
		sign = true,
		virtual_text = false,
		priority = 100,
	},
	implementation_icon = {
		text = " ",
		text_align = "left",
	},
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	ui = {
		enable = true,
		sign = true,
		virtual_text = false,
		-- currently only round theme
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		code_action = "",
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "",
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#001b21",
		},
		kind = {},
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set({ "n", "v" }, "<space>a", "<Cmd>Lspsaga code_action<CR>", opts)
-- vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", opts)
