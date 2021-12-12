require'lualine'.setup {
	options = {
		theme = 'auto',
		section_separators = { ' ', ' ' },
		component_separators = { ' ', ' ' },
	},
	sections = {
		lualine_c = { 
			{
				'filename',
				file_status = true, -- displays file status (readonly status, modified status)
				path = 2
			}
		}
	}
}
