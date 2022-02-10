
local utils = require('utils')
local opts = { noremap=true, silent=true }
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

utils.map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {},
	auto_close          = true,
	open_on_tab         = false,
	hijack_cursor       = false,
	update_cwd          = true,
	update_to_buf_dir   = {
		enable = true,
	auto_open = true,
	},
	diagnostics = {
		enable = false,
	icons = {
		hint = "",
	info = "",
	warning = "",
	error = "",
	}
	},
	update_focused_file = {
		enable      = false,
	update_cwd  = false,
	ignore_list = {}
	},
	system_open = {
		cmd  = nil,
	args = {}
	},
	filters = {
		dotfiles = false,
	custom = {}
	},
	git = {
		enable = true,
	ignore = true,
	timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = {"l", "<CR>", "o" }, cb = tree_cb "edit"},
				{ key = "h", cb = tree_cb "close_node"}
			}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	},
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = false,
		}
	}
}
