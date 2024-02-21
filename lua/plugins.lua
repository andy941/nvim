local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- Core plugins
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"rcarriga/nvim-notify",
		lazy = true,
	},

	-- Nicer UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("config.noice")
		end,
		keys = {
			{ "<leader>N", "<cmd>Telescope noice<cr>", desc = "Notifications and messages history" },
		},
	},

	-- Icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- bufferline on top
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.bufferline")
		end,
	},

	-- File Browser
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.nvim-tree")
		end,
	},

	-- Comments handling
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("config.comment")
		end,
	},

	-- Make it easier to use the termina
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("config.toggleterm")
		end,
	},

	-- Color scheme
	{ "ellisonleao/gruvbox.nvim", config = true },
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("config.nightfox")
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("config.catpuccin")
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Lualine
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("config.lualine")
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-bibtex.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"crispgm/telescope-heading.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("config.telescope")
		end,
	},

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "p00f/clangd_extensions.nvim" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lspsaga")
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{
		"saecki/crates.nvim",
		lazy = true,
		tag = "stable",
		config = true,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^3",
		dependencies = {
			"saecki/crates.nvim",
		},
		ft = { "rust" },
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("config.nvim-lint")
		end,
	},

	-- Code formatting
	{
		"mhartington/formatter.nvim",
		config = function()
			require("config.formatter")
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-path",
			--"jalvesaq/cmp-nvim-r",
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"rcarriga/cmp-dap",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
			"saecki/crates.nvim",
		},
		config = function()
			require("config.completion")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},

	-- Auto close brackets
	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	},

	-- Rstudio like environment for R
	--[[ {
		"jalvesaq/Nvim-R",
		ft = { "r", "rmd" },
		config = function()
			vim.cmd("source ~/.config/nvim/lua/config/nvimR.vim")
		end,
	}, ]]

	-- resize buffers and keep proportions
	{
		"kwkarlwang/bufresize.nvim",
		config = function()
			require("config.bufresize")
		end,
	},

	-- Git workflow
	{
		"tpope/vim-fugitive",
		config = function()
			require("config.fugitive")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	},
	{
		"ldelossa/gh.nvim",
		dependencies = {
			{
				"ldelossa/litee.nvim",
				config = function()
					require("litee.lib").setup()
				end,
			},
		},
		config = function()
			require("config.gh")
		end,
	},

	-- Work with csv files and other tables easily
	{
		"chrisbra/csv.vim",
		ft = { "csv" },
		config = function()
			vim.cmd("source ~/.config/nvim/lua/config/csv.vim")
		end,
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = ":call mkdp#util#install()",
		ft = { "markdown" },
		config = function()
			vim.cmd("source ~/.config/nvim/lua/config/markdown-preview.vim")
		end,
	},

	-- latex preview and more
	{
		"lervag/vimtex",
		ft = { "tex" },
		config = function()
			vim.cmd("source ~/.config/nvim/lua/config/vimtex.vim")
		end,
	},

	-- Lsp aware variable highlight
	{
		"RRethy/vim-illuminate",
		config = function()
			require("config.vim-illuminate")
		end,
	},

	-- Debugger API and sugar
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("config.nvim-dap-virtual-text")
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("config.nvim-dap-ui")
				end,
			},
		},
		config = function()
			require("config.nvim-dap")
		end,
	},
	{ "mfussenegger/nvim-dap-python", ft = "python" },

	-- Show hex colors in file
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("config.colorizer")
		end,
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		config = function()
			require("config.zen-mode")
		end,
	},

	-- Show indent line and current context with treesitter
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent-line")
		end,
	},

	-- window management
	{
		"sindrets/winshift.nvim",
		config = function()
			require("config.winshift")
		end,
	},

	-- Copy/paste from anywhere
	{
		"ojroques/nvim-osc52",
		config = function()
			require("config.nvim-osc52")
		end,
	},

	-- Quarto
	{
		"3rd/image.nvim",
		lazy = true,
		config = function()
			require("config.image")
		end,
	},
	{
		"benlubas/molten-nvim",
		lazy = true,
		build = ":UpdateRemotePlugins",
		dependencies = "3rd/image.nvim",
		config = function()
			require("config.molten")
		end,
	},
	{
		"jmbuhr/otter.nvim",
		lazy = true,
		dev = false,
		opts = {
			buffers = { set_filetype = true, write_to_disk = true },
		},
	},

	-- send code from python/r/qmd documets to a terminal or REPL
	-- like ipython, R, bash
	{
		"jpalardy/vim-slime",
		init = function()
			vim.b["quarto_is_" .. "python" .. "_chunk"] = false
			Quarto_is_in_python_chunk = function()
				require("otter.tools.functions").is_otter_language_context("python")
			end


      -- stylua: ignore start
      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !b:quarto_is_r_mode
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]])
			-- stylua: ignore end

			local function mark_terminal()
				vim.g.slime_last_channel = vim.b.terminal_job_id
				vim.print(vim.g.slime_last_channel)
			end

			local function set_terminal()
				vim.b.slime_config = { jobid = vim.g.slime_last_channel }
			end

			vim.b.slime_cell_delimiter = "```"

			-- slime, neovvim terminal
			vim.g.slime_target = "neovim"
			vim.g.slime_python_ipython = 1

			-- -- slime, tmux
			-- vim.g.slime_target = 'tmux'
			-- vim.g.slime_bracketed_paste = 1
			-- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

			local function toggle_slime_tmux_nvim()
				if vim.g.slime_target == "tmux" then
					pcall(function()
						vim.b.slime_config = nil
						vim.g.slime_default_config = nil
					end)
					-- slime, neovvim terminal
					vim.g.slime_target = "neovim"
					vim.g.slime_bracketed_paste = 0
					vim.g.slime_python_ipython = 1
				elseif vim.g.slime_target == "neovim" then
					pcall(function()
						vim.b.slime_config = nil
						vim.g.slime_default_config = nil
					end)
					-- -- slime, tmux
					vim.g.slime_target = "tmux"
					vim.g.slime_bracketed_paste = 1
					vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
				end
			end
			vim.keymap.set("n", "<leader>smt", mark_terminal)
			vim.keymap.set("n", "<leader>sst", set_terminal)
			vim.keymap.set("n", "<leader>stt", toggle_slime_tmux_nvim)
		end,
	},
	{
		"quarto-dev/quarto-nvim",
		dev = false,
		dependencies = {
			"jmbuhr/otter.nvim",
			"3rd/image.nvim",
			"benlubas/molten-nvim",
      "jpalardy/vim-slime"
		},
		ft = { "markdown", "quarto" },
		config = function()
			require("config.quarto")
		end,
	},

	-- Templates
	{
		"glepnir/template.nvim",
		config = function()
			require("config.template")
		end,
	},

	-- Trouble quickfix
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},

	-- ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		-- event = "VeryLazy",
		lazy = true,
		cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTCompleteCode", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"folke/trouble.nvim",
		},
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "gpg --decrypt " .. vim.fn.expand("$HOME") .. "/.password-store/openai_key.gpg",
			})
		end,
	},
})
