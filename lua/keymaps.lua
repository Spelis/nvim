local fzf = require("telescope.builtin")
local wk = require("which-key")
local vim = vim
local km = vim.keymap.set -- i learnt to use vim search and replace while changing everything from keymap.set to km

wk.add({
	{ "<leader>q", group = "Quit" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>f", group = "Find" },
})

-- keybinds
km("n", ";", ":", { desc = "Run Command" })
km("n", "<Esc>", "<cmd>noh<CR>")

km("n", "<leader><CR>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })

km("n", "<leader>bn", "<cmd>ene<CR>", { desc = "Create new file" })
km("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write Buffer" })
km("n", "<leader>bq", "<cmd>bdelete<CR>", { desc = "Close Buffer" })

km("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
km("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save current buffer" })

km("n", "<leader>ff", fzf.find_files, { desc = "Telescope Find Files" })
km("n", "<leader>fb", fzf.buffers, { desc = "Telescope Buffers" })
km("n", "<leader>fr", fzf.oldfiles, { desc = "Telescope Recent Files" })
km("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope Recent Projects" })
km("n", "<leader>ft", fzf.live_grep, { desc = "Telescope Find Text" })
km("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Diagnostics" })
km("n", "<leader>fo", "<cmd>Oil<CR>", { desc = "File Explorer" })
km("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Telescope symbols" })
km("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "Telescope Workspace Symbols" })

local function toggle_diffview()
	local view = require("diffview.lib").get_current_view()
	if view then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end

km("n", "<leader>gd", toggle_diffview, { desc = "Toggle Git Diff View" })
