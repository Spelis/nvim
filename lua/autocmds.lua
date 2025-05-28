vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "lua/plugins/*.lua",
	callback = function(args)
		local mod = "plugins." .. args.file:match("lua/plugins/(.*)%.lua$"):gsub("/", ".")
		package.loaded[mod] = nil
		require(mod)
		vim.notify("🔁 Reloaded: " .. mod)
	end,
})
