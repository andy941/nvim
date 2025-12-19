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

-- choose a leader key
vim.cmd([[let mapleader=" "]])

vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.autowriteall = true
vim.opt.updatetime = 20
vim.opt.shortmess = "acsFW"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.wildmenu = true
vim.opt.wildignore = "*.o"
vim.opt.wildmode = "full"
vim.opt.equalalways = false
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 1
vim.opt.scrolloff = 6
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.signcolumn = "yes:2"
vim.opt.relativenumber = false
vim.opt.foldenable = false
vim.opt.wrap = false

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- No numbers in terminal
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Open terminal in insert mode
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end,
})
