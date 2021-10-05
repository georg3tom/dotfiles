local opt = vim.opt
opt.termguicolors = true
opt.showmode = false
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.lazyredraw = true
opt.mouse = "a"
opt.completeopt = "menuone,noselect"
opt.updatetime = 1000
opt.hidden = true
opt.undofile = true
opt.relativenumber = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.scrolloff = 10
opt.colorcolumn = "88"
opt.shortmess = opt.shortmess +"c"

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

-- opt.pumblend = 0 -- opacity

-- opt.inccommand = "split"
-- opt.cursorline = true

opt.list = true
opt.listchars= "eol:↲"
-- set list listchars=tab:┆·,trail:·
