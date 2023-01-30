require("nvim-tree").setup({
	view = {
    width = 40,
		mappings = {
			list = {
				{ key = { "l", "e" }, action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = { "v", "s" }, action = "vsplit" },
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = false,
		},
		icons = {
			git_placement = "after",
			show = {
				folder_arrow = false,
			},
		},
	},
})
