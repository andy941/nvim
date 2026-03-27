return {

	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = "all",
			ignore_install = {
				"ipkg", -- broken?
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

			sync_install = false,
			auto_install = true,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
