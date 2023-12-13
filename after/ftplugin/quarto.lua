local utils = require("utils")

utils.map("n", "<C-s>", "<cmd>QuartoSend<cr>", opts)
utils.map("n", "\\a",   "<cmd>QuartoSendAll<cr>", opts)
utils.map("n", "<leader>rs",   "<cmd>QuartoActivate<cr>", opts)
utils.map("n", "<leader>vv",   "<cmd>QuartoPreview<cr>", opts)

utils.map("n", "<leader>cb", "<cmd>Telescope bibtex format=markdown<cr>", opts)
