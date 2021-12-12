local utils = require('utils')

vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode

local nightfox = require('nightfox')
-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- change the colorscheme to use nordfox
  styles = {
    comments = "italic", -- change style of comments to be italic
    --keywords = "bold", -- change style of keywords to be bold
    functions = "italic" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = true, -- inverse the highlighting of match_parens
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})
-- Load the configuration set above and apply the colorscheme
nightfox.load()

vim.cmd [[ colorscheme nordfox ]]

