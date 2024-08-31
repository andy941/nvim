require("gen").setup({
	model = "mistral",
	show_prompt = true,
	show_model = true,
	no_auto_close = true,
})

vim.keymap.set("n", "<leader>LM", require("gen").select_model)
