local fzf = require("telescope.builtin")
local wk = require("which-key")
local vim = vim
local km = vim.keymap.set -- i learnt to use vim search and replace while changing everything from keymap.set to km

wk.add({
	{ "<leader>t", group = "Toggle" },
	{ "<leader>q", group = "Quit" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>f", group = "Find" },
	{ "<leader>bq", group = "Close Buffer" },
})

-- keybinds
km("n", ";", ":", { desc = "Run Command" })
km("n", "<Esc>", "<cmd>noh<CR>")

km("n", "<leader>tt", "<cmd>ToggleTerm direction=float | startinsert<CR>", { desc = "Toggle Terminal" })
km("n", "<leader>te", "<cmd>Trouble diagnostics<CR>", { desc = "Toggle Error Pane" })

km("t", "<Esc>", "", { desc = "Close Terminal" })

km("n", "<leader>qw", "<cmd>wq<CR>", { desc = "Write and Quit" })
km("n", "<leader>qf", "<cmd>q!<CR>", { desc = "Force Quit" })
km("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit Nvim" })

km("n", "<leader>bn", "<cmd>ene<CR>", { desc = "Create new file" })
km("n", "<leader>bd", "<cmd>Dashboard<CR>", { desc = "Go back to Dashboard" })
km("n", "<leader>bpv", "<cmd>VenvSelect<CR>", { desc = "Select Python Interpreter" })
km("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write Buffer" })

km("n", "<leader>bqs", "<cmd>BufferLinePickClose<CR>", { desc = "Select buffer to close" })
km("n", "<leader>bqc", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
km("n", "<leader>bqr", "<cmd>BufferLineCloseRight", { desc = "Close all buffers to the right" })
km("n", "<leader>bql", "<cmd>BufferLineCloseLeft", { desc = "Close all buffers to the left" })

km("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
km("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save current buffer" })
km("n", "<C-w>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
km("i", "<C-w>", "<Esc><cmd>bdelete<CR>", { desc = "Close current buffer" })

km("n", "<leader>ff", fzf.find_files, { desc = "Telescope Find Files" })
km("n", "<leader>fb", fzf.buffers, { desc = "Telescope Buffers" })
km("n", "<leader>fr", fzf.oldfiles, { desc = "Telescope Recent Files" })
km("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope Recent Projects" })
km("n", "<leader>ft", fzf.live_grep, { desc = "Telescope Find Text" })
km("n", "<leader>fn", "<cmd>RemoteSSHFSConnect<CR>", { desc = "Find SSH Connections" })

km("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
km("i", "<C-e>", "<Esc><cmd>NvimTreeToggle<CR>i", { desc = "Toggle File Tree" })
