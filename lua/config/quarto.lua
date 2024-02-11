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

local runner = require("quarto.runner")

vim.keymap.set("n", "<C-s>", runner.run_cell, { desc = "run cell", silent = true })
-- vim.keymap.set("n", "<>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>a", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>l", runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<C-s>", runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<localleader>A", function()
	runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })
vim.keymap.set("n", "<leader>rs", "<cmd>QuartoActivate<cr>", opts)
vim.keymap.set("n", "<leader>vv", "<cmd>QuartoPreview<cr>", opts)
vim.keymap.set("n", "<leader>cB", "<cmd>Telescope bibtex format=markdown<cr>", opts)
