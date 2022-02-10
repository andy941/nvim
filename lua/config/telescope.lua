local utils = require('utils')
local actions = require "telescope.actions"

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
	defaults = {
		file_ignore_patterns = { -- % is an escape char in lua regex
			'Pictures/',
			'Drives/',
			'vpnconfigs/',
			'.git/',
			'lua%-language%-server/',
		},
		layout_config = {
			width = 0.99,
			height = 0.99,
			preview_width = 0.50
		},
		mappings = {
			n = {
				["<C-q>"] = false,
				["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = false,
				["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist
			}
		},
		prompt_prefix = "    "
	},
	pickers = {
		find_files = {
			hidden = true
		},
		live_grep = {
			hidden = true
		},
		file_browser = {
			hidden = true
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- project management with Telescope
require('telescope').load_extension('project')

-- KeyBindings -----------------------------------------------------------------------

-- One character
utils.map('n', '<leader>b',   	'<cmd>Telescope 	buffers<cr>')

-- Two characters
utils.map('n', '<leader>ff',	'<cmd>Telescope		find_files<cr>')
utils.map('n', '<leader>fu',  	'<cmd>Telescope 	current_buffer_fuzzy_find<cr>')
utils.map('n', '<leader>gg',  	'<cmd>Telescope 	live_grep<cr>')
utils.map('n', '<leader>tt',  	'<cmd>Telescope 	treesitter<cr>')
utils.map('n', '<leader>ht',  	'<cmd>Telescope 	help_tags<cr>')
utils.map('n', '<leader>kb',  	'<cmd>Telescope 	keymaps<cr>')
utils.map('n', '<leader>di',  	'<cmd>Telescope 	diagnostics<cr>')
utils.map('n', '<leader>pr',  	'<cmd>Telescope 	project<cr>')

-- Search with relative path "w-orking dir"
utils.map('n', '<leader>wf',  	'<cmd>Telescope 	find_files			cwd=%:p:h<cr>')
utils.map('n', '<leader>wg',  	'<cmd>Telescope 	live_grep			cwd=%:p:h<cr>')

-- Git
utils.map('n', '<leader>G',		'<cmd>Telescope		git_status			cwd=%:p:h<cr>')
utils.map('n', '<leader>gf',	'<cmd>Telescope		git_files			cwd=%:p:h<cr>')
utils.map('n', '<leader>gb',	'<cmd>Telescope		git_branches<cr>')
utils.map('n', '<leader>gl',	'<cmd>Telescope		git_commits<cr>')
utils.map('n', '<leader>gd',	'<cmd>Telescope		git_bcommits<cr>')

-- Useful additions
utils.map('n', '<leader>rc',  	'<cmd>Telescope 	find_files			cwd=~/.config/nvim<cr>')
utils.map('n', '<leader>CS', 	'<cmd>Telescope 	colorscheme<cr>')

