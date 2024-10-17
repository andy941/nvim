local opts = { noremap = true, silent = true }

local compute_cargo_path = function(toml)
	local path_toml = vim.fn.expand("%:p:h") .. "/../" .. toml
	if vim.fn.findfile(path_toml) ~= 1 then
		return path_toml
	else
		return "./" .. toml
	end
end

vim.keymap.set(
	"n",
	"<leader>Mt",
	':TermExec cmd="cargo run -j$(getconf _NPROCESSORS_ONLN) --manifest-path '
		.. compute_cargo_path("Cargo.toml")
		.. '"',
	opts
)
vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)
vim.keymap.set("n", "<leader>E", "<cmd>RustLsp renderDiagnostic<CR>", opts)
vim.keymap.set("n", "<leader>x", "<cmd>RustLsp explainError<CR>", opts)
-- vim.keymap.set("n", "<leader>a", "<cmd>RustLsp codeAction<CR>", opts)
vim.keymap.set("n", "<leader>Mr", "<cmd>RustLsp runnables<CR>", opts)
vim.keymap.set("n", "<leader>MM", "<cmd>RustLsp! runnables<CR>", opts)
vim.keymap.set("n", "<leader>MD", "<cmd>RustLsp debuggables<CR>", opts)
vim.keymap.set("n", "<leader>Md", "<cmd>RustLsp! debuggables<CR>", opts)
