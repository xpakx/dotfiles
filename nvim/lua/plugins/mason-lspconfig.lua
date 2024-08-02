return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		'williamboman/mason.nvim',
	},
	config = function()

		require("mason-lspconfig").setup {
			ensure_installed = {
			'pylsp',
			'rust_analyzer',
			'gopls',
			'ocamllsp',
			'tsserver',
			'wgsl_analyzer',
			'lua_ls',
			},
		}
	end,
}
