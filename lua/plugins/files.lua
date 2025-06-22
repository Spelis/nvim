return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-s>"] = { "<Esc><cmd>w<CR>" },
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
	},
}
