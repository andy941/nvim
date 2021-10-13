local utils = require('utils')

-- Find files using Telescope command-line sugar.
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
