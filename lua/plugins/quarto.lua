return {
	"quarto-dev/quarto-nvim",
	dev = false,
	dependencies = {
		{
			"jmbuhr/otter.nvim",
			dev = false,
			opts = {
				buffers = { set_filetype = true, write_to_disk = true },
			},
		},
	},
	ft = { "markdown", "quarto", "rmarkdown" },
	config = function()
		require("quarto").setup({
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				languages = { "r", "python", "julia", "sh", "zsh", "bash", "c", "cpp" },
				chunks = "all", -- 'curly' or 'all'
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>rs", "<cmd>QuartoActivate<cr>", opts)
		vim.keymap.set("n", "<leader>vv", "<cmd>QuartoPreview<cr>", opts)
		vim.keymap.set("n", "<leader>cB", "<cmd>Telescope bibtex format=markdown<cr>", opts)
	end,
}
