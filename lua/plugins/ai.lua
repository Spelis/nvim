return {
	{
		"frankroeder/parrot.nvim",
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
