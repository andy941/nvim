vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 40
vim.g.molten_auto_open_output = true

local utils = require("utils")
utils.map("n", "<leader>mi",   "<cmd>MoltenInit<cr>", opts)
