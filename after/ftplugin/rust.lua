local utils = require("utils")
local opts = { noremap = true, silent = true }

compute_cargo_path = function(toml)
	path_toml = vim.fn.expand("%:p:h") .. "/../" .. toml
	if vim.fn.findfile(path_toml) ~= 1 then
		return path_toml
	else
		return "./" .. toml
	end
end

utils.map(
	"n",
	"<leader>MM",
	':TermExec cmd="cargo run -j$(getconf _NPROCESSORS_ONLN) --manifest-path '
		.. compute_cargo_path("Cargo.toml")
		.. '"<CR>',
	opts
)
