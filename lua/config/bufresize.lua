local opts = { noremap=true, silent=true }
require("bufresize").setup({
	register = {
		keys = {
			{ "n", "<", "<C-w><", opts },
			{ "n", ">", "<C-w>>", opts },
			{ "n", "+", "<C-w>+", opts },
			{ "n", "-", "<C-w>-", opts },
			{ "n", "<C-w>H", "<C-w>H", opts },
			{ "n", "<C-w>J", "<C-w>J", opts },
			{ "n", "<C-w>K", "<C-w>K", opts },
			{ "n", "<C-w>L", "<C-w>L", opts },
			{ "n", "<C-w>_", "<C-w>_", opts },
			{ "n", "<C-w>=", "<C-w>=", opts },
			{ "n", "<C-w>|", "<C-w>|", opts },
			{ "", "<LeftRelease>", "<LeftRelease>", opts },
			{ "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
		},
		trigger_events = { "BufWinEnter", "WinEnter" },
	},
	resize = {
		keys = {
		},
		trigger_events = { "VimResized", "BufWipeout"},
		increment = 1,
	},
})
