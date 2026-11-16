return {
	"folke/snacks.nvim",
	dependencies = { "nvim-web-devicons" },
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		image = {
			enabled = true,
			doc = {
				inline = true,
				float = true,
				conceal = function()
					return false
				end,
				max_width = 300,
				max_height = 300,
			},
			math = {
				enabled = true,
				latex = {
					font_size = "normalsize",
				},
			},
		},
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
			zoom = {
				toggles = {},
				center = false,
				show = { statusline = true, tabline = true },
				win = {
					backdrop = true,
					width = 0, -- full width
				},
			},
		},
		styles = {
			zen = {
				-- opaque backdrop. With blend = 0 snacks uses `bg` as is (it blends Normal -> bg by
				-- `blend`), so `bg` must be the Normal bg; it is kept in sync below.
				backdrop = { transparent = false, blend = 0 },
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- every zen window gets a backdrop in exactly the editor background (colorscheme agnostic)
		local function sync_zen_backdrop()
			Snacks.config.styles.zen.backdrop.bg = Snacks.util.color("Normal", "bg")
		end
		sync_zen_backdrop()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = sync_zen_backdrop })
	end,

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
