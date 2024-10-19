local utils = require("utils")
local opts = { noremap = true, silent = true }
local tele = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")
local trouble = require("trouble.sources.telescope")

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
tele.setup({
	defaults = {
		layout_strategy = "flex",
		layout_config = {
			width = 0.90,
			height = 0.95,
			vertical = { preview_height = 0.75 },
			horizontal = { preview_width = 0.66 },
		},
		file_ignore_patterns = { -- % is an escape char in lua regex
			"Pictures/",
			"Drives/",
			"vpnconfigs/",
			".git/",
			"lua%-language%-server/",
			".cache/",
			"build/",
		},
		mappings = {
			n = {
				--["<C-q>"] = false,
				["<C-q>"] = trouble.open,
				["<M-q>"] = false,
				["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-a>"] = actions.toggle_all,
			},
			i = {
				["<C-a>"] = actions.toggle_all,
				["<C-q>"] = trouble.open,
			},
		},
		prompt_prefix = "    ",
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		find_files = {
			hidden = true,
		},
		live_grep = {
			hidden = true,
		},
		file_browser = {
			hidden = true,
		},
		buffers = {
			theme = "dropdown",
			initial_mode = "normal",
			previewer = false,
			sort_mru = true,
			mappings = {
				n = {
					["<C-e>"] = actions.delete_buffer,
				},
				i = {
					["<C-e>"] = actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		project = {
			theme = "dropdown",
			hidden_files = true,
			sync_with_nvim_tree = false,
		},
		bibtex = {
			-- Context awareness disabled by default
			context = true,
			-- Fallback to global/directory .bib files if context not found
			-- This setting has no effect if context = false
			context_fallback = true,
			wrap = true,
			search_keys = { "author", "year", "title", "abstract" },
			custom_formats = {
				{ id = "spaced_cite", cite_marker = "~\\citep{%s}" },
			},
			format = "spaced_cite",
		},
		heading = {
			treesitter = true,
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
tele.load_extension("fzf")

-- Preview media files
tele.load_extension("media_files")

-- project management with Telescope
tele.load_extension("project")

-- Bibtex citation search
tele.load_extension("bibtex")

-- Search in headings (if applicable)
tele.load_extension("heading")

-- DAP integration
tele.load_extension("dap")

-- ui.select replacement
tele.load_extension("ui-select")

-- Templates
tele.load_extension("find_template")

-- Custom functions ------------------------------------------------------------------
-- find files and then live grep into their contents
local ff_and_lg = function()
	builtin.find_files({
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local current_picker = action_state.get_current_picker(prompt_bufnr)
				local selections = current_picker:get_multi_selection()
				-- if no multi-selection, leverage current selection
				if vim.tbl_isempty(selections) then
					table.insert(selections, action_state.get_selected_entry())
				end
				local paths = vim.tbl_map(function(e)
					return e.path
				end, selections)
				actions.close(prompt_bufnr)
				builtin.live_grep({
					search_dirs = paths,
				})
			end)
			-- true: attach default mappings; false: don't attach default mappings
			return true
		end,
	})
end

-- KeyBindings -----------------------------------------------------------------------

-- One character
utils.map("n", "<leader>B", "<cmd>Telescope 	buffers<cr>", opts)

-- Two characters
utils.map("n", "<Leader>ff", "<cmd>Telescope		find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", ff_and_lg)
utils.map("n", "<leader>fu", "<cmd>Telescope 	current_buffer_fuzzy_find<cr>", opts)
utils.map("n", "<leader>gg", "<cmd>Telescope 	live_grep<cr>", opts)
utils.map("n", "<leader>gG", "<cmd>Telescope  grep_string<cr>", opts)
utils.map("n", "<leader>H", "<cmd>Telescope 	help_tags<cr>", opts)
utils.map("n", "<leader>kb", "<cmd>Telescope 	keymaps<cr>", opts)
utils.map("n", "<leader>pr", "<cmd>Telescope 	project<cr>", opts)
utils.map("n", "<leader>R", "<cmd>Telescope 	resume<cr>", opts)

-- LSP
utils.map("n", "<leader>di", "<cmd>Telescope 	diagnostics<cr>", opts)
utils.map("n", "<leader>ws", "<cmd>Telescope 	lsp_dynamic_workspace_symbols<cr>", opts)

-- Search with relative path 'w-orking dir' or relative to 'w-orkspace'
utils.map("n", "<leader>wf", "<cmd>Telescope 	find_files			cwd=%:p:h<cr>", opts)
utils.map("n", "<leader>wg", "<cmd>Telescope 	live_grep			cwd=%:p:h<cr>", opts)
utils.map("n", "<leader>wG", "<cmd>Telescope 	grep_string			cwd=%:p:h<cr>", opts)

-- Git
utils.map("n", "<leader>gb", "<cmd>Telescope		git_branches<cr>", opts)
utils.map("n", "<leader>gl", "<cmd>Telescope		git_commits<cr>", opts)
utils.map("n", "<leader>gL", "<cmd>Telescope		git_bcommits<cr>", opts)

-- headings
utils.map("n", "<leader>sh", "<cmd>Telescope		heading<cr>", opts)

-- Useful additions
utils.map("n", "<leader>rc", "<cmd>Telescope 	find_files			cwd=~/.config/nvim<cr>", opts)
utils.map("n", "<leader>CS", "<cmd>Telescope 	colorscheme<cr>", opts)

-- Templates
utils.map("n", "<leader>T", "<cmd>Telescope find_template 	type=insert<cr>", opts)
