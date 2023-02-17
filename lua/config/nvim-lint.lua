require('lint').linters_by_ft = {
  'cpplint',
  'textlint',
}

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

