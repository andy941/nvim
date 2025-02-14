require("markview").setup({
	preview = {
		filetypes = { "markdown", "quarto", "rmd" },
		modes = { "n", "i", "c", "no", "io", "co" },
		hybrid_modes = { "i", "n", ":" },
		ignore_nodes = { "fenced_code_block" },
		icon_provider = { "devicons" },

		-- This is nice to have
		callbacks = {
			on_enable = function(_, win)
				vim.wo[win].conceallevel = 2
				vim.wo[win].concealcursor = "nc"
			end,
		},
	},

	code_blocks = {
		style = "language",
		sign = false,
		pad_amount = 0,
	},

	latex = {
		enable = false,
	},
})
