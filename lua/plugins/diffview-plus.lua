return {
	"dlyongemallo/diffview-plus.nvim",
	lazy = false,
	opts = {
		enhanced_diff_hl = true,
		use_icons = true,
	},
	keys = {
		{ mode = "n", "<leader>do", "<cmd>DiffviewOpen<CR>" },
		{ mode = "n", "<leader>dO", "<cmd>DiffviewOpen origin/HEAD<CR>" },
		{ mode = "n", "<leader>df", "<cmd>DiffviewFileHistory<CR>" },
		{ mode = "n", "<leader>dF", "<cmd>DiffviewFileHistory origin/HEAD<CR>" },
		{ mode = "n", "<leader>dq", "<cmd>DiffviewClose<CR>" },
	},
}
