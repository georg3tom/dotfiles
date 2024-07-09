local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", ":cnext<CR>", opts)
vim.keymap.set("n", "<C-k>", ":cprev<CR>", opts)

-- Clear highlight on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
