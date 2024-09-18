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

local colorscheme = "solarized-osaka-night"
-- local colorscheme = "onedark"

-- vim.g.onedarker_italic_keywords = false
--
-- vim.g.onedarker_italic_functions = false
--
-- vim.g.onedarker_italic_comments = true
--
-- vim.g.onedarker_italic_loops = false
--
-- vim.g.onedarker_italic_conditionals = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	-- vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
