local wezterm = require 'wezterm'

return {
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
  -- color_scheme = "Darcula (base16)",
  font = wezterm.font 'JetBrainsMono Nerd Font',
  -- font = wezterm.font 'MonoLisa Trial',
  font_size = 16,
  hide_tab_bar_if_only_one_tab = true,
  line_height = 1.2,
  window_padding = {
    left = '0',
    right = '0',
    top = '0',
    bottom = '0',
  },
}
