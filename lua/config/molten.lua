vim.g.molten_image_provider = "image.nvim"
--vim.g.molten_output_win_max_height = 40
vim.g.molten_auto_open_output = true
--vim.g.molten_enter_output_behavior = "open_and_enter"
vim.g.molten_virt_text_output = true
vim.g.molten_wrap_output = true
vim.g.molten_virt_lines_off_by_1 = true

local utils = require("utils")
utils.map("n", "<leader>mi",   "<cmd>MoltenInit<cr>", opts)
