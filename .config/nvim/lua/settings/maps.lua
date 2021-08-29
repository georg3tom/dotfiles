local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<Esc><Esc>', '<Esc>:nohlsearch<CR><Esc>',opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<CR>',opts)
vim.api.nvim_set_keymap('n', '<C-k>', ':cprev<CR>',opts)
