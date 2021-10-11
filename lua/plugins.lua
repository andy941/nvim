return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true}

  -- Icons lua fork for nvim
  use { 'kyazdani42/nvim-web-devicons'}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Lualine
  use { 'hoob3rt/lualine.nvim' }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope.nvim',
      requires = {
      {'nvim-lua/popup.nvim'}, 
      {'nvim-lua/plenary.nvim'}}
    }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'onsails/lspkind-nvim' }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

end)
