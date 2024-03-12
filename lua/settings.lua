local utils = require("utils")
local opts = { noremap = true, silent = true }

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

-- colors
-- vim.o.termguicolors = true

utils.opt("b", "tabstop", 4)
utils.opt("b", "softtabstop", 4)
utils.opt("b", "shiftwidth", 4)
utils.opt("b", "expandtab", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "swapfile", false)

-- utils.opt("o", "python3_host_program", vim.fn.expand("/usr/bin/python"))
utils.opt("o", "encoding", "utf-8")
utils.opt("o", "splitright", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "hidden", true)
utils.opt("o", "autowriteall", true)
utils.opt("o", "updatetime", 20)
utils.opt("o", "shortmess", "acsFW")
utils.opt("o", "hlsearch", true)
utils.opt("o", "incsearch", true)
utils.opt("o", "inccommand", "nosplit")
utils.opt("o", "wildmenu", true)
utils.opt("o", "wildignore", "*.o")
utils.opt("o", "wildmode", "full")
utils.opt("o", "scrolloff", 6)
utils.opt("o", "equalalways", false)
utils.opt("o", "laststatus", 3) -- Global statusline
utils.opt("o", "cmdheight", 1)
vim.cmd([[let mapleader=" "]])

utils.opt("w", "cursorline", true)
utils.opt("w", "cursorlineopt", "number")
utils.opt("w", "number", true)
utils.opt("w", "signcolumn", "yes:2")
utils.opt("w", "relativenumber", false)
utils.opt("w", "foldenable", false)
utils.opt("w", "foldmethod", "syntax")
utils.opt("w", "wrap", false)

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- No numbers in terminal
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Exit insert mode in nvim terminal
utils.map("t", "<localleader><Esc>", "<c-\\><c-n>", opts)

---- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
