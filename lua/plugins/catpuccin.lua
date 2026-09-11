return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("catppuccin").setup({
			-- flavour = "latte", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
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
			lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
					ok = { "undercurl" },
				},
				inlay_hints = {
					background = true,
				},
			},
			custom_highlights = function(colors)
				return {
					SagaLightBulb = { fg = colors.yellow },
				}
			end,
			auto_integrations = false,
			integrations = {
				notify = true,
				diffview = true,
				blink_cmp = {
					style = "bordered",
				},
				lsp_saga = true,
				illuminate = {
					lsp = true,
				},
				dap = {
					enabled = true,
					enable_ui = true, -- enable nvim-dap-ui
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
