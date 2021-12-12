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
  use { 'sainnhe/everforest' }
  use { 'savq/melange' }
  use { 'eddyekofo94/gruvbox-flat.nvim' }
  use { 'EdenEast/nightfox.nvim' }

  -- Lualine
  use { 'hoob3rt/lualine.nvim' }

  -- Fuzzy finder
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim'}

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'windwp/nvim-autopairs' }
  use { 'hrsh7th/nvim-cmp', 
		requires = 
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind-nvim'
		}

	-- for vsnip
  --use { 'hrsh7th/cmp-vsnip' }
  --use { 'hrsh7th/vim-vsnip' }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

end)
