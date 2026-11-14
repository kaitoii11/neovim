return {
	{
		"nvim-tree/nvim-tree.lua",
		event = "VimEnter",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
		config = function()
			require("plugins.tree").setup()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					accept = false,
                    enabled = true,
                    keymap = {
                        accept = "<C-o>",
                    }
				},
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",
			windows = {
				position = "right",
				width = 30,
				sidebar_header = {
					align = "center",
					rounded = false,
				},
				ask = {
					floating = true,
					start_insert = true,
					border = "rounded",
				},
			},
		},
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			{ "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter").setup()
		end,
	},
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    --[[{
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp.config").setup()
        end,
    },]]
}
