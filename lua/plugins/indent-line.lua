return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
			--exclude = {
			--	"lspinfo",
			--	"packer",
			--	"checkhealth",
			--	"help",
			--	"man",
			--	"tex",
			--	"plaintex",
			--	"markdown",
			--	"bib",
			--	"",
			--},
		})
	end,
}
