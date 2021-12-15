require("lualine").setup({
	options = {
		theme = "rose-pine",
		-- component_separators = { left = '>', right = '<'},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = { "NvimTree" },
	},
	sections = {
		lualine_a = {},
		lualine_b = { "mode" },
		lualine_c = { "filename" },
		lualine_x = { "progress" },
		lualine_y = { "location" },
		lualine_z = {},
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

vim.opt.showmode = false
