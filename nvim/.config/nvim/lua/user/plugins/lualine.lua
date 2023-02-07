--[[ TODO: Customize config ]]

require("lualine").setup({
	options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {
				"NvimTree",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})

-- sections = {
-- 	lualine_a = {},
-- 	lualine_b = { "mode" },
-- 	lualine_c = {
-- 		{
-- 			"filename",
-- 			path = 1,
-- 		},
-- 	},
-- 	lualine_x = { "progress" },
-- 	lualine_y = { "location" },
-- 	lualine_z = {},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = { "filename" },
-- 		lualine_x = { "location" },
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- },
-- From kickstart
--[[ options = { ]]
--[[ 	icons_enabled = false, ]]
--[[ 	component_separators = "|", ]]
--[[ 	section_separators = "", ]]
--[[ }, ]]

-- Old config
