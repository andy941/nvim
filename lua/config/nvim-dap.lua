require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = {},
	handlers = {},
})

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

-------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }
local utils = require("utils")
local dap = require("dap")
local api = vim.api

-------------------------------------------------------------------------------

-- keymaps only active when dap session is active
local keymap_restore = {}
dap.listeners.after["event_initialized"]["me"] = function()
	for _, buf in pairs(api.nvim_list_bufs()) do
		local keymaps = api.nvim_buf_get_keymap(buf, "n")
		for _, keymap in pairs(keymaps) do
			if keymap.lhs == "<C-k>" then
				table.insert(keymap_restore, keymap)
				api.nvim_buf_del_keymap(buf, "n", "<C-k>")
			end
		end
	end
	vim.keymap.set("n", "<C-k>", function()
		require("dapui").eval()
	end, { desc = "DAP UI: Eval", silent = true })

	for _, buf in pairs(api.nvim_list_bufs()) do
		local keymaps = api.nvim_buf_get_keymap(buf, "v")
		for _, keymap in pairs(keymaps) do
			if keymap.lhs == "<C-k>" then
				table.insert(keymap_restore, keymap)
				api.nvim_buf_del_keymap(buf, "v", "<C-k>")
			end
		end
	end
	vim.keymap.set("v", "<C-k>", function()
		require("dapui").eval()
	end, { desc = "DAP UI: Eval", silent = true })
end

dap.listeners.after["event_terminated"]["me"] = function()
	for _, keymap in pairs(keymap_restore) do
		vim.keymap.set(
			keymap.mode,
			keymap.lhs,
			keymap.rhs,
			{ buffer = keymap.buffer, silent = keymap.silent == 1, desc = "Restored mapping" }
		)
	end
	keymap_restore = {}
end

-------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, silent = true, desc = "DAP: Continue" })
vim.keymap.set(
	"n",
	"<leader>dC",
	'<cmd>lua require("dap").reverse_continue()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Reverse continue" }
)
vim.keymap.set(
	"n",
	"<leader>dl",
	'<cmd>lua require("dap").run_last()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Run last" }
)
vim.keymap.set("n", "<leader>dT", "<cmd>DapTerminate<cr>", { noremap = true, silent = true, desc = "DAP: Terminate" })

vim.keymap.set(
	"n",
	"<leader>db",
	"<cmd>DapToggleBreakpoint<cr>",
	{ noremap = true, silent = true, desc = "DAP: Toggle breakpoint" }
)
vim.keymap.set(
	"n",
	"<leader>dB",
	'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
	{ noremap = true, silent = true, desc = "DAP: Conditional breakpoint" }
)
vim.keymap.set(
	"n",
	"<leader>dL",
	'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>',
	{ noremap = true, silent = true, desc = "DAP: Log point" }
)

vim.keymap.set(
	"n",
	"<leader>dr",
	"<cmd>DapToggleRepl<cr>",
	{ noremap = true, silent = true, desc = "DAP: Toggle REPL" }
)
vim.keymap.set(
	"n",
	"<leader>dl",
	'<cmd>lua require("dap").run_last()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Run last" }
)

-- Python
vim.keymap.set(
	"n",
	"<leader>dtm",
	':lua require("dap-python").test_method()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Test method (Python)" }
)
vim.keymap.set(
	"n",
	"<leader>dtc",
	':lua require("dap-python").test_class()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Test class (Python)" }
)
vim.keymap.set(
	"v",
	"<leader>dc",
	':lua require("dap-python").debug_selection()<cr>',
	{ noremap = true, silent = true, desc = "DAP: Debug selection (Python)" }
)

-- Python
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- change the test runner (unittest is default)
require("dap-python").test_runner = "pytest" -- or django
