vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

  autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
]])
