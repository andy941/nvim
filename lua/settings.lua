local utils = require("utils")

-- change cursor shape in insert/normal mode
vim.cmd([[
let &t_SI = "\<Esc>[6 q" " INSERT - solid line
let &t_SR = "\<Esc>[4 q" " REPLACE - solid underscore
let &t_EI = "\<Esc>[2 q" " NORMAL(else) - solid square
]])

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.cmd([[ 
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set ssop+=globals    " required by Bufferline
]])

utils.opt("b", "tabstop", 2)
utils.opt("b", "softtabstop", 2)
utils.opt("b", "shiftwidth", 2)
utils.opt("b", "expandtab", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "swapfile", false)

utils.opt("o", "encoding", "utf-8")
utils.opt("o", "splitright", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "hidden", true)
utils.opt("o", "autowriteall", true)
utils.opt("o", "updatetime", 20)
utils.opt("o", "shortmess", "ac")
utils.opt("o", "hlsearch", true)
utils.opt("o", "incsearch", true)
utils.opt("o", "inccommand", "nosplit")
utils.opt("o", "wildmenu", true)
utils.opt("o", "wildignore", "*.o")
utils.opt("o", "wildmode", "full")
utils.opt("o", "scrolloff", 6)
utils.opt("o", "equalalways", false)
utils.opt("o", "laststatus", 3) -- Global statusline
utils.opt("o", "cmdheight", 0)

utils.opt("w", "cursorline", true)
utils.opt("w", "number", true)
utils.opt("w", "signcolumn", "auto:3")
utils.opt("w", "relativenumber", true)
utils.opt("w", "foldenable", false)
utils.opt("w", "foldmethod", "syntax")
utils.opt("w", "wrap", false)

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- No numbers in terminal
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
