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
