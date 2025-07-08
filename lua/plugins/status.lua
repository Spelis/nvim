return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufReadPre", "BufNewFile", "BufEnter", "BufWinEnter" },
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
							local replace = {
								COMMAND = "C",
								NORMAL = "N",
								INSERT = "I",
								VISUAL = "V",
								["V-BLOCK"] = "VB",
								["V-LINE"] = "VL",
								TERMINAL = "T",
								REPLACE = "R",
							}
							return replace[res] or res -- Replace with shorthand, or if there is none, use full name (for debug purposes, should be complete)
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
							modified = "●",
							readonly = "",
							unnamed = "Unnamed",
							newfile = "",
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
