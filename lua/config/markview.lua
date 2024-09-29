require("markview").setup({
	filetypes = { "markdown", "quarto", "rmd" },
	modes = { "i", "n", "c", "no", "io", "co" },
	hybrid_modes = { "i", "n", ":" },

	-- This is nice to have
	callbacks = {
		on_enable = function(_, win)
			vim.wo[win].conceallevel = 2
			vim.wo[win].concealcursor = "nc"
		end,
	},

	code_blocks = {
		style = "language",
		sign = false,
	},
})
