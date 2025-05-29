return {
	{
		"propet/colorscheme-persist.nvim",
		name = "colorscheme",
		lazy = false, -- Required: Load on startup to set the colorscheme
		config = true, -- Required: call setup() function
		dependencies = {
			"nvim-telescope/telescope.nvim",
			{
				"catppuccin/nvim",
				name = "catppuccin",
			},
			"Sly-Harvey/radium.nvim",
			"tiagovla/tokyodark.nvim",
			"folke/tokyonight.nvim",
			"ayu-theme/ayu-vim",
			"oxfist/night-owl.nvim",
		},
		keys = {
			{
				"<leader>fc",
				function()
					require("colorscheme-persist").picker()
				end,
				mode = "n",
				desc = "Choose colorscheme",
			},
		},
		opts = true,
	},
}
