require("r").setup({
	R_args = { "--quiet", "--no-save" },
	hook = {
		after_config = function()
			-- This function will be called at the FileType event
			-- of files supported by R.nvim. This is an
			-- opportunity to create mappings local to buffers.
			if vim.o.syntax ~= "rbrowser" then
				vim.keymap.set("i", "<C-s>", "<Plug>RSendChunk", opts)
				vim.keymap.set("n", "<C-s>", "<Plug>RSendChunk", opts)
				vim.keymap.set("v", "<C-s>", "<Plug>RSendSelection", opts)
				vim.keymap.set("i", "<C-c>", "<Plug>RStop", opts)
				vim.keymap.set("n", "<C-c>", "<Plug>RStop", opts)
				vim.keymap.set("v", "<C-c>", "<Plug>RStop", opts)
			end
		end,
	},
	min_editor_width = vim.fn.winwidth(0) / 2,
	rconsole_width = 0,
	rconsole_height = vim.fn.winheight(0) / 5,
	objbr_place = "RIGHT", -- console, script, LEFT, RIGHT
	objbr_h = vim.fn.winheight(0) / 4,
	objbr_w = vim.fn.winwidth(0) / 6,
	objbr_opendf = true,
	routnotab = true,
	clear_line = true,
	insert_mode_cmds = true,
	non_r_compl = false,
	nvimpager = "float",
	assign = false,
	Rout_more_colors = true,
	hl_term = true,
	-- R_user_maps_only = 1,,
	-- R_disable_cmds = ['RSetwd', 'RDputObj'],,
})
