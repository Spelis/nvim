return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{ "Bekaboo/dropbar.nvim", lazy = true },
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre", -- delay LSP stuff until a file is opened
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup({
				-- keep your config
			})

			local lspconfig = require("lspconfig")

			mason_lsp.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			})
		end,
	},
	{ "onsails/lspkind.nvim", event = "InsertEnter" },
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertCharPre",
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
						mode = "symbol_text",
						menu = {
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							path = "[Path]",
						},
					}),
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
		opts = {
			bind = true,
			floating_window = true,
			handler_opts = {
				border = "none",
			},
			toggle_key = "<C-d>", -- Toggle signature help
			hint_enable = false,
			extra_trigger_chars = { "(", "," }, -- Auto-trigger on these characters}
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
	{
		"L3MON4D3/LuaSnip",
		event = "InsertCharPre",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "lukas-reineke/headlines.nvim", lazy = true, ft = "markdown", config = true },
}
