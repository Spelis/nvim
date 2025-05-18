return {
	{
		"akinsho/bufferline.nvim",
		config = function()
			bl = require("bufferline")
			bl.setup({
				options = {
					style_preset = bl.style_preset.no_italic,
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					separator_style = { "", "" },
				},
			})
		end,
	},
}
