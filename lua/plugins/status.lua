return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "BufReadPre",
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
						path = 1,
						symbols = {
							modified = "*",
							readonly = "!",
							unnamed = "Unnamed",
							newfile = "@",
						},
					},
				},
				lualine_x = {
					"filetype",
				},
				lualine_y = { "diagnostics" },
				lualine_z = { "location" },
			},
		},
	},
}
