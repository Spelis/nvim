vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Easier to exit Terminal mode

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "single",
		title = "Terminal",
		title_pos = "left",
		focusable = true,
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	pattern = "term://*",
	callback = function()
		-- Only enter terminal mode if not already in it
		if vim.bo.buftype == "terminal" and vim.fn.mode() ~= "t" then
			vim.cmd("startinsert")
		end
	end,
})

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set("n", "<leader><CR>", toggle_terminal, { desc = "Toggle Terminal" })
vim.keymap.set("n", "q", function()
	if state.floating.win ~= -1 then
		vim.api.nvim_win_hide(state.floating.win)
		state.floating.win = -1
	end
end, { desc = "Hide Terminal", buffer = state.floating.buf })

return {}
