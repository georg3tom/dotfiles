vim.keymap.set('n', 's', function () require('leap').leap { target_windows = { vim.fn.win_getid() } } end)
require('flit').setup {}
-- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
