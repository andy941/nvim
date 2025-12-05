return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
		})

		-- Add rules
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		npairs.add_rule(Rule("```", "```", { "markdown", "quarto" }))
		npairs.add_rule(Rule("$$", "$$", { "markdown", "quarto" }))
	end,
}
