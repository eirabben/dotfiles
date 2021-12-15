local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
	git = {
		enable = true,
		ignore = false,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "e" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "s", cb = tree_cb("vsplit") },
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
