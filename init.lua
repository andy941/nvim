-- -- disable netrw at the very start of your init.lua for nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Sensible defaults
require("settings")

-- Install plugins
require("plug")

-- lsp setup
require("lsp")

vim.cmd.colorscheme("catppuccin")
