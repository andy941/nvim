return {
	"pwntester/octo.nvim",
	-- Until github enterprise gets updated to >= 3.14!
	commit = "f09ff9413652e3c06a6817ba6284591c00121fe0",
	pin = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({
			use_local_fs = true, -- use local files on right side of reviews
			enable_builtin = true, -- shows a list of builtin actions when no action is provided
			ui = {
				use_signcolumn = true, -- show "modified" marks on the sign column
				use_signstatus = false, -- show "modified" marks on the status column
			},
			reviews = {
				auto_show_threads = false, -- automatically show comment threads on cursor move
			},

			suppress_missing_scope = { projects_v2 = true },
		})

		vim.keymap.set("n", "<leader>ct", "<cmd>Octo review thread<cr>", opts)
	end,
}