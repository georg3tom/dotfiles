vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fr",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			python = { "ruff" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			scss = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
		},

		format_after_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { lsp_format = "fallback" }
		end,

		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2", "-ci" },
			},
			isort = {
				prepend_args = { "--profile", "black" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
