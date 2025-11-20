return {
	"iamcco/markdown-preview.nvim",
	build = ":call mkdp#util#install()",
	ft = { "markdown" },
	config = function()
		vim.cmd("source ~/.config/nvim/lua/plugins/markdown-preview.vim")
	end,
}
