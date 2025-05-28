local conf = vim.api.nvim_exec('echo stdpath("config")', true)

math.randomseed(os.time() + vim.loop.hrtime())

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

local username = os.getenv("USER") or os.getenv("USERNAME") or "?"
username = username:gsub("^%l", string.upper)
local greet = get_greeting() .. ", " .. username .. "!"

footer = function()
	local messages = {
		"Welcome to  macs!",
		"did you try to dd your water spill?",
		"Nah, I'd  im",
		"Setting up Neovim is a long and messy road that never ends.",
		"Helping people write bugs since 1991",
		-- nice one nesting
		random_char_append(random_char_append(random_char_append("", "vc"), "ia"), "\"'[({`"),
		"not brain.exists == True",
		"The one true text editor.",
		" Comes with Telescope!",
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
		"the config provider was too lazy to put a quote here, ignore me.",
	}

	local message = messages[math.random(#messages)]

	return "\n" .. message
end

function random_char_append(str, chars)
	local rand_index = math.random(1, #chars)
	return str .. chars:sub(rand_index, rand_index)
end

return {
	width = 70,
	row = nil,
	col = nil,
	pane_gap = 4,
	autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	preset = {
		pick = nil,
		keys = {
			{ icon = " ", desc = "New file                   ", key = "n", action = ":ene" },
			{
				icon = "󱀸 ",
				desc = "Restore Session            ",
				key = "s",
				action = ":SessionRestore",
			},
			{
				icon = "󰚰 ",
				desc = "Project Browser            ",
				key = "p",
				action = ":Telescope projects",
			},
			{
				icon = "󰒲 ",
				desc = "Lazy                       ",
				key = "l",
				action = ":Lazy",
			},
			{
				icon = " ",
				desc = "Keybinds                   ",
				key = "?",
				action = ":WhichKey",
			},
			{
				icon = " ",
				desc = "Configuration              ",
				key = "c",
				action = ":e " .. conf .. "/init.lua | chdir " .. conf,
			},
			{ icon = " ", desc = "Quit Neovim                ", key = "q", action = ":qa!" },
		},
		-- Used by the `header` section
		header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 


]]
			.. footer()
			.. "\n"
			.. greet,

		-- item field formatters
		formats = {
			icon = function(item)
				if item.file and item.icon == "file" or item.icon == "directory" then
					return M.icon(item.file, item.icon)
				end
				return { item.icon, width = 2, hl = "icon" }
			end,
			footer = { "%s", align = "center" },
			header = { "%s", align = "center" },
			file = function(item, ctx)
				local fname = vim.fn.fnamemodify(item.file, ":~")
				fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
				if #fname > ctx.width then
					local dir = vim.fn.fnamemodify(fname, ":h")
					local file = vim.fn.fnamemodify(fname, ":t")
					if dir and file then
						file = file:sub(-(ctx.width - #dir - 2))
						fname = dir .. "/…" .. file
					end
				end
				local dir, file = fname:match("^(.*)/(.+)$")
				return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
			end,
		},
	},
	sections = {
		{ section = "header" },
		{ section = "keys", gap = 1, padding = 1 },
		{ section = "startup" },
	},
}
