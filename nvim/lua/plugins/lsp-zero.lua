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

		lsp.on_attach(function(client, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		lsp.setup()
	end
}
