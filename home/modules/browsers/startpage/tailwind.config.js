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
				'pine': '#31748f',
				'rose': '#ebbcba',
				'gold': '#f6c177',
				'foam': '#9ccfd8',
				'hllow': '#21202e',
				'hlmed': '#403d52',
				'hlhigh': '#524f67',
				'bg': '#191724',
				'love': '#eb6f92',
				'muted': '#6e6a86',
				'subtle': '#908caa',
				'text': '#e0def4',
				'iris': '#c4a7e7',
				'surface': '#1f1d2e',
				'overlay': '#26233a',
			},
		},
		fontFamily: {
			sans: ['Recursive', 'sans-serif'],
			serif: ['Recursive', 'serif'],
			monospace: ['Recursive', 'monospace'],
		},
	},

	variants: {
		extend: {},
	},
	plugins: [],

}
