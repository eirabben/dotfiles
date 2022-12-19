local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		theme = "auto",
		-- component_separators = { left = '>', right = '<'},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = { "NvimTree" },
	},
	sections = {
		lualine_a = {},
		lualine_b = { "mode" },
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
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
