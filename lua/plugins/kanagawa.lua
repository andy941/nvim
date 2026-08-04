return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	lazy = true,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = { italic = true, bold = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = { bold = true },
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			background = {
				dark = "wave",
				light = "lotus",
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					SagaLightBulb = { fg = colors.palette.carpYellow },
				}
			end,
		})
	end,
}
