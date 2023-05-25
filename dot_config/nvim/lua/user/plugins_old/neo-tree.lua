require("window-picker").setup({
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },

			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
	other_win_hl_color = "#e35e4f",
})

require("neo-tree").setup({
	window = {
		mappings = {
			["/"] = "none", -- "noop" removes default mapping for fuzzy search
			["<space>"] = "none", -- "noop" removes default mapping for fuzzy search
			["g/"] = "fuzzy_finder",
			["l"] = "open",
			["e"] = "open",
			["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			["h"] = "close_node",
		},
	},
	filesystem = {
		use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle [E]xplorer" })
vim.keymap.set("n", "<leader>o", "<cmd>NeoTreeReveal<cr>", { desc = "Show File in Explorer" })
