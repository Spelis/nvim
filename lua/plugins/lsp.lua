return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufReadPre",
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {},
		branch = "regexp",
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		cmd = { "VenvSelect" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		event = "BufReadPre",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local mason_lsp = require("mason-lspconfig")

			local lspconfig = require("lspconfig")
			local lspopts = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				handlers = {
					["textDocument/signatureHelp"] = vim.lsp.with(
						vim.lsp.handlers.signature_help,
						{ border = "rounded" } -- or "single", "shadow", etc.
					),
				},
			}

			for _, server_name in ipairs(mason_lsp.get_installed_servers()) do
				lspconfig[server_name].setup(lspopts)
			end
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},

	{ "onsails/lspkind.nvim", event = "InsertEnter" },
	{ "windwp/nvim-autopairs", lazy = false, config = true },
	{
		"hrsh7th/nvim-cmp",
		event = "BufEnter",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
				}),
				experimental = {
					ghost_text = true, -- VSCode-like inline ghost text
				},
				window = {
					-- completion = cmp.config.window.bordered { border = "single" },
					-- documentation = cmp.config.window.bordered { border = "single" },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
					}),
				},
				preselect = cmp.PreselectMode.Item,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
			})
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "lukas-reineke/headlines.nvim", lazy = true, ft = "markdown", config = true },
}
