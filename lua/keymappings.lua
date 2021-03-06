local utils = require('utils')
local opts = { noremap=true, silent=true }

-- quickfix list FIX
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
vim.cmd [[set wildchar=<Tab>]]
vim.cmd [[let mapleader=" "]]

-- Clear highlights
utils.map('n', '<CR>', '<cmd>noh<CR>', opts)

-- Exit insert mode in nvim terminal
utils.map('t', '<leader><Esc>', '<c-\\><c-n>', opts)



