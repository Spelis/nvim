return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			require("gitblame").setup({
				enabled = true,
				highlight_group = "GitBlameHL",
				delay = 0,
			})

			vim.api.nvim_set_hl(0, "GitBlameHL", {
				fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg,
				bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg,
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		cmd = "Neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
