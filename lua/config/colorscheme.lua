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
		GruvboxRedSign = { fg = colors.red, bg = colors.dark0_hard, reverse = false },
		GruvboxGreenSign = { fg = colors.green, bg = colors.dark0_hard, reverse = false },
		GruvboxYellowSign = { fg = colors.yellow, bg = colors.dark0_hard, reverse = false },
		GruvboxBlueSign = { fg = colors.blue, bg = colors.dark0_hard, reverse = false },
		GruvboxPurpleSign = { fg = colors.purple, bg = colors.dark0_hard, reverse = false },
		GruvboxAquaSign = { fg = colors.aqua, bg = colors.dark0_hard, reverse = false },
		GruvboxOrangeSign = { fg = colors.orange, bg = colors.dark0_hard, reverse = false },
		IlluminatedWordText = { bg = colors.dark1, reverse = false },
		IlluminatedWordRead = { bg = colors.dark1, reverse = false },
		IlluminatedWordWrite = { bg = colors.dark0_hard, reverse = true },
	},
})

-- setup must be called before loading
vim.cmd("colorscheme gruvbox")
