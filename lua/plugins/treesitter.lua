local M = {}

M.setup = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "go", "lua", "yaml", "json", "bash", "toml" },
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
        folds = {
            enable = true,
        },
	})
end

return M
