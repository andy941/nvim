require'lualine'.setup {

	options = {
		theme = 'gruvbox',
		section_separators = { ' ', ' ' },
		component_separators = { ' ', ' ' },
	},

	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'}
	}
}
