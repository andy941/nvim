local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require("settings")

-- Install plugins
require("plugins")

-- Group configuration in one folder
--require("config")

-- lsp setup
require("lsp_lua")
