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

require("lazy").setup({
	"nvim-tree/nvim-web-devicons", -- nerd font support, common dependency
	"catppuccin/nvim", -- catppuccin theme
	"nvim-lualine/lualine.nvim", -- status line
	"windwp/nvim-autopairs", -- auto close brackets
	"akinsho/toggleterm.nvim", -- terminal
	"akinsho/bufferline.nvim", -- tab bar
	"folke/which-key.nvim", -- keybind helper
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim", -- fzf
	"nvim-telescope/telescope-fzf-native.nvim", -- fzf (dependency of dropbar.nvim)
	"neovim/nvim-lspconfig", -- configure LSPs
	"williamboman/mason.nvim", -- install language servers
	"williamboman/mason-lspconfig.nvim", -- auto install, auto activate etc
	"Bekaboo/dropbar.nvim", -- breadcrumbs
	"hrsh7th/nvim-cmp", -- completer
	"hrsh7th/cmp-nvim-lsp", -- lsp source
	"hrsh7th/cmp-path", -- File paths
	"hrsh7th/cmp-cmdline", -- Commands
	"onsails/lspkind.nvim", -- Icons in completion menu
	"ray-x/lsp_signature.nvim", -- Function signature hints
	"folke/trouble.nvim", -- errors and warnings pane
	"stevearc/conform.nvim", -- formatting
	"lewis6991/gitsigns.nvim",
	"nvimdev/dashboard-nvim", -- dashboard, obviously
	"andweeb/presence.nvim", -- discord rich presence
	{ "spelis/project.nvim", branch = "patch-1" }, -- recent projects
	"rcarriga/nvim-notify", -- prettier notifications
	"rmagatti/auto-session", -- restore session
	{ "linux-cultist/venv-selector.nvim", branch = "regexp", lazy = false },
	"nosduco/remote-sshfs.nvim",
})
