vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[set cmdheight=0]]) -- hide command bar when unused
vim.cmd([[set laststatus=3]]) -- global status
vim.cmd([[set clipboard+=unnamedplus]]) -- use system clipboard when yanking and stuff

if vim.g.neovide then
	vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", {})
	vim.g.neovide_title_background_color = "#11111b"
	vim.g.neovide_refresh_rate = 165
	vim.o.guifont = "JetBrainsMono Nerd Font:h11"
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

require("keymaps")
