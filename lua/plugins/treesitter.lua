return {
	{ "nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate", event = { "BufReadPost", "BufNewFile" } },
}
