return {
	"nvim-neotest/neotest",
	ft = { "c", "cpp", "rust", "python" },
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"alfaix/neotest-gtest",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
				require("rustaceanvim.neotest"),
				require("neotest-gtest").setup({}),
			},
		})
	end,
}
