return {
	"EdenEast/nightfox.nvim",
	lazy = true,
	priority = 1000, -- important when switching
	config = function()
		require("nightfox").setup({
			styles = {
				comments = { "italic" },
				functions = { "italic", "bold" },
				types = { "bold" },
			},
			groups = {
				all = {
					BlinkCmpMenuSelection = { link = "PmenuSel" },
				},
			},
		})
		vim.cmd.colorscheme("nightfox")
	end,
}
