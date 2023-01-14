require("jayden.base")
require("jayden.highlights")
require("jayden.maps")
require("jayden.plugins")

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("jayden.macos")
end
if is_win then
	require("jayden.windows")
end

vim.g.copilot_autostart = 1
vim.g.copilot_autocomplete = 1
vim.g.copilot_autocomplete_delay = 100
vim.g.copilot_autocomplete_chars = 2
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set("n", "<space>gg", "<Cmd>LazyGit<CR>", {})
