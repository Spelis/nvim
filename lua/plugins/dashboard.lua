return {
	{
		"rmagatti/auto-session",
		cmd = { "SessionRestore" },
		event = { "BufEnter", "InsertLeavePre", "InsertEnter", "VeryLazy" },
		opts = {
			auto_save = true,
			auto_restore = false,
			bypass_save_filetype = { "dashboard" },
		},
	},
}
