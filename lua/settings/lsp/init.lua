require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "bashls", "dockerls", "tailwindcss", "marksman" }, -- Add your LSPs here
}

require "settings.lsp.comp"
require "settings.lsp.servers"
require "settings.lsp.sig"
