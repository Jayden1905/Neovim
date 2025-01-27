local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})

vim.keymap.set("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<space>bl", "<Cmd>BufferLineMoveNext<CR>", {})
vim.keymap.set("n", "<space>bh", "<Cmd>BufferLineMovePrev<CR>", {})
