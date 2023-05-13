-- Utilities for creating configurations
local fmt = require("formatter.filetypes.lua")

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
		cpp = { fmt.clangformat },
		c = { fmt.clangformat },
		--python = {
		--	function()
		--		return {
		--			exe = "black",
		--			args = { "-q", "-", "-l 80" },
		--			stdin = true,
		--		}
		--	end,
		--},
		tex = {
			function()
				return {
					exe = "latexindent",
					args = {
						"--modifylinebreaks",
						"-g",
						"/dev/null",
					},
					stdin = true,
				}
			end,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
