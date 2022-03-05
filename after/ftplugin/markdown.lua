local utils = require('utils')
vim.cmd("setlocal wrap")
vim.cmd("setlocal linebreak")

utils.map('n', '<C-m>', 	'<cmd>MarkdownPreviewToggle<cr>')
