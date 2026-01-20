return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
			"stevearc/dressing.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
			-- "zbirenbaum/copilot.lua",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				ft = { "Avante" },
			},
		},
		opts = {
			provider = "copilot",
			mode = "agentic",
			providers = {
				copilot = {
					model = "claude-opus-4.5",
					auto_select_model = false,
				},
			},
			-- hints = { enabled = true },
			selector = {
				provider = "telescope",
			},
			behaviour = {
				auto_apply_diff_after_generation = false,
				enable_token_counting = true,
				auto_approve_tool_permissions = false,
				enable_fastapply = false,
			},
		},
	},
}
