local utils = require("utils")
local opts = { noremap = true, silent = true }

vim.keymap.set(
	"n",
	"<leader>Mr",
	[[:TermExec cmd="rm -r build; mkdir build; cd build/ && cmake -DCMAKE_BUILD_TYPE=Release .. && cd .. && cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	{ noremap = true, silent = true, desc = "C++: Build and run (Release)" }
)

vim.keymap.set(
	"n",
	"<leader>Md",
	[[:TermExec cmd="rm -r build; mkdir build; cd build/ && cmake -DCMAKE_BUILD_TYPE=Debug .. && cd .. && cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	{ noremap = true, silent = true, desc = "C++: Build and run (Debug)" }
)

vim.keymap.set(
	"n",
	"<leader>MM",
	[[:TermExec cmd="cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && %:r.o" <CR>]],
	{ noremap = true, silent = true, desc = "C++: Build and install" }
)
