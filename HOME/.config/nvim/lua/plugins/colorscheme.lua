return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					alpha = true,
					cmp = true,
					flash = true,
					gitsigns = true,
					illuminate = true,
					indent_blankline = { enabled = true },
					lsp_trouble = true,
					mason = true,
					leap = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					navic = { enabled = true, custom_bg = "lualine" },
					neotest = true,
					noice = true,
					notify = true,
					neotree = true,
					semantic_tokens = true,
					telescope = true,
					treesitter = true,
					which_key = true,
				},
			})
			-- vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	{
		"neanias/everforest-nvim",
		name = "everforest",
		version = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				italics = "true",
				colours_override = function(palette)
					palette.bg0 = palette.bg_dim
				end,
			})
			-- vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = true
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
