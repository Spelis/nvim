local fzf = require("telescope.builtin")
local wk = require("which-key")

wk.add({
	{ "<leader>t", group = "Toggle" },
	{ "<leader>q", group = "Quit" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>l", group = "Movement" },
	{ "<leader>f", group = "Find" },
	{ "<leader>bq", group = "Close Buffer" },
})

-- keybinds
vim.keymap.set("n", ";", ":", { desc = "Run Command" })

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float | startinsert<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>te", "<cmd>Trouble diagnostics<CR>", { desc = "Toggle Error Pane" })

vim.keymap.set("t", "<Esc>", "<C-d>", { desc = "Close Terminal" })

vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>", { desc = "Write and Quit" })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<CR>", { desc = "Force Quit" })
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit Nvim" })

vim.keymap.set("n", "<leader>bn", "<cmd>ene<CR>", { desc = "Create new file" })
vim.keymap.set("n", "<leader>bd", "<cmd>Dashboard<CR>", { desc = "Go back to Dashboard" })
vim.keymap.set("n", "<leader>bpv", "<cmd>VenvSelect<CR>", { desc = "Select Python Interpreter" })
vim.keymap.set("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write Buffer" })
vim.keymap.set("n", "<leader>bqs", "<cmd>BufferLinePickClose<CR>", { desc = "Select buffer to close" })
vim.keymap.set("n", "<leader>bqc", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })

vim.keymap.set("n", "<leader>le", "$", { desc = "Go to End of Line" })
vim.keymap.set("n", "<leader>ll", "G", { desc = "Go to Last Line" })
vim.keymap.set("n", "<leader>lf", "gg", { desc = "Go to First Line" })

vim.keymap.set("n", "<leader>ff", fzf.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Telescope Recent Files" })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope Recent Projects" })
vim.keymap.set("n", "<leader>ft", fzf.live_grep, { desc = "Telescope Find Text" })
vim.keymap.set("n", "<leader>fn", "<cmd>RemoteSSHFSConnect<CR>", { desc = "Find SSH Connections" })
