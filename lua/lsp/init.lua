require("mason").setup({ ui = { border = "rounded" } })
require("mason-lspconfig").setup({ automatic_installation = false })
require("lspconfig.ui.windows").default_options.border = "rounded"

-- Mappings.
local opts = { noremap = true, silent = true }

local attach = function(client, bufnr)
	-- Disable loggin (reactivate with vim.lsp.set_log_level("debug"))
	vim.lsp.set_log_level("off")

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enabe completion triggered by <c-x><c-o>
	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
	vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
	vim.keymap.set("n", "gI", "<cmd>Lspsaga incoming_calls<CR>", opts)
	vim.keymap.set("n", "gO", "<cmd>Lspsaga outgoing_calls<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
	vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)
	-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>rN", "<cmd>Lspsaga rename ++project<CR>", opts)
	vim.keymap.set("n", "<leader>E", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>O", "<cmd>Lspsaga outline<CR>", opts)
end

vim.cmd([[
  sign define DiagnosticSignError text= texthl=LspDiagnosticsVirtualTextError linehl= numhl=LspDiagnosticsVirtualTextError
  sign define DiagnosticSignWarn text= texthl=LspDiagnosticsVirtualTextWarning linehl= numhl=LspDiagnosticsVirtualTextWarning
  sign define DiagnosticSignInfo text= texthl=LspDiagnosticsVirtualTextInfo linehl= numhl=LspDiagnosticsVirtualTextInfo
  sign define DiagnosticSignHint text= texthl=LspDiagnosticsVirtualTextHint linehl= numhl=LspDiagnosticsVirtualTextInfo
]])

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

local servers = {
	"pyright",
	"cmake",
	"bashls",
	"r_language_server",
	"dockerls",
	"lua_ls",
	"clangd",
	"nil_ls",
	"marksman",
	"wgsl_analyzer",
}

local command = {}
local init_options = {}
local filetypes = {}
local root_dir = {}
local settings = {}

command.wgsl_analyzer = { "wgsl-analyzer" }

command.clangd = {
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
}

init_options.clangd = {
	fallbackFlags = { cpp = "--std=c++23", c = "--std=c23" },
}

filetypes.marksman = { "quarto", "markdown", "telekasten" }
root_dir.marksman = function(fname)
	return vim.fs.root(vim.fs.joinpath(vim.env.PWD, fname), { ".git", ".marksman.toml", ".qmd" }) or vim.env.PWD
end

-- FIXME
-- root_dir.pyright = function(fname)
-- 	return vim.fs.root(vim.fs.joinpath(vim.env.PWD, fname), { ".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt" })
-- 		or vim.fs.dirname(fname)
-- end

filetypes.r_language_server = { "r" }
settings.r_language_server = {
	r = {
		lsp = {
			rich_documentation = false,
		},
	},
	quarto = {
		lsp = {
			rich_documentation = false,
		},
	},
}

for _, lsp in ipairs(servers) do
	vim.lsp.config[lsp] = {
		cmd = command[lsp],
		on_attach = attach,
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
		handlers = handlers,
		init_options = init_options[lsp],
		filetypes = filetypes[lsp],
		root_dir = root_dir[lsp],
		settings = settings[lsp],
	}
	vim.lsp.enable(lsp)
end

vim.g.rustaceanvim = {
	tools = {
		float_win_config = {
			border = "rounded",
		},
	},
}

vim.lsp.config.texlab = {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	handlers = handlers,
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
