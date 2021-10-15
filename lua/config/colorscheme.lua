local utils = require('utils')

vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode

vim.cmd [[
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material
]]
