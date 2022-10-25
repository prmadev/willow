local wezterm = require 'wezterm'



return {
	color_scheme = "Rosé Pine (base16)",
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "zsh" },

	font = wezterm.font_with_fallback {
		{
			family = 'Operator Mono SSm Nerd Lig Book',
			weight = 325,
			style = "Normal",
		}

	},
	font_rules = {
		-- Select a fancy italic font for italic text
		{
			italic = true,
			font = wezterm.font_with_fallback {
				{
					family = 'Operator Mono SSm Nerd Lig',
					weight = 325,
					style = "Italic",
				},

			},
		},

		-- Similarly, a fancy bold+italic font
		{
			italic = true,
			intensity = 'Bold',
			font = wezterm.font_with_fallback {
				{
					family = 'Operator Mono SSm Nerd Lig',
					weight = "Regular",
					style = "Italic",
				},
			},
		},

		-- Make regular bold text a different color to make it stand out even more
		{
			intensity = 'Bold',
			font = wezterm.font_with_fallback {
				{
					family = 'Operator Mono SSm Nerd Lig',
					weight = "Regular",
					style = "Normal",
				},
			},
		},

		-- For half-intensity text, use a lighter weight font
		{
			intensity = 'Half',
			font = wezterm.font_with_fallback {
				{
					family = 'Operator Mono SSm Nerd Lig',
					weight = "Light",
					style = "Normal",
				},
			},
		},
	}
}
