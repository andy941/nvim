local utils = require("utils")
local opts = { noremap = true, silent = true }

utils.map(
	"n", -- Release
	"<leader>Mr",
	[[:TermExec cmd="rm -r build; mkdir build; cd build/ && cmake -DCMAKE_BUILD_TYPE=Release .. && cd .. && cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	opts
)

utils.map(
	"n", -- Debug
	"<leader>Md",
	[[:TermExec cmd="rm -r build; mkdir build; cd build/ && cmake -DCMAKE_BUILD_TYPE=Debug .. && cd .. && cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	opts
)

utils.map(
	"n",
	"<leader>MM",
	[[:TermExec cmd="cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	opts
)
