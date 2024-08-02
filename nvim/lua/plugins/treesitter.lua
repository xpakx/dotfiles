return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = { "vimdoc", "java", "javascript", "typescript", "c", "lua", "rust", "python", "wgsl" },
	    sync_install = false,
	    auto_install = true,
    })
    vim.filetype.add({
	    pattern = {
		    ['.*%.wgsl'] = 'wgsl',
	    },
    })
    end,
}
