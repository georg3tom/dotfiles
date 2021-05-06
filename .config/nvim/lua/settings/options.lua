vim.o.termguicolors = true
vim.o.showcmd = false
vim.o.showmode = false
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.completeopt = "menuone,noselect"

vim.cmd [[
set autoindent
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
]]

vim.wo.colorcolumn = "88"
vim.wo.number = true 
vim.wo.relativenumber = true 
vim.wo.cursorline = true 
vim.wo.listchars = "tab:┆·,trail:·" 

vim.cmd("set undofile")
