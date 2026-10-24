vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.linebreak = true

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
