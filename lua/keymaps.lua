local fzf = require("telescope.builtin")
local wk = require("which-key")
local vim = vim
local km = vim.keymap.set

wk.add({
	{ "<leader>q", group = "Quit" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>f", group = "Find" },
})

-- keybinds
km("n", ";", ":", { desc = "Run Command" })
km("n", "<Esc>", "<cmd>noh<CR>")
km("n", "<leader>?", "<cmd>WhichKey<CR>")

km("n", "<leader><CR>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })

km("n", "<leader>bn", "<cmd>ene<CR>", { desc = "Create new file" })
km("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write Buffer" })
km("n", "<leader>bq", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
km("n", "<leader>bd", "<cmd>lua require'snacks'.dashboard()<CR>", { desc = "Open Dashboard" })

km("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
km("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save current buffer" })

-- Telescope keybinds have been moved to the telescope.lua file
km("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope Recent Projects" })
km("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Diagnostics" })
km("n", "<leader>fo", "<cmd>Oil<CR>", { desc = "File Explorer" })

local function toggle_diffview()
	local view = require("diffview.lib").get_current_view()
	if view then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end

km("n", "<leader>gd", toggle_diffview, { desc = "Toggle Git Diff View" })

km("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle Tabs" })
