require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "bashls", "dockerls", "tailwindcss", "marksman" }, -- Add your LSPs here
})

require("gitsigns").setup({})

require("settings.lsp.comp")
require("settings.lsp.servers")
require("settings.lsp.sig")

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
