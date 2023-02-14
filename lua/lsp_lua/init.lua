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

	--if client.server_capabilities.documentFormattingProvider then
	--	vim.api.nvim_command([[augroup Format]])
	--	vim.api.nvim_command([[autocmd! * <buffer>]])
	--	vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil, 100000)]])
	--	vim.api.nvim_command([[augroup END]])
	--else -- formatter.nvim takes over
	--	vim.api.nvim_command([[augroup FormatAutogroup]])
	--	vim.api.nvim_command([[autocmd!]])
	--	vim.api.nvim_command([[autocmd BufWritePost * FormatWrite]])
	--	vim.api.nvim_command([[augroup END]])
	--end
end

local servers = {
	"pyright",
	"cmake",
	"bashls",
	"r_language_server",
	"dockerls",
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
		-- defaults:
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			-- Only show inlay hints for the current line
			only_current_line = false,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",
			-- whether to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 7,
			-- The color of the hints
			highlight = "Comment",
			-- The highlight group priority for extmark
			priority = 100,
		},
		ast = {
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},

			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},

			highlights = {
				detail = "Comment",
			},
		},
		memory_usage = {
			border = "none",
		},
		symbol_info = {
			border = "none",
		},
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
USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
	sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
	sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
elseif vim.fn.has("unix") == 1 then
	sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
	sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
else
	print("Unsupported system for sumneko")
end

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})
