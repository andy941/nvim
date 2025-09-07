local utils = require("utils")
local opts = { noremap = true, silent = true }

vim.cmd("setlocal linebreak")
vim.cmd("setlocal spell spelllang=en_us")

utils.opt("o", "scrolloff", 12)

vim.keymap.set(
	"n",
	"<leader>cB",
	"<cmd>Telescope bibtex<cr>",
	{ noremap = true, silent = true, desc = "Search BibTeX citations" }
)
vim.keymap.set(
	"n",
	"<leader>cP",
	"<cmd>Telescope bibtex format=plain<cr>",
	{ noremap = true, silent = true, desc = "Search BibTeX citations (plain)" }
)
vim.keymap.set(
	"n",
	"<leader>vv",
	"<cmd>VimtexView<cr>",
	{ noremap = true, silent = true, desc = "View PDF with Vimtex" }
)
