return {
	{
		"j-hui/fidget.nvim",
		opts = {},
		lazy = true,
		init = function()
			local lazy_notify = vim.notify
			vim.notify = function(...)
				-- Load plugin just before first notify
				require("lazy").load({ plugins = { "fidget.nvim" } })
				vim.notify = lazy_notify
				return vim.notify(...)
			end
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		opts = {
			notify = {
				enabled = false,
			},
			indent = {
				priority = 1,
				enabled = true,
				char = "│",
				only_scope = false, -- only show indent guides of the scope
				only_current = false, -- only show indent guides in the current window
				hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
			},
			scope = {
				enabled = true, -- enable highlighting the current scope
				priority = 200,
				char = "│",
				underline = false, -- underline the start of the scope
				only_current = false, -- only show scope in the current window
				hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
			},
			dashboard = require("dashboard"),
		},
	},
	{
		"folke/noice.nvim",
		event = "CmdlineEnter",
		opts = {
			notify = {
				enabled = false,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		opts = true,
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
}
