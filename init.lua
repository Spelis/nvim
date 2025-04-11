local vim = vim -- reduses errors
vim.g.mapleader = " "

require("plugins.init")

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
require("settings.dashboard")
require("settings.rpc")

-- whichKey setup
local wk = require("which-key")
wk.add({
	{ "<leader> " },
})

require("settings.lsp")
require("settings.formatting")
