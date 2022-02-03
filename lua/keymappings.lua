local utils = require('utils')

utils.map('n', '<CR>', '<cmd>noh<CR>') -- Clear highlights

---- quickfix list FIX 
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
vim.cmd [[set wildchar=<Tab>]]
vim.cmd [[let mapleader=" "]]

-- Compile and run with g++
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }
-- utils.map('n', '<C-m>c', ':!gcc  -o  %:r.o % && ./%:r.o<Enter>', opts)
-- utils.map('n', '<C-m>p', ':!g++  -std=c++14 ~/Bioinformatics_Algorithms/lib/Tools.cpp -o  %:r.o % && ./%:r.o<Enter>', opts)
-- utils.map('n', '<C-m><C-m>', ':!cmake --build build -j$(getconf _NPROCESSORS_ONLN) && cmake --install build && ./%:r.o<Enter>', opts)
utils.map('t', '<leader><Esc>', '<c-\\><c-n>', opts)
