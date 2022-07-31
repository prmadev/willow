module.exports = {
	content: [
		'./index.html',
	],
	darkMode: 'media', // or 'media' or 'class'
	theme: {
		screens: {
			'sm': { 'min': '1px', 'max': '300px', },
			'md': { 'min': '300px', 'max': '600px', },
			'lg': { 'min': '600px', }
		},
		extend: {

			colors: {
				// // Rose Pine
				// 'pine': '#31748f',
				// 'rose': '#ebbcba',
				// 'gold': '#f6c177',
				// 'foam': '#9ccfd8',
				// 'hllow': '#21202e',
				// 'hlmed': '#403d52',
				// 'hlhigh': '#524f67',
				// 'bg': '#191724',
				// 'love': '#eb6f92',
				// 'muted': '#6e6a86',
				// 'subtle': '#908caa',
				// 'text': '#e0def4',
				// 'iris': '#c4a7e7',
				// 'surface': '#1f1d2e',
				// 'overlay': '#26233a',

				// // Catppucin mocha

				'rosewater': '#f5e0dc',
				'flamingo': '#f2cdcd',
				'pink': '#f5c2e7',
				'mauve': '#cba6f7',
				'red': '#f38ba8',
				'maroon': '#eba0ac',
				'peach': '#fab387',
				'yellow': '#f9e2af',
				'green': '#a6e3a1',
				'teal': '#94e2d5',
				'sky': '#89dceb',
				'sapphire': '#74c7ec',
				'blue': '#89b4fa',
				'lavender': '#b4befe',
				'text': '#cdd6f4',
				'subtext1': '#bac2de',
				'subtext0': '#a6adc8',
				'overlay2': '#9399b2',
				'overlay1': '#7f849c',
				'overlay0': '#6c7086',
				'surface2': '#585b70',
				'surface1': '#45475a',
				'surface0': '#313244',
				'base': '#1e1e2e',
				'mantle': '#181825',
				'crust': '#11111b',
			},
		},
		fontFamily: {
			sans: ['sans-serif'],
			serif: ['serif'],
			monospace: ['monospace'],
		},
	},

	variants: {
		extend: {},
	},
	plugins: [],

}
