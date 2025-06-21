local utils = require("utils")

utils.opt("o", "completeopt", "menu,menuone,noinsert,noselect")
-- vim.cmd([[set shortmess+=c]])
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" } -- <Tab> to navigate the completion menu

-- Vsnip functions from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp.
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			preset = "default",
			maxwidth = 50,
			ellipsis_char = "...",
			show_labelDetails = true,
		}),
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<Space>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},

	experimental = {
		ghost_text = false,
	},

	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,

	sources = {
		{ name = "cmp_r" },
		{ name = "dap" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "crates" },
		{ name = "git" },
		{
			name = "latex_symbols",
			option = {
				strategy = 2, -- mixed
			},
		},
	},

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.sort_text,
			cmp.config.compare.recently_used,
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

require("cmp").setup.cmdline(":", {
	sources = {
		{ name = "cmdline" },
	},
})

require("cmp").setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

require("cmp").setup.filetype("tex", {
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

require("cmp").setup.filetype("quarto", {
	sources = {
		{ name = "dap" },
		{ name = "path" },
		{ name = "otter" },
		{ name = "cmp_r" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "latex_symbols", option = { strategy = 2 } },
	},
})

-- For Git completion
require("cmp_git").setup({
	github = {
		hosts = { "git.illumina.com" },
	},
})

-- For AI completion with Ollama
require("cmp_ai.config"):setup({
	max_lines = 100,
	provider = "Ollama",
	provider_options = {
		model = "codellama:7b-code",
	},
	notify = true,
	notify_callback = function(msg)
		print("cmp-ai: ", msg)
	end,
	run_on_every_keystroke = false,
	ignored_file_types = {},
})

-- For R.nvim
require("cmp_r").setup({})

-- for friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- for custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })

-- link quarto and rmarkdown to markdown snippets
luasnip.filetype_extend("quarto", { "markdown" })
luasnip.filetype_extend("rmarkdown", { "markdown" })
