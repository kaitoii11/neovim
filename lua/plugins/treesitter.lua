local M = {}

local parsers = {
	"go",
	"lua",
	"python",
	"javascript",
	"typescript",
	"html",
	"json",
	"markdown",
	"markdown_inline",
	"bash",
	"yaml",
	"toml",
}

M.setup = function()
	require("nvim-treesitter").install(parsers)

	-- main branch no longer enables features; start them per buffer when a parser exists
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
		callback = function(args)
			if not pcall(vim.treesitter.start, args.buf) then
				return
			end
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	})
	vim.opt.foldlevel = 99
end

return M
