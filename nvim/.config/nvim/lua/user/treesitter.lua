local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "maintained",
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {},
	},
})

-- TODO: Move into another file
require("Comment").setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})

-- vim.api.nvim_command('autocmd FileType twig set commentstring={#%s#}')

local ft = require("Comment.ft")
ft.set("twig", { "{#%s#}", "{#%s#}" })
