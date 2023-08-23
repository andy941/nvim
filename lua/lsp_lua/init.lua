require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = { exclude = "r_language_server" } })

local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
	-- Disable loggin (reactivate with vim.lsp.set_log_level("debug"))
	vim.lsp.set_log_level("off")

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
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
	vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
	vim.keymap.set("n", "gI", "<cmd>Lspsaga incoming_calls<CR>", opts)
	vim.keymap.set("n", "gO", "<cmd>Lspsaga outgoing_calls<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
	vim.keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>rN", "<cmd>Lspsaga rename ++project<CR>", opts)
	vim.keymap.set("n", "E", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>O", "<cmd>Lspsaga outline<CR>", opts)
end

-------------------------------------------------------------------------------

require("mason-tool-installer").setup({
	ensure_installed = {
	},
})

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
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})
end

require("clangd_extensions").setup({
	server = {
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		root_dir = nvim_lsp.util.root_pattern(
			"compile_commands.json",
			"build/compile_commands.json",
			"compile_flags.txt",
			".git"
		),
	},
	extensions = {
		autoSetHints = false,
	},
})
