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
  contrast = "light", -- can be "hard" or "light"
  overrides = {
		SignColumn = {bg = 'none'},
		GruvboxRedSign = { fg = colors.red, bg = colors.dark0, reverse = false },
    GruvboxGreenSign = { fg = colors.green, bg = colors.dark0, reverse = false },
    GruvboxYellowSign = { fg = colors.yellow, bg = colors.dark0, reverse = false },
    GruvboxBlueSign = { fg = colors.blue, bg = colors.dark0, reverse = false },
    GruvboxPurpleSign = { fg = colors.purple, bg = colors.dark0, reverse = false },
    GruvboxAquaSign = { fg = colors.aqua, bg = colors.dark0, reverse = false },
    GruvboxOrangeSign = { fg = colors.orange, bg = colors.dark0, reverse = false },
		--Normal = {bg='none'}
	},
})

-- setup must be called before loading
vim.cmd("colorscheme gruvbox")

