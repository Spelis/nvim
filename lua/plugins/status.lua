local keypresses = {}

vim.on_key(function(key)
	local lookup = {
		["<Space>"] = "󱁐",
		["<CR>"] = "",
		["<BS>"] = "󰁮",
		["<Tab>"] = "",
		["<Cmd>"] = "",
		["<Esc>"] = "󱊷 ",
		["<Up>"] = "k",
		["<Down>"] = "j",
		["<Left>"] = "h",
		["<Right>"] = "l",
	}

	local k = vim.fn.keytrans(key)
	if k:match("^<.+>$") and not lookup[k] then
		return
	end
	k = lookup[k] or k

	local last = keypresses[#keypresses]

	if last and last.key == k then
		last.count = last.count + 1
	else
		table.insert(keypresses, { key = k, count = 1 })
	end

	if #keypresses > 20 then
		table.remove(keypresses, 1) -- pop oldest
	end
end)

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "BufWinEnter",
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
					{
						function()
							local out = {}
							for _, entry in ipairs(keypresses) do
								if entry.count > 1 then
									table.insert(out, tostring(entry.count) .. entry.key)
								else
									table.insert(out, entry.key)
								end
							end
							return table.concat(out, "")
						end,
					},
					"diagnostics",
				},
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
