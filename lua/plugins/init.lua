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
	{
		"catppuccin/nvim",
		name = "catppuccin",
	}, -- Catppuccin :3
	"nvim-lualine/lualine.nvim", -- status line
	"windwp/nvim-autopairs", -- auto close brackets
	"akinsho/toggleterm.nvim", -- terminal
	"akinsho/bufferline.nvim", -- tab bar
	"folke/which-key.nvim", -- keybind helper
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim", -- fzf
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			pcall(function()
				require("telescope").load_extension("fzf")
			end)
		end,
	}, -- fzf (dependency of dropbar.nvim)
	"nvim-telescope/telescope-ui-select.nvim",
	"sindrets/diffview.nvim", -- git diffview
	"frankroeder/parrot.nvim",
	"neovim/nvim-lspconfig", -- configure LSPs
	"williamboman/mason.nvim", -- install language servers
	"williamboman/mason-lspconfig.nvim", -- auto install, auto activate etc
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- TreeSitter
	"Bekaboo/dropbar.nvim", -- breadcrumbs
	"hrsh7th/nvim-cmp", -- completer
	"hrsh7th/cmp-nvim-lsp", -- lsp source
	"hrsh7th/cmp-path", -- File paths
	"hrsh7th/cmp-cmdline", -- Commands
	"onsails/lspkind.nvim", -- Icons in completion menu
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Snippets
	"rafamadriz/friendly-snippets", -- VSCode like snippets
	"saadparwaiz1/cmp_luasnip", -- snippets in cmp
	"ray-x/lsp_signature.nvim", -- Function signature hints
	"stevearc/conform.nvim", -- formatting
	"lewis6991/gitsigns.nvim",
	"nvimdev/dashboard-nvim", -- dashboard, obviously
	"andweeb/presence.nvim", -- discord rich presence
	"spelis/project.nvim", -- recent projects
	"rcarriga/nvim-notify", -- prettier notifications
	"rmagatti/auto-session", -- restore session
	{ "linux-cultist/venv-selector.nvim", branch = "regexp", lazy = false },
	"nosduco/remote-sshfs.nvim",
	"ya2s/nvim-cursorline",
	"nvim-tree/nvim-tree.lua",
	{ "rrethy/vim-hexokinase", build = "make hexokinase" },
	{ "lukas-reineke/headlines.nvim", ft = "markdown", config = true },
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
	},
	{ "lukas-reineke/indent-blankline.nvim" },
})
