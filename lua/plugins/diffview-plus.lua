return {
	"dlyongemallo/diffview-plus.nvim",
	lazy = false,
	opts = {
		enhanced_diff_hl = true,
		use_icons = true,
		hooks = {
			diff_buf_win_enter = function()
				vim.opt_local.wrap = false
				vim.opt_local.linebreak = false
			end,
		},
		commit_log_panel = {
			win_config = {
				win_opts = {
					wrap = false,
				},
			},
		},
	},
	keys = {
		{ mode = "n", "<leader>do", "<cmd>DiffviewOpen<CR>" },
		{ mode = "n", "<leader>dO", "<cmd>DiffviewOpen origin/HEAD<CR>" },
		{ mode = "n", "<leader>df", "<cmd>DiffviewFileHistory<CR>" },
		{ mode = "n", "<leader>dF", "<cmd>DiffviewFileHistory origin/HEAD<CR>" },
		{ mode = "n", "<leader>dq", "<cmd>DiffviewClose<CR>" },
	},
}
