require("lspsaga").setup({
	preview = {
		lines_above = 0,
		lines_below = 40,
	},
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	request_timeout = 10000,

	finder = {
		max_height = 0.7,
		keys = {
			jump_to = "e",
			edit = { "o" },
			vsplit = "v",
			split = "x",
			tabe = "t",
			tabnew = "r",
			quit = { "q" },
			close_in_preview = "<C-c>",
		},
	},

	definition = {
		edit = "<C-c>e",
		vsplit = "<C-c>v",
		split = "<C-c>x",
		tabe = "<C-c>t",
		quit = "q",
		close = "<Esc>",
	},

	code_action = {
		num_shortcut = true,
		show_server_name = true,
		extend_gitsigns = true,
		keys = { quit = "q", exec = "<CR>" },
	},

	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = false,
		sign_priority = 40,
		virtual_text = true,
	},

	diagnostic = {
		on_insert = false,
		on_insert_follow = false,
		insert_winblend = 0,
		show_code_action = true,
		show_source = true,
		jump_num_shortcut = true,
		max_width = 0.7,
		custom_fix = nil,
		custom_msg = nil,
		text_hl_follow = false,
		border_follow = true,
		keys = {
			exec_action = "<CR>",
			quit = "q",
			go_action = "l",
		},
	},

	rename = {
		quit = "<Esc>",
		exec = "<CR>",
		mark = "<Tab>",
		confirm = "<CR>",
		in_select = true,
	},

	outline = {
		win_position = "right",
		win_with = "",
		win_width = 70,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "<CR>",
			expand_collapse = "l",
			quit = "q",
		},
	},

	callhierarchy = {
		show_detail = true,
		keys = {
			edit = "e",
			vsplit = "v",
			split = "x",
			tabe = "t",
			jump = "<CR>",
			quit = "q",
			expand_collapse = "l",
		},
	},

	symbol_in_winbar = {
		enable = false,
		separator = " ",
		ignore_patterns = {},
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},

	ui = {
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
})
