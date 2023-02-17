vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode

local colors = require("gruvbox.palette")
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true, -- will make italic comments and special strings
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_indent_guides = false,
	contrast = "hard", -- can be "hard" or "light"
	overrides = {
		SignColumn = { bg = "none" },
		CursorLineNr = { bg = "none" },
		Operator = { italic = false },
		--GruvboxRedSign = { fg = colors.red, bg = colors.dark0_hard, reverse = false },
		--GruvboxGreenSign = { fg = colors.green, bg = colors.dark0_hard, reverse = false },
		--GruvboxYellowSign = { fg = colors.yellow, bg = colors.dark0_hard, reverse = false },
		--GruvboxBlueSign = { fg = colors.blue, bg = colors.dark0_hard, reverse = false },
		--GruvboxPurpleSign = { fg = colors.purple, bg = colors.dark0_hard, reverse = false },
		--GruvboxAquaSign = { fg = colors.aqua, bg = colors.dark0_hard, reverse = false },
		--GruvboxOrangeSign = { fg = colors.orange, bg = colors.dark0_hard, reverse = false },
		IlluminatedWordText = { bg = colors.dark1, reverse = false },
		IlluminatedWordRead = { bg = colors.dark1, reverse = false },
		IlluminatedWordWrite = { bg = colors.dark0_hard, reverse = true },
	},
})

require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,    -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    colorblind = {
      enable = false,        -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 0,          -- Severity [0,1] for protan (red)
        deutan = 0,          -- Severity [0,1] for deutan (green)
        tritan = 0,          -- Severity [0,1] for tritan (blue)
      },
    },
    styles = {               -- Style to be applied to different syntax groups
      comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "bold",
      functions = "italic,bold",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = true,
      search = true,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme duskfox")
