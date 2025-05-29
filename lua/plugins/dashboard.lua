return {
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			auto_save = true,
			auto_restore = false,
			bypass_save_filetype = { "dashboard" },
		},
	},
	{
		"spelis/project.nvim",
		event = "VimEnter",
		config = function()
			require("project_nvim").setup()
			require("telescope").load_extension("projects")
		end,
	},
	-- dashboard has been moved to lua/dashboard.lua. it is being sourced from snacks.lua.
}
