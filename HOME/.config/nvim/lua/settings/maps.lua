local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', ':cnext<CR>', opts)
vim.keymap.set('n', '<C-k>', ':cprev<CR>', opts)
-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<Space>l", ":noh<CR>", { desc = "clear highlights", remap = true, silent = true })
