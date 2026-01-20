require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = {},
		loops = {},
		functions = { "italic", "bold" },
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
		operators = {},
	},
	custom_highlights = function(colors)
		return {
			MoltenCell = { bg = colors.none },
			SagaLightBulb = { fg = colors.yellow },
		}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = { enabled = true },
		mason = true,
		octo = true,
		telekasten = true,
		headlines = true,
		illuminate = {
			lsp = true,
		},
		which_key = true,
		noice = true,
		lsp_trouble = true,
		lsp_saga = true,
		vimwiki = true,
		dap = {
			enabled = true,
			enable_ui = true, -- enable nvim-dap-ui
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = {},
				hints = {},
				warnings = {},
				information = {},
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = {
				background = true,
			},
		},
	},
})
