local utils = require('utils')

require("toggleterm").setup{
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			--return vim.cmd"set columns" * 0.2
			return 20
		elseif term.direction == "vertical" then
			return 40
		end
	end,

  open_mapping = [[<c-\>]],
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = false, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  float_opts = {
--    border = 'curved',
--		width = function(term)
--			return vim.o.rows * 0.9
--		end,
--		height = function(term)
--			return vim.o.columns * 0.9
--		end,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
