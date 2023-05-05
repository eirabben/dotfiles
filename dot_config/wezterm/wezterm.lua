local wezterm = require("wezterm")

return {
	-- color_scheme = "Catppuccin Macchiato", -- Mocha, Macchiato, Frappe, Latte
	color_scheme = "Kanagawa (Gogh)",
	font = wezterm.font("JetBrainsMono Nerd Font"),
	freetype_load_flags = "NO_HINTING", -- Makes fonts smoother. The default is no flag, so maybe change this.
	font_size = 16,
	hide_tab_bar_if_only_one_tab = true,
	line_height = 1.2,
	window_padding = {
		left = "0",
		right = "0",
		top = "0",
		bottom = "0",
	},
}
