require("gen").setup({
	model = "mistral",
	show_prompt = true,
	show_model = true,
	no_auto_close = true,
	display_mode = "split",
})

vim.keymap.set("n", "<leader>LM", require("gen").select_model)
vim.keymap.set("n", "<leader>lc", "<cmd>Gen Chat<CR>")
vim.keymap.set("n", "<leader>la", "<cmd>Gen Ask<CR>")
vim.keymap.set("v", "<leader>la", "<cmd>Gen Ask<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>Gen Review Code<CR>")
vim.keymap.set("v", "<leader>lr", "<cmd>Gen Review Code<CR>")
