local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require("settings")

-- Install plugins
require("plugins")

-- lsp setup
require("lsp_lua")
