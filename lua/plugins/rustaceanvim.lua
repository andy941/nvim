return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	dependencies = {
		"saecki/crates.nvim",
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		vim.g.rustaceanvim = {
			tools = {
				float_win_config = {
					border = "rounded",
				},
			},
		}
	end,
}
