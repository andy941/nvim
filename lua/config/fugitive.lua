local utils = require("utils")
utils.map("n", "<leader>dv", "<cmd>Gvdiffsplit!<CR>") -- Git diff
utils.map("n", "<leader>hh", "<cmd>diffget //2<CR>") -- Git diffget left
utils.map("n", "<leader>ll", "<cmd>diffget //3<CR>") -- Git diffget right
utils.map("n", "<leader>gB", "<cmd>Git blame<CR>")
