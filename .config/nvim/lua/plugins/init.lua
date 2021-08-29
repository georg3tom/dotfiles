local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {'nvim-treesitter/nvim-treesitter-textobjects', run = ':TSUpdate' }
	use {"windwp/nvim-autopairs"}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use {"terrortylor/nvim-comment"}

	use {
        'hoob3rt/lualine.nvim',
		-- 'glepnir/galaxyline.nvim',
		-- branch = 'main',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use 'neovim/nvim-lspconfig'
	use {"hrsh7th/nvim-compe"}
	use {"hrsh7th/vim-vsnip"}
	use {"rafamadriz/friendly-snippets"}

	use {"norcalli/nvim-colorizer.lua"}
    require('colorizer').setup()

    use 'arcticicestudio/nord-vim'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

	require("plugins.treesitter")
	require("plugins.lualine")
	require("plugins.comment")
	require("plugins.telescope")
	require("plugins.gitsigns")
	require("plugins.autopairs")
	require("plugins.compe")
	require("plugins.colorscheme")
end)
