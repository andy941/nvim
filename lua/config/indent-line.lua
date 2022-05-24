require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	use_treesitter = true,
	use_treesitter_scope = true,
	max_indent_increase = 1,
	--show_first_indent_level = true,
	filetype_exclude = {
		'lspinfo',
		'packer',
		'checkhealth',
		'help',
		'man',
		'tex',
		'plaintex',
		'markdown',
		'bib',
		'',
	}
}
