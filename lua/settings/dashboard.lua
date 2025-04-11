local dashboard = require("dashboard")

local conf = vim.api.nvim_exec('echo stdpath("config")', true) .. "/init.lua"

-- Setup with centered layout
dashboard.setup({
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
		center = {
			{ icon = " ", desc = "New file                   ", key = "n", action = "ene | startinsert" },
			{ icon = " ", desc = "Find file                  ", key = "ff", action = "Telescope find_files" },
			{ icon = "󰚰 ", desc = "Recently used files        ", key = "fr", action = "Telescope oldfiles" },
			{ icon = "󱎸 ", desc = "Find text                  ", key = "ft", action = "Telescope live_grep" },
			{ icon = " ", desc = "Configuration              ", key = "c", action = "e " .. conf },
			{ icon = "󰑓 ", desc = "Update                     ", key = "u", action = "PaqUpdate" },
			{ icon = " ", desc = "Quit Neovim                ", key = "q", action = "qa!" },
		},
		footer = function()
			local messages = {
				"Vim is my favourite text editor. I've been using it for years...I can't figure out how to exit.",
				"Welcome to  macs!",
				"you try to dd your water spill.",
				"Nah, I'd  im",
				"Setting up Neovim is a long and messy road that never ends.",
				"Helping people write bugs since 1991",
				'ciw""󱊷 P',
				"brain.exists() = False",
			}

			local date = os.date("%a, %Y / %m / %d")
			local version = " " .. vim.version().major .. "." .. vim.version().minor .. " - 󰃭 " .. date
			local message = messages[math.random(#messages)]

			-- Center alignment calculation
			local max_width = math.max(#message, #version)

			return {
				"",
				message,
				version,
			}
		end,

		-- Styling configurations
		preview = { command = "", file_path = "", file_height = 0, file_width = 0 },
		packages = { enable = false }, -- Disable package stats
		shortcut = false, -- Disable default shortcuts
		vertical_center = true,
	},
})

-- Custom highlighting
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#c678dd" })

-- Auto-refresh footer on open
vim.api.nvim_create_autocmd("User", {
	pattern = "DashboardReady",
	callback = function()
		vim.schedule(function()
			package.loaded.dashboard = nil
			require("dashboard").setup()
		end)
	end,
})
