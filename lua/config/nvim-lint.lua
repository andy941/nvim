require("lint").linters_by_ft = {
	-- lua = { "luacheck" },
}

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
