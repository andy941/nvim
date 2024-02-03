require("lualine").setup({
	options = {
		theme = "auto",
		section_separators = { left = "", right = "" },
		-- component_separators = { left = '', right = '' }
		component_separators = { left = "", right = " " },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diff", "branch", "diagnostics" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 2,
			},
		},
		lualine_x = {
			{
				require("noice").api.status.message.get_hl,
				fmt = function(str)
					return str:sub(1, vim.o.columns / 5)
				end,
				cond = require("noice").api.status.message.has,
			},
			"encoding",
			"fileformat",
			"filetype",
			"filesize",
		},
	},
	extensions = { "fugitive", "nvim-tree", "toggleterm", "quickfix" },
})
