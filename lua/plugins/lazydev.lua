return {
	"folke/lazydev.nvim",
	ft = "lua",
	event = "VeryLazy",
	config = function()
		require("lazydev").setup()
	end,
}
