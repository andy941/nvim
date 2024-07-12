require("neotest").setup({
	adapters = {
		require("neotest-python"),
		require("rustaceanvim.neotest"),
		-- require("neotest-gtest").setup({}),
	},
})
