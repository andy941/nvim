return {
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {
			buffers = { set_filetype = true, write_to_disk = true },
		},
	},
}
