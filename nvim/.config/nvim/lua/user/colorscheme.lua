local M = {}

M.init = function(colorscheme)
	-- vim.g.colors_name = 'embark'
	-- vim.opt.background = 'dark'

	-- Sonokai
	if colorscheme == "sonokai" then
		vim.g.sonokai_style = "espresso"
		vim.g.sonokai_enable_italic = true
		vim.g.sonokai_disable_italic_comment = true
		vim.cmd("colorscheme sonokai")
	end

	-- Rose Pine
	if colorscheme == "rose-pine" then
		vim.g.rose_pine_variant = "base"
		vim.cmd("colorscheme rose-pine")
	end

	-- Nightfox
	if colorscheme == "nightfox" then
		vim.cmd("colorscheme nightfox") -- Can also be nordfox, palefox
	end

	-- Nord
	-- vim.cmd('colorscheme nord')
end

return M
