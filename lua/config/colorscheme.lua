local utils = require('utils')

vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode

--vim.g.gruvbox_flat_style = "light"
vim.g.gruvbox_terminal_colors = false
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_flat_style = "hard"

vim.g.acquarium_style = "dark"
vim.g.acqua_bold = 1

vim.cmd [[
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'material'
colorscheme gruvbox-flat
]]

