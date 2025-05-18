-- Status line setup

require("lualine").setup({
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = nil, right = nil },
		globalstatus = true,
	},
	sections = {
		lualine_a = { {
			"mode",
			fmt = function(res)
				return res:sub(1, 1)
			end,
		} },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 3,
				symbols = {
					modified = "*", -- Text to show when the file is modified.
					readonly = "!", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "Unnamed", -- Text to show for unnamed buffers.
					newfile = "@", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_x = { "diagnostics" },
		lualine_y = { "location" },
		lualine_z = { "filetype" },
	},
})

-- whatever im putting this here idc
require("nvim-cursorline").setup({
	cursorline = {
		enable = true,
		timeout = 100,
	},
	cursorword = {
		enable = false,
	},
})
