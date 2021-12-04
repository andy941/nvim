local utils = require('utils')utils.map('n', '<Leader>G', '<cmd>G<CR>')  -- Git status
local utils = require('utils')utils.map('n', '<Leader>M', '<cmd>Gvdiffsplit!<CR>')  -- Git diff
local utils = require('utils')utils.map('n', '<Leader>hh', '<cmd>diffget //2<CR>')  -- Git diffget left
local utils = require('utils')utils.map('n', '<Leader>ll', '<cmd>diffget //3<CR>')  -- Git diffget right
