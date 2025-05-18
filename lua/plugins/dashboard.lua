local conf = vim.api.nvim_exec('echo stdpath("config")', true)
local function startuptime()
	return (math.floor(require("lazy.stats").stats().startuptime * 100 + 0.5) / 100)
end

local function extendlist(l1, l2)
	local ret = {}
	for i, v in ipairs(l1) do
		table.insert(ret, v)
	end
	for i, v in ipairs(l2) do
		table.insert(ret, v)
	end
	return ret
end

return {
	{
		"rmagatti/auto-session",
		opts = {
			auto_save = true,
			auto_restore = false,
			bypass_save_filetype = { "dashboard" },
		},
	},
	{ "spelis/project.nvim" },
	{
		"nvimdev/dashboard-nvim",
		opts = {
			theme = "doom",
			config = {
				header = {
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
					"",
					"",
					"󱐋 Powered By  eovim",
					"",
				},
				center = extendlist({
					{ icon = " ", desc = "New file                   ", key = "n", action = "ene" },
					{ icon = "󱀸 ", desc = "Restore Session            ", key = "sr", action = "SessionRestore" },
					{ icon = "󰚰 ", desc = "Project Browser            ", key = "sl", action = "Telescope projects" },
					{ icon = "󰛳 ", desc = "SSH Connections            ", key = "ss", action = "RemoteSSHFSConnect" },
					{ icon = " ", desc = "Find file                  ", key = "f", action = "Telescope find_files" },
					{ icon = "󰚰 ", desc = "Recently used files        ", key = "r", action = "Telescope oldfiles" },
					{ icon = "󱎸 ", desc = "Find text                  ", key = "t", action = "Telescope live_grep" },
					{
						icon = " ",
						desc = "Configuration              ",
						key = "c",
						action = "e " .. conf .. "/init.lua | chdir " .. conf,
					},
					{ icon = "󰒲 ", desc = "Lazy                       ", key = "l", action = "Lazy" },
					{ icon = " ", desc = "Quit Neovim                ", key = "q", action = "qa!" },
				}, {}), -- allows for dynamically adding stuff to the list, probably a better way to do this.
				footer = function()
					local messages = {
						"Vim is my favourite text editor. I've been using it for years...I can't figure out how to exit.",
						"Welcome to  macs!",
						"did you try to dd your water spill?",
						"Nah, I'd  im",
						"Setting up Neovim is a long and messy road that never ends.",
						"Helping people write bugs since 1991",
						'ciw""󱊷 P',
						"brain.exists() = False",
						"The one true text editor.",
						" comes with Telescope!",
						'"Write programs that do one thing and do it well." - Unix philosophy',
						"NVidia, Fuck you. ",
						"Did you mean 'emacs'?",
						"Linux is only free if your time has no value.",
						"All operating systems suck, but Linux just sucks less",
						"i use arch btw.",
						"cat 󰄛 ",
					}

					local date = os.date("%a, %Y / %m / %d"):gsub("^%l", string.upper)
					local version = " " .. vim.version().major .. "." .. vim.version().minor .. " - 󰃭 " .. date
					local sut = " " .. startuptime() .. "ms"
					local message = messages[math.random(#messages)]

					return {
						"",
						message,
						version,
						sut,
					}
				end,

				-- Styling configurations
				preview = { command = "", file_path = "", file_height = 0, file_width = 0 },
				packages = { enable = false }, -- Disable package stats
				shortcut = false, -- Disable default shortcuts
				vertical_center = true,
			},
		},
	},
}
