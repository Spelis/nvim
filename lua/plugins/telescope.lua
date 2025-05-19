return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.9,
					height = 0.85,
					preview_cutoff = 120,
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				winblend = 10,
				border = true,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = "  ",
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
		config = function()
			pcall(function()
				require("telescope").load_extension("fzf")
			end)
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim", lazy = true },
}
