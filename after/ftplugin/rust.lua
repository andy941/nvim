local utils = require("utils")
local opts = { noremap = true, silent = true }

utils.map(
	"n",
	"<leader>MM",
	[[:TermExec cmd="cargo run" <CR>]],
	opts
)
