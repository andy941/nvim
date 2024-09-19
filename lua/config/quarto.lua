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
	codeRunner = {
		enabled = false,
		default_method = "slime", -- 'molten' or 'slime'
		--ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
		-- Takes precedence over `default_method`
		never_run = { "yaml" }, -- filetypes which are never sent to a code runner
	},
	keymap = {
		hover = "K",
		definition = "gD",
		rename = "<leader>rn",
		references = "gr",
	},
})

vim.keymap.set("n", "<leader>rs", "<cmd>QuartoActivate<cr>", opts)
vim.keymap.set("n", "<leader>vv", "<cmd>QuartoPreview<cr>", opts)
vim.keymap.set("n", "<leader>cB", "<cmd>Telescope bibtex format=markdown<cr>", opts)

