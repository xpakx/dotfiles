return {
	'nvim-telescope/telescope.nvim',
	dependencies =  {'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {} )
		vim.keymap.set("n", "<C-p>", builtin.git_files, {} )

		vim.keymap.set("n", "<leader>pg", builtin.live_grep, {} )
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ")})
		end)
		vim.keymap.set("n", "<leader>pq", builtin.quickfix, {} )

		vim.api.nvim_set_keymap('n', '<leader>rl', '<cmd>lua require("xpakx.get_posts").select_webpage_and_run_script()<CR>', { noremap = true, silent = true })
	end,
}
