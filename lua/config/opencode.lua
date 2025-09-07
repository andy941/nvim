-- Basic setup for opencode.nvim
require("opencode").setup({})

-- Required for `opts.auto_reload`
vim.opt.autoread = true

-- stylua: ignore start
vim.keymap.set('n', '<leader>aa', function() require('opencode').ask() end, { desc = 'Ask Opencode (prompt)' })
vim.keymap.set('v', '<leader>aa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask about selection' })
vim.keymap.set('v', '<leader>ab', function() require('opencode').ask('@buffer: ') end, { desc = 'Ask about buffer' })
vim.keymap.set('v', '<leader>aB', function() require('opencode').ask('@buffers: ') end, { desc = 'Ask about buffers' })
vim.keymap.set('v', '<leader>ad', function() require('opencode').ask('@diagnostic: ') end, { desc = 'Ask about diagnostic' })
vim.keymap.set('v', '<leader>aD', function() require('opencode').ask('@diagnostics: ') end, { desc = 'Ask about diagnostics' })
-- stylua: ignore end
