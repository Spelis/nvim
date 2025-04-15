local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		pyright = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

local servers = {
	"gopls",
	"clangd",
	"bashls",
	"dockerls",
	"tailwindcss",
	"marksman",
	"lua_ls",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})
end
