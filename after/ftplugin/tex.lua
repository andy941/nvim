local utils = require('utils')
local opts = { noremap=true, silent=true }

vim.cmd("setlocal wrap")
vim.cmd("setlocal linebreak")

utils.map('n', '<leader>cl',   	'<cmd>Telescope bibtex<cr>', opts)
utils.map('n', '<leader>cp',   	'<cmd>Telescope bibtex format=plain<cr>', opts)
utils.map('n', '<leader>pp',   	'<cmd>VimtexView<cr>', opts)

