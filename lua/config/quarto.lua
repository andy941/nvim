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

---- Molten keymaps
-- local runner = require("quarto.runner")
-- vim.keymap.set("n", "<C-s>", runner.run_cell, { desc = "run cell", silent = true })
-- vim.keymap.set("n", "<localleader>a", runner.run_all, { desc = "run all cells", silent = true })
-- vim.keymap.set("n", "<localleader>l", runner.run_line, { desc = "run line", silent = true })
-- vim.keymap.set("v", "<C-s>", runner.run_range, { desc = "run visual range", silent = true })
-- vim.keymap.set("n", "<localleader>A", function()
-- 	runner.run_all(true)
-- end, { desc = "run all cells of all languages", silent = true })

vim.keymap.set("n", "<leader>rs", "<cmd>QuartoActivate<cr>", opts)
vim.keymap.set("n", "<leader>vv", "<cmd>QuartoPreview<cr>", opts)
vim.keymap.set("n", "<leader>cB", "<cmd>Telescope bibtex format=markdown<cr>", opts)

local M = {}
M.reticulate_running = false
local function send_cell()
	if vim.b["quarto_is_" .. "r" .. "_mode"] == nil then
		vim.cmd([[call slime#send_cell()]])
		return
	end
	if vim.b["quarto_is_" .. "r" .. "_mode"] == true then
		local is_python = require("otter.tools.functions").is_otter_language_context("python")
		if is_python and not M.reticulate_running then
			vim.cmd([[call slime#send("reticulate::repl_python()" . "\r")]])
			M.reticulate_running = true
		end
		if not is_python and M.reticulate_running then
			vim.cmd([[call slime#send("exit" . "\r")]])
			M.reticulate_running = false
		end
		vim.cmd([[call slime#send_cell()]])
		vim.cmd([[call slime#send("\n")]])
	end
end

vim.b["quarto_is_" .. "r" .. "_mode"] = nil
vim.keymap.set("n", "<localleader>R", function()
	vim.b["quarto_is_" .. "r" .. "_mode"] = true
	vim.cmd([[TermExec direction=vertical cmd="R"]])
end)

vim.keymap.set("n", "<C-s>", send_cell)
