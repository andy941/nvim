-- Utilities for creating configurations
local fmt = require("formatter.filetypes.lua")
local util = require("formatter.util")

-- Format keybinding
vim.keymap.set("n", "F", "<cmd>Format<CR>", opts)

-- clang-format default not working without this (for now at least)
Cformat = function()
	return {
		exe = "clang-format",
		args = {
			"-assume-filename",
			util.escape_path(util.get_current_buffer_file_name()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

cbFmt = function()
	return {
		exe = "cbfmt",
		args = {
			"--config",
			vim.fn.stdpath("config") .. "/lua/config/cbfmt.toml",
			"--parser",
			"markdown",
			"--write",
			"--best-effort",
			"|",
			"sed 's/^# |/#|/'",
		},
		stdin = true,
	}
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
		nix = {
			function()
				return {
					exe = "nixfmt",
					stdin = false,
				}
			end,
		},
		toml = { fmt.taplo },
		rust = {
			function()
				return {
					exe = "rustfmt",
					--args = { "--edition 2021" },
					stdin = false,
				}
			end,
		},
		markdown = {
			cbFmt,
		},
		quarto = {
			cbFmt,
		},
		cpp = { Cformat },
		c = { Cformat },
		python = {
			-- function()
			-- 	return {
			-- 		exe = "black",
			-- 		args = { "-q", "-", "-l 200" },
			-- 		stdin = true,
			-- 	}
			-- end,
			function()
				return {
					exe = "yapf",
					args = { "--style='{indent_width: 2}'" },
					stdin = true,
				}
			end,
		},
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
    -- stylua: ignore start
    r = {
      function()
        return {
          exe = "R",
          args = {
            "--slave",
            "--no-restore",
            "--no-save",
            "-e",
            '\'con <- file("stdin"); styler::style_text(readLines(con)); close(con)\'',
            "2>/dev/null"
          },
          stdin = true
        }
      end
    },
		-- stylua: ignore end

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
