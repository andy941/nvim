local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

-- global options

-- window-local options

-- buffer-local options

-- maps.lua

require('plugins')

-- colorscheme
cmd [[

" Enable truecolor
if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
	endif

"set termguicolors
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'hard'
set background=dark
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
]]
