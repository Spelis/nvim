require("lsp_signature").setup({
	bind = true,
	floating_window = true,
	handler_opts = {
		border = "none",
	},
	toggle_key = "<C-d>", -- Toggle signature help
	hint_enable = false,
	extra_trigger_chars = { "(", "," }, -- Auto-trigger on these characters
})
