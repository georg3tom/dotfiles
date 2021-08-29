local cmd = vim.cmd

-- highlight yank
cmd([[
augroup vimrc
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]])

cmd([[
au BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif
]])
