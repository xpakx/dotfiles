return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {"nvim-lua/plenary.nvim"},
	config = function()
		local harpoon = require("harpoon")
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		for _, idx in ipairs { 1, 2, 3, 4, 5 } do
			vim.keymap.set("n", string.format("<leader>%d", idx), function() harpoon:list():select(idx) end)
		end

		vim.keymap.set("n", "[h", function() harpoon:list():prev() end)
		vim.keymap.set("n", "]h", function() harpoon:list():next() end)
	end
}
