return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		image = {
			doc = {
				max_width = 300,
				max_height = 300,
			},
			math = {
				latex = {
					font_size = "normalsize",
				},
			},
		},
		scroll = {},
		input = {},
		indent = {
			animate = { enabled = false },
		},
		statuscolumn = {},
		terminal = {},
	},

	config = function()
		-- keybindings
		vim.keymap.set("n", "<c-\\>", Snacks.terminal.toggle, { desc = "Toggle terminal" })
	end,
}
