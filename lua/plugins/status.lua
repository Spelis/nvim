return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = nil, right = nil },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(res)
							return res:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = true,
						path = 3,
						symbols = {
							modified = "*",
							readonly = "!",
							unnamed = "Unnamed",
							newfile = "@",
						},
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "location" },
				lualine_z = { "filetype" },
			},
		},
	},
	{
		"ya2s/nvim-cursorline",
		opts = {
			cursorline = {
				enable = true,
				timeout = 100,
			},
			cursorword = {
				enable = false,
			},
		},
	},
}
