return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

	-- Some core plugins
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- Icons support
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'mortepau/codicons.nvim' }


  use {'akinsho/bufferline.nvim', 
  requires = 'kyazdani42/nvim-web-devicons'}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use { 'eddyekofo94/gruvbox-flat.nvim' }
  use { 'frenzyexists/aquarium-vim' }
	use { 'embark-theme/vim' }
	use { 'monsonjeremy/onedark.nvim' }

  -- Lualine
  use { 'hoob3rt/lualine.nvim' }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim'}

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-buffer' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'saadparwaiz1/cmp_luasnip' }

	-- for vsnip
  --use { 'hrsh7th/cmp-vsnip' }
  --use { 'hrsh7th/vim-vsnip' }
  use { 'onsails/lspkind-nvim' }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

end)
