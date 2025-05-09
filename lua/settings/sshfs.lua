require("remote-sshfs").setup({
	connections = {
		ssh_configs = {
			vim.fn.expand("$HOME") .. "/.ssh/config",
			"/etc/ssh/ssh_config",
		},
		ui = {
			confirm = {
				connect = false,
				change_dir = false,
			},
		},
		handlers = {
			on_connect = {
				change_dir = true,
				callback = function()
					vim.cmd("stopinsert") -- exit insert after connecting
				end,
			},
			on_disconnect = {
				clean_mount_folders = true,
			},
			on_edit = {},
		},
	},
})
