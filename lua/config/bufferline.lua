require("bufferline").setup({
	options = {
		after = "catppuccin",
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})
		end,
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		max_name_length = 400,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 28,
		diagnostics = false, -- false | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = { "", "" }, -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = "directory", --'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
	},
})

-- move between buffer sat lightspeed
local utils = require("utils")
local opts = { noremap = true, silent = true }
utils.map("n", "L", ":BufferLineCycleNext<CR>", opts)
utils.map("n", "H", ":BufferLineCyclePrev<CR>", opts)
