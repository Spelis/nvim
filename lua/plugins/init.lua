require "paq" {
  "savq/paq-nvim", -- auto update paq
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
  "simrat39/symbols-outline.nvim",
  "lewis6991/gitsigns.nvim",
}

vim.cmd [[PaqInstall]] -- Install all packages
vim.cmd [[PaqUpdate]] -- Update any outdated packages
