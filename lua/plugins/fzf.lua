return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = true,
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fr",
				function()
					require("fzf-lua").oldfiles()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>ft",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Find Text",
			},
			{
				"<leader>fs",
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				desc = "Document Symbols",
			},
			{
				"<leader>fS",
				function()
					require("fzf-lua").lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},
		},
	},
}
