return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		scope = {
			show_start = false,
			show_end = false,
		},
	},
}
