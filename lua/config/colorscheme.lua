local utils = require('utils')

vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_flat_style = "dark"
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

vim.cmd [[

" Enable truecolor
if exists('+termguicolors')
	" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
	endif
colorscheme gruvbox-flat
]]


--vim.cmd [[
--
--" Enable truecolor
--if exists('+termguicolors')
--	" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
--	" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
--	set termguicolors
--	endif
--
--" set termguicolors
--let g:gruvbox_material_enable_bold = 1
--let g:gruvbox_material_enable_italic = 1
--let g:gruvbox_material_disable_italic_comment = 1
--let g:gruvbox_material_background = 'hard'
--set background=dark
--colorscheme gruvbox-material
--]]
