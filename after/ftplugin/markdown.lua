local utils = require("utils")
local opts = { noremap = true, silent = true }
vim.cmd("set wrap")
vim.cmd("set spell")
vim.cmd("set linebreak")

utils.map("n", "<leader>vv", "<cmd>MarkdownPreviewToggle<cr>", opts)
utils.map("n", "<leader>cB", "<cmd>Telescope bibtex format=markdown<cr>", opts)
