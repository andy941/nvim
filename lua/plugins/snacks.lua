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
		zen = {
			toggles = {
				dim = false,
				git_signs = true,
				mini_diff_signs = true,
				diagnostics = true,
				inlay_hints = false,
			},
		},
	},

	keys = {
		{
			mode = { "n", "t" },
			"<c-\\>",
			function()
				Snacks.terminal.toggle()
			end,
			{ desc = "Toggle terminal" },
		},
		{
			mode = { "n" },
			"<leader>Z",
			function()
				Snacks.zen()
			end,
			{ desc = "Toggle Zen mode" },
		},
	},
}
