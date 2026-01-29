return {
	"mhartington/formatter.nvim",
	lazy = true,
	keys = { { mode = "n", "F", "<cmd>Format<CR>" } },
	config = function()
		-- Utilities for creating configurations
		local fmt = require("formatter.filetypes.lua")
		local util = require("formatter.util")

		local Clang_format_finder = function(clang_format_file)
			local cwd = vim.fn.getcwd()
			local CF = vim.fs.joinpath(cwd, clang_format_file)
			if vim.fn.filereadable(CF) == 1 then
				return CF
			else
				return "clang-format"
			end
		end

		-- clang-format default not working without this (for now at least)
		local Cformat = function()
			local CF = Clang_format_finder("/meta/clang-format")
			local clang_format_params = {
				"-style='{BasedOnStyle: Google, AlignConsecutiveAssignments: true, AlignConsecutiveDeclarations: true, AlignTrailingComments: true}'",
				"-assume-filename",
				util.escape_path(util.get_current_buffer_file_name()),
			}

			if CF ~= "clang-format" then
				clang_format_params = {
					"-assume-filename",
					util.escape_path(util.get_current_buffer_file_name()),
				}
			end

			return {
				exe = CF,
				args = clang_format_params,
				stdin = true,
				try_node_modules = true,
			}
		end

		local cbFmt = function()
			return {
				exe = "cbfmt",
				args = {
					"--config",
					vim.fn.stdpath("config") .. "/lua/plugins/configuration_files/cbfmt.toml",
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
							args = { "--edition 2021" },
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
							args = { "--style='{indent_width: 4, column_limit: 120}'" },
							stdin = true,
						}
					end,
				},
				tex = {
					function()
						return {
							exe = "tex-fmt",
							args = {
								"--stdin",
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
								'\'con <- file(\"stdin\"); styler::style_text(readLines(con)); close(con)\'',
								"2>/dev/null",
							},
							stdin = true,
						}
					end,
					-- stylua: ignore end
				},
				wgsl = {
					function()
						return {
							exe = "wgslfmt",
							stdin = false,
						}
					end,
				},

				["*" ] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
