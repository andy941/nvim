require("mason").setup()
require("mason-nvim-dap").setup({
	automatic_setup = true,
})
--require("mason-nvim-dap").setup_handlers({})

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
	api.nvim_set_keymap("n", "<C-k>", '<cmd>lua require("dapui").eval()<cr>', opts)

	for _, buf in pairs(api.nvim_list_bufs()) do
		local keymaps = api.nvim_buf_get_keymap(buf, "v")
		for _, keymap in pairs(keymaps) do
			if keymap.lhs == "<C-k>" then
				table.insert(keymap_restore, keymap)
				api.nvim_buf_del_keymap(buf, "v", "<C-k>")
			end
		end
	end
	api.nvim_set_keymap("v", "<C-k>", '<cmd>lua require("dapui").eval()<cr>', opts)
end

dap.listeners.after["event_terminated"]["me"] = function()
	for _, keymap in pairs(keymap_restore) do
		api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
	end
	keymap_restore = {}
end

-------------------------------------------------------------------------------

utils.map("n", "<leader>dc", "<cmd>DapContinue<cr>", opts)
utils.map("n", "<leader>dC", '<cmd>lua require("dap").reverse_continue()<cr>', opts)
utils.map("n", "<leader>dl", '<cmd>lua require("dap").run_last()<cr>', opts)
utils.map("n", "<leader>dT", "<cmd>DapTerminate<cr>", opts)

utils.map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", opts)
utils.map("n", "<leader>dB", '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts)
utils.map(
	"n",
	"<leader>dL",
	'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>',
	opts
)

utils.map("n", "<leader>dr", "<cmd>DapToggleRepl<cr>", opts)
utils.map("n", "<leader>dl", '<cmd>lua require("dap").run_last()<cr>', opts)

-- Python
utils.map("n", "<leader>dtm", ':lua require("dap-python").test_method()<cr>', opts)
utils.map("n", "<leader>dtc", ':lua require("dap-python").test_class()<cr>', opts)
utils.map("v", "<leader>dc", ':lua require("dap-python").debug_selection()<cr>', opts)

--
--dap.adapters.lldb = {
--	name = "lldb",
--	type = "executable",
--	command = path_to_lldb, -- adjust as needed, must be absolute path
--}
--
--dap.configurations.cpp = {
--	{
--		name = "Launch",
--		type = "lldb",
--		request = "launch",
--		program = function()
--			return vim.fn.input("Path to executable: ", vim.fn.expand("%:r") .. ".o", "file")
--		end,
--		cwd = "${workspaceFolder}",
--		stopOnEntry = false,
--		args = function()
--			local argument_string = vim.fn.input("Program arguments: ")
--			return vim.fn.split(argument_string, " ", true)
--		end,
--
--		-- 💀
--		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--		--
--		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--		--
--		-- Otherwise you might get the following error:
--		--
--		--    Error on launch: Failed to attach to the target process
--		--
--		-- But you should be aware of the implications:
--		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--		-- runInTerminal = false,
--	},
--}
--
---- If you want to use this for Rust and C, add something like this:
--
--dap.configurations.c = dap.configurations.cpp
--dap.configurations.rust = dap.configurations.cpp
--
-- Python
require("dap-python").setup()
-- change the test runner (unittest is default)
require('dap-python').test_runner = 'pytest' -- or django
