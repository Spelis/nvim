return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier" },
				html = { "prettierd", "prettier", "htmlbeautifier" },
				htmldjango = { "prettierd", "prettier", "htmlbeautifier", "djlint" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				h = { "clang_format" },
				hpp = { "clang_format" },
			},
			formatters = {
				clang_format = {
					prepend_args = {
						'--style={"BasedOnStyle":"Google","UseTab":"Always","IndentWidth":4,"TabWidth":4}',
					},
				},
				stylua = {
					prepend_args = {
						"--indent-type",
						"Tabs",
						"--indent-width",
						"4",
					},
				},
				rustfmt = {
					prepend_args = {
						"--config",
						"hard_tabs=true",
						"--config",
						"tab_spaces=4",
					},
				},
				prettier = {
					prepend_args = {
						"--use-tabs",
						"--tab-width",
						"4",
					},
				},
				prettierd = {
					prepend_args = {
						"--use-tabs",
						"--tab-width",
						"4",
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		-- Fallback global tab settings
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.softtabstop = 4
		vim.opt.expandtab = false
	end,
}
