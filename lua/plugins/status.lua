return {
	{
		"nvim-mini/mini.statusline",
		event = "VimEnter",
		opts = {
			-- Enable global statusline
			global_statusline = true,

			-- Components
			content = {
				-- Left section
				active = function()
					local mode_map = {
						n = "N",
						i = "I",
						v = "V",
						V = "VL",
						["␖"] = "VB",
						R = "R",
						c = "C",
						t = "T",
					}
					local mode = mode_map[vim.fn.mode()] or vim.fn.mode()

					local cwd = " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

					local filename = "%f" -- filename
					local file_status = ""
					if vim.bo.modified then
						file_status = " ●"
					elseif vim.bo.readonly then
						file_status = " "
					elseif vim.fn.empty(vim.fn.expand("%:t")) == 1 then
						file_status = " "
					end

					return table.concat({ mode, "|", cwd, "|", filename .. file_status }, " ")
				end,

				-- Right section
				active_right = function()
					local branch = vim.b.gitsigns_head or ""
					local diff = "" -- You could integrate gitsigns here
					local diagnostics = "" -- Could use vim.diagnostic.get_count(0, {severity = "E"}) etc.
					local filetype = vim.bo.filetype

					return table.concat({ branch, diff, diagnostics, filetype }, " | ")
				end,
			},
		},
	},
}
