
local utils = require('utils')
local opts = { noremap=true, silent=true }

utils.map("n",
	"<leader>m",
	[[:TermExec cmd="cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && ./%:r.o" <CR>]],
	opts)

