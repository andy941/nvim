return {
	"3rd/image.nvim",
	config = function()
		-- Requirements
		-- https://github.com/3rd/image.nvim?tab=readme-ov-file#requirements
		local backend = "kitty"

		local shell
		if vim.fn.has("nvim-0.10.0") == 1 then
			-- print('nvim >= 0.10')
			shell = function(command)
				local obj = vim.system(command, { text = true }):wait()
				if obj.code ~= 0 then
					return nil
				end
				return obj.stdout
			end
		else
			-- print('nvim < 0.10')
			shell = function(command)
				command = table.concat(command, " ")
				local handle = io.popen(command)
				if handle == nil then
					return nil
				end
				local result = handle:read("*a")
				handle:close()
				return result
			end
		end

		-- check if imagemagick is available
		if shell({ "convert", "-version" }) == nil then
			-- print("imagemagick is not available")
			return
		end

		if backend == "kitty" then
			-- check if kitty is available
			local out = shell({ "kitty", "--version" })
			if out == nil then
				-- print("kitty is not available")
				return
			end
			local kitty_version = out:match("(%d+%.%d+%.%d+)")
			if kitty_version == nil then
				-- print("kitty version is not available")
				return
			end
			local v = vim.version.parse(kitty_version)
			local minimal = vim.version.parse("0.30.1")
			if v and vim.version.cmp(v, minimal) < 0 then
				-- print("kitty version is too old")
				return
			end
		end
		local tmux = vim.fn.getenv("TMUX")
		if tmux ~= vim.NIL then
			-- tmux uses number.number.(maybe letter)
			-- e.g. 3.3a
			-- but 3.3 comes before 3.3a
			-- so we replace a with 1
			local offset = 96
			local out = shell({ "tmux", "-V" })
			if out == nil then
				-- print("tmux is not available")
				return
			end
			out = out:gsub("\n", "")
			local letter = out:match("tmux %d+%.%d+([a-z])")
			local number
			if letter == nil then
				number = 0
			else
				number = string.byte(letter) - offset
			end
			local version = out:gsub("tmux (%d+%.%d+)([a-z])", "%1." .. number)
			local v = vim.version.parse(version)
			local minimal = vim.version.parse("3.3.1")
			if v and vim.version.cmp(v, minimal) < 0 then
				-- print("tmux version is too old")
				return
			end
		end

		-- setup
		-- Example for configuring Neovim to load user-installed installed Lua rocks:
		--$ luarocks --local --lua-version=5.1 install magick
		-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
		-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

		-- check if magick luarock is available
		local ok, magick = pcall(require, "magick")
		if not ok then
			-- print("magick luarock is not available")
			return
		end

		require("image").setup({
			backend = backend,
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "markdown", "vimwiki", "quarto" },
				},
			},
			max_width = 100,
			max_height = 15,
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			mux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
		})
	end,
}