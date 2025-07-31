return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
						fmt = function(mode)
							local map = {
								NORMAL = "N",
								INSERT = "I",
								VISUAL = "V",
								["V-LINE"] = "VL",
								["V-BLOCK"] = "VB",
								REPLACE = "R",
								COMMAND = "C",
								TERMINAL = "T",
							}
							return map[mode] or mode
						end,
					},
				},
				lualine_b = {
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
						icon = "",
					},
				},
				lualine_c = {
					{
						"filename",
						path = 0,
						file_status = true,
						newfile_status = true,
						symbols = {
							modified = "●",
							readonly = "",
							unnamed = "Unnamed",
							newfile = "",
						},
					},
				},
				lualine_x = { "filetype" },
				lualine_y = { "branch", "diff", "diagnostics" },
				lualine_z = {},
			},
		},
	},
}
