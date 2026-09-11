return {
	lazy = false,
	"brianhuster/live-preview.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},

	opts = {
		port = 4440,
	  dynamic_root = true,
		browser = ":",
	},
}
