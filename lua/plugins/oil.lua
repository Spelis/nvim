return {
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<C-s>"] = { "<Esc><cmd>w<CR>" },
			},
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		cmd = "Oil",
	},
}
