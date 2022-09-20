local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
  return
end

telescope.load_extension("harpoon")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "mm", function()
  require("harpoon.mark").add_file()
end, opts)

vim.keymap.set("n", "m;", function()
  require("harpoon.ui").toggle_quick_menu()
end, opts)
