
local utils = require('utils')
local opts = { noremap=true, silent=true }

utils.map("n", -- Release
	"<leader>M",
	[[:2TermExec cmd="cd build/ && cmake -DCMAKE_BUILD_TYPE=Release .. && cd .. && cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	opts)

utils.map("n",
	"<leader>m",
	[[:2TermExec cmd="cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	opts)

