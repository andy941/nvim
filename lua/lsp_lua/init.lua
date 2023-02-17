require("mason").setup()
require("mason-lspconfig").setup({automatic_installation = true})

local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "E", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "F", "<cmd>lua vim.lsp.buf.format(nil, 100000)<CR>", opts)

	vim.api.nvim_command([[augroup FormatAutogroup]])
	vim.api.nvim_command([[autocmd!]])
	vim.api.nvim_command([[autocmd BufWritePost * FormatWrite]])
	vim.api.nvim_command([[augroup END]])
end

-------------------------------------------------------------------------------

require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
}
}

-------------------------------------------------------------------------------

local servers = {
	"pyright",
	"cmake",
	"bashls",
	"r_language_server",
	"dockerls",
	"lua_ls",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		flags = {
			debounce_text_changes = 150,
		},
	})
end

require("clangd_extensions").setup({
	server = {
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		root_dir = nvim_lsp.util.root_pattern(
			"compile_commands.json",
			"build/compile_commands.json",
			"compile_flags.txt",
			".git"
		),
		flags = {
			debounce_text_changes = 150,
		},
	},
	extensions = {
		autoSetHints = false,
	},
})

nvim_lsp.texlab.setup({
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	flags = {
		debounce_text_changes = 150,
	},
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
})

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
--USER = vim.fn.expand("$USER")
--
--local sumneko_root_path = ""
--local sumneko_binary = ""
--
--if vim.fn.has("mac") == 1 then
--	sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
--	sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
--elseif vim.fn.has("unix") == 1 then
--	sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
--	sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
--else
--	print("Unsupported system for sumneko")
--end
--
--nvim_lsp.lua_ls.setup({
--	on_attach = on_attach,
--	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
--	settings = {
--		Lua = {
--			runtime = {
--				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--				version = "LuaJIT",
--				-- Setup your lua path
--				path = vim.split(package.path, ";"),
--			},
--			diagnostics = {
--				-- Get the language server to recognize the `vim` global
--				globals = { "vim" },
--			},
--			workspace = {
--				-- Make the server aware of Neovim runtime files
--				library = {
--					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
--					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--				},
--			},
--		},
--	},
--})
