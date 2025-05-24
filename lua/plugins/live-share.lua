return {
	{
		"jbyuki/instant.nvim",
		config = function()
			local user = os.getenv("USER") or "unknown"
			local handle = io.popen("hostname")
			local host = handle:read("*l") or "unknown"
			handle:close()

			vim.g.instant_username = user .. "@" .. host
		end,
	},
}
