local lspkind = require("lspkind")

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
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
