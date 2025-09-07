local vim = vim -- Makes the LSP shut the fuck up.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.deprecate = function() end -- Hide deprecation warnings, they're annoying as fuck.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap Lazy.nvim
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

require("lazy").setup("plugins", { ui = {
	border = "single",
	pills = false,
	title = "Lazy",
} })

vim.opt.foldlevel = 1000 -- Don’t fold anything unless I do it
vim.opt.foldlevelstart = 1000 -- Make sure it doesn’t start folded

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0 -- Hide command bar when unused.
vim.opt.laststatus = 3 -- Global status.
vim.opt.mouse = ""
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- >> and << size
vim.opt.expandtab = true -- turn tabs into spaces
vim.opt.smartindent = true
vim.o.shortmess = "tToOCFIs"
vim.opt.signcolumn = "yes" -- Forces the bar left of the line number to always be visible. Houses git status and diagnostics
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[set clipboard+=unnamedplus]]) -- Use system clipboard when yanking and stuff.
vim.api.nvim_set_hl(0, "MsgArea", { bg = "#282828" }) -- Set commandline background

if vim.g.neovide then
	vim.g.neovide_title_background_color = "#11111b" -- windows only
	vim.g.neovide_refresh_rate = 165
	vim.o.guifont = "JetBrainsMono Nerd Font:h11"
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_particle_density = 10
	vim.g.neovide_floating_corner_radius = 10.0
	vim.g.neovide_floating_blur_amount_x = 8.0
	vim.g.neovide_floating_blur_amount_y = 8.0
end

require("keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.schedule(function()
			if vim.fn.argc() == 0 then -- Assume this means no file
				vim.cmd("WhichKey <leader>")
			end
		end)
	end,
})
