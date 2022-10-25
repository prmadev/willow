local wezterm = require 'wezterm'



return {
	color_scheme = "Rosé Pine (base16)",
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "zsh" },

	font = wezterm.font_with_fallback {

		{
			family = 'JetbrainsMono Nerd Font',
		},

		{
			family = 'Gintronic Nerd Font',
		},

		{
			family = 'Gintronic',
		}

	},
	default_cursor_style = 'BlinkingBlock',
	cursor_blink_rate = 800,
	cursor_blink_ease_in = "Ease",

	exit_behavior = 'CloseOnCleanExit',
}
