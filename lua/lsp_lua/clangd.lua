require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	root_dir = require'lspconfig'.util.root_pattern("compile_commands.json", "build/compile_commands.json", "compile_flags.txt", ".git"),
    flags = {
      debounce_text_changes = 150,
    }
}

