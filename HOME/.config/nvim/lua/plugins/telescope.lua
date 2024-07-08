return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	init = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
				git_files = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
				},
				current_buffer_fuzzy_find = {
					theme = "ivy",
				},
				lsp_code_actions = {
					theme = "cursor",
				},
				lsp_references = {
					theme = "dropdown",
				},
				lsp_document_symbols = {
					theme = "dropdown",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				file_browser = {
					theme = "dropdown",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
	end,
	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		function git_find_files()
			local results = require("telescope.utils").get_os_command_output({ "git", "rev-parse", "--git-dir" })

			if results[1] then
				require("telescope.builtin").git_files()
			else
				require("telescope.builtin").find_files()
			end
		end

		function search_dotfiles()
			require("telescope.builtin").find_files({
				prompt_title = "dotfiles",
				cwd = "$HOME/.config/nvim/",
			})
		end

		vim.keymap.set("n", "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>p", git_find_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })

		vim.keymap.set("n", "<leader>b", function()
			require("telescope.builtin").buffers({
				sort_mru = true,
				ignore_current_buffer = true,
			})
		end, { desc = "[ ] Find existing buffers" })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
