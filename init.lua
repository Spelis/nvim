local vim = vim -- reduces errors
vim.g.mapleader = " "

require("plugins.init")
require("settings.notif")

vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[colorscheme catppuccin-mocha]]) -- Catppuccin :3
vim.cmd([[set cmdheight=0]]) -- hide command bar when unused
vim.cmd([[set laststatus=3]]) -- global status
vim.cmd([[set clipboard+=unnamedplus]]) -- use system clipboard when yanking and stuff

require("utils.keymaps")
require("utils.autocmds")

require("settings.status")
require("settings.noconf")
require("settings.symbols")
require("settings.tabs")
require("settings.rpc")
require("settings.telescope")
require("settings.sshfs")

-- whichKey setup
local wk = require("which-key")
wk.add({
	{ "<leader> " },
})

require("settings.lsp")
require("settings.formatting")
require("settings.dashboard")
