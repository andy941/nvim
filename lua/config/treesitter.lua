local utils = require('utils')


require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
	additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
  textobjects = { enable = true },


}

-- format on save

vim.cmd [[
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.hpp lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.R lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.r lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre DockerFile lua vim.lsp.buf.formatting_sync(nil, 1000)
]]
