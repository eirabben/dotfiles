local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")

local default_colors = {
	"blue",
	"darkblue",
	"default",
	"delek",
	"desert",
	"elflord",
	"evening",
	"habamax",
	"industry",
	"koehler",
	"lunaperche",
	"morning",
	"murphy",
	"pablo",
	"peachpuff",
	"quiet",
	"ron",
	"shine",
	"slate",
	"torte",
	"zellner",
}

local colorscheme = function(opts)
	opts = opts or {}
	local before_background = vim.o.background
	local before_color = vim.api.nvim_exec("colorscheme", true)
	local need_restore = true

	local colors = opts.colors or { before_color }
	if not vim.tbl_contains(colors, before_color) then
		table.insert(colors, 1, before_color)
	end

	colors = vim.list_extend(
		colors,
		vim.tbl_filter(function(color)
			return color ~= before_color and not vim.tbl_contains(default_colors, color)
		end, vim.fn.getcompletion("", "color"))
	)

	local previewer
	if opts.enable_preview then
		-- define previewer
		local bufnr = vim.api.nvim_get_current_buf()
		local p = vim.api.nvim_buf_get_name(bufnr)

		-- don't need previewer
		if vim.fn.buflisted(bufnr) ~= 1 then
			local deleted = false
			local function del_win(win_id)
				if win_id and vim.api.nvim_win_is_valid(win_id) then
					utils.buf_delete(vim.api.nvim_win_get_buf(win_id))
					pcall(vim.api.nvim_win_close, win_id, true)
				end
			end

			previewer = previewers.new({
				preview_fn = function(_, entry, status)
					if not deleted then
						deleted = true
						del_win(status.preview_win)
						del_win(status.preview_border_win)
					end
					vim.cmd("colorscheme " .. entry.value)
				end,
			})
		else
			-- show current buffer content in previewer
			previewer = previewers.new_buffer_previewer({
				get_buffer_by_name = function()
					return p
				end,
				define_preview = function(self, entry)
					if vim.loop.fs_stat(p) then
						conf.buffer_previewer_maker(p, self.state.bufnr, { bufname = self.state.bufname })
					else
						local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
						vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
					end
					vim.cmd("colorscheme " .. entry.value)
				end,
			})
		end
	end

	local picker = pickers.new(opts, {
		prompt_title = "Change Colorscheme",
		finder = finders.new_table({
			results = colors,
		}),
		sorter = conf.generic_sorter(opts),
		previewer = previewer,
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				if selection == nil then
					utils.__warn_no_selection("builtin.colorscheme")
					return
				end

				actions.close(prompt_bufnr)
				need_restore = false
				vim.cmd("colorscheme " .. selection.value)
			end)

			return true
		end,
	})

	if opts.enable_preview then
		-- rewrite picker.close_windows. restore color if needed
		local close_windows = picker.close_windows
		picker.close_windows = function(status)
			close_windows(status)
			if need_restore then
				vim.o.background = before_background
				vim.cmd("colorscheme " .. before_color)
			end
		end
	end

	picker:find()
end

colorscheme()
