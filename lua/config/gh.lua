local utils = require("utils")

require("litee.lib").setup({
	--icon_set = "codicons",
	tree = {
		icon_set = "codicons",
	},
	panel = {
		orientation = "bottom",
		panel_size = 15,
	},
})
require("litee.gh").setup({
	-- deprecated, around for compatability for now.
	jump_mode = "invoking",
	-- remap the arrow keys to resize any litee.nvim windows.
	map_resize_keys = false,
	-- do not map any keys inside any gh.nvim buffers.
	disable_keymaps = false,
	-- the icon set to use.
	icon_set = "codicons",
	-- any custom icons to use.
	icon_set_custom = nil,
	-- whether to register the @username and #issue_number omnifunc completion
	-- in buffers which start with .git/
	git_buffer_completion = true,
	-- defines keymaps in gh.nvim buffers.
	keymaps = {
		-- when inside a gh.nvim panel, this key will open a node if it has
		-- any futher functionality. for example, hitting <CR> on a commit node
		-- will open the commit's changed files in a new gh.nvim panel.
		open = "<CR>",
		-- when inside a gh.nvim panel, expand a collapsed node
		expand = "zo",
		-- when inside a gh.nvim panel, collpased and expanded node
		collapse = "zc",
		-- when cursor is over a "#1234" formatted issue or PR, open its details
		-- and comments in a new tab.
		goto_issue = "gD",
		-- show any details about a node, typically, this reveals commit messages
		-- and submitted review bodys.
		details = "K",
		-- inside a convo buffer, submit a comment
		submit_comment = "<localleader>s",
		-- inside a convo buffer, when your cursor is ontop of a comment, open
		-- up a set of actions that can be performed.
		actions = "<localleader>a",
		-- inside a thread convo buffer, resolve the thread.
		resolve_thread = "<localleader>r",
		-- inside a gh.nvim panel, if possible, open the node's web URL in your
		-- browser. useful particularily for digging into external failed CI
		-- checks.
		goto_web = "<localleader>w",
	},
})

utils.map("n", "<leader>ht", "<cmd>GHToggleThreads<cr>", opts)
utils.map("n", "<leader>hn", "<cmd>GHNextThread<cr>", opts)
utils.map("n", "<leader>hc", "<cmd>GHCreateThread<cr>", opts)
utils.map("n", "<leader>he", "<cmd>LTPanel<cr>", opts)
