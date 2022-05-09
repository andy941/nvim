local utils = require('utils')
local opts = { noremap=true, silent=true }
vim.cmd("setlocal wrap")
vim.cmd("setlocal spell")
vim.cmd("setlocal linebreak")

utils.map('n', '<leader>vv', 	'<cmd>MarkdownPreviewToggle<cr>', opts)
