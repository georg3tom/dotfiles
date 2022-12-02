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
  use { 'nvim-treesitter/nvim-treesitter-context' }

  use {'windwp/nvim-autopairs'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'}, 
      {'nvim-lua/plenary.nvim'},
    }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'numToStr/Comment.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons', opt = true}
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

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({})
    end
  })


  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'ggandor/leap.nvim',
    requires = {
      'tpope/vim-repeat',
      'ggandor/flit.nvim'
    }
  }

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({})
    end
  })

  use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({})
    end
  })

  
  require('plugins.colorscheme')
  require('plugins.treesitter')
  require('plugins.lualine')
  require('plugins.comment')
  require('plugins.telescope')
  require('plugins.gitsigns')
  require('plugins.cmp')
  require('plugins.autopairs')
  require('plugins.leap')
  require('plugins.refactoring')
end)
