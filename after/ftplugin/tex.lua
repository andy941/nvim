local utils = require('utils')
local opts = { noremap=true, silent=true }

utils.map('n', '<leader>L',   	'<cmd>Telescope bibtex context=false<cr>', opts)
