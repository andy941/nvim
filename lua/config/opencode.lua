-- Basic setup for opencode.nvim
require("opencode").setup({})

-- Opencode.nvim keybindings (prefix <leader>a{letter})
local map = vim.keymap.set

-- Required for `opts.auto_reload`
vim.opt.autoread = true

-- stylua: ignore start
map('n', '<leader>aa', function() require('opencode').ask() end, { desc = 'Ask Opencode (prompt)' })
map('v', '<leader>aa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask about selection' })
map('v', '<leader>ab', function() require('opencode').ask('@buffer: ') end, { desc = 'Ask about buffer' })
map('v', '<leader>aB', function() require('opencode').ask('@buffers: ') end, { desc = 'Ask about buffers' })
map('v', '<leader>ad', function() require('opencode').ask('@diagnostic: ') end, { desc = 'Ask about diagnostic' })
map('v', '<leader>aD', function() require('opencode').ask('@diagnostics: ') end, { desc = 'Ask about diagnostics' })
-- stylua: ignore end
