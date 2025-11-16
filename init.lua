local fn = vim.fn
local execute = vim.api.nvim_command

-- disable netrw at the very start of your init.lua for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sensible defaults
require("settings")

-- Install plugins
require("plugins")

-- lsp setup
require("lsp")
