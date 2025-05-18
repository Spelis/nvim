local plugin_specs = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
	if file ~= "init.lua" and file:match("%.lua$") then
		local modname = "plugins." .. file:gsub("%.lua$", "")
		table.insert(plugin_specs, require(modname))
	end
end

return plugin_specs
