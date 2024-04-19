vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Navigation
  use('nvim-lua/plenary.nvim')
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }
  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = {{"nvim-lua/plenary.nvim"}}
  }

  use('christoomey/vim-tmux-navigator')

  
  -- code formatting 
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('mbbill/undotree')

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'}
	  }
  }

  -- UI
  use({
	  "utilyre/barbecue.nvim",
	  tag = "*",
	  requires = {
		  "SmiteshP/nvim-navic",
		  "nvim-tree/nvim-web-devicons", -- optional dependency
	  },
	  after = "nvim-web-devicons", -- keep this if you're using NvChad
	  config = function()
		  require("barbecue").setup()
	  end,
  })
  use { 'windwp/windline.nvim' }
  use({
	  "catppuccin/nvim", as = "catppuccin",
	  config = function()
		  vim.cmd('colorscheme catppuccin')
		  require("catppuccin").setup {
			  color_overrides = {
			  }
		  }
	  end
  })
end)
