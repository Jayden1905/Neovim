local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "padded_slant",
		always_show_bufferline = false,
		show_buffer_close_icons = true,
		show_close_icon = false,
		color_icons = true,
	},
})

vim.keymap.set("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<space>bl", "<Cmd>BufferLineMoveNext<CR>", {})
vim.keymap.set("n", "<space>bh", "<Cmd>BufferLineMovePrev<CR>", {})
