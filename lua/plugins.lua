return require("packer").startup(function()
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })

	-- Some core plugins
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	-- Icons support
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "mortepau/codicons.nvim" })

	-- bufferline on top
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- File Browser
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	-- Make it easier to use the terminal
	use({ "akinsho/toggleterm.nvim" })

	-- Color scheme
	use({ "ellisonleao/gruvbox.nvim" })

	-- Lualine
	use({ "hoob3rt/lualine.nvim" })

	-- Fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-telescope/telescope-project.nvim" })
	use({ "nvim-telescope/telescope-bibtex.nvim" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "crispgm/telescope-heading.nvim" })
	use({ "nvim-telescope/telescope.nvim" })

	-- LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "p00f/clangd_extensions.nvim" })

	-- Code formatting
	use({ "mhartington/formatter.nvim" })

	-- Completion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-path" })
	use({ "jalvesaq/cmp-nvim-r" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "rcarriga/cmp-dap" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "onsails/lspkind-nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Context aware spell checking
	use({ "lewis6991/spellsitter.nvim" })

	-- Auto close brackets
	use({ "windwp/nvim-autopairs" })

	-- Rstudio like environment for R
	use({ "jalvesaq/Nvim-R" })

	-- resize buffers and keep proportions
	use({ "kwkarlwang/bufresize.nvim" })

	-- Git workflow
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })

	-- Work with csv files and other tables easily
	use({ "chrisbra/csv.vim" })

	-- markdown preview
	use({ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" })

	-- latex preview and more
	use({ "lervag/vimtex" })
	use({ "RRethy/vim-illuminate" })

	-- Debugger API and sugar
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "mfussenegger/nvim-dap-python" })

	-- Show hex colors in file
	use({ "norcalli/nvim-colorizer.lua" })

	-- Zen mode
	use({ "folke/zen-mode.nvim" })

	-- Show indent line and current context with treesitter
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- window management
	use({ "sindrets/winshift.nvim" })

	-- Note taking with Zettelkasten method
	use({ "renerocksai/telekasten.nvim", requires = { "renerocksai/calendar-vim" } })

  -- Remote work
	use({ "chipsenkbeil/distant.nvim"})

end)
