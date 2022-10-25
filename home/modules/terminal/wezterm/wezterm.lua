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
	animation_fps = 60,

	exit_behavior = 'CloseOnCleanExit',
	set_environment_variables = {
		TERMINFO_DIRS = '~/terminfo',
		WSLENV = 'TERMINFO_DIRS',
	},
	term = "wezterm",
	window_background_gradient = {
		orientation = { Linear = { angle = 45.0 } },
		colors = {
			"#191724",
			"#1f1d2e"
		}

	},
}
