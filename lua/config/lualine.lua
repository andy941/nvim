require'lualine'.setup {

	options = {
		theme = 'gruvbox-flat',
		section_separators = { ' ', ' ' },
		component_separators = { ' ', ' ' },
	},

	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		--lualine_c = {'require("nvim-treesitter").statusline(
		--indicator_size = 100,
		--type_patterns = {'class', 'function', 'method'},
		--transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
		--separator = ' -> ')'}
	}
}
