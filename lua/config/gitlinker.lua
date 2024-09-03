require("gitlinker").setup({
	-- default mapping to call url generation with action_callback
	callbacks = {
		["git.illumina.com"] = require("gitlinker.hosts").get_github_type_url,
	},
	mappings = "<leader>GL",
})
