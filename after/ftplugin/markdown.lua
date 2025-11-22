vim.cmd("set wrap")
vim.cmd("set spell")
vim.cmd("set linebreak")

vim.keymap.set(
	"n",
	"<leader>cB",
	"<cmd>Telescope bibtex format=markdown<cr>",
	{ noremap = true, silent = true, desc = "Search BibTeX citations (markdown)" }
)
