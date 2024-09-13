return {
        {
                'williamboman/mason.nvim',
                config = function()
                        require('mason').setup()
                end,
        },
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        'williamboman/mason-lspconfig.nvim',
                        'williamboman/mason.nvim',
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                        "hrsh7th/cmp-cmdline",
                        "hrsh7th/nvim-cmp",
                        "L3MON4D3/LuaSnip",
                        "saadparwaiz1/cmp_luasnip",
                        "j-hui/fidget.nvim",
                },

                config = function()
                        local cmp = require('cmp')
                        local cmp_lsp = require("cmp_nvim_lsp")
                        local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities())

                        require('mason-lspconfig').setup({
                                ensure_installed = {
					'pylsp',
					'rust_analyzer',
					'gopls',
					--'ocamllsp',
					'ts_ls',
					'wgsl_analyzer',
					'lua_ls',
                                },

                                handlers = {
                                        function(server_name)
						if server_name == "tsserver" then
							server_name = "ts_ls"
						end
                                                require("lspconfig")[server_name].setup {
                                                        capabilities = capabilities
                                                }
                                        end,
                                }
                        })

                        require("fidget").setup({})
                        cmp.setup({
                                snippet = {
                                        expand = function(args)
                                                require('luasnip').lsp_expand(args.body)
                                        end,
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                }),
                                sources = cmp.config.sources({
                                        { name = 'nvim_lsp' },
                                        { name = 'luasnip' },
                                }, {
                                        { name = 'buffer' },
                                })
                        })

                        vim.diagnostic.config({
                                -- update_in_insert = true,
                                float = {
                                        focusable = false,
                                        style = "minimal",
                                        border = "rounded",
                                        source = "always",
                                        header = "",
                                        prefix = "",
                                },
                        })
                end
        }
}

