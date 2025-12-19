return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>dv", "<cmd>Gvdiffsplit!<CR>", { desc = "Git diff vertical split" })
		vim.keymap.set({ "n", "v" }, "<leader>hh", "<cmd>diffget //2<CR>", { desc = "Git diffget left" })
		vim.keymap.set({ "n", "v" }, "<leader>ll", "<cmd>diffget //3<CR>", { desc = "Git diffget right" })
		vim.keymap.set({ "n", "v" }, "<leader>dg", "<cmd>diffget<CR>", { desc = "Get diff change" })
		vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>", { desc = "Show Git blame" })
	end,
}
