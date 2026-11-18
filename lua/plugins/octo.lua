return {
	"pwntester/octo.nvim",
	-- Until github enterprise gets updated to >= 3.14!
	commit = "f09ff9413652e3c06a6817ba6284591c00121fe0",
	pin = true,
	cmd = "Octo",
	keys = {
		{
			"<leader>PR",
			"<cmd>Octo search is:pr is:open review-requested:@me<cr>",
			desc = "Octo: PRs awaiting my review",
		},
	},
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

		-- `gh pr checkout` runs async and Octo only reports on completion; announce the start.
		local octo_utils = require("octo.utils")
		local orig_checkout_pr = octo_utils.checkout_pr
		octo_utils.checkout_pr = function(pr_number, ...)
			vim.notify(("Octo: checking out PR #%s ..."):format(tostring(pr_number)), vim.log.levels.INFO)
			return orig_checkout_pr(pr_number, ...)
		end

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
				-- blank filler lines: the winhighlight mapping from settings.lua is ignored on
				-- windows that have a highlight namespace, so override DiffDelete in the namespace
				vim.api.nvim_set_hl(ns, "DiffDelete", { link = "Normal" })
				for _, name in ipairs({ "DiffChange", "DiffText" }) do
					local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
					vim.api.nvim_set_hl(ns, name, hl)
				end
			end
			-- Vim draws lines that only exist in the left (old) buffer as "added" (DiffAdd). Draw
			-- them with the colorscheme's DiffDelete instead. Read it without link=false first:
			-- that resolves through the current window's winhighlight (DiffDelete:Normal).
			local del = vim.api.nvim_get_hl(0, { name = "DiffDelete" })
			if del.link then
				del = vim.api.nvim_get_hl(0, { name = "DiffDelete", link = false })
			end
			vim.api.nvim_set_hl(constants.OCTO_REVIEW_LEFT_HIGHLIGHT_NS, "DiffAdd", del)
		end
		local Layout = require("octo.reviews.layout").Layout
		local orig_init_layout = Layout.init_layout
		Layout.init_layout = function(self, ...)
			local ret = orig_init_layout(self, ...)
			apply_review_hl()
			return ret
		end
		vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_review_hl })

		-- Octo defines its own groups (OctoNormal, OctoStatusLine, ...) once at setup and only
		-- when they don't exist yet. `:colorscheme` clears them (they stay "existing" but empty),
		-- so the file panel etc. lose their colours. Re-run Octo's own setup on ColorScheme, with
		-- hlexists() reporting "missing" for the call so it redefines every group.
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.fn.hlexists = function()
					return 0
				end
				local ok, err = pcall(require("octo.ui.colors").setup)
				vim.fn.hlexists = nil -- drop the override; vim.fn regenerates the real function
				if not ok then
					vim.notify("Octo: failed to refresh highlights: " .. tostring(err), vim.log.levels.WARN)
				end
			end,
		})

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
