return {
	{
		"Spelis/nvim-dbview",
		opts = true,
		ft = { "db", "sql" },
		event = "BufReadPre *.db",
		cmd = { "DBOpen", "DBNew", "DBQuery" },
	},
}
