local home = vim.fn.expand("~/Notes")
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files

require("telekasten").setup({

	-- Main paths
	home = home, -- path to main notes folder
	dailies = home .. "/" .. "daily", -- path to daily notes
	templates = home .. "/" .. "templates", -- path to templates

	-- Specific note templates
	-- set to `nil` or do not specify if you do not want a template
	-- template_new_note = '/path/to/file',    -- template for new notes
	-- template_new_daily = '/path/to/file',   -- template for new daily notes
	-- template_new_weekly = '/path/to/file',  -- template for new weekly notes

	-- Image subdir for pasting
	-- subdir name
	-- or nil if pasted images shouldn't go into a special subdir
	image_subdir = "images",

	-- File extension for note files
	extension = ".md",

	-- Generate note filenames. One of:
	-- "title" (default) - Use title if supplied, uuid otherwise
	-- "uuid" - Use uuid
	-- "uuid-title" - Prefix title by uuid
	-- "title-uuid" - Suffix title with uuid
	new_note_filename = "uuid-title",
	-- file uuid type ("rand" or input for os.date such as "%Y%m%d%H%M")
	uuid_type = "%Y%m%d%H%M",
	-- UUID separator
	uuid_sep = "-",

	-- Flags for creating non-existing notes
	follow_creates_nonexisting = true, -- create non-existing on follow
	dailies_create_nonexisting = true, -- create non-existing dailies
	weeklies_create_nonexisting = true, -- create non-existing weeklies

	-- Image link style",
	-- wiki:     ![[image name]]
	-- markdown: ![](image_subdir/xxxxx.png)
	image_link_style = "markdown",

	-- Default sort option: 'filename', 'modified'
	sort = "filename",

	-- Make syntax available to markdown buffers and telescope previewers
	install_syntax = true,

	-- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
	tag_notation = "#tag",

	-- When linking to a note in subdir/, create a [[subdir/title]] link
	-- instead of a [[title only]] link
	subdirs_in_links = true,

	-- Command palette theme: dropdown (window) or ivy (bottom panel)
	command_palette_theme = "ivy",

	-- Tag list theme:
	-- get_cursor (small tag list at cursor)
	-- dropdown (window)
	-- ivy (bottom panel)
	show_tags_theme = "ivy",

	-- Previewer for media files (images mostly)
	-- "telescope-media-files" if you have telescope-media-files.nvim installed
	-- "catimg-previewer" if you have catimg installed
	-- "viu-previewer" if you have viu installed
	media_previewer = "telescope-media-files",

	-- Customize insert image and preview image files list. This is useful
	-- to add optional filetypes into filtered list (for example
	-- telescope-media-files optionally supporting svg preview)
	media_extensions = {
		".png",
		".jpg",
		".bmp",
		".gif",
		".pdf",
		".mp4",
		".webm",
		".webp",
	},

	-- Calendar integration
	plug_into_calendar = true, -- use calendar integration
	calendar_opts = {
		weeknm = 4, -- calendar week display mode:
		--   1 .. 'WK01'
		--   2 .. 'WK 1'
		--   3 .. 'KW01'
		--   4 .. 'KW 1'
		--   5 .. '1'

		calendar_monday = 1, -- use monday as first day of week:
		--   1 .. true
		--   0 .. false

		calendar_mark = "left-fit", -- calendar mark placement
		-- where to put mark for marked days:
		--   'left'
		--   'right'
		--   'left-fit'
	},

	-- Specify a clipboard program to use
	clipboard_program = "xclip", -- xsel, xclip, wl-paste, osascript

	vaults = {
		personal = {
			-- configuration for personal vault. E.g.:
			-- home = "/home/user/vaults/personal",
		},
	},
})
