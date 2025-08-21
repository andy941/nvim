require("r").setup({
	R_args = { "--quiet", "--no-save" },
	hook = {
		on_filetype = function()
			vim.keymap.set("n", "<C-p>", "<Plug>RPreviousRChunk", opts)
			vim.keymap.set("n", "<C-n>", "<Plug>RNextRChunk", opts)
			vim.keymap.set("n", "<localleader>aa", "<Plug>RSendChunkFH", opts)
			vim.keymap.set("n", "<C-s>", "<Plug>RSendChunk", opts)
			vim.keymap.set("v", "<C-s>", "<Plug>RSendSelection", opts)
			vim.keymap.set("n", "<C-c>", "<Plug>RStop", opts)
			vim.keymap.set("v", "<C-c>", "<Plug>RStop", opts)
		end,
	},
	min_editor_width = vim.fn.winwidth(0) * 2 / 3,
	rconsole_width = 0,
	rconsole_height = vim.fn.winheight(0) / 4,
	objbr_place = "RIGHT", -- console, script, LEFT, RIGHT
	-- objbr_h = vim.fn.winheight(0) / 4,
	objbr_w = vim.fn.winwidth(0) / 8,
	objbr_opendf = true,
	specialplot = true,
	routnotab = true,
	clear_line = true,
	insert_mode_cmds = false,
	-- non_r_compl = false,
	nvimpager = "float",
	Rout_more_colors = true,
	hl_term = false,
	pdfviewer = "zathura",
	-- R_user_maps_only = 1,,
	-- R_disable_cmds = ['RSetwd', 'RDputObj'],,
})
