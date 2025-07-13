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
			local servers = { "basedpyright", "rust-analyzer", "lua_ls", "clangd", "html", "ts_ls" }
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
			vim.lsp.config("lua_ls", {
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
		dependencies = { "onsails/lspkind.nvim", "hrsh7th/cmp-buffer", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-path" },
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
					completion = {
						col_offset = 1,
						side_padding = 0,
					},
					-- documentation = cmp.config.window.bordered({ border = "rounded" }),
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						local icon = strings[1] or ""
						local text = strings[2] or ""
						local base_group = "CmpItemKind" .. text
						local custom_group = "MyCmpKindWhite" .. text

						local hl = vim.api.nvim_get_hl(0, { name = base_group }) or {}
						local bg = vim.api.nvim_get_hl(0, { name = "Pmenu" }) or {}

						if vim.fn.hlID(custom_group) == 0 then
							vim.api.nvim_set_hl(0, custom_group, { fg = bg.bg, bg = hl.fg })
						end

						vim_item.kind = " " .. icon .. " "
						vim_item.kind_hl_group = custom_group
						vim_item.menu = "    (" .. text .. ")"

						return vim_item
					end,
				},
				preselect = cmp.PreselectMode.Item,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
			})
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
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
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
