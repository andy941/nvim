require("lint").linters_by_ft = {
	cpp = { "cpplint" },
	markdown = { "textlint" },
}

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
