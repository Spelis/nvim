return {
	{
		"rmagatti/auto-session",
		cmd = { "SessionRestore" },
		event = "VimEnter",
		opts = {
			auto_save = true,
			auto_restore = false,
		},
	},
}
