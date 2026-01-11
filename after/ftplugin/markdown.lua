vim.cmd("set wrap")
vim.cmd("set spell")
vim.cmd("set linebreak")

require("otter").activate()

vim.keymap.set(
	"n",
	"<leader>cB",
	"<cmd>Telescope bibtex format=markdown<cr>",
	{ noremap = true, silent = true, desc = "Search BibTeX citations (markdown)" }
)

vim.keymap.set(
	"n",
	"<leader>vv",
	"<cmd>LivePreview start<cr>",
	{ noremap = true, silent = true, desc = "View PDF with Vimtex" }
)
