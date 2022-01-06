local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<CR>',opts)
vim.api.nvim_set_keymap('n', '<C-k>', ':cprev<CR>',opts)
vim.api.nvim_set_keymap('n', '<M-h>', '<C-W><C-H>',opts)
vim.api.nvim_set_keymap('n', '<M-j>', '<C-W><C-J>',opts)
vim.api.nvim_set_keymap('n', '<M-k>', '<C-W><C-K>',opts)
vim.api.nvim_set_keymap('n', '<M-l>', '<C-W><C-L>',opts)
