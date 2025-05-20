return {
	{
		"akinsho/bufferline.nvim",
		event = "BufWinEnter",
		config = function()
			local bl = require("bufferline")
			bl.setup({
				options = {
					mode = "buffers", -- or "tabs"
					numbers = "none", -- or "ordinal" | "buffer_id" | function
					close_command = "bdelete! %d",
					middle_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					right_mouse_command = "",
					indicator = {
						icon = " ", -- this should be a valid unicode character
						style = "icon",
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = false,
					separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'pair' }
					enforce_regular_tabs = false,
					always_show_bufferline = false,
					sort_by = "id",
				},
			})
		end,
	},
}
