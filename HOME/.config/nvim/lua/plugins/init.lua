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
    use {'windwp/nvim-autopairs'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'terrortylor/nvim-comment'}

    use {
        'tjdevries/express_line.nvim',
        -- 'glepnir/galaxyline.nvim',
        -- branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}

    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-calc'}
    use {'hrsh7th/cmp-path'}
    use {'ray-x/cmp-treesitter'}


    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}

    use {'rafamadriz/friendly-snippets'}

    use {'norcalli/nvim-colorizer.lua'}
    require('colorizer').setup()

    use {'arcticicestudio/nord-vim'}

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    require('plugins.treesitter')
    require('plugins.el')
    require('plugins.comment')
    require('plugins.telescope')
    require('plugins.gitsigns')
    require('plugins.cmp')
    require('plugins.autopairs')
    require('plugins.colorscheme')
end)
