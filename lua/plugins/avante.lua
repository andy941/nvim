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
			hints = { enabled = true },
			selector = {
				provider = "telescope",
			},
      dual_boost = { enabled = false},
			behaviour = {
        auto_suggestions = false,
				enable_token_counting = true,
				enable_fastapply = false,
        auto_add_current_file = false,
			},
		},
	},
}
