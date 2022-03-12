local utils = require('utils')
vim.cmd("setlocal wrap")
vim.cmd("setlocal linebreak")

utils.map('n', '<leader>m', 	'<cmd>MarkdownPreviewToggle<cr>')
