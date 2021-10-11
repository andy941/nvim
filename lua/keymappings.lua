local utils = require('utils')

utils.map('n', '<CR>', '<cmd>noh<CR>') -- Clear highlights
utils.map('n', '<CR>', '<cmd>noh<CR>') -- Clear highlights
-- quickfix list FIX 
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
--vim.cmd [[set wildchar=<Tab>]]
vim.cmd [[let mapleader=" "]]
