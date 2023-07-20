-- Utilities for creating configurations
local fmt = require("formatter.filetypes.lua")
local util = require("formatter.util")

-- Format keybinding
vim.keymap.set("n", "F", "<cmd>Format<CR>", opts)

---- Format on save
--vim.api.nvim_command([[augroup FormatAutogroup]])
--vim.api.nvim_command([[autocmd!]])
--vim.api.nvim_command([[autocmd BufWritePost * FormatWrite]])
--vim.api.nvim_command([[augroup END]])

Clang_format_finder = function(clang_format_file)
	CF = vim.fn.finddir(".git/..", ".;")
	CF = vim.fn.fnamemodify(CF, ":p:h") .. clang_format_file
	if vim.fn.findfile(CF) ~= 1 then
		return CF
	else
		return ""
	end
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({

	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = { fmt.stylua },
		cmake = { fmt.cmake },
		sh = { fmt.sh },
		json = { fmt.json },
		html = { fmt.html },
		markdown = { fmt.markdown },
		python = {
			function()
				return {
					exe = "black",
					args = { "-q", "-", "-l 80" },
					stdin = true,
				}
			end,
		},
		cpp = function()
			return {
				exe = Clang_format_finder("/meta/clang-format"),
				args = {
					"-assume-filename",
					util.escape_path(util.get_current_buffer_file_name()),
				},
				stdin = true,
				try_node_modules = true,
			}
		end,

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
