vim.g.mapleader = " "

require("plugins.init")

require("catppuccin").setup({
	show_end_of_buffer = true,
	styles = {
		comments = { "italic" },
		keywords = { "bold" },
	},
})

vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[colorscheme catppuccin-mocha]]) -- Catppuccin :3
vim.cmd([[set cmdheight=0]]) -- hide command bar when unused
vim.cmd([[set laststatus=3]]) -- global status
vim.cmd([[set clipboard+=unnamedplus]]) -- use system clipboard when yanking and stuff

require("settings.notif")
require("utils.keymaps")
require("utils.autocmds")
require("settings.status")
require("settings.symbols")
require("settings.tabs")
require("settings.rpc")
require("settings.telescope")
require("settings.sshfs")
require("settings.lsp")
require("settings.tree")
require("settings.formatting")
require("settings.noconf")
require("settings.dashboard")
require("settings.whichkey")
require("settings.git")
require("settings.noice")
