local wezterm = require 'wezterm'
return {
	color_scheme = "Rosé Pine (base16)",
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "zsh", },

	font = wezterm.font_with_fallback {
		'monospace',
		'JetBrainsMono Nerd Font Mono'
	},
	font_rules = {
		intensity = "Bold",
		font = wezterm.font("monospace", { weight = "Normal", },)

	}


}
