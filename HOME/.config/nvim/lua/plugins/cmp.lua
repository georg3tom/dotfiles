return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		completion = {
			documentation = { auto_show = false },
			list = { selection = { preselect = false, auto_insert = true } },
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
