local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "thin",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
	},
	highlights = {
		separator = {
			fg = "#073642",
			bg = "#002b36",
		},
		separator_selected = {
			fg = "#073642",
		},
		background = {
			fg = "#657b83",
			bg = "#002b36",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
		},
		fill = {
			bg = "#073642",
		},
	},
})

vim.keymap.set("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<space>bl", "<Cmd>BufferLineMoveNext<CR>", {})
vim.keymap.set("n", "<space>bh", "<Cmd>BufferLineMovePrev<CR>", {})
