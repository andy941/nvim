return {
	filetypes = { "tex", "plaintex", "bib" },
	settings = {
		texlab = {
			auxDirectory = "./build",
			bibtexFormatter = "texlab",
			chktex = {
				onEdit = true,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 50,
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = true,
			},
		},
	},
}
