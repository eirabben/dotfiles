require("neo-tree").setup({
	window = {
		mappings = {
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
