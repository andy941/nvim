return {
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			buffers = {
				set_filetype = true,
				write_to_disk = true,
			},
		},
	},
}
