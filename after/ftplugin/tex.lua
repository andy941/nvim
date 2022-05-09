local utils = require('utils')
local opts = { noremap=true, silent=true }

vim.cmd("setlocal linebreak")
vim.cmd("setlocal spell spelllang=en_us")

utils.opt('o', 'scrolloff', 12)

utils.map('n', '<leader>cl',   	'<cmd>Telescope bibtex<cr>', opts)
utils.map('n', '<leader>cp',   	'<cmd>Telescope bibtex format=plain<cr>', opts)
utils.map('n', '<leader>pp',   	'<cmd>VimtexView<cr>', opts)

