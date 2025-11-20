return {
	"glepnir/template.nvim",
	config = function()
		require("template").setup({
			temp_dir = vim.fn.stdpath("config") .. "/lua/plugins/",
			author = "Andrea Finocchio",
		})
	end,
}
