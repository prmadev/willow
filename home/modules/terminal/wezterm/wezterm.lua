local wezterm = require 'wezterm'



return {
	color_scheme = "Rosé Pine (base16)",
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "zsh" },

	font = wezterm.font_with_fallback {
		{
			family = 'ComicCodeLigatures Nerd Font',
		},

		{
			family = 'Comic Code Ligatures',
		},
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
	font_rules = {
		{
			italic = true,
			intensity = 'Bold',
			font = wezterm.font_with_fallback {
				{
					family = 'ComicCodeLigatures Nerd Font',
					weigth = "Bold",
					style = "Italic",
				},
			},
		},

	},
	default_cursor_style = 'BlinkingBlock',
	cursor_blink_rate = 800,
	cursor_blink_ease_in = "Ease",
	animation_fps = 60,
	force_reverse_video_cursor = true,
	exit_behavior = 'CloseOnCleanExit',
	set_environment_variables = {
		TERMINFO_DIRS = '~/terminfo',
		WSLENV = 'TERMINFO_DIRS',
	},
	term = "wezterm",
	window_frame = {
		inactive_titlebar_bg = '#353535',
		active_titlebar_bg = '#2b2042',
		inactive_titlebar_fg = '#cccccc',
		active_titlebar_fg = '#ffffff',
		inactive_titlebar_border_bottom = '#2b2042',
		active_titlebar_border_bottom = '#2b2042',
		button_fg = '#cccccc',
		button_bg = '#2b2042',
		button_hover_fg = '#ffffff',
		button_hover_bg = '#3b3052',
	},
}
