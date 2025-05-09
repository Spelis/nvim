local telescope = require("telescope")
require("project_nvim").setup({})

telescope.load_extension("ui-select")

local themes = require("telescope.themes")

telescope.setup({
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
	pickers = {
		find_files = themes.get_dropdown({ previewer = false }),
		live_grep = themes.get_dropdown(),
		buffers = themes.get_dropdown({ previewer = false }),
		old_files = themes.get_dropdown({ previewer = false }),
		lsp_document_symbols = themes.get_dropdown({ previewer = false }),
	},
	extensions = {
		["ui-select"] = themes.get_dropdown({}),
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("projects")
telescope.load_extension("remote-sshfs")
