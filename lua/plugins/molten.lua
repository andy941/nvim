return {
	"benlubas/molten-nvim",
	-- lazy = false,
	-- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	build = ":UpdateRemotePlugins",
	init = function()
		-- this is an example, not a default. Please see the readme for more configuration options
		vim.g.molten_output_win_max_height = 80
		vim.g.molten_image_provider = "snacks.nvim"
		vim.g.molten_use_border_highlights = true
		vim.g.molten_auto_open_output = true
		vim.g.molten_output_crop_border = false
		vim.g.molten_output_virt_lines = false
		vim.g.molten_outputi_win_hide_on_leave = false
		vim.g.molten_output_win_style = "minimal"
		vim.g.molten_tick_rate = 200
		vim.g.molten_virt_text_max_lines = 80
		vim.g.molten_virt_text_truncate = "top"
	end,
}
