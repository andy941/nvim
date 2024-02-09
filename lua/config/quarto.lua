require("quarto").setup({
	debug = false,
	closePreviewOnExit = true,
	lspFeatures = {
		enabled = true,
		languages = { "r", "python", "julia", "bash" },
		chunks = "curly", -- 'curly' or 'all'
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
		default_method = "molten", -- 'molten' or 'slime'
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
