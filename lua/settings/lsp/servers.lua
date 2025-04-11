local lspconfig = require "lspconfig"

lspconfig.pyright.setup {
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
}

lspconfig.lua_ls.setup {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
