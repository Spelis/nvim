return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			notify = {
				enabled = true,
				view = "notify",
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
				popupmenu = {
					relative = "editor",
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = 56,
						height = 10,
					},
					border = {
						style = "none",
						padding = { 0, 3 },
					},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
