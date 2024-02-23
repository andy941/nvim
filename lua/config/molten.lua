vim.g.molten_image_provider = "image.nvim"
--vim.g.molten_output_win_max_height = 40
vim.g.molten_auto_open_html_in_browser = false
vim.g.molten_output_win_hide_on_leave = false
vim.g.molten_auto_open_output = true
vim.g.molten_enter_output_behavior = "open_then_enter"
vim.g.molten_use_border_highlights = true
vim.g.molten_output_show_more = false

vim.g.molten_output_virt_lines = false
vim.g.molten_wrap_output = true
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_virt_text_output = false

local utils = require("utils")
utils.map("n", "<leader>mi",   "<cmd>MoltenInit<cr>", opts)
