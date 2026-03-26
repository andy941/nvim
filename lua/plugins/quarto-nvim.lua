return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"benlubas/molten-nvim",
	},

	config = function()
		require("quarto").setup({
			debug = false,
			filetypes = { "quarto", "rmd", "qmd" },
			lspFeatures = {
				enabled = true,
				chunks = "curly",
				languages = { "python", "c", "cpp", "julia", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "molten", -- "molten", "slime", "iron" or <function>
				ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
				-- Takes precedence over `default_method`
				never_run = { "yaml" }, -- filetypes which are never sent to a code runner
			},
		})
	end,
}
