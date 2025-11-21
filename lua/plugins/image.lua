return {
	"3rd/image.nvim",
	config = function()
		require("image").setup({
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "markdown", "vimwiki", "quarto" },
				},
			},
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			mux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
		})
	end,
}
