local M = {}

M.setup = function()
	require("nvim-tree").setup({
		auto_reload_on_write = true,
		disable_netrw = false,
		sort_by = "name",
		renderer = {
			icons = {
				show = {
					file = false,
					folder = false,
					folder_arrow = false,
					git = false,
					modified = false,
				},
			},
		},
	})
end

return M
