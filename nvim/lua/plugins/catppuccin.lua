return {
	"catppuccin/nvim", as = "catppuccin",
	config = function()
		vim.cmd('colorscheme catppuccin')
		require("catppuccin").setup {
			color_overrides = {
			}
		}
	end
}
