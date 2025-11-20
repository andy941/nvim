return {
  "folke/lazydev.nvim",
  event = "VeryLazy",
  config = function()
    require("lazydev").setup()
  end,
}
