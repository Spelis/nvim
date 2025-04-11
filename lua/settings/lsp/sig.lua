require("lsp_signature").setup {
  bind = true,
  floating_window = true,
  handler_opts = { border = "single" }, -- Border style
  toggle_key = "<C-d>", -- Toggle signature help
  extra_trigger_chars = { "(", "," }, -- Auto-trigger on these characters
}
