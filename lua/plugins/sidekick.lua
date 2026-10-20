return {
	"folke/sidekick.nvim",
	config = function(_, opts)
		require("sidekick").setup(opts)

		-- Open the CLI terminal in a snacks "zen" float (centered, full height, no border,
		-- flat Normal-colored backdrop)
		-- instead of sidekick's plain float. Hide/show just closes/opens the window.
		-- make the terminal use the same bg as the backdrop / editor (default is NormalFloat)
		local function link_chat()
			vim.api.nvim_set_hl(0, "SidekickChat", { link = "Normal" })
		end
		link_chat()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = link_chat })

		local Terminal = require("sidekick.cli.terminal")
		function Terminal:open_win()
			if self:is_open() or not self.buf then
				return
			end
			local win = Snacks.win({
				buf = self.buf,
				style = "zen",
				enter = false,
				width = 120,
				row = 0,
				height = function()
					return vim.o.lines - vim.o.cmdheight
				end,
				border = "none",
				-- opaque backdrop in the exact Normal bg: the whole screen becomes one flat color
				-- and the terminal text appears to float over it. (snacks blends bg->black by
				-- `blend`, so blend = 0 yields bg itself; bg defaults to black, hence set it.)
				backdrop = { transparent = false, bg = Snacks.util.color("Normal", "bg"), blend = 0 },
			})
			self.win = win.win
			vim.w[self.win].sidekick_cli = self.tool
			vim.w[self.win].sidekick_session_id = self.id
			self:wo()
		end
	end,
	opts = {
		-- add any options here
		cli = {
			mux = {
				backend = "tmux",
				enabled = false,
			},
			win = {
				layout = "float",
				float = {
					row = 0,
					width = 120,
					height = 0.95,
				},
			},
		},
		nes = { enabled = false },
	},
	keys = {
		{
			"<c-.>",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send File",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
	},
}
