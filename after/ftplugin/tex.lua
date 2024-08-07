local utils = require("utils")
local opts = { noremap = true, silent = true }

vim.cmd("setlocal linebreak")
vim.cmd("setlocal spell spelllang=en_us")

utils.opt("o", "scrolloff", 12)

utils.map("n", "<leader>cB", "<cmd>Telescope bibtex<cr>", opts)
utils.map("n", "<leader>cP", "<cmd>Telescope bibtex format=plain<cr>", opts)
utils.map("n", "<leader>vv", "<cmd>VimtexView<cr>", opts)
