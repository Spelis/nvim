return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose" },
	},
}
