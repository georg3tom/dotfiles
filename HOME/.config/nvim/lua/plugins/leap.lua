return {
	{
		"ggandor/leap.nvim",
		enabled = false,
		config = function()
			vim.keymap.set("n", "s", function()
				require("leap").leap({ target_windows = { vim.fn.win_getid() } })
			end)
		end,
	},
	{
		"ggandor/flit.nvim",
		enabled = false,
		opts = {},
	},
}
