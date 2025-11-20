return {
	command = {
		"clangd",
		"-j=8",
		"--background-index",
		"--clang-tidy",
		"--fallback-style=llvm",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
		"--pch-storage=memory",
	},

	init_options = {
		fallbackFlags = { cpp = "--std=c++23", c = "--std=c23" },
	},
}
