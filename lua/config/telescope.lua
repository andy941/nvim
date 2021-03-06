local utils = require('utils')
local opts = { noremap=true, silent=true }
local tele = require('telescope')
local actions = require('telescope.actions')

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
tele.setup {
	defaults = {
		layout_strategy = 'vertical',
		layout_config = {
			width = 0.90,
			height = 0.95,
			--preview_width = 0.70,
			preview_height = 0.75,
		},
		file_ignore_patterns = { -- % is an escape char in lua regex
			'Pictures/',
			'Drives/',
			'vpnconfigs/',
			'.git/',
			'lua%-language%-server/',
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
		},
		bibtex = {
			-- Context awareness disabled by default
			context = true,
			-- Fallback to global/directory .bib files if context not found
			-- This setting has no effect if context = false
			context_fallback = true,
			wrap = true,
			search_keys = {'author', 'year', 'title', 'abstract'},
			custom_formats = {
        {id = 'spaced_cite', cite_marker = '~\\cite{%s}'}
      },
      format = 'spaced_cite',
		},
		heading = {
			treesitter = true,
		},
	},
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
tele.load_extension('fzf')

-- project management with Telescope
tele.load_extension('project')

-- Bibtex citation search
tele.load_extension('bibtex')

-- Search in headings (if applicable)
tele.load_extension('heading')

-- DAP integration
tele.load_extension('dap')


-- KeyBindings -----------------------------------------------------------------------

-- One character
utils.map('n', '<leader>b',   	'<cmd>Telescope 	buffers<cr>', opts)

-- Two characters
utils.map('n', '<leader>ff',		'<cmd>Telescope		find_files<cr>', opts)
utils.map('n', '<leader>fu',  	'<cmd>Telescope 	current_buffer_fuzzy_find<cr>', opts)
utils.map('n', '<leader>gg',  	'<cmd>Telescope 	live_grep<cr>', opts)
utils.map('n', '<leader>ht',  	'<cmd>Telescope 	help_tags<cr>', opts)
utils.map('n', '<leader>kb',  	'<cmd>Telescope 	keymaps<cr>', opts)
utils.map('n', '<leader>pr',  	'<cmd>Telescope 	project<cr>', opts)

-- LSP
utils.map('n', '<leader>di',  	'<cmd>Telescope 	diagnostics<cr>', opts)
utils.map('n', '<leader>ws',  	'<cmd>Telescope 	lsp_dynamic_workspace_symbols<cr>', opts)

-- Search with relative path 'w-orking dir' or relative to 'w-orkspace'
utils.map('n', '<leader>wf',  	'<cmd>Telescope 	find_files			cwd=%:p:h<cr>', opts)
utils.map('n', '<leader>wg',  	'<cmd>Telescope 	live_grep			cwd=%:p:h<cr>', opts)

-- Git
utils.map('n', '<leader>G',		'<cmd>Telescope		git_status			cwd=%:p:h<cr>', opts)
utils.map('n', '<leader>gf',	'<cmd>Telescope		git_files			cwd=%:p:h<cr>', opts)
utils.map('n', '<leader>gb',	'<cmd>Telescope		git_branches<cr>', opts)
utils.map('n', '<leader>gl',	'<cmd>Telescope		git_commits<cr>', opts)
utils.map('n', '<leader>gd',	'<cmd>Telescope		git_bcommits<cr>', opts)

-- headings
utils.map('n', '<leader>sh',	'<cmd>Telescope		heading<cr>', opts)

-- Useful additions
utils.map('n', '<leader>rc', 	'<cmd>Telescope 	find_files			cwd=~/.config/nvim<cr>', opts)
utils.map('n', '<leader>CS', 	'<cmd>Telescope 	colorscheme<cr>', opts)

