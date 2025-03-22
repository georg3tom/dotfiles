return {
	"ggml-org/llama.vim",
	init = function()
		vim.g.llama_config = {
			auto_fim = true,
			show_info = false,
			endpoint = "llamaserver:8012/infill",
		}
	end,
}
