require("remote-sshfs").setup({
	connections = {
		ssh_configs = {
			vim.fn.expand("$HOME") .. "/.ssh/config",
			"/etc/ssh/ssh_config",
		},
		ui = {
			confirm = {
				change_dir = true,
			},
		},
		handlers = {
			on_connect = {
				change_dir = true,
			},
			on_disconnect = {
				clean_mount_folders = true,
			},
			on_edit = {},
		},
	},
})
