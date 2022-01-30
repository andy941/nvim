local opts = { noremap=true, silent=true }
require("bufresize").setup({
	register = {
		keys = {
			{ "n", "<", "<C-w><", opts },
			{ "n", ">", "<C-w>>", opts },
			{ "n", "+", "<C-w>+", opts },
			{ "n", "-", "<C-w>-", opts },
			{ "n", "<C-w>h", "<C-w>h", opts },
			{ "n", "<C-w>j", "<C-w>j", opts },
			{ "n", "<C-w>k", "<C-w>k", opts },
			{ "n", "<C-w>l", "<C-w>l", opts },
			{ "n", "<C-w>_", "<C-w>_", opts },
			{ "n", "<C-w>=", "<C-w>=", opts },
			{ "n", "<C-w>|", "<C-w>|", opts },
			{ "", "<LeftRelease>", "<LeftRelease>", opts },
			{ "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
		},
		trigger_events = { "BufWinEnter", "WinEnter" },
	},
	resize = {
		keys = {},
		trigger_events = { "VimResized" },
	},
})
