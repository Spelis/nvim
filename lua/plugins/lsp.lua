return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "VeryLazy",
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		config = true,
		event = "InsertEnter",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig")
			local servers = { "basedpyright", "jdtls", "rust_analyzer", "emmylua_ls", "clangd", "html", "ts_ls" }
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			vim.lsp.enable(servers)
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
			-- Python
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				filetypes = { "python" },
			})
			-- Lua
			vim.lsp.config("emmylua_ls", {
				capabilities = capabilities,
				filetypes = { "lua" },
				workspace = {
					maxPreload = 100,
					preloadFileSize = 1000,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"chrisgrieser/cmp-nerdfont",
			"hrsh7th/cmp-emoji",
		},
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
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "nerdfont" },
					{ name = "emoji", option = { insert = false } },
				}),
				experimental = {
					ghost_text = true, -- VSCode-like inline ghost text
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							mode = "symbol",
							maxwidth = 50,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						local icon = strings[1] or ""
						local text = strings[2] or ""
						vim_item.kind = icon
						vim_item.menu = "(" .. text .. ")"

						return vim_item
					end,
				},
				window = {
					completion = cmp.config.window.bordered({ border = "single" }),
					documentation = cmp.config.window.bordered({ border = "single" }),
				},
				preselect = cmp.PreselectMode.Item,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
			})

			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7c6f64", bg = nil })
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on Lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saadparwaiz1/cmp_luasnip",
		dependencies = { "L3MON4D3/LuaSnip" },
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"echasnovski/mini.ai",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = "html",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
