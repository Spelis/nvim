-- Tab bar
local bufferline = require "bufferline"
bufferline.setup {
  options = {
    style_preset = bufferline.style_preset.no_italic,
    diagnostics_indicator = function(count, level)
      local icon = level:match "error" and " " or " "
      return " " .. icon .. count
    end,
    separator_style = "slant",
  },
}
