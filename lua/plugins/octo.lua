return {
	"pwntester/octo.nvim",
	-- Until github enterprise gets updated to >= 3.14!
	commit = "f09ff9413652e3c06a6817ba6284591c00121fe0",
	pin = true,
	cmd = "Octo",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({
			use_local_fs = true, -- use local files on right side of reviews
			enable_builtin = true, -- shows a list of builtin actions when no action is provided
			ui = {
				use_signcolumn = true, -- show "modified" marks on the sign column
				use_signstatus = false, -- show "modified" marks on the status column
			},
			reviews = {
				auto_show_threads = false, -- automatically show comment threads on cursor move
			},

			suppress_missing_scope = { projects_v2 = true },
		})

		-- Added files: show them as plain files (no all-green diff). The right side is the
		-- real buffer (use_local_fs), so threads/signs still work.
		local FileEntry = require("octo.reviews.file-entry").FileEntry
		local orig_show_diff = FileEntry.show_diff
		FileEntry.show_diff = function(self)
			orig_show_diff(self)
			if self.status ~= "A" then
				return
			end
			for _, bufid in ipairs({ self.left_bufid, self.right_bufid }) do
				local win = vim.fn.bufwinid(bufid)
				if win ~= -1 then
					vim.api.nvim_win_call(win, function()
						vim.cmd("diffoff")
						vim.wo.foldmethod = "manual"
					end)
				end
			end
		end

		-- Octo hardcodes dark DiffText colours and links the left DiffChange to DiffDelete.
		-- Use the colorscheme's own DiffChange/DiffText in both review windows instead.
		local constants = require("octo.constants")
		local function apply_review_hl()
			for _, ns in ipairs({ constants.OCTO_REVIEW_LEFT_HIGHLIGHT_NS, constants.OCTO_REVIEW_RIGHT_HIGHLIGHT_NS }) do
				for _, name in ipairs({ "DiffChange", "DiffText" }) do
					local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
					vim.api.nvim_set_hl(ns, name, hl)
				end
			end
		end
		local Layout = require("octo.reviews.layout").Layout
		local orig_init_layout = Layout.init_layout
		Layout.init_layout = function(self, ...)
			local ret = orig_init_layout(self, ...)
			apply_review_hl()
			return ret
		end
		vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_review_hl })

		-- Toggle diff highlighting for the current file in a review
		vim.keymap.set("n", "<leader>cd", function()
			local review = require("octo.reviews").get_current_review()
			if not review or not review.layout then
				return
			end
			local wins = { review.layout.left_winid, review.layout.right_winid }
			local enable = not vim.wo[wins[2]].diff
			for _, win in ipairs(wins) do
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_call(win, function()
						vim.cmd(enable and "diffthis" or "diffoff")
						vim.wo.foldmethod = enable and "diff" or "manual"
					end)
				end
			end
		end, { desc = "Octo: toggle review diff" })

		vim.keymap.set("n", "<localleader>ct", "<cmd>Octo review thread<cr>", opts)
	end,
}
