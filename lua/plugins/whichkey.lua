return {
	{
		"folke/which-key.nvim",
		keys = "<leader>", -- load when leader is pressed
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({ delay = 0 })
			local km = vim.keymap.set

			wk.add({
				{ "<leader>f", group = "Find" },
			})

			km("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })
			km("n", "?", "<cmd>WhichKey<CR>")

			km("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

			km("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
			km("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save current buffer" })

			km("n", "D", vim.diagnostic.open_float, { desc = "Show diagnostics" })
			km("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
			km("n", "H", vim.lsp.buf.signature_help, { desc = "Show signature help" })
			km("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show Signature help" })
		end,
	},
}
