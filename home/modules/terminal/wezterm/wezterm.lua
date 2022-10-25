local wezterm = require 'wezterm'


-- A helper function for my fallback fonts
function Font_with_fallback(name, params)
	local names = { name, 'Operator Mono SSm Lig Book', 'JetBrainsMono Nerd Font Mono', 'Noto Color Emoji', 'JetBrains Mono' }
	return wezterm.font_with_fallback(names, params)
end

return {
	color_scheme = "Rosé Pine (base16)",
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "zsh", },

	font = Font_with_fallback 'monospace',
	font_rules = {
		-- Select a fancy italic font for italic text
		{
			italic = true,
			font = Font_with_fallback 'Operator Mono SSm Nerd Lig Medium Italic',
		},

		-- Similarly, a fancy bold+italic font
		{
			italic = true,
			intensity = 'Bold',
			font = Font_with_fallback 'Operator Mono SSm Nerd Lig Book Italic',
		},

		-- Make regular bold text a different color to make it stand out even more
		{
			intensity = 'Bold',
			font = Font_with_fallback(
				'Operator Mono SSm Nerd Lig Bold',
				{ foreground = 'tomato' }
			),
		},

		-- For half-intensity text, use a lighter weight font
		{
			intensity = 'Half',
			font = Font_with_fallback 'Operator Mono SSm Nerd Lig Light',
		},
	},


}
