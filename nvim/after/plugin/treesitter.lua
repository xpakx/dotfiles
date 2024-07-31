require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vimdoc", "java", "javascript", "typescript", "c", "lua", "rust", "python", "wgsl" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}

}

vim.filetype.add({
    pattern = {
      ['.*%.wgsl'] = 'wgsl',
    },
})
