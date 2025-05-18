local conf = vim.api.nvim_exec('echo stdpath("config")', true)
local function startuptime()
	return (math.floor(require("lazy.stats").stats().startuptime * 100 + 0.5) / 100)
end

function get_greeting()
	local hour = tonumber(os.date("%H"))
	if hour >= 5 and hour < 12 then
		return "Good morning"
	elseif hour >= 12 and hour < 17 then
		return "Good afternoon"
	elseif hour >= 17 and hour < 21 then
		return "Good evening"
	else
		return "Good night"
	end
end

function random_char_append(str, chars)
	local rand_index = math.random(1, #chars)
	return str .. chars:sub(rand_index, rand_index)
end

local username = os.getenv("USER") or os.getenv("USERNAME")
username = username:gsub("^%l", string.upper)
local greet = get_greeting() .. ", " .. username .. "!"

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
		event = "VimEnter",
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
					"󱐋 Powered By  eovim",
					greet,
					"",
				},
				center = {
					{ icon = " ", desc = "New file                   ", key = "n", action = "ene" },
					{ icon = "󱀸 ", desc = "Restore Session            ", key = "sr", action = "SessionRestore" },
					{ icon = "󰚰 ", desc = "Project Browser            ", key = "sl", action = "Telescope projects" },
					{ icon = " ", desc = "Find file                  ", key = "f", action = "Telescope find_files" },
					{ icon = "󰚰 ", desc = "Recently used files        ", key = "r", action = "Telescope oldfiles" },
					{
						icon = " ",
						desc = "Configuration              ",
						key = "c",
						action = "e " .. conf .. "/init.lua | chdir " .. conf,
					},
					{ icon = " ", desc = "Quit Neovim                ", key = "q", action = "qa!" },
				},
				footer = function()
					local messages = {
						"Vim is my favourite text editor. I've been using it for years...I can't figure out how to exit.",
						"Welcome to  macs!",
						"did you try to dd your water spill?",
						"Nah, I'd  im",
						"Setting up Neovim is a long and messy road that never ends.",
						"Helping people write bugs since 1991",
						-- nice one nesting
						random_char_append(random_char_append(random_char_append("", "vc"), "ia"), "\"'[({`"),
						"not brain.exists == True",
						"The one true text editor.",
						" comes with Telescope!",
						'"Write programs that do one thing and do it well." - Unix philosophy',
						"NVidia, Fuck you. ",
						"Did you mean 'emacs'?",
						"Linux is only free if your time has no value.",
						"All operating systems suck, but Linux just sucks less",
						"i use arch btw.",
						"cat 󰄛 ",
						"ggVG",
						"why use C-c + C-v when you can use y + p?",
						"arrow keys? nah, hjkl",
						"Escape is just a suggestion.",
						"99% configuring, 1% editing.",
						"real devs :q without saving",
						"I don't need therapy, I need :h",
						"I use vim because I hate myself efficiently.",
						"Everything is a buffer if you try hard enough.",
						"rm -rf your expectations.",
						"Today's bug is tomorrow's feature.",
						"hjkl is my cardio",
						"Every keystroke is a cry for help.",
						"Always test in prod.",
						"Just pushed to main. YOLO!",
						"daw",
						"yyp",
						random_char_append("g", "Uu") .. "iw",
						"zz",
						"the config provider was too lazy to put a quote here, have a good rest of your day.",
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
