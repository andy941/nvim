require("codecompanion").setup({
	display = {
		chat = {
			window = {
				layout = "float",
				height = 0.8,
				width = 0.8,
			},
		},
	},

	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
		agent = {
			adapter = "copilot",
		},
	},
})

vim.keymap.set("n", "<LocalLeader>AA", "<cmd>CodeCompanionActions<cr>", { desc = "Code companion actions" })
vim.keymap.set("v", "<LocalLeader>AA", "<cmd>CodeCompanionActions<cr>", { desc = "Code companion actions" })
vim.keymap.set("n", "<LocalLeader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code companion chat toggle" })
vim.keymap.set("v", "<LocalLeader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code companion chat toggle" })
vim.keymap.set("v", "<LocalLeader>ay", "<cmd>CodeCompanionAdd<cr>", { desc = "Code companion add selection to chat" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
