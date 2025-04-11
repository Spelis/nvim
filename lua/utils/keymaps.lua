local fzf = require "telescope.builtin"

-- keybinds
vim.keymap.set("n", ";", ":", { desc = "Run Command" })

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>te", "<cmd>Trouble diagnostics<CR>", { desc = "Toggle Error Pane" })
vim.keymap.set("n", "<leader>to", "<cmd>SymbolsOutline<CR>", { desc = "Toggle SymbolsOutline Pane" })

vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Write and Quit" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })

vim.keymap.set("n", "<leader>le", "$", { desc = "Go to End of Line" })

vim.keymap.set("n", "<leader>ff", fzf.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Telescope Buffers" })
