local utils = require('utils')
local opts = { noremap=true, silent=true }

-- quickfix list FIX
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
vim.cmd [[set wildchar=<Tab>]]
vim.cmd [[let mapleader=" "]]

-- Compile and run with g++
-- utils.map('n', '<C-m>c', ':!gcc  -o  %:r.o % && ./%:r.o<Enter>', opts)
-- utils.map('n', '<C-m>p', ':!g++  -std=c++14 ~/Bioinformatics_Algorithms/lib/Tools.cpp -o  %:r.o % && ./%:r.o<Enter>', opts)
-- utils.map('n', '<C-m><C-m>', ':!cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && ./%:r.o<Enter>', opts)

-- Clear highlights
utils.map('n', '<CR>', '<cmd>noh<CR>', opts)

-- Exit insert mode in nvim terminal
utils.map('t', '<leader><Esc>', '<c-\\><c-n>', opts)

-- move between buffersat lightspeed
utils.map('n', 'L', ':BufferLineCycleNext<CR>', opts)
utils.map('n', 'H', ':BufferLineCyclePrev<CR>', opts)

-- Compile project
utils.map('n', 'H', ':BufferLineCyclePrev<CR>', opts)



