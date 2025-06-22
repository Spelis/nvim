if vim.fn.executable("ollama") == 1 then
	return {
		{
			"frankroeder/parrot.nvim",
			event = "BufReadPre",
			tag = "v1.8.0",
			opts = {
				providers = {
					ollama = {
						model = "code-only-llama3",
						filter = function(output)
							return output
								:gsub("```[%w]*\n?", "") -- remove ``` or ```lang
								:gsub("```", "") -- just in case there's a trailing ```
								:gsub("^%s*", "") -- strip leading whitespace
						end,
					},
				},
			},
		},
	}
else
	print("AI Disabled. No Ollama found on system.")
	return {}
end
