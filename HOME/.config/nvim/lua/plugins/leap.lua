return {
  {
    "ggandor/leap.nvim",
    enabled = true,
    config = function()
      vim.keymap.set('n', 's', function() require('leap').leap { target_windows = { vim.fn.win_getid() } } end)
    end,

  },
  {
    "ggandor/flit.nvim",
    enabled = true,
    opts = {},
  },
}
