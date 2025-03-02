local M = {}

M.webpages = {
	"Hacker News",
	"r/AcademicBiblical"
}

M.run_script_for_webpage = function(selected_webpage)
	if selected_webpage then
		if selected_webpage == M.webpages[1] then
			M.get_hackernews()
		end
	else
		print("No webpage selected or operation cancelled.")
	end
end

M.select_webpage_and_run_script = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local finders = require("telescope.finders")
	local sorters = require("telescope.sorters")
	local pickers = require("telescope.pickers")

	pickers.new({}, {
		prompt_title = "Select Webpage",
		finder = finders.new_table({
			results = M.webpages,
		}),
		sorter = sorters.get_generic_fuzzy_sorter(),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				M.run_script_for_webpage(selection[1])
			end)
			return true
		end,
	}):find()
end

M.get_hackernews = function()
	-- Call the Python script
	local script_path = vim.fn.stdpath('config') .. '/python/hackernews.py'
	local file_name = "hr.md"
	local command = string.format('python3 %s > %s', script_path, file_name)
	os.execute(command)

	vim.cmd('edit ' .. file_name)
end

return M
