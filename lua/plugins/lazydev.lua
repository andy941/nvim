return {
	"folke/lazydev.nvim",
	ft = "lua",
	dependencies = {
		{ -- optional cmp completion source for require statements and module annotations
			"hrsh7th/nvim-cmp",
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
		},
	},
	event = "VeryLazy",
	config = function()
		require("lazydev").setup()
	end,
}
