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
