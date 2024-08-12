return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
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
	},
	config = function()
		local lsp = require('lsp-zero')
		require('lspconfig').intelephense.setup({})
		lsp.preset('recommended')

		local cmp = require('cmp')

		cmp.setup({
			mapping = {
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}
		})
		lsp.setup()
	end
}
