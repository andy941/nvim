return {
	"folke/snacks.nvim",
	dependencies = { "nvim-web-devicons" },
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		image = {
			doc = {
				inline = true,
				conceal = function()
					return false
				end,
				max_width = 300,
				max_height = 300,
			},
			math = {
				latex = {
					font_size = "normalsize",
				},
			},
		},
		scroll = { enabled = true },
		input = { enabled = true },
		indent = {
			animate = { enabled = false },
		},
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
	},

	keys = {
		{
			mode = "n",
			"<c-\\>",
			function()
				Snacks.terminal.toggle()
			end,
			{ desc = "Toggle terminal" },
		},
	},
}
