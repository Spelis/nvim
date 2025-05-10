local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.del("n", "<C-e>", { buffer = bufnr })
	vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>")
end

tree = require("nvim-tree").setup({
	on_attach = on_attach,
	view = {
		width = 30,
		number = true,
		relativenumber = true,
	},
	filters = {
		dotfiles = false, -- Show hidden files (dotfiles)
		git_ignored = false, -- Show git ignored files
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		if vim.bo[buf].filetype == "NvimTree" and vim.fn.win_getid(vim.fn.winnr(), "$") ~= -1 then
			vim.cmd("close")
		end
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd("quit")
		end
	end,
})
