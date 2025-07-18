local wk = require("which-key")
local vim = vim
local km = vim.keymap.set

wk.add({
	{ "<leader>b", group = "Buffers" },
	{ "<leader>f", group = "Find" },
})

km("n", "<Esc>", "<cmd>noh<CR>")
km("n", "<leader>?", "<cmd>WhichKey<CR>")

km("n", "<leader>bn", "<cmd>ene<CR>", { desc = "Create new file" })
km("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write Buffer" })
km("n", "<leader>bq", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
km("n", "<leader>bd", "<cmd>lua require'snacks'.dashboard()<CR>", { desc = "Open Dashboard" })

km("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
km("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save current buffer" })

km("n", "D", vim.diagnostic.open_float, { desc = "Show diagnostics" })
km("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })

km("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
km("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
km("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
km("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
