require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"gopls",
		"clangd",
		"bashls",
		"dockerls",
		"tailwindcss",
		"marksman",
		"html",
	}, -- Add your LSPs here
})

vim.g.Hexokinase = { "sign_column" }

require("settings.lsp.comp")
require("settings.lsp.servers")
require("settings.lsp.sig")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("html", { "html" })

require("auto-session").setup({ -- doesn't belong here but whatever im tired of making new files
	auto_save = true,
	auto_restore = false,
	bypass_save_filetypes = { "dashboard" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "markdown", "markdown_inline" },
	highlight = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 2
		vim.opt_local.concealcursor = "nc"
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

require("ibl").setup({
	exclude = {
		filetypes = {
			"dashboard",
			"help",
			"terminal",
			"lazy",
			"TelescopePrompt",
		},
		buftypes = {
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
		},
	},
})

require("parrot").setup({
	providers = {
		ollama = {
			model = "code-only-llama3",
			filter = function(output)
				return output
					:gsub("```[%w]*\n?", "") -- remove ``` or ```lang
					:gsub("```", "") -- just in case there's a trailing ```
					:gsub("^%s*", "") -- strip leading whitespace
			end,
		},
	},
})
