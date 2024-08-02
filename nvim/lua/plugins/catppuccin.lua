return {
	"catppuccin/nvim", 
	name = "catppuccin",
	lazy = false,
	config = function()
		vim.cmd('colorscheme catppuccin')
		require("catppuccin").setup {
			color_overrides = {
			}
		}
	end
}
