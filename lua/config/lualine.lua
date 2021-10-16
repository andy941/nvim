require'lualine'.setup {

	options = {
		theme = 'gruvbox-flat',
		section_separators = { ' ', ' ' },
		component_separators = { ' ', ' ' },
	},

	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'}
	}
}
