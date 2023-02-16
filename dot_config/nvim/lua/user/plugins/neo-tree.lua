require("neo-tree").setup({
	window = {
		mappings = {
      ["/"] = "noop", -- "noop" removes default mapping for fuzzy search
      ["g/"] = "fuzzy_finder",
			["l"] = "open",
			["e"] = "open",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["h"] = "close_node",
		},
	},
	filesystem = {
		use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
	},
})

vim.keymap.set("n", "<leader>e", '<cmd>Neotree toggle<cr>', { desc = "Toggle [E]xplorer" })
