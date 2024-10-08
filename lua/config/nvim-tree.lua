local utils = require("utils")
local opts = { noremap = true, silent = true }

utils.map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Define some funtion callbacks for hjkl style navigation
local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_cursor = true,
	hijack_netrw = true,
	-- hijack_unnamed_buffer_when_opening = true,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = true,
	view = {
		width = 40,
		side = "left",
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},

	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
		},
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = { ".git/" },
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
	},
}) -- END_DEFAULT_OPTS
