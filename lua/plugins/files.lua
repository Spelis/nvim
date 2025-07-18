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
				["q"] = { "actions.close", mode = "n" },
			},
			delete_to_trash = false,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		keys = {
			{ "<leader>fo", "<cmd>Oil<CR>", desc = "Open File" },
		},
	},
}
