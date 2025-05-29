return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>ft",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find Text",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Document Symbols",
			},
			{
				"<leader>fS",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},
		},
		opts = {
			defaults = {
				-- layout_strategy = "vertical",
				layout_config = {
					width = 0.9,
					height = 0.85,
					preview_cutoff = 120,
					prompt_position = "top",
				},
				pickers = {
					find_files = {
						hidden = true,
					},
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
