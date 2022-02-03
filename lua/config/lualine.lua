require'lualine'.setup {
	options = {
		theme = 'auto',
		--section_separators = { ' ', ' ' },
		--component_separators = { ' ', ' ' },
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
	},
	sections = {
		lualine_a = {'mode'},
	lualine_b = {'diff', 'branch', 'diagnostics'},
	lualine_c = { 
		{
	'filename',
	file_status = true, -- displays file status (readonly status, modified status)
	path = 2
	}
	},
	lualine_x = {'encoding', 'fileformat', 'filetype', 'filesize'},
	},
	extensions = {'fugitive', 'symbols-outline'}
}
