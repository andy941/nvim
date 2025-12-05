-- Mappings.
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
	-- Disable loggin (reactivate with vim.lsp.set_log_level("debug"))
	vim.lsp.set_log_level("off")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
	-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>rN", "<cmd>Lspsaga rename ++project<CR>", opts)
	vim.keymap.set("n", "<leader>E", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>O", "<cmd>Lspsaga outline<CR>", opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = on_attach,
})

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

vim.lsp.enable("pyright")
vim.lsp.enable("cmake")
vim.lsp.enable("bashls")
vim.lsp.enable("r_language_server")
vim.lsp.enable("dockerls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("nil_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("wgsl_analyzer")
