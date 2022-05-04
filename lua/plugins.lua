return require('packer').startup(function()

	-- Packer can manage itself as an optional plugin
	use { 'wbthomason/packer.nvim', opt = true }

	-- Some core plugins
	use { 'nvim-lua/popup.nvim' }
	use { 'nvim-lua/plenary.nvim' }

	-- Icons support
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'mortepau/codicons.nvim' }


	-- bufferline on top
	use {'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'}

	-- File Browser
	use {'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'}

	-- Make it easier to use the terminal
	use { 'akinsho/toggleterm.nvim' }

	-- Color scheme
	use { 'EdenEast/nightfox.nvim' }
	use { 'morhetz/gruvbox' }

	-- Lualine
	use { 'hoob3rt/lualine.nvim' }

	-- Fuzzy finder
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-project.nvim' }
	use { 'nvim-telescope/telescope-bibtex.nvim' }
	use { 'nvim-telescope/telescope.nvim'}

	-- LSP
	use { 'neovim/nvim-lspconfig' }

	-- Completion
	use { 'hrsh7th/nvim-cmp' }
	use { 	'hrsh7th/cmp-path' }
	use { 	'hrsh7th/cmp-nvim-lsp' }
	use { 	'hrsh7th/cmp-nvim-lsp-signature-help' }
	use { 	'hrsh7th/cmp-nvim-lua' }
	use { 	'hrsh7th/cmp-buffer' }
	use { 	'hrsh7th/cmp-cmdline' }
	use {		'f3fora/cmp-spell', }
	use { 	'L3MON4D3/LuaSnip' }
	use { 	'saadparwaiz1/cmp_luasnip' }
	use { 	'onsails/lspkind-nvim' }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Context aware spell checking
	use { 'lewis6991/spellsitter.nvim'}

	-- Auto close brackets
	use { 'windwp/nvim-autopairs' }

	-- Rstudio like environment for R
	use { 'jalvesaq/Nvim-R' , branch = 'stable'}

	-- resize buffers and keep proportions
	use { 'kwkarlwang/bufresize.nvim' }

	-- Fugitive for Git
	use { 'tpope/vim-fugitive' }

	-- Work with csv files and other tables easily
	use { 'chrisbra/csv.vim' }

	-- markdown preview
	use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()' }

	-- latex preview and more
	use { 'lervag/vimtex' }

	-- Debugger API
	use { 'mfussenegger/nvim-dap' }

	-- Show hex colors in file
	use { 'norcalli/nvim-colorizer.lua' }

end
)
