return {
	"quarto-dev/quarto-nvim",
	lazy = true,
	dependencies = {
		{
			"jmbuhr/otter.nvim",
			opts = {
				buffers = { set_filetype = true, write_to_disk = true },
			},
		},
	},
	ft = { "markdown", "rmarkdown", "quarto" },
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
					enabled = false,
				},
			},
		})

		vim.keymap.set("n", "<leader>rs", "<cmd>QuartoActivate<cr>", opts)
		vim.keymap.set("n", "<leader>vv", "<cmd>QuartoPreview<cr>", opts)
	end,
}
