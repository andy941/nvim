return {
	"hoob3rt/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				-- component_separators = { left = '', right = '' }
				component_separators = { left = "", right = " " },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					-- "mode",
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						fmt = function(str)
							return str:gsub("%-%-", "")
						end,
					},
				},
				lualine_b = { "diff", "branch", "diagnostics" },
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 2,
					},
				},
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					"filesize",
				},
			},
			extensions = { "fugitive", "nvim-tree", "quickfix" },
		})
	end,
}
