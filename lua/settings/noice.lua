require("noice").setup({
	cmdline = {
		view = "cmdline_popup", -- replaces bottom command line
		format = {
			cmdline = { icon = "" },
			search_down = { icon = " " },
			search_up = { icon = " " },
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
			border = {
				style = "rounded",
			},
		},
	},
	messages = { enabled = false },
	popupmenu = { enabled = true },
	lsp = {
		progress = { enabled = false },
		hover = { enabled = false },
		signature = { enabled = false },
	},
})
vim.o.wildmenu = true
vim.o.wildoptions = "pum"
