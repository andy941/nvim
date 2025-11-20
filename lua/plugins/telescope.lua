return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"crispgm/telescope-heading.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
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
				spell_suggest = {
					theme = "dropdown",
					initial_mode = "normal",
					previewer = false,
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
		-- stylua: ignore start

		-- One character
		vim.keymap.set("n", "<leader>B", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "List open buffers" })
vim.keymap.set("n", "<leader>R", "<cmd>Telescope resume<cr>", { noremap = true, silent = true, desc = "Resume last Telescope" })
vim.keymap.set("n", "<leader>S", "<cmd>Telescope spell_suggest<cr>", { noremap = true, silent = true, desc = "Spell suggestions" })

		-- Two characters
		vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ff_and_lg, { desc = "Find files then live grep" })
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true, desc = "Fuzzy find in buffer" })
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live grep project" })
vim.keymap.set("n", "<leader>gG", "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true, desc = "Grep for string under cursor" })
vim.keymap.set("n", "<leader>H", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Help tags" })
vim.keymap.set("n", "<leader>kb", "<cmd>Telescope keymaps<cr>", { noremap = true, silent = true, desc = "Show keymaps" })
vim.keymap.set("n", "<leader>pr", "<cmd>Telescope project<cr>", { noremap = true, silent = true, desc = "Project picker" })

		-- LSP
	vim.keymap.set("n", "<leader>di", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true, desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { noremap = true, silent = true, desc = "Workspace symbols" })

		-- Search with relative path 'w-orking dir' or relative to 'w-orkspace'
	vim.keymap.set("n", "<leader>wf", "<cmd>Telescope find_files cwd=%:p:h<cr>", { noremap = true, silent = true, desc = "Find files in current dir" })
vim.keymap.set("n", "<leader>wg", "<cmd>Telescope live_grep cwd=%:p:h<cr>", { noremap = true, silent = true, desc = "Live grep in current dir" })
vim.keymap.set("n", "<leader>wG", "<cmd>Telescope grep_string cwd=%:p:h<cr>", { noremap = true, silent = true, desc = "Grep string in current dir" })

		-- Git
	vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true, desc = "Git branches" })
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true, desc = "Git commits" })
vim.keymap.set("n", "<leader>gL", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true, desc = "Git buffer commits" })

		-- headings
	vim.keymap.set("n", "<leader>sh", "<cmd>Telescope heading<cr>", { noremap = true, silent = true, desc = "Search headings" })

		-- Useful additions
	vim.keymap.set("n", "<leader>rc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", { noremap = true, silent = true, desc = "Find files in nvim config" })
vim.keymap.set("n", "<leader>CS", "<cmd>Telescope colorscheme<cr>", { noremap = true, silent = true, desc = "Colorscheme picker" })

		-- Templates
	vim.keymap.set("n", "<leader>T", "<cmd>Telescope find_template type=insert<cr>", { noremap = true, silent = true, desc = "Find template" })

		-- stylua: ignore end
	end,
}
