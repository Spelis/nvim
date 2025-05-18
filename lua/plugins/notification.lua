return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			notify = {
				enabled = true,
				view = "notify",
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
