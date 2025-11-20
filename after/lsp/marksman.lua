return {
	filetypes = { "quarto", "markdown", "telekasten" },
	root_dir = function(fname)
		return vim.fs.root(vim.fs.joinpath(vim.env.PWD, fname), { ".git", ".marksman.toml", ".qmd" }) or vim.env.PWD
	end,
}
