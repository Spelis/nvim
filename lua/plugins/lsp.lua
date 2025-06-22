return {
	{ "williamboman/mason.nvim", build = ":MasonUpdate", config = true, event = { "BufReadPre", "BufNewFile" } },
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		opts = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- still needed
		},
		config = function()
			local mason_lsp = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			-- Only require cmp_nvim_lsp if cmp is available
			local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			if has_cmp then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			local handlers = {
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			for _, server_name in ipairs(mason_lsp.get_installed_servers()) do
				lspconfig[server_name].setup({
					capabilities = capabilities,
					handlers = handlers,
				})
			end
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "BufReadPost",
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},

	{ "onsails/lspkind.nvim", event = "InsertEnter" },
	{
		"windwp/nvim-autopairs",
		lazy = true,
		config = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
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
					{ name = "emoji" },
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
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
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
	{ "lukas-reineke/headlines.nvim", lazy = true, ft = "markdown", config = true },
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
}
