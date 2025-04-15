-- Status line setup

require("lualine").setup({
	globalstatus = true,
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "location" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 1,
				symbols = {
					modified = "*", -- Text to show when the file is modified.
					readonly = "!", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "Unnamed", -- Text to show for unnamed buffers.
					newfile = "@", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_x = { "diagnostics" },
		lualine_y = { "branch" },
		lualine_z = { "diff" },
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
