require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = {
		"phpdoc",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
		disable = { "json" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			-- init_selection = "gnn",
			-- node_incremental = "grn",
			-- scope_incremental = "grc",
			-- node_decremental = "grm",
		},
		disable = { "json" },
	},
	indent = {
		enable = false,
		disable = { "json" },
	},
	textobjects = { enable = true, disable = { "json" } },
})
