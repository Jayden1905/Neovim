local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
-- keymap.set("n", "<space>w", ":w<cr>")
-- keymap.set("n", "<space>q", ":q<cr>")
keymap.set("n", "<space>h", ":noh<cr>")
keymap.set("n", "<space>c", ":bdelete<cr>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "tn", ":tabedit<cr>")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Save Sessions
keymap.set("n", "<space>ss", "<cmd>SaveSession<cr>")
keymap.set("n", "<space>sd", "<cmd>DeleteSession<cr>")
keymap.set("n", "<space>sf", "<cmd>Autosession search<cr>")
keymap.set("n", "<space>sD", "<cmd>Autosession delete<cr>")

-- Github Copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Lazy Git
vim.keymap.set("n", "<space>gg", "<Cmd>LazyGit<CR>", {})

vim.keymap.set("n", "<space>r", "<Cmd>!g++ -Wall % && ./a.out<CR>", {})

-- Tsserver Organize Imports
vim.keymap.set("n", "<space>oi", "<Cmd>OrganizeImports<CR>", {})

-- keymap.set("n", "j", "jzz")
-- keymap.set("n", "k", "kzz")
