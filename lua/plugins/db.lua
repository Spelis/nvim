return {
	{
		dir = "/home/elis/Documents/Lua/nvim-dbview/",
		-- "Spelis/nvim-dbview",
		opts = true,
		ft = { "db", "sql" },
		event = "BufReadPre *.db",
		cmd = { "DBOpen", "DBNew", "DBQuery" },
	},
}
