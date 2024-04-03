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
